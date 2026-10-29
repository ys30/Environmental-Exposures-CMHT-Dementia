# Analysis plan (working draft)

## Research question
How are environmental exposures and socioeconomic deprivation associated with CMHT service utilization among older adults already diagnosed with dementia?

**Do not interpret service-use associations as dementia incidence or causation.**

## Cohort and outcomes
- Retrospective longitudinal SLaM CRIS cohort, age 65+ and dementia diagnosis F00–F03.
- Index first face-to-face contact during 2008–2012; confirm all inclusion/exclusion logic.
- Reported final N = 5,007; independently audit.
- CMHT event counts for Year 1, Year 5, Year 9.
- Exposure offset: log(active SLaM observation days); verify positivity and unit definition.

## Predictors
- Pollution: PM2.5, PM10, NO2, NOx; baseline concentrations and quartiles Q1–Q4.
- NDVI: continuous baseline greenness.
- Temperature: baseline average maximum temperature.
- IMD: 2015 deprivation index, continuous.
- Covariates: entry year and season; age, gender, ethnicity, borough, social fragmentation.

## Models
Negative-binomial regression (e.g., MASS::glm.nb), exposure-specific:
1. Year and season.
2. Add NDVI.
3. Add temperature.
4. Add demographic, geographic and socioeconomic covariates.

Evaluate pollutant×NDVI, pollutant×temperature, and pollutant×IMD interactions separately; prespecify scale, reference levels and contrasts.

## Validation before reporting
- Cohort flow and missingness; uniqueness and longitudinal observation windows.
- Offset definitions and event counting; check zero/negative days.
- Pollution quartile cutpoints, ties and ordering.
- Collinearity and exposure correlations; distribution/overdispersion.
- Model convergence, fit, robust SE approach and CI construction.
- Multiple testing and interactions interpreted with uncertainty.
- Sensitivity analyses and disclosure review.

**Status:** Planning documentation only; no source-data verification or model reruns have been performed in this public repository.
