# All exports from this script are PRIVATE by default.
write_private_results <- function(results, output_dir) {
  if (!grepl("(^|/)private(/|$)", gsub("\\\\", "/", output_dir))) {
    stop("Refusing to export outside a private output directory")
  }
  dir.create(output_dir, recursive = TRUE, showWarnings = FALSE)
  status <- compare_fit(results)
  utils::write.csv(status, file.path(output_dir, "model_status.csv"), row.names = FALSE)
  rows <- lapply(names(results), function(key) {
    x <- results[[key]]
    if (is.null(x$table)) return(NULL)
    cbind(model_id = key, x$table)
  })
  rows <- Filter(Negate(is.null), rows)
  if (length(rows)) utils::write.csv(do.call(rbind, rows),
     file.path(output_dir, "coefficient_results.csv"), row.names = FALSE)
  invisible(status)
}
