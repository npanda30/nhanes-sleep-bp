-- Query 4: Summary Statistics by Sex
-- Males have higher average systolic BP (125.14 vs 120.36 mmHg) and higher
-- hypertension rates (37.59% vs 35.31%). Sleep hours nearly identical between
-- sexes (7.64 vs 7.79), confirming non-significant sleep x sex main effect.

SELECT
    CASE WHEN sex = 1 THEN 'Male' ELSE 'Female' END AS sex_label,
    COUNT(*) AS n_participants,
    ROUND(AVG(systolic_bp), 2) AS avg_systolic_bp,
    ROUND(AVG(diastolic_bp), 2) AS avg_diastolic_bp,
    ROUND(AVG(sleep_hours), 2) AS avg_sleep_hours,
    ROUND(SUM(CASE WHEN hypertension_diagnosis = 1 THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS pct_hypertensive
FROM nhanes
GROUP BY sex
ORDER BY sex;
