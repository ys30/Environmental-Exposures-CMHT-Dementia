# Environmental Exposures and CMHT Service Use in Dementia

Reproducible analysis framework for a retrospective cohort study of environmental exposures, socioeconomic deprivation, and Community Mental Health Team (CMHT) service utilization among older adults living with dementia.

## Study overview
- Setting: South London and Maudsley NHS Foundation Trust (SLaM), CRIS-derived cohort.
- Population: adults aged 65+ with a recorded dementia diagnosis; reported analytic cohort **N = 5,007** (subject to verification against approved source data).
- Outcome: **CMHT service-use event counts**, assessed at Year 1, Year 5 and Year 9, with an offset for active observation days.
- Exposures: air pollution (PM2.5, PM10, NO2, NOx), greenness (NDVI), temperature, and Index of Multiple Deprivation (IMD).
- Primary approach: negative-binomial count regression and prespecified exposure interactions.

**This is a public, code-and-documentation-only repository. No CRIS patient-level records, identifiable information, restricted results, or confidential supervisor feedback belong here.**

## Repository layout
- `R/`: configuration, cohort checks, exposure models and diagnostics.
- `docs/`: analysis plan, data dictionary and revision checklist.
- `data/synthetic/`: safe synthetic examples only.
- `results/tables/` and `results/figures/`: public-safe outputs only.

## Reproducibility status
The R files are analysis **scaffolds**, not validated implementations. No models have been executed from this repository and no estimates are presented as newly reproduced. Variable mappings, follow-up offsets, confounder coding and model diagnostics must be checked within an authorized secure environment before publication.

## Data access and governance
The underlying CRIS records are access-controlled and are **not** publicly redistributable. Obtain data only through applicable institutional approvals and secure infrastructure. Do not commit source extracts, row-level data, linkage keys, credentials, small-cell disclosures or sensitive intermediate artifacts.

## Getting started
1. Review `docs/analysis_plan.md` and `docs/data_dictionary.md`.
2. Configure local secure paths outside this repository.
3. Verify data availability and definitions with authorized data custodians.
4. Implement and validate models; publish only disclosure-reviewed aggregate outputs.

## Citation
Citation and manuscript metadata will be added after confirmation.
