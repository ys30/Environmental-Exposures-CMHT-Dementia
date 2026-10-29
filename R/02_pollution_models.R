# Pollution-specific negative binomial scaffold.
# Replace exposure_name with a verified, sanitized column name.
fit_pollution_nb <- function(df, year, exposure_name, covariates) {
  if (!requireNamespace("MASS", quietly = TRUE)) stop("Install MASS")
  count <- paste0("community_MHT_events_Y", year)
  days <- paste0("active_slam_days_Y", year)
  needed <- c(count, days, exposure_name, covariates)
  stopifnot(all(needed %in% names(df)))
  dat <- df[stats::complete.cases(df[, needed, drop = FALSE]), needed, drop = FALSE]
  if (!nrow(dat) || any(dat[[days]] <= 0)) stop("Invalid model data or offset")
  formula <- stats::reformulate(c(exposure_name, covariates, sprintf("offset(log(%s))", days)), response = count)
  MASS::glm.nb(formula, data = dat)
}
