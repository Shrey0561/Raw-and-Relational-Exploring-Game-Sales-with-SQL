WITH sales_trend AS (
 SELECT
 g.year_of_release, ROUND(SUM(s.global_sales), 2) AS Total_Global_Sales
 FROM sales s
 JOIN games g ON s.game_id = g.game_id
 GROUP BY g.year_of_release
 ORDER BY g.year_of_release
)
SELECT *
FROM sales_trend;