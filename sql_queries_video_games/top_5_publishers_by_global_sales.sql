WITH publisher_sales AS (
 SELECT
 pub.publisher_name, ROUND(SUM(s.global_sales), 2) AS Total_Sales
 FROM sales s
 JOIN games g ON s.game_id = g.game_id
 JOIN publishers pub ON g.publisher_id = pub.publisher_id
 GROUP BY pub.publisher_name
)
SELECT *
FROM publisher_sales
ORDER BY Total_Sales DESC
LIMIT 5;