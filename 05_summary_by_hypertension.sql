-- Query 5: Summary Statistics by Hypertension Status
-- Hypertensive participants are older (62.29 vs 46.56 years) and have higher
-- BMI (31.68 vs 28.37). Sleep hours virtually identical (7.71 vs 7.72),
-- providing a clean single-number summary of the null sleep finding.

SELECT
    CASE WHEN hypertension_diagnosis = 1 THEN 'Hypertensive' ELSE 'Not Hypertensive' END AS diagnosis,
    COUNT(*) AS n_participants,
    ROUND(AVG(age), 2) AS avg_age,
    ROUND(AVG(bmi), 2) AS avg_bmi,
    ROUND(AVG(sleep_hours), 2) AS avg_sleep_hours,
    ROUND(AVG(systolic_bp), 2) AS avg_systolic_bp
FROM nhanes
GROUP BY hypertension_diagnosis
ORDER BY hypertension_diagnosis;