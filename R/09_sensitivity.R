# Sensitivity checks on authorized local data.
# Analyses should be prespecified and interpretations audited.
compare_fit <- function(results) {
  keys <- names(results)
  do.call(rbind, lapply(keys, function(k) {
    x <- results[[k]]
    data.frame(model_id = k, n = if (!is.null(x$n)) x$n else NA_integer_,
               AIC = if (!is.null(x$AIC)) x$AIC else NA_real_,
               BIC = if (!is.null(x$BIC)) x$BIC else NA_real_,
               converged = if (!is.null(x$converged)) x$converged else FALSE,
               error = if (!is.null(x$error)) x$error else "", row.names = NULL)
  }))
}
# Same-sample model comparison: compare AIC/BIC only on matching analytic rows.
# Follow-up window sensitivity: confirm Year 5/9 counts are cumulative or interval-specific.
# Additional analyses (stratification, alternative exposure scaling, missingness)
# must be defined against approved variable names before implementation.
