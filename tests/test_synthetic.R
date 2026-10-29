# Synthetic test; never uses actual CRIS records.
source("R/08_model_engine.R")
if (!all(vapply(c("MASS", "sandwich", "lmtest"), requireNamespace,
                 logical(1), quietly = TRUE))) stop("Install MASS, sandwich, lmtest")
set.seed(20261029)
n <- 360L
d <- data.frame(
  pm25_quartile = factor(rep(paste0("Q", 1:4), length.out = n),
                        levels = paste0("Q", 1:4)),
  entry_year = factor(sample(2008:2012, n, TRUE)),
  entry_season = factor(sample(c("Winter", "Spring", "Summer", "Autumn"), n, TRUE)),
  age = sample(65:95, n, TRUE), gender = factor(sample(c("F", "M"), n, TRUE)),
  ethnicity = factor(sample(c("A", "B"), n, TRUE)),
  IMD_2015 = runif(n, 5, 60),
  borough_slam = factor(sample(c("A", "B", "C"), n, TRUE)),
  social_fragmentation = rnorm(n), ndvi_cohort_entry = runif(n),
  temp_cohort_entry = rnorm(n, 17, 3)
)
for (yr in c(1, 5, 9)) {
  d[[paste0("active_slam_days_Y", yr)]] <- sample(90:365, n, TRUE) * yr
  d[[paste0("community_MHT_events_Y", yr)]] <-
    stats::rnbinom(n, mu = d[[paste0("active_slam_days_Y", yr)]] * 0.01, size = 2)
}
fit <- fit_nb(d, 1, "pm25_quartile",
              c("entry_year", "entry_season", "ndvi_cohort_entry"))
stopifnot(fit$converged, nrow(fit$table) > 2, all(fit$table$CI_low <= fit$table$IRR),
          all(fit$table$IRR <= fit$table$CI_high))
interaction_fit <- fit_nb(d, 1, "pm25_quartile",
    c("entry_year", "entry_season", "ndvi_cohort_entry"), "ndvi_cohort_entry")
stopifnot(interaction_fit$converged)
cat("Synthetic tests passed; no confidential data accessed.\n")
