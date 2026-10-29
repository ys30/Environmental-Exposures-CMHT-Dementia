# Generalized negative-binomial modeling with HC0 robust covariance.
# Exposures are explicitly mapped by the analyst after inspecting approved data.
get_model_spec <- function(df) {
  pollutant_map <- c(PM25 = "pm25_quartile", PM10 = "pm10_quartile",
                     NO2 = "no2_quartile", NOx = "nox_quartile")
  # These are PLACEHOLDERS. Confirm pollutant quartile names and covariate columns.
  list(pollutants = pollutant_map,
       base = c("entry_year", "entry_season"),
       demographics = c("age", "gender", "ethnicity", "IMD_2015",
                        "borough_slam", "social_fragmentation"),
       ndvi = "ndvi_cohort_entry", temp = "temp_cohort_entry", imd = "IMD_2015")
}
quote_name <- function(x) paste0("`", gsub("`", "", x, fixed = TRUE), "`")
make_formula <- function(response, terms, days) {
  stats::as.formula(paste(quote_name(response), "~",
    paste(c(terms, sprintf("offset(log(%s))", quote_name(days))), collapse = " + ")))
}
fit_nb <- function(df, year, exposure, covariates, interaction = NULL) {
  count <- paste0("community_MHT_events_Y", year)
  days <- paste0("active_slam_days_Y", year)
  vars <- unique(c(count, days, exposure, covariates, interaction))
  absent <- setdiff(vars, names(df))
  if (length(absent)) stop("Missing required columns: ", paste(absent, collapse = ", "))
  d <- df[stats::complete.cases(df[, vars, drop = FALSE]), vars, drop = FALSE]
  if (nrow(d) < 20 || any(d[[days]] <= 0) ||
      any(d[[count]] < 0 | d[[count]] != floor(d[[count]]))) stop("Invalid model sample")
  d[[exposure]] <- if (is.character(d[[exposure]])) factor(d[[exposure]]) else d[[exposure]]
  if (is.factor(d[[exposure]]) && nlevels(d[[exposure]]) < 2) stop("Exposure has <2 levels")
  exposure_term <- quote_name(exposure)
  terms <- c(exposure_term, vapply(covariates, quote_name, character(1)))
  if (!is.null(interaction)) {
    terms <- c(terms, paste0(exposure_term, ":", quote_name(interaction)))
  }
  model <- MASS::glm.nb(make_formula(count, terms, days), data = d)
  V <- sandwich::vcovHC(model, type = "HC0")
  b <- stats::coef(model)
  se <- sqrt(diag(V))
  ci_low <- b - stats::qnorm(.975) * se
  ci_high <- b + stats::qnorm(.975) * se
  z <- b / se
  tab <- data.frame(term = names(b), log_IRR = unname(b),
                    robust_se = unname(se), IRR = unname(exp(b)),
                    CI_low = unname(exp(ci_low)), CI_high = unname(exp(ci_high)),
                    p = unname(2 * stats::pnorm(abs(z), lower.tail = FALSE)),
                    row.names = NULL)
  list(model = model, table = tab, n = nrow(d),
       AIC = stats::AIC(model), BIC = stats::BIC(model),
       converged = isTRUE(model$converged), year = year,
       exposure = exposure, interaction = interaction)
}
run_all_models <- function(df, spec) {
  out <- list()
  for (year in c(1L, 5L, 9L)) {
    for (pollutant in unname(spec$pollutants)) {
      for (stage in 1:4) {
        covars <- switch(as.character(stage),
          "1" = spec$base,
          "2" = c(spec$base, spec$ndvi),
          "3" = c(spec$base, spec$ndvi, spec$temp),
          "4" = c(spec$base, spec$ndvi, spec$temp, spec$demographics))
        key <- paste(year, pollutant, paste0("M", stage), sep = "__")
        out[[key]] <- tryCatch(fit_nb(df, year, pollutant, unique(covars)),
                               error = function(e) list(error = conditionMessage(e)))
      }
      full_covars <- unique(c(spec$base, spec$ndvi, spec$temp, spec$demographics))
      for (modifier in c(spec$ndvi, spec$temp, spec$imd)) {
        key <- paste(year, pollutant, paste0("interaction_", modifier), sep = "__")
        # Remove modifier from covariates only if it is explicitly in the exposure terms?
        # Keep main modifier effect in model; fit_nb adds interaction term.
        out[[key]] <- tryCatch(fit_nb(df, year, pollutant, full_covars, modifier),
                               error = function(e) list(error = conditionMessage(e)))
      }
    }
  }
  out
}
