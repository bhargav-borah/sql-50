WITH cte AS (
    SELECT
        *,
        LAG(id) OVER() AS prev,
        LEAD(id) OVER() AS next
    FROM Seat
)

SELECT
    prev AS id,
    student
FROM cte
WHERE id % 2 = 0

UNION 

SELECT
    CASE
        WHEN next IS NULL THEN (SELECT COUNT(*) FROM Seat)
        ELSE next
    END AS id,
    student
FROM cte
WHERE id % 2 = 1

ORDER BY id ASC
