-- Query 3: Refund Impact by Issue Type
-- Business question: Which issue types cost the most in total refunds?
-- Finding: FX Exchange Rate Slip Dispute generated highest total refunds (906.19)

SELECT
  issue_type,
  COUNT(*) AS ticket_count,
  ROUND(SUM(refund_amount), 2) AS total_refund,
  ROUND(AVG(refund_amount), 2) AS avg_refund
FROM tickets
WHERE refund_amount > 0
GROUP BY issue_type
ORDER BY total_refund DESC;