SELECT 
    t1.id
FROM Weather t1
LEFT JOIN Weather t2
ON t1.recordDate = DATE_ADD(t2.recordDate, INTERVAL 1 DAY)
WHERE t2.id IS NOT NULL AND t1.temperature > t2.temperature;
