# Results — Environmental exposures and CMHT service utilisation

## Scope and source

This page documents results from the study's archived regression outputs `H1_results.csv`, `H3_results.csv`, `H2int_results.csv`, `H3int_results.csv`, and `H4_results.csv`, and research manuscript. They have **not** been independently rerun on restricted patient-level data. The outcome is **CMHT service-use counts among people with dementia**, not dementia incidence. IRRs describe associations, not causal effects. Year 1, 5 and 9 are analysis windows as labelled in the supplied outputs.

## Study population

The research manuscript reports **N = 5,007**; the supplementary methods describe **5,024 complete cases** and **5,272 in an imputation sample**. These denominators require reconciliation before being treated as the same analysis population. Further baseline characteristics: **暂不公开**.

## H1: Air pollution (quartile Q4 versus Q1)

Adjusted IRRs from the archived `H1_results.csv` analysis (rounded to three decimals):

| Pollutant | Year 1 IRR (95% CI) | Year 5 IRR (95% CI) | Year 9 IRR (95% CI) |
|---|---|---|---|
| PM₂.₅ | 1.231 (1.080–1.403) | 1.200 (1.098–1.312) | 1.201 (1.102–1.310) |
| PM₁₀ | 1.188 (1.037–1.361) | 1.218 (1.112–1.333) | 1.231 (1.127–1.345) |
| NO₂ | 1.168 (1.033–1.320) | 1.313 (1.210–1.425) | 1.322 (1.221–1.432) |
| NOₓ | 1.132 (1.000–1.281) | 1.289 (1.187–1.400) | 1.298 (1.198–1.406) |

The archived results list p < 0.05 for these Q4 comparisons. These comparisons do **not** by themselves establish a monotonic dose–response across all quartiles. Some archived p-values and confidence intervals do not align perfectly, so significance should be treated as provisional pending table/model verification.

## H3 output: greenness and temperature in the same models

From the archived `H3_results.csv` analysis, PM₂.₅-specific model:

| Exposure | Year 1 IRR (95% CI) | Year 5 IRR (95% CI) | Year 9 IRR (95% CI) |
|---|---|---|---|
| NDVI | 0.442 (0.206–0.953) | 0.381 (0.228–0.639) | 0.403 (0.244–0.667) |
| Temperature | 1.019 (1.005–1.034) | 1.020 (1.010–1.031) | 1.021 (1.011–1.031) |

NDVI is a continuous index: the displayed IRR is per full 1.0-unit increase, not per 0.1. Temperature is interpreted per 1°C if the source variable is recorded in Celsius. The exact temperature exposure definition should be confirmed against the data dictionary. An earlier manuscript summary quotes NDVI IRRs ~0.38/~0.32/~0.33, which **do not match the archived H3 table**; those earlier numbers should not be silently substituted for these estimates.

## H4 output: fully adjusted covariate associations, not an interaction test

From the archived `H4_results.csv` analysis, PM₂.₅-specific model:

| Exposure | Year 1 IRR (95% CI) | Year 5 IRR (95% CI) | Year 9 IRR (95% CI) |
|---|---|---|---|
| IMD_2015 (per point) | 1.0096 (1.0060–1.0133) | 1.0068 (1.0043–1.0092) | 1.0068 (1.0044–1.0091) |
| NDVI | 0.995 (0.391–2.529) | 0.921 (0.491–1.726) | 0.996 (0.540–1.836) |
| Temperature | 1.011 (0.997–1.026) | 1.012 (1.002–1.022) | 1.012 (1.003–1.022) |

In this fuller specification, the NDVI estimate is no longer statistically distinguishable from 1, while IMD remains positively associated with CMHT utilisation. Borough indicators also appear as covariates; they do not demonstrate **pollution × borough** effect modification. Despite the filename, this CSV has **no pollution × IMD interaction coefficients**. Formal H4 interaction estimates: **暂不公开**.

## Interaction models

`H2int_results.csv` includes pollution-quartile × NDVI coefficients. Three of 36 individual interaction coefficients have archived p < 0.05: PM₁₀ Q2 × NDVI at Year 1 (IRR 0.089, p = 0.010); PM₁₀ Q3 × NDVI at Year 1 (IRR 0.087, p = 0.011); NO₂ Q4 × NDVI at Year 5 (IRR 4.151, p = 0.046). The last confidence interval (0.948–18.267) crosses 1 despite the reported p-value, requiring verification.

`H3int_results.csv` includes pollution-quartile × temperature coefficients. One of 36 individual coefficients has archived p < 0.05: PM₁₀ Q3 × temperature at Year 1 (IRR 0.979, p = 0.049), but its reported 95% CI (0.958–1.002) crosses 1.

These are **individual term-level tests**, not omnibus interaction tests; multiplicity and apparent CI/p discrepancies prevent confident claims of a consistent buffering or synergistic interaction. Omnibus Wald/LR tests and corrected outputs: **暂不公开**.

## Sensitivity analyses and remaining results

The study documentation describes missing-data and follow-up sensitivity analyses. Independently reconciled complete-case versus imputed estimates, detailed baseline tables, PAF estimates and remaining subgroup estimates: **暂不公开**. The proposed mechanisms (neuroinflammation, restoration, heat stress) are proposed explanations, not effects measured in these CSVs.

For a concise, reproducible checklist of the aggregate-level discrepancies and the limits of this audit, see [Results quality audit](results_quality_audit.md).

## Verification priorities

1. Reconcile sample sizes and differences between manuscript NDVI estimates and `H3_results.csv`.
2. Reconcile any p-values inconsistent with 95% confidence intervals and check how intervals and robust standard errors were calculated.
3. Confirm model adjustment levels, temperature unit/definition and time-window denominators.
4. Locate the actual pollution × IMD model before making an H4 effect-modification claim.

**Data availability:** restricted patient-level SLaM CRIS data are not distributed in this repository. This page reports only aggregate findings from archived research outputs.
