SELECT 
    t1.name,
    t2.bonus
FROM Employee t1
LEFT JOIN Bonus t2
ON t1.empId = t2.empId
WHERE COALESCE(t2.bonus, 0) < 1000;

-- SELECT 
--     t1.name,
--     t2.bonus
-- FROM Employee t1
-- LEFT JOIN Bonus t2
-- ON t1.empId = t2.empId
-- WHERE IFNULL(t2.bonus, 0) < 1000;

-- SELECT
--     t1.name,
--     t2.bonus
-- FROM Employee t1
-- LEFT JOIN Bonus t2
-- ON t1.empId = t2.empId
-- WHERE t2.bonus IS NULL OR t2.bonus < 1000;
