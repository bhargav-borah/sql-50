WITH cte AS (
    SELECT
        player_id,
        MIN(event_date) AS first_login_date
    FROM Activity
    GROUP BY player_id
)

SELECT 
    ROUND(COUNT(*) / (SELECT COUNT(DISTINCT player_id) FROM Activity), 2) AS fraction
FROM Activity a
JOIN cte c
ON a.player_id = c.player_id
WHERE DATE_ADD(c.first_login_date, INTERVAL 1 DAY) = a.event_date;
