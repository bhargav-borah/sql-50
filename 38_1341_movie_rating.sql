WITH cte_1 AS (
    SELECT
        user_id,
        COUNT(*) AS num_movies_rated
    FROM MovieRating
    GROUP BY user_id
),

cte_2 AS (
    SELECT 
        user_id
    FROM cte_1
    WHERE num_movies_rated = (SELECT MAX(num_movies_rated) FROM cte_1)
),

cte_3 AS (
    SELECT
        movie_id,
        AVG(rating) AS avg_rating
    FROM MovieRating
    WHERE created_at BETWEEN '2020-02-01' AND '2020-02-29'
    GROUP BY movie_id 
),

cte_4 AS (
    SELECT
        movie_id
    FROM cte_3
    WHERE avg_rating = (SELECT MAX(avg_rating) FROM cte_3)
)


(
    SELECT
        u.name AS results
    FROM Users u
    JOIN cte_2
    ON u.user_id = cte_2.user_id
    ORDER BY u.name ASC 
    LIMIT 1
)

UNION ALL

(
    SELECT
        m.title AS results
    FROM Movies m
    JOIN cte_4
    ON m.movie_id = cte_4.movie_id
    ORDER BY m.title ASC
    LIMIT 1
)
