# NDVI main effect and pollutant interaction scaffold.
# Confirm NDVI scale and covariates before inference.
fit_ndvi_interaction <- function(df, year, pollutant, covariates) {
  if (!requireNamespace("MASS", quietly = TRUE)) stop("Install MASS")
  outcome <- paste0("community_MHT_events_Y", year)
  days <- paste0("active_slam_days_Y", year)
  needed <- c(outcome, days, pollutant, "ndvi_cohort_entry", covariates)
  stopifnot(all(needed %in% names(df)))
  dat <- stats::na.omit(df[, needed, drop = FALSE])
  if (!nrow(dat) || any(dat[[days]] <= 0)) stop("Invalid model data or offset")
  f <- stats::as.formula(paste(outcome, "~", pollutant, "* ndvi_cohort_entry +",
    paste(c(covariates, sprintf("offset(log(%s))", days)), collapse = " + ")))
  MASS::glm.nb(f, data = dat)
}
