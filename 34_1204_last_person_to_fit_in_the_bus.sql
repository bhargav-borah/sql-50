WITH cte AS (
    SELECT
        *,
        SUM(weight) OVER(ORDER BY turn) AS total_weight
    FROM Queue
    ORDER BY turn
)

SELECT
    person_name
FROM cte
WHERE total_weight <= 1000
ORDER BY total_weight DESC
LIMIT 1
