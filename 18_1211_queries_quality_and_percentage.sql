SELECT
    query_name,
    ROUND(AVG(rating / position), 2) AS quality,
    ROUND(SUM(rating < 3) / COUNT(rating) * 100, 2) AS poor_query_percentage
FROM Queries
GROUP BY query_name
HAVING query_name IS NOT NULL;

-- SELECT
--     ROUND(AVG(rating / position), 2) AS quality
-- FROM Queries
-- GROUP BY query_name;
