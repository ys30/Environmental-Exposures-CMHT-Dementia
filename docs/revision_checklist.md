# Research documentation and reporting notes

This document records interpretation conventions and reporting boundaries for the **Environmental Exposures & CMHT Service Utilisation in Dementia** research project. It is a reference for maintaining a consistent public research portfolio, not a dissertation revision assignment.

## Outcome and model interpretation

- The study examines **CMHT service utilisation among people living with dementia**, not dementia incidence.
- Air pollution quartiles are exposure categories in negative-binomial regression, not quantile regression.
- NDVI IRRs refer to a full one-unit contrast unless explicitly rescaled.
- Year 1, 5 and 9 estimates refer to the study's labelled follow-up windows; event-count models incorporate observation-time offsets.
- The NDVI association is model-dependent and attenuates in the fuller H4 adjustment.
- Isolated interaction terms do not establish a consistent buffering or synergistic mechanism.

## Archived-result interpretation

- Preserve the original H1/H3/H4 model labels and their corresponding estimates.
- Interpret IRRs alongside their confidence intervals and the adjustment specification.
- Where archived p-values and confidence intervals do not align, avoid definitive significance claims and refer to [aggregate results interpretation](results_quality_audit.md).
- Sample counts of 5,007, 5,024 and 5,272 refer to separately documented analysis definitions and should not be presented as interchangeable.

## Public documentation and confidentiality

- Only aggregate results appropriate for public disclosure are presented.
- Individual-level SLaM CRIS records are confidential, encrypted and unavailable for renewed analysis.
- The repository's R scripts and synthetic examples document the analytical approach; they are not a rerun of the original patient-level models.
- Additional unavailable or unreleased results are simply marked **暂不公开**.
