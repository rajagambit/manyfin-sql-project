SELECT
  ic.category,
  COUNT(DISTINCT t.ticket_id) AS unique_ticket_count,
  COUNT(*) AS raw_row_count
FROM tickets t
JOIN issue_category ic ON t.issue_type = ic.issue_type
GROUP BY ic.category
ORDER BY unique_ticket_count DESC;
