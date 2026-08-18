sql
-- Query 1: SLA Breach Rate
-- Business question: What percentage of resolved tickets missed their SLA target?
-- Finding: 50% of resolved tickets (19 out of 38) breached SLA

SELECT
  COUNT(*) AS total_resolved,
  SUM(CASE WHEN CAST(resolution_time AS REAL) > sla_target 
      THEN 1 ELSE 0 END) AS breached,
  ROUND(
    SUM(CASE WHEN CAST(resolution_time AS REAL) > sla_target 
        THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
  2) AS breach_rate_pct
FROM tickets
WHERE resolution_date IS NOT NULL;