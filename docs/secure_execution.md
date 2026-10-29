# Secure execution and disclosure control

Run this workflow only inside the CRIS-approved analysis environment.

1. Keep patient-level input outside the Git checkout; use a local RDS file.
2. Set `CRIS_ANALYSIS_INPUT` to the authorized absolute file path in the secure session.
3. Review and map real variable names in `R/08_model_engine.R` (pollution quartiles and demographics are placeholders).
4. Run `Rscript R/07_pipeline.R` from the repository root.
5. Inspect `results/private/model_status.csv` for errors and convergence.
6. Inspect model samples, estimates, CI, interactions and disclosure risk locally.
7. Release only approved aggregated results, with institutional disclosure approval.

**Never upload the CRIS data, a private RDS, model objects with individual-level residuals, private CSV exports, credentials, or log files that expose patient details.** GitHub Actions uses **synthetic data only**.

Important limitations: covariate names and follow-up definitions have not been verified; sandwich HC0 does not automatically address within-person dependence across repeated windows; year-specific models are fitted separately. AIC/BIC comparison is only meaningful for comparable outcomes and observation sets. Sensitivity analyses need final prespecification and secure-data execution.
