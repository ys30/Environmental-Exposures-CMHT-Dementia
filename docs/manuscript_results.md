# Manuscript-reported findings (not a repository rerun)

This page records findings previously described in the dissertation drafting discussion. **The full source manuscript and original regression tables are not currently available for table-by-table reconciliation.** Values marked ~ are approximate. They must not be described as independently reproduced or formally published.

## Cohort and outcome
- **N = 5,007** older patients with diagnosed dementia in the SLaM CRIS-based retrospective cohort (as reported in the draft).
- Outcome: CMHT service-use event counts, not dementia incidence or severity.
- Follow-up analyses: Year 1, Year 5 and Year 9, using observation-time offsets.

## Quantitative results carried forward from the draft

| Exposure / hypothesis | Year 1 adjusted IRR | Year 5 adjusted IRR | Year 9 adjusted IRR | Important qualification |
|---|---:|---:|---:|---|
| Greenness / NDVI (H2) | ~0.38 | ~0.32 | ~0.33 | Per **1.0 NDVI unit** in the reported PM2.5-adjusted specification; not per 0.1 NDVI |
| Temperature (H3) | ~1.02 | Not separately verified | Not separately verified | Approximate effect per 1°C; year-specific source table needed |
| Deprivation / IMD (H4) | ~1.010 | ~1.007 | ~1.007 | Per 1 IMD index point |
| Pollution quartiles (H1) | Table-level values pending | Table-level values pending | Table-level values pending | PM2.5, PM10, NO2, NOx were assessed using Q1–Q4 |
| Pollution × NDVI / temperature / IMD | Not fully transcribed | Not fully transcribed | Not fully transcribed | Many reported interactions were not statistically conclusive |

**No 95% confidence intervals or p-values have been transcribed here** because the final underlying tables were not available for direct checking. The earlier manuscript draft reportedly contained at least one malformed interaction CI; interaction claims should be audited rather than copied without review.

## Interpretation safeguards
1. These are **associations with service utilization**, not causal effects and not dementia-incidence estimates.
2. NDVI IRR values refer to a full-unit difference on the NDVI scale; a 0.1-unit contrast would require rescaling the coefficient and CI, not reusing the full-unit IRR.
3. Model-specific sample sizes, confounder adjustment, observation windows and statistical uncertainty must be confirmed against the final thesis tables.
4. The newer generalized R code is a reproducibility companion under development, not the source of these historical estimates.

## Restricted data access
Individual-level NHS SLaM CRIS records are confidential and cannot be downloaded from this public repository. Access may be requested through the relevant SLaM/CRIS research governance and data access processes, subject to approvals and secure-environment conditions. Only disclosure-cleared aggregate results may be made public.

## Pending source reconciliation
- [ ] Verify manuscript version, authorship, thesis/publication status and citation.
- [ ] Enter exact H1 pollutant-quartile IRRs, 95% CIs, p-values and sample sizes.
- [ ] Confirm year-specific H3 temperature estimates.
- [ ] Verify NDVI/IMD models, scales, CI, and adjustment specifications.
- [ ] Correct malformed interaction CIs and check tests against narrative claims.
- [ ] Confirm aggregate-results disclosure approval.
