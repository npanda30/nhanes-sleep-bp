-- Query 2: Average Blood Pressure by Sleep Group
-- Average systolic BP is stable across sleep groups (~121-124 mmHg),
-- consistent with the non-significant sleep coefficient in regression (p=0.499).
-- Note: extreme sleep groups (<=3hrs, >=11.5hrs) have very small sample sizes.

SELECT
    sleep_hours,
    ROUND(AVG(systolic_bp), 2) AS avg_systolic_bp,
    ROUND(AVG(diastolic_bp), 2) AS avg_diastolic_bp,
    COUNT(*) AS n_participants
FROM nhanes
GROUP BY sleep_hours
ORDER BY sleep_hours;
