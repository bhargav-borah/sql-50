SELECT 
    s.user_id,
    ROUND(COALESCE(SUM(c.action = 'confirmed') / COUNT(s.user_id), 0.0), 2) AS confirmation_rate
FROM Signups s
LEFT JOIN Confirmations c
ON s.user_id = c.user_id
GROUP BY s.user_id;


-- In case we didn't need to include the confirmation rate of the user who didn't request any confirmation message
-- SELECT
--     user_id,
--     SUM(action = 'confirmed') / COUNT(user_id) AS confirmation_rate
-- FROM Confirmations
-- GROUP BY user_id;

