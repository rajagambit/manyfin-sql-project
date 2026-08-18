-- Query 4: Monthly Ticket Volume Trend
-- Business question: How did ticket volume and resolution speed change over time?
-- Finding: July had worst resolution time (65.29h avg) despite lower volume than June

SELECT
  strftime('%Y-%m', created_date) AS month,
  COUNT(*) AS total_tickets,
  ROUND(AVG(CAST(resolution_time AS REAL)), 2) AS avg_resolution_hours
FROM tickets
GROUP BY month
ORDER BY month;