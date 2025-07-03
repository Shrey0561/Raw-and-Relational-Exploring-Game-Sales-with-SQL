WITH genre_sales AS (
 SELECT
 gnr.genre_name, ROUND(SUM(s.global_sales), 2) AS Total_Sales
 FROM sales s
 JOIN games g ON s.game_id = g.game_id
 JOIN genres gnr ON g.genre_id = gnr.genre_id
 GROUP BY gnr.genre_name
)
SELECT *
FROM genre_sales
ORDER BY Total_Sales DESC
LIMIT 1;