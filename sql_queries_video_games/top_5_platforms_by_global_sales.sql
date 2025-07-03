WITH platform_sales AS (
 SELECT
 p.platform_name, ROUND(SUM(s.global_sales), 2) AS Total_Sales
 FROM sales s
 JOIN platforms p ON g.platform_id = p.platform_id
 GROUP BY p.platform_name
)
SELECT *
FROM platform_sales
ORDER BY Total_Sales DESC
LIMIT 5;