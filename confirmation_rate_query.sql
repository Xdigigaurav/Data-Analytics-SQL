SELECT 
    s.user_id,
    ROUND(
        1.0 * SUM(
            CASE 
                WHEN c.action = 'confirmed' THEN 1 
                ELSE 0 
            END
        ) / COUNT(*),
        2
    ) AS confirmation_rate
FROM Signups s
LEFT JOIN Confirmations c
    ON s.user_id = c.user_id
GROUP BY s.user_id;

/*
  SQL Query: Calculate each user's confirmation rate

  Explanation:
  - Used LEFT JOIN to include all users, even those who never requested confirmation.
  - SUM(CASE WHEN c.action='confirmed' THEN 1 ELSE 0 END) counts how many confirmations succeeded.
  - COUNT(*) is used instead of COUNT(c.action) because COUNT(*) includes rows where
    c.action IS NULL (after the LEFT JOIN). This ensures users with no confirmation 
    attempts are still included in the output with a confirmation rate of 0.00.
  - Multiplying by 1.0 ensures the division returns a decimal instead of an integer.
  - ROUND(..., 2) rounds the result to two decimal places for clarity and consistent output.
*/
