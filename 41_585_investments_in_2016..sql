WITH cte_1 AS (
    SELECT
        tiv_2015,
        COUNT(*) AS count
    FROM Insurance
    GROUP BY tiv_2015
),

cte_2 AS (
    SELECT
        CONCAT(lat, ' ', lon) AS location,
        COUNT(*) AS count
    FROM Insurance
    GROUP BY location
)

SELECT
    ROUND(SUM(tiv_2016), 2) AS tiv_2016
FROM Insurance i
LEFT JOIN cte_1 
ON i.tiv_2015 = cte_1.tiv_2015
LEFT JOIN cte_2 ON cte_2.location = CONCAT(i.lat, ' ', i.lon)
WHERE cte_1.count > 1 AND cte_2.count = 1

