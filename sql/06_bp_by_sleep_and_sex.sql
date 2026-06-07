-- Query 6: Average BP by Sleep Category and Sex
-- Replicates sleep x sex interaction (p=0.025) from regression modeling.
-- Males show slight downward BP trend with more sleep (125.89 -> 124.76 mmHg).
-- Females show no consistent pattern. Age nearly identical across groups (~52 years).

SELECT
    CASE
        WHEN sleep_hours <= 6 THEN 'short'
        WHEN sleep_hours <= 8 THEN 'normal'
        ELSE 'long'
    END AS sleep_group,
    CASE WHEN sex = 1 THEN 'Male' ELSE 'Female' END AS sex_label,
    COUNT(*) AS n_participants,
    ROUND(AVG(systolic_bp), 2) AS avg_systolic_bp,
    ROUND(AVG(diastolic_bp), 2) AS avg_diastolic_bp,
    ROUND(AVG(sleep_hours), 2) AS avg_sleep_hours,
    ROUND(AVG(age), 2) AS avg_age
FROM nhanes
GROUP BY sleep_group, sex_label
ORDER BY sex_label, sleep_group;
