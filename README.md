# Environmental Exposures & Mental Health Service Utilisation in Dementia

**Longitudinal environmental epidemiology | Negative-binomial regression | Health services research | R**

An applied research project investigating how **air pollution, residential greenness, temperature and neighbourhood deprivation** relate to **Community Mental Health Team (CMHT) service use** among older adults living with dementia in South London.

> **Research outcome:** The manuscript reports associations between greater greenness and lower CMHT utilisation, and between higher temperature or deprivation and greater utilisation. These are observational associations, not causal effects.

## Project at a glance

| | |
|---|---|
| **Research setting** | South London and Maudsley NHS Foundation Trust (SLaM); Clinical Record Interactive Search (CRIS) |
| **Study population** | Adults aged 65+ with recorded dementia |
| **Reported primary cohort** | **5,007 participants** (see sample-definition note below) |
| **Follow-up** | Year 1, Year 5 and Year 9 |
| **Outcome** | CMHT event counts, adjusted for time under observation |
| **Methods** | Negative-binomial regression, nested adjustment specifications, exposure interactions, missing-data and sensitivity analysis |
| **Technical tools** | R, `MASS::glm.nb`, robust covariance estimation, reproducible analytical workflows |

## Key findings

The following are **approximate adjusted incidence rate ratios (IRRs) reported in the dissertation/manuscript**, rather than estimates produced by rerunning the public code.

| Exposure | Year 1 | Year 5 | Year 9 | Interpretation |
|---|---:|---:|---:|---|
| **Residential greenness (NDVI)** | **~0.38** | **~0.32** | **~0.33** | Lower CMHT use with higher NDVI; **per full 1.0 NDVI unit**, in PM₂.₅-adjusted specifications |
| **Neighbourhood deprivation (IMD)** | **~1.010** | **~1.007** | **~1.007** | Higher CMHT use with greater deprivation; per IMD point |
| **Temperature** | **~1.02**¹ | — | — | Higher CMHT use with higher temperature; per 1°C |
 
¹ Available manuscript summary estimate; its precise follow-up window still needs confirmation. Dashes mean the exact year-specific values have not been verified from the source tables, **not** that no analysis was conducted.

Air pollution analyses covered **PM₂.₅, PM₁₀, NO₂ and NOₓ**, including quartile comparisons. Interactions involving environmental exposures and deprivation were also examined; the available summaries do **not** justify claiming confirmed synergistic effects. Exact pollutant coefficients, confidence intervals and interaction tests are not included without source-table verification.

**Interpretation matters:** The outcome is *mental health service utilisation among people already diagnosed with dementia*, not dementia incidence, dementia severity or proof of a causal environmental effect.

[Read the detailed manuscript findings](docs/manuscript_results.md)

## What the project demonstrates

- **Longitudinal observational analysis:** specified service-use count outcomes at three follow-up horizons and incorporated `log(observed days)` offsets to account for differing exposure time.
- **Multivariable statistical modelling:** assessed pollution, greenness, temperature and socioeconomic deprivation through staged negative-binomial models.
- **Effect-modification analysis:** considered interactions between air pollution and NDVI, temperature and deprivation, while avoiding overinterpretation of statistically inconclusive interactions.
- **Missing-data methodology:** documented complete-case and multiple-imputation approaches, with sensitivity checks requiring reconciliation against the approved manuscript.
- **Reproducibility and research governance:** structured a public R workflow while keeping patient-level NHS clinical records in access-controlled systems.

## Analytical approach

**Outcome:** number of CMHT service-use events.

**Model family:** negative-binomial generalized linear models with a log link and an observation-time offset:

```r
MASS::glm.nb(cmht_events ~ exposure + covariates +
             offset(log(active_observation_days)), data = secure_data)
```

The analysis considered four nested adjustment specifications, moving from entry timing to environmental and demographic/geographic/socioeconomic covariates. Separate analyses considered **Years 1, 5 and 9** and exposure interactions. See [analysis plan](docs/analysis_plan.md) for the working specifications.

## Code and reproducibility

This repository is a **public-facing companion to an existing empirical manuscript**. It contains R modelling utilities, secure-execution instructions and synthetic-data tests. **The newer generalized code has not been independently validated against the restricted clinical extract**, and synthetic tests do not reproduce the published-in-manuscript estimates.

| Location | Contents |
|---|---|
| [`R/`](R/) | Cohort checks, negative-binomial model engine, interactions, diagnostics and secure pipeline |
| [`docs/manuscript_results.md`](docs/manuscript_results.md) | Detailed findings and verification limits |
| [`docs/analysis_plan.md`](docs/analysis_plan.md) | Research design and model specifications |
| [`docs/data_dictionary.md`](docs/data_dictionary.md) | Working variable definitions |
| [`docs/secure_execution.md`](docs/secure_execution.md) | Restricted-data execution and disclosure guidance |
| [`tests/`](tests/) | Synthetic-data tests; no clinical records |
| [`.github/workflows/`](.github/workflows/) | Automated synthetic test workflow |

## Data availability and privacy

**Individual-level SLaM CRIS data are confidential and are not publicly available.** Researchers seeking access must contact the relevant **SLaM/CRIS data governance or research access authorities** and obtain applicable institutional approvals. This repository does not distribute patient records, linkage identifiers, restricted extracts or model objects containing sensitive information.

Only disclosure-cleared aggregate findings are suitable for public presentation. The manuscript summary is shared separately from the confidential underlying dataset.

## Study status and reporting notes

- **Research findings exist in a dissertation/manuscript.** This repository is not merely a proposal or an empty modelling scaffold.
- **Publication status:** described as an unpublished manuscript; peer-reviewed publication has not been verified.
- **Sample definitions:** the main manuscript reports **N = 5,007**, while a separate supplementary-methods description lists **5,024 complete cases** and **5,272 participants in an imputation sample**. These figures may refer to different analysis populations and must be reconciled before making claims about a single universal analytic N.
- **Numerical precision:** the IRRs above are approximate transcriptions from earlier manuscript summaries; exact confidence intervals and p-values have not been independently reconciled with original regression tables.

For research interpretation, refer to the [detailed results](docs/manuscript_results.md). For reproducibility limitations, see [secure execution](docs/secure_execution.md).
