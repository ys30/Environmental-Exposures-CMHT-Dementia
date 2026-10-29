# Cohort and outcome checks; accepts only an already-authorized in-memory data.frame.
validate_followup <- function(df, year) {
  outcome <- paste0("community_MHT_events_Y", year)
  days <- paste0("active_slam_days_Y", year)
  stopifnot(is.data.frame(df), all(c(outcome, days) %in% names(df)))
  if (any(!is.na(df[[days]]) & df[[days]] <= 0)) stop("Non-positive observation days: ", days)
  if (any(!is.na(df[[outcome]]) & (df[[outcome]] < 0 | df[[outcome]] != floor(df[[outcome]])))) {
    stop("Invalid event counts: ", outcome)
  }
  invisible(TRUE)
}
