SELECT *
FROM (
  SELECT
    ticket_id,
    COUNT(*) OVER (PARTITION BY ticket_id) AS occurrence_count
  FROM tickets
) sub
WHERE occurrence_count > 1;
