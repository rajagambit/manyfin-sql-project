-- Query 5: Average Resolution Time by Escalation Level
-- Business question: Which escalation level takes longest to resolve tickets?
-- Finding: Compliance & Risk slowest (77.46h avg), Tier 2 fastest (52.17h avg)

SELECT
  escalation_level,
  COUNT(*) AS total_tickets,
  ROUND(AVG(CAST(resolution_time AS REAL)), 2) AS avg_resolution_hours,
  ROUND(MIN(CAST(resolution_time AS REAL)), 2) AS fastest,
  ROUND(MAX(CAST(resolution_time AS REAL)), 2) AS slowest
FROM tickets
WHERE resolution_time IS NOT NULL
GROUP BY escalation_level
ORDER BY avg_resolution_hours DESC;