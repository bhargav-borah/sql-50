SELECT
    DISTINCT c.visited_on,
    (
        SELECT
            SUM(amount)
        FROM Customer
        WHERE visited_on BETWEEN DATE_SUB(c.visited_on, INTERVAL 6 DAY) AND c.visited_on 
    ) AS amount,
    (
        SELECT
            ROUND(SUM(amount) / 7, 2)
        FROM Customer
        WHERE visited_on BETWEEN DATE_SUB(c.visited_on, INTERVAL 6 DAY) AND c.visited_on
    ) AS average_amount
FROM Customer c
WHERE c.visited_on > (SELECT DATE_ADD(MIN(visited_on), INTERVAL 5 DAY) FROM Customer)
ORDER BY c.visited_on ASC
