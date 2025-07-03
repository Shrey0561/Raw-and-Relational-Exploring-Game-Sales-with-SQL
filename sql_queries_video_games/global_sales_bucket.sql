WITH sales_bucket AS (
 SELECT g.game_name, 
 CASE
  WHEN s.global_sales >= 20 THEN 'Blockbuster (20M+)'
  WHEN s.global_sales >= 10 THEN 'Hit (10M - 19.9M)'
  WHEN s.global_sales >= 5 THEN 'Moderate Hit (5M - 9.9M)'
  WHEN s.global_sales >= 1 THEN 'Niche Success (1M - 4.9M)'
  ELSE 'Low Impact (< 1M)'
 END AS sales_bucket
 FROM sales s
 JOIN games g ON s.game_id = g.game_id
)
SELECT sales_bucket, COUNT(*) AS game_count
FROM sales_bucket
ORDER BY game_count DESC;