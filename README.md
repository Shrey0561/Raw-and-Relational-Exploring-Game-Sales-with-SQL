# Press Play for Insights: SQL Dashboard on Video Games

This project simulates an analytics dashboard using SQL. It focuses on global video game sales and uses structured querying and relational design to extract business-ready insights.

## Overview 

Using raw game sales data, this project transforms a flat file into a relational database and builds SQL-based *dashboard tiles* that mimic visual analytics, all without Power BI or Excel. It covers platform performance, genre patterns, publisher trends, and year-over-year global sales. 

## Entity Relationship Diagram (ERD)

![ERD](./ERD.png)
> Designed using dbdiagram.io

## Database Structure

Data was modeled into 5 main tables: 
- `games` - game details (name, platform, genre, etc.)
- `platforms` - platform names
- `genres` - genre types
- `publishers` - publisher information
- `sales` - regional and global sales

All tables are linked using foreign keys, and the schema was manually designed for clarity and efficiency.

## Key Questions Answered

 - Which platforms generate the highest global sales?
 - Which publishers dominate the market?
 - What are the highest and lowest-performing game genres?
 - How have global sales trended over the years?
 - What type of games fall into the Blockbuster vs Niche sales bucket?

## KPIs & Insights

Each insight below is written using SQL Common Table Expressions (CTEs) to simulate a dashboard tile.

### Top 5 Platforms by Global Sales
```sql
-- This is a SQL code block
WITH platform_sales AS (
 SELECT
  p.platform_name, ROUND(SUM(s.global_sales), 2) AS Total_Sales
  FROM sales s
  JOIN games g ON s.game_id = g.game_id
  JOIN platforms p ON g.platform_id = p.platform_id
  GROUP BY p.platform_name
)
SELECT platform_name, Total_Sales,
REPEAT ('▓', ROUND(total_sales / 1000)) AS Ascii_Chart
FROM platform_sales
ORDER BY Total_Sales DESC
LIMIT 5;
```
```
|Platform  |Global Sales (in millions)     | Chart            |
|----------|-------------------------------|------------------|
| Xbox 360 | 10835.41                      | ▓▓▓▓▓▓▓▓▓▓▓      |
| Ps3      | 10197.72                      | ▓▓▓▓▓▓▓▓▓▓       |
| Ps2      | 7325.55                       | ▓▓▓▓▓▓▓          |
| Wii      | 6198.93                       | ▓▓▓▓▓▓           |
| Ds       | 4263.75                       | ▓▓▓▓             |

```
Takeaway: Xbox 360 dominated with over 10.8K in sales, and strong NA & EU appeal helped it edge out competitors.

### Top 5 Publishers

|Publisher                   |Global Sales (in millions) |
|----------------------------|---------------------------|
|Nintendo                    | 14,462.46                 |
|Electronic Arts             | 11,098.62                 |
|Activision                  | 9,703.53                  |
|Take-Two Interactive        | 4,204.98                  |
|Sony Computer Entertainment | 3,642.57                  |

Takeaway: Nintendo's iconic IPs gave it a huge edge, the only publisher to cross 14K in global sales.

### Genre Sales Performance

 - Highest-Selling Genre : **Action** - 13,102.11M
   *Fast-paced gameplay and broad appeal made Action the top performer.*
   
 - Lowest-Selling Genre: **Strategy** - 498.96M
   *Despite depth, the genre struggled to attract mainstream success.*

### Global Sales Trend by Year
This simulated line chart shows how game sales evolved, peaking around 2008-2010 before a sharp decline by 2016.

| Year | Global Sales |
|------|--------------|
| 1980 | 63.63        |
| 1981 | 151.83       |
| 1982 | 99.36        |
| 1983 | 68.58        |
| 1984 | 404.91       |
| 1985 | 436.68       |
| 1986 | 251.19       |
| 1987 | 143.37       |
| 1988 | 389.25       |
| 1989 | 605.16       |
| 1990 | 396.99       |
| 1991 | 173.25       |
| 1992 | 591.39       |
| 1993 | 247.05       |
| 1994 | 506.34       |
| 1995 | 359.73       |
| 1996 | 1,191.51     |
| 1997 | 1,092.69     |
| 1998 | 1,423.26     |
| 1999 | 1,311.84     |
| 2000 | 995.04       |
| 2001 | 2,188.71     |
| 2002 | 2,231.01     |
| 2003 | 1,836.18     |
| 2004 | 2,330.46     |
| 2005 | 2,271.69     |
| 2006 | 3,253.95     |
| 2007 | 4,718.16     |
| 2008 | 5,122.26     |
| 2009 | 4,078.26     |
| 2010 | 4,778.28     |
| 2011 | 4,569.30     |
| 2012 | 3,048.57     |
| 2013 | 4,844.16     |
| 2014 | 4,679.82     |
| 2015 | 2,853.09     |
| 2016 | 328.05       |

### Sales Bucket Heatmap

| Sales Bucket                | Game Count |
|-----------------------------|------------|
| Niche Success (1M–4.9M)     | 16,425     |
| Moderate Hit (5M–9.9M)      | 1,899      |
| Hit (10M–19.9M)             | 603        |
| Blockbuster (20M+)          | 189        |

Takeaway: Blockbuster titles are *rare*, only 189 games crossed 20M+ sales. Most games stay in the niche/moderate zone.

## Tools Used 

 * MySQL - data modeling and querying
 * Excel - data cleaning
 * dbdiagram.io - ERD design and schema visualization

## Folder Structure 

| File/Folder              | Description                           |
|--------------------------|---------------------------------------|
| `README.md`              | This file                             |
| `/images/`               | ERD diagram and screenshots           |
| `/data/`                 | Cleaned CSV used for import           |
| `video_game_queries.sql` | SQL queries for all insights          |
| `case study`             | Full case study                       |

## Case Study: Behind the Queries
[Read the full case study](https://docs.google.com/document/d/1S4yuYQY2KCqcYIfT1PEbgiOFtp6Q5HS4NJODZsVNyRU/edit?usp=sharing)

## Why This Project Matters

This project highlights the ability to extract and communicate insights directly from structured data using only SQL. It demonstrated key data analytics skills, from database design to segmentation logic and business storytelling. 
By replicating typical dashboard views through raw queries, it reflects a deep understanding of how metrics, patterns, and business questions connect. It's not about the tool, it's about the thinking behind the insight.

## What I'd Explore Next

If this were a real business case: 
 * Add game ratings or user reviews to explore the impact on sales
 * Analyze sales by region + genre to see local market preferences
 * Add launch date data to study time-to-peak-sales trends
 * Use window functions (RANK, ROW_NUMBER) for leaderboard-style insights.

## Let's Connect

I'm actively building tools to uncover workplace insights through data. Feel free to reach out via:

 * [GitHub](https://github.com/Shrey0561)
 * [LinkedIn](https://www.linkedin.com/in/shreya-srinath-879a66205/)
 * [Notion](https://www.notion.so/Data-Analyst-Portfolio-221ebe151fdd801e9445e32590b67758?source=copy_link)


I'm always up for conversations or new opportunities!


