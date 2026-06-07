-- Query 1: Sleep Hours Distribution
-- Shows the distribution of self-reported sleep hours across the sample.
-- Most participants report 7-8 hours; 8.0 hours is the modal category (20.47%).

SELECT 
    sleep_hours,
    COUNT(*) AS n_participants,
    ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (), 2) AS pct_of_sample
FROM nhanes
GROUP BY sleep_hours
ORDER BY sleep_hours;