sql
-- Query 2: Escalation Frequency by Issue Type
-- Business question: Which issue types most frequently reach each escalation level?
-- Finding: Crypto Withdrawal Security Hold had highest volume at Tier 2 (5 tickets)

SELECT
  issue_type,
  escalation_level,
  COUNT(*) AS total_tickets
FROM tickets
GROUP BY issue_type, escalation_level
ORDER BY total_tickets DESC;