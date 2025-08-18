# Press Play for Insights: Video Games Sales & Platform Trends Dashboard (SQL)

This SQL-only project simulates an interactive dashboard by using ASCII visuals and query outputs to analyze 16K+ video game sales. It uncovers business patterns in platforms, genres, regions, and publishers, proving that backend logic and storytelling can deliver powerful insights even without traditional BI tools.

## TL;DR
**Problem:** Gaming companies need to understand which platforms, genres, and publishers are driving global market share.

**Process:** Used SQL-only, including relational joins, CTEs, and ASCII visualizations to analyze **16K+ video game records**.

**Result:** 
- Identified top-performing platforms (Xbox 360, PS3) and regional growth differences
- Highlighted genre performance (Action vs Strategy) and publisher dominance
- Pinpointed blockbuster vs niche sales buckets using logic-first segmenting

**Takeaway:** Backend SQL workflows can deliver powerful business insights, even before dashboards are introduced.

## SQL Logic Preview
This project replaces a traditional dashboard with backend SQL logic and ASCII-style visualizations. Below is the Entity Relationship Diagram (ERD) used to model the relational database behind the analysis.

![ERD](./ERD.png)

## Database Tables (Schema Reference)

Data was modeled into 5 main tables: 
- `games` - game details (name, platform, genre, etc.)
- `platforms` - platform names
- `genres` - genre types
- `publishers` - publisher information
- `sales` - regional and global sales

All tables are linked using foreign keys, and the schema was manually designed for clarity and efficiency.


## Table of Contents
* [Overview](#overview)
* [Key Questions Answered](#key-questions-answered)
* [KPIs & Insights](#kpis--insights)
* [Tools Used](#tools-used)
* [Case Study - Full Walkthrough](#case-study-full-walkthrough)
* [What I'd Explore Next](#what-id-explore-next)
* [What This Project Demonstrates](#what-this-project-demonstrates)
* [Let's Connect](#lets-connect)

## Overview 

Starting from raw video game sales data, this project models a relational SQL database and builds "logic-first" dashboard tiles using queries and ASCII visuals. It explores platform performance, genre trends, publisher dominance, and year-over-year global sales to surface market-driven business insights.

## Key Questions Answered

 - Which platforms generate the highest global sales?
 - Which publishers dominate the market?
 - What are the highest and lowest-performing game genres?
 - How have global sales trended over the years?
 - What games fall into Blockbuster vs Niche sales buckets?

## KPIs & Insights
**🎮Top Platforms**
- **Xbox 360** and **PS3** dominate global game sales (10.8B+ and 10.1B+ units)
- Regional reach outweighed pure hardware specs in overall performance

### ASCII Chart Legend
*Each “▓” = ~1,000 million units sold (scaled).*

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
|Platform  |Global Sales (in millions)     | Ascii_Chart      |
|----------|-------------------------------|------------------|
| Xbox 360 | 10,835.41                     | ▓▓▓▓▓▓▓▓▓▓▓      |
| Ps3      | 10,197.72                     | ▓▓▓▓▓▓▓▓▓▓       |
| Ps2      | 7,325.55                      | ▓▓▓▓▓▓▓          |
| Wii      | 6,198.93                      | ▓▓▓▓▓▓           |
| Ds       | 4,263.75                      | ▓▓▓▓             |
```

**🏢 Top Publishers**
* **Nintendo** leads global sales (14.46B), followed by Electronic Arts and Activision
* Highlights the advantage of owning IP, hardware, and a family-friendly catalog

**🎭 Genre Performance**
* **Action** games dominate (~13B)
* **Strategy** games remain niche (<500M), despite loyal communities

**📈 Sales Trend Over Time**
* Peak growth occurred during **2006-2010**, driven by console maturity and cross-platform hits
* Post-2015 dip reflects rise of **mobile + digital distribution**

**🔥 Blockbuster vs Niche** 
* Only **189 games** achieved blockbuster status (20M+ units)
* ~16K titles fall into "**niche success**" (1-4.9M), reinforcing long-tail dynamics

## Tools Used 

- **MySQL** - Data modeling and SQL querying
- **Microsoft Excel** - Minor data cleaning before import
- **dbdiagram.io** - ERD design and schema visualization

## Case Study - Full Walkthrough
Explore the business context, SQL logic, and schema design driving each query:

[View the full case study](https://docs.google.com/document/d/1S4yuYQY2KCqcYIfT1PEbgiOFtp6Q5HS4NJODZsVNyRU/edit?usp=sharing)

## What I'd Explore Next
In a future version of this project, I would: 
- Integrate gamer ratings or reviews to measure quality vs sales
- Analyze region + genre interactions to capture local preferences
- Add launch date data to study time-to-peak performance
- Introduce window functions (e.g., RANK, ROW_NUMBER) for leaderboard-style insights

## What This Project Demonstrates
 - Ability to perform backend analytics using SQL (without BI tools)
 - Exposure to data modeling with custom schemas and foreign keys
 - Practice turning SQL outputs into story-driven insights using CTEs and ASCII visuals
 - Growing understanding of genre, platform, and market performance metrics
  
## Let's Connect

I'm building my career in data analytics and love exploring how market trends translate into business strategy. Feel free to reach out via:

 * [GitHub](https://github.com/Shrey0561)
 * [LinkedIn](https://www.linkedin.com/in/shreya-srinath-879a66205/)
 * [Notion](https://www.notion.so/Data-Analyst-Portfolio-221ebe151fdd801e9445e32590b67758?source=copy_link)


I'm always open to conversations, mentorship, or entry-level opportunities.


