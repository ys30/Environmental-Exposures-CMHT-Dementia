# Aggregate-result quality audit

This audit is **limited to numbers already documented in the public manuscript summary**. It does not access restricted CRIS records, does not recreate standard errors from source models, and cannot certify the original regression output.

## 1. Cross-model NDVI estimates

| Follow-up | H3 model NDVI IRR (95% CI) | H4 fuller model NDVI IRR (95% CI) |
|---|---|---|
| Year 1 | 0.442 (0.206–0.953) | 0.995 (0.391–2.529) |
| Year 5 | 0.381 (0.228–0.639) | 0.921 (0.491–1.726) |
| Year 9 | 0.403 (0.244–0.667) | 0.996 (0.540–1.836) |

**Observed:** The H3 NDVI intervals are below 1, whereas all H4 intervals include 1. The point estimates move closer to 1 with fuller adjustment.

**What this does not establish:** The change cannot be attributed specifically to deprivation, borough, sample composition, collinearity or any single confounder without comparing exact formulas, analysis rows and model diagnostics. Avoid calling the H3 association robust to full adjustment.

## 2. CI versus p-value flags

For a two-sided test of the same coefficient and variance estimator, a **95% CI that crosses IRR = 1 generally corresponds to p ≥ 0.05**. Rounding, different CI methods, or different variance estimators can create exceptions; a contradiction is a *review flag*, not proof of an error.

| Source summary | IRR | Reported 95% CI | Reported p | Audit finding |
|---|---:|---|---:|---|
| H2int: NO₂ Q4 × NDVI, Year 5 | 4.151 | 0.948–18.267 | 0.046 | CI crosses 1; verify estimator and source output |
| H3int: PM₁₀ Q3 × temperature, Year 1 | 0.979 | 0.958–1.002 | 0.049 | CI crosses 1; verify estimator and source output |
| H1: NOₓ Q4 vs Q1, Year 1 | 1.132 | 1.000–1.281 | source p < 0.05 | Lower bound rounds to 1.000; verify unrounded bounds |

The first two rows are interaction **term-level** comparisons; they do not replace an omnibus interaction test.

## 3. Sample denominators

- Main manuscript cohort: **5,007**.
- Separate supplementary complete-case count: **5,024**.
- Separate imputation-sample count: **5,272** (248 participants with missing covariates, as described in supplementary text).

**Open issue:** These may represent different inclusion, time-window or variable-completeness rules. Do not claim they are a single consistent N until the cohort flow and model-specific N are confirmed.

## 4. Required secure-environment checks

1. Compare the exact H3 and H4 model formulas, covariate reference levels, outcome windows and complete-case row IDs.
2. Check whether NDVI is measured on the same scale, with the same pollution adjustment, across H3, H4 and the draft manuscript.
3. Recompute coefficient estimates, robust standard errors, Wald p-values and confidence intervals **using the same variance estimator**; inspect unrounded outputs.
4. Run omnibus interaction tests for each pollutant–modifier combination, with a documented multiple-comparison strategy.
5. Verify Year 1/5/9 definitions, observation-time offsets and missing-data model specifications.
6. Export **only institutionally approved aggregate results** after disclosure review.

## Portfolio-safe conclusion

The source regression tables support reporting associations of higher pollution quartiles and higher deprivation with greater CMHT utilisation. NDVI and temperature associations vary with model adjustment; interaction evidence is not sufficiently consistent to claim a general effect-modification mechanism. This is an observational service-utilisation study, not a causal dementia-incidence analysis.
