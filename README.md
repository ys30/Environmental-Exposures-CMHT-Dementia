# Environmental Exposures and CMHT Service Use in Dementia

Manuscript-informed research repository and reproducible analysis workflow for a retrospective cohort study of environmental exposures, socioeconomic deprivation, and Community Mental Health Team (CMHT) service utilization among older adults living with dementia.

## Study overview
- Setting: South London and Maudsley NHS Foundation Trust (SLaM), CRIS-derived cohort.
- Population: adults aged 65+ with a recorded dementia diagnosis; reported analytic cohort **N = 5,007** (subject to verification against approved source data).
- Outcome: **CMHT service-use event counts**, assessed at Year 1, Year 5 and Year 9, with an offset for active observation days.
- Exposures: air pollution (PM2.5, PM10, NO2, NOx), greenness (NDVI), temperature, and Index of Multiple Deprivation (IMD).
- Primary approach: negative-binomial count regression and prespecified exposure interactions.

**This is a public, code-and-documentation-only repository. No CRIS patient-level records, identifiable information, restricted results, or confidential supervisor feedback belong here.**

## Manuscript-reported findings

The dissertation/manuscript **already reports empirical analyses** based on an access-controlled cohort. The estimates below are transcribed as **approximate, manuscript-reported results**, not calculated from public data or independently rerun by this GitHub repository. They should be checked against the final approved manuscript tables before formal citation.

| Analysis | Manuscript-reported estimate | Interpretation / caveat |
|---|---|---|
| Analytic cohort | **N = 5,007** | Older adults with recorded dementia; not an incident-dementia cohort |
| NDVI, Year 1 | Adjusted IRR **~0.38** | Continuous NDVI effect in a PM2.5-adjusted model; per **one full NDVI unit** |
| NDVI, Year 5 | Adjusted IRR **~0.32** | Same exposure scaling; do not equate to a realistic incremental NDVI change |
| NDVI, Year 9 | Adjusted IRR **~0.33** | Same exposure scaling |
| Temperature | Adjusted IRR **~1.02 per °C** | Approximate manuscript estimate; window-specific detail requires table check |
| IMD, Year 1 | Adjusted IRR **~1.010 per IMD point** | Approximate manuscript estimate |
| IMD, Year 5 / Year 9 | Adjusted IRR **~1.007 per IMD point** | Approximate manuscript estimates |
| Pollution quartiles | Analyzed for PM2.5, PM10, NO2 and NOx | Exact quartile-specific estimates not transcribed here pending table-level verification |
| Exposure interactions | Mostly statistically inconclusive | No blanket claim of synergy or confirmed effect modification |

**Outcome:** CMHT service-use event counts with observation-time offsets. These are **associations**, not evidence that exposures cause dementia or changes in service use. Reported results do not by themselves establish publication status.

For a detailed record of the existing dissertation findings, their interpretation limits and outstanding table-level checks, see [Manuscript-reported results](docs/manuscript_results.md).

## Repository layout
- `R/`: configuration, cohort checks, exposure models and diagnostics.
- `docs/`: analysis plan, data dictionary and revision checklist.
- `data/synthetic/`: safe synthetic examples only.
- `results/tables/` and `results/figures/`: public-safe outputs only.

## Reproducibility status
**The study has manuscript-reported results.** This repository is the public code/documentation companion, and its newer generalized R pipeline has **not yet been independently validated against the restricted CRIS extract**. The figures above come from the prior manuscript analysis, not from a GitHub rerun. Variable mappings, follow-up offsets, confounder coding, robust variance estimation and model diagnostics still require validation in an approved secure environment. The synthetic-data CI workflow does not process confidential records.

## Data access and governance
The underlying CRIS records are access-controlled and are **not** publicly redistributable. Researchers seeking access must contact the relevant SLaM/CRIS data governance and institutional research access authorities and obtain the necessary approvals; access is not automatic. This public repository can share manuscript-reported, disclosure-approved aggregate findings without sharing individual-level data. Obtain data only through applicable institutional approvals and secure infrastructure. Do not commit source extracts, row-level data, linkage keys, credentials, small-cell disclosures or sensitive intermediate artifacts.

## Getting started
1. Review `docs/analysis_plan.md` and `docs/data_dictionary.md`.
2. Configure local secure paths outside this repository.
3. Verify data availability and definitions with authorized data custodians.
4. Implement and validate models; publish only disclosure-reviewed aggregate outputs.

## Citation
Dissertation/manuscript findings are summarized above. **Publication status and a formal citation have not been verified**; do not describe this study as peer-reviewed or published without confirmation.
