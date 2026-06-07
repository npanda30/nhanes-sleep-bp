-- Query 3: Hypertension Rates by Age Group
-- Hypertension rates increase dramatically with age, from 5.95% (18-30)
-- to 55.84% (61-80). Sharpest increase between 31-45 and 46-60 age groups,
-- consistent with age-related arterial stiffness and dominant age effect in regression.

SELECT
    CASE
        WHEN age BETWEEN 18 AND 30 THEN '18-30'
        WHEN age BETWEEN 31 AND 45 THEN '31-45'
        WHEN age BETWEEN 46 AND 60 THEN '46-60'
        WHEN age BETWEEN 61 AND 80 THEN '61-80'
    END AS age_group,
    COUNT(*) AS n_participants,
    ROUND(AVG(systolic_bp), 2) AS avg_systolic_bp,
    ROUND(SUM(CASE WHEN hypertension_diagnosis = 1 THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS pct_hypertensive
FROM nhanes
GROUP BY age_group
ORDER BY age_group;
