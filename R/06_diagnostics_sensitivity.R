# Basic diagnostics; not a substitute for a full statistical audit.
model_diagnostics <- function(model) {
  stopifnot(inherits(model, "glm"))
  list(
    n = stats::nobs(model),
    AIC = stats::AIC(model),
    BIC = stats::BIC(model),
    converged = isTRUE(model$converged),
    theta = if (!is.null(model$theta)) model$theta else NA_real_
  )
}
