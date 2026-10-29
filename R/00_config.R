# Analysis scaffold: do not store private data or secrets in this repository.
required_packages <- c("MASS", "sandwich", "lmtest")
check_packages <- function(pkgs = required_packages) {
  missing <- pkgs[!vapply(pkgs, requireNamespace, logical(1), quietly = TRUE)]
  if (length(missing)) stop("Install required packages: ", paste(missing, collapse = ", "))
  invisible(TRUE)
}
followup_years <- c(1L, 5L, 9L)
count_column <- function(year) paste0("community_MHT_events_Y", year)
days_column <- function(year) paste0("active_slam_days_Y", year)
