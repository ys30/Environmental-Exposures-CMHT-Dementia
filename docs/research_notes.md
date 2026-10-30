# Research notes

This page documents the interpretation and reporting conventions used in the Environmental Exposures and CMHT Service Utilisation in Dementia study.

## Model interpretation

- The outcome is CMHT service utilisation among people living with dementia, not dementia incidence.
- Pollution quartiles are categorical exposures in negative-binomial regression, not quantile regression.
- NDVI incidence rate ratios refer to a one-unit contrast unless otherwise specified.
- Year 1, Year 5 and Year 9 results represent the study's labelled follow-up windows, with observation-time offsets in the count models.
- The NDVI association attenuates in the fuller H4 adjustment.
- Individual interaction coefficients do not establish a consistent overall effect-modification pattern.

## Results and reporting

- Keep H1, H3 and H4 estimates linked to their respective model specifications.
- Interpret incidence rate ratios together with confidence intervals and adjustment levels.
- Discuss inconsistencies between archived confidence intervals and p-values cautiously; see [Results interpretation](results_quality_audit.md).
- The documented cohort counts (5,007, 5,024 and 5,272) reflect different reported analysis definitions and should not be treated as interchangeable.

## Research data and public code

The underlying SLaM CRIS patient-level data are confidential, encrypted and unavailable for reanalysis. This repository presents aggregate study results and a public R workflow illustrated with synthetic data; the synthetic examples are not a reproduction of the original clinical estimates. Additional unreleased results are marked as not publicly available.
