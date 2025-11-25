USE portfolio_projects;

CREATE TABLE gender_inequality (
    iso3 VARCHAR(10),
    country VARCHAR(100),
    continent VARCHAR(50),
    hemisphere VARCHAR(50),
    human_dev_groups VARCHAR(50),
    undp_regions VARCHAR(50),
    hdi_rank_2021 INT,
    gii_rank_2021 INT,
    gii_1990 DECIMAL(5,3),
    gii_2021 DECIMAL(5,3)
);
USE portfolio_projects;

DROP TABLE IF EXISTS gender_inequality;

CREATE TABLE gender_inequality (
    iso3 VARCHAR(10),
    country VARCHAR(100),
    continent VARCHAR(50),
    hemisphere VARCHAR(50),
    human_dev_groups VARCHAR(50),
    undp_regions VARCHAR(50),
    hdi_rank_2021 INT,
    gii_rank_2021 INT,
    gii_1990 DECIMAL(5,3),
    gii_1992 DECIMAL(5,3),
    gii_1993 DECIMAL(5,3),
    gii_1994 DECIMAL(5,3),
    gii_1995 DECIMAL(5,3),
    gii_1996 DECIMAL(5,3),
    gii_1997 DECIMAL(5,3),
    gii_1998 DECIMAL(5,3),
    gii_1999 DECIMAL(5,3),
    gii_2000 DECIMAL(5,3),
    gii_2004 DECIMAL(5,3),
    gii_2005 DECIMAL(5,3),
    gii_2006 DECIMAL(5,3),
    gii_2007 DECIMAL(5,3),
    gii_2008 DECIMAL(5,3),
    gii_2009 DECIMAL(5,3),
    gii_2010 DECIMAL(5,3),
    gii_2011 DECIMAL(5,3),
    gii_2012 DECIMAL(5,3),
    gii_2014 DECIMAL(5,3),
    gii_2015 DECIMAL(5,3),
    gii_2016 DECIMAL(5,3),
    gii_2017 DECIMAL(5,3),
    gii_2018 DECIMAL(5,3),
    gii_2019 DECIMAL(5,3),
    gii_2020 DECIMAL(5,3),
    gii_2021 DECIMAL(5,3)
);

USE portfolio_projects;

DROP TABLE IF EXISTS gender_inequality;

CREATE TABLE gender_inequality (
    iso3 VARCHAR(10),
    country VARCHAR(100),
    continent VARCHAR(50),
    hemisphere VARCHAR(50),
    human_dev_groups VARCHAR(50),
    undp_regions VARCHAR(50),
    hdi_rank_2021 INT,
    gii_rank_2021 INT,
    gii_1990 DECIMAL(5,3),
    gii_1991 DECIMAL(5,3),
    gii_1992 DECIMAL(5,3),
    gii_1993 DECIMAL(5,3),
    gii_1994 DECIMAL(5,3),
    gii_1995 DECIMAL(5,3),
    gii_1996 DECIMAL(5,3),
    gii_1997 DECIMAL(5,3),
    gii_1998 DECIMAL(5,3),
    gii_1999 DECIMAL(5,3),
    gii_2000 DECIMAL(5,3),
    gii_2001 DECIMAL(5,3),
    gii_2002 DECIMAL(5,3),
    gii_2003 DECIMAL(5,3),
    gii_2004 DECIMAL(5,3),
    gii_2005 DECIMAL(5,3),
    gii_2006 DECIMAL(5,3),
    gii_2007 DECIMAL(5,3),
    gii_2008 DECIMAL(5,3),
    gii_2009 DECIMAL(5,3),
    gii_2010 DECIMAL(5,3),
    gii_2011 DECIMAL(5,3),
    gii_2012 DECIMAL(5,3),
    gii_2013 DECIMAL(5,3),
    gii_2014 DECIMAL(5,3),
    gii_2015 DECIMAL(5,3),
    gii_2016 DECIMAL(5,3),
    gii_2017 DECIMAL(5,3),
    gii_2018 DECIMAL(5,3),
    gii_2019 DECIMAL(5,3),
    gii_2020 DECIMAL(5,3),
    gii_2021 DECIMAL(5,3)
    
);

USE portfolio_projects;

SELECT COUNT(*) FROM gender_inequality;

SELECT * FROM gender_inequality
LIMIT 10;

-- Query 1: Top 10 countries with HIGHEST gender inequality (2021)
SELECT 
    country,
    continent,
    human_dev_groups,
    gii_2021
FROM gender_inequality
WHERE gii_2021 IS NOT NULL
ORDER BY gii_2021 DESC
LIMIT 10;

-- Query 2: Top 10 countries with LOWEST gender inequality (most equal) in 2021
SELECT 
    country,
    continent,
    human_dev_groups,
    gii_2021
FROM gender_inequality
WHERE gii_2021 IS NOT NULL
ORDER BY gii_2021 ASC
LIMIT 10;

-- Query 3: Average gender inequality by continent (2021)
SELECT 
    continent,
    ROUND(AVG(gii_2021), 3) AS avg_inequality,
    COUNT(*) AS country_count
FROM gender_inequality
WHERE gii_2021 IS NOT NULL
GROUP BY continent
ORDER BY avg_inequality DESC;

SELECT 
    'Global Average' AS region,
    ROUND(AVG(gii_1990), 3) AS avg_1990,
    ROUND(AVG(gii_2000), 3) AS avg_2000,
    ROUND(AVG(gii_2010), 3) AS avg_2010,
    ROUND(AVG(gii_2021), 3) AS avg_2021
FROM gender_inequality;

SELECT 
    country,
    continent,
    gii_1990,
    gii_2021,
    ROUND((gii_1990 - gii_2021), 3) AS improvement,
    ROUND(((gii_1990 - gii_2021) / gii_1990 * 100), 1) AS improvement_percent
FROM gender_inequality
WHERE gii_1990 IS NOT NULL AND gii_2021 IS NOT NULL
ORDER BY improvement DESC
LIMIT 10;

SELECT 
    country,
    human_dev_groups,
    gii_2021,
    CASE 
        WHEN gii_2021 < 0.3 THEN 'Low Inequality'
        WHEN gii_2021 < 0.5 THEN 'Medium Inequality'
        ELSE 'High Inequality'
    END AS inequality_level
FROM gender_inequality
WHERE continent = 'Africa' AND gii_2021 IS NOT NULL
ORDER BY gii_2021 ASC
LIMIT 15;

SELECT 
    COUNT(*) AS total_countries,
    ROUND(AVG(gii_2021), 3) AS global_avg_2021,
    ROUND(MIN(gii_2021), 3) AS best_gii,
    ROUND(MAX(gii_2021), 3) AS worst_gii,
    SUM(CASE WHEN gii_2021 < 0.3 THEN 1 ELSE 0 END) AS low_inequality_countries,
    SUM(CASE WHEN gii_2021 >= 0.3 AND gii_2021 < 0.5 THEN 1 ELSE 0 END) AS medium_inequality_countries,
    SUM(CASE WHEN gii_2021 >= 0.5 THEN 1 ELSE 0 END) AS high_inequality_countries
FROM gender_inequality
WHERE gii_2021 IS NOT NULL;