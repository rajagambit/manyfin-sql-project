WITH duration_check AS (
  SELECT
    ticket_id,
    resolution_time,
    ROUND ((julianday(resolution_date) - julianday(created_date)) * 24, 2) AS calculated_hours
  FROM tickets
  WHERE resolution_date IS NOT NULL
)
SELECT
  ticket_id,
  resolution_time,
  calculated_hours,
  ROUND(ABS(resolution_time - calculated_hours), 2) AS diff_hours
FROM duration_check
WHERE ABS(resolution_time - calculated_hours) > 0.02
ORDER BY diff_hours DESC;
