# Environmental Exposures and CMHT Service Use in Dementia

Research documentation and reproducible analysis workflow for a retrospective cohort study of environmental exposures, deprivation, and Community Mental Health Team (CMHT) service utilisation among older adults living with dementia.

## Study overview
- Setting: South London and Maudsley NHS Foundation Trust (SLaM), CRIS-derived cohort.
- Population: adults aged 65+ with dementia; the manuscript-reported analytic cohort is **N = 5,007**. A separate supplementary-methods description gives **N = 5,024 complete cases** and **N = 5,272 in the imputation sample**. These sample definitions must not be treated as interchangeable until reconciled.
- Outcome: CMHT service-use event counts at Years 1, 5 and 9, with observation-time offsets.
- Exposures: PM₂.₅, PM₁₀, NO₂, NOₓ, greenness (NDVI), temperature, and Index of Multiple Deprivation (IMD).
- Statistical approach: negative-binomial regression and exposure interaction analyses.

## Results

Greater residential greenness was associated with lower CMHT service utilisation. In PM₂.₅-adjusted specifications, the manuscript-reported adjusted incidence rate ratios (IRRs) for NDVI were approximately **0.38 at Year 1, 0.32 at Year 5 and 0.33 at Year 9**. These values represent a **one-unit NDVI contrast**, not a 0.1-unit increment.

Higher temperature was associated with greater CMHT service use, with an approximate adjusted IRR of **1.02 per 1°C increase** in the reported specification. Year-specific estimates beyond this available value: **Not publicly available**.

Higher deprivation was also associated with increased service utilisation. The approximate adjusted IRRs for IMD were **1.010 at Year 1** and **1.007 at Years 5 and 9**, per one-point increase in IMD.

Associations with particulate and gaseous air pollutants (PM₂.₅, PM₁₀, NO₂ and NOₓ) were investigated, including pollutant quartiles. Detailed pollutant-specific estimates: **Not publicly available**.

Effect modification by greenness, temperature, deprivation and borough was considered. The available summaries do not support asserting statistically significant synergistic effects; detailed interaction estimates and tests: **Not publicly available**.

Exact 95% confidence intervals and p-values for the approximate IRRs above: **Not publicly available**.

**Interpretation:** These are observational associations with CMHT service-use counts, not estimates of dementia incidence or causal effects. The numerical IRRs are approximate values previously transcribed from the manuscript; original regression tables have not been independently reconciled. See [Detailed results](docs/manuscript_results.md).

## Repository layout
- `R/`: configuration, cohort checks, exposure models and diagnostics.
- `docs/`: analysis plan, data dictionary, results and revision checklist.
- `data/synthetic/`: synthetic examples only.
- `results/tables/` and `results/figures/`: public-safe outputs only.

## Reproducibility status
The study has manuscript-reported results. The generalized R workflow in this repository has **not** been independently validated against the access-controlled CRIS extract. Synthetic-data checks do not reproduce the study estimates.

## Data access and governance
Individual-level SLaM CRIS records are access-controlled and are not redistributed here. Only aggregate findings cleared for disclosure should be made public. Do not commit patient records, linkage keys, sensitive intermediate files or credentials.

## Citation
This work is described as an unpublished manuscript. Publication and peer-review status have not been verified.
