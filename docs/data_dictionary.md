# Working data dictionary (verify against authorized extract)

| Concept | Candidate variable | Notes |
|---|---|---|
| CMHT count, Year 1 | `community_MHT_events_Y1` | Outcome; confirm event coding |
| CMHT count, Year 5 | `community_MHT_events_Y5` | Outcome; confirm cumulative vs interval definition |
| CMHT count, Year 9 | `community_MHT_events_Y9` | Outcome; confirm cumulative vs interval definition |
| Observation days, Year 1 | `active_slam_days_Y1` | Offset; must be >0 |
| Observation days, Year 5 | `active_slam_days_Y5` | Offset; must be >0 |
| Observation days, Year 9 | `active_slam_days_Y9` | Offset; must be >0 |
| Greenness | `ndvi_cohort_entry` | Continuous; report unit/scale |
| Temperature | `temp_cohort_entry` | Confirm °C and aggregation |
| Deprivation | `IMD_2015` | Continuous index; verify interpretation |
| Borough | `borough_slam` | Geographic confounder |
| Fragmentation | `social_fragmentation` | Verify definition |
| Air pollutants | PM2.5 / PM10 / NO2 / NOx | Confirm exact source column names and units |

Names reflect draft manuscript terminology and must be checked against the approved extract. No person-level data are included.
