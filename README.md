# GENDER INEQUALITY INDEX ANALYSIS

**By:** Buhle Damane  
**Date:** November 25, 2025  
**Project Duration:** 7 days

---

## PROJECT OVERVIEW

This project analyzes gender inequality across 194 countries using the Gender Inequality Index (GII) dataset from Kaggle. The analysis spans 31 years (1990-2021) and examines patterns across continents, identifies countries with the highest and lowest inequality, and tracks global trends over time.

The project demonstrates proficiency in:
- Database management and SQL querying
- Data analysis and statistical interpretation
- Data visualization in Excel
- Technical documentation

---

## DATASET INFORMATION

- **Source:** Kaggle - Gender Inequality Index Dataset
- **Total Countries:** 194 (128 with complete data)
- **Time Period:** 1990-2021 (31 years)
- **Key Metrics:**
  - Gender Inequality Index (GII) Value
  - GII Rank
  - Human Development Group
  - Continental Classification

### What is GII?

The Gender Inequality Index measures gender disparities in reproductive health, empowerment, and economic status. Values range from 0 (perfect equality) to 1 (complete inequality).

---

## TOOLS & TECHNOLOGIES USED

1. **MySQL Workbench 8.0**
   - Database creation and management
   - Complex SQL queries
   - Data filtering and aggregation

2. **Microsoft Excel**
   - Data visualization
   - Dashboard creation
   - Chart formatting

3. **Documentation**
   - Technical writing
   - Data interpretation

---

## RESEARCH QUESTIONS

1. Which 10 countries have the highest gender inequality?
2. Which 10 countries have the lowest gender inequality (most equal)?
3. What is the average gender inequality by continent?
4. How has global gender inequality changed from 1990 to 2021?
5. Which countries showed the biggest improvement in gender equality?
6. How do African countries compare in terms of gender inequality?
7. What is the distribution of countries across inequality levels?

---

## KEY FINDINGS

### 1. Geographic Patterns
- 9 out of 10 most unequal countries are in Africa
- Papua New Guinea (Oceania) is the most unequal country globally (GII: 0.725)
- 90% of the most equal countries are in Europe
- Europe has the lowest average continental GII (0.103)

### 2. Historical Trends
- Gender inequality has decreased by 34% from 1990 (0.488) to 2021 (0.322)
- Consistent improvement every decade:
  - 1990 → 2000: 10.25% decrease
  - 2000 → 2010: 14.6% decrease
  - 2010 → 2021: 13.9% decrease

### 3. Continental Analysis
- **Africa:** Highest average inequality (0.525)
- **Europe:** Lowest average inequality (0.103)
- **Oceania, America, Asia:** Medium inequality levels

### 4. Country-Specific Insights
- **Most Unequal:** Papua New Guinea (0.725)
- **Most Equal:** Denmark, Norway, Switzerland (all below 0.050)
- **Biggest Improver:** United Arab Emirates (92.6% improvement from 1990-2021)

### 5. Development Correlation
- 60% of high-inequality countries have low Human Development (poor, low education, low life expectancy)
- 100% of low-inequality countries have high Human Development (wealthy, educated, high life expectancy)

---

## SQL QUERIES EXECUTED

### Query 1: Top 10 Most Unequal Countries
```sql
SELECT country, continent, human_dev_groups, gii_2021
FROM gender_inequality
WHERE gii_2021 IS NOT NULL
ORDER BY gii_2021 DESC
LIMIT 10;
```
**Purpose:** Identify countries with highest gender inequality in 2021

### Query 2: Top 10 Most Equal Countries
```sql
SELECT country, continent, human_dev_groups, gii_2021
FROM gender_inequality
WHERE gii_2021 IS NOT NULL
ORDER BY gii_2021 ASC
LIMIT 10;
```
**Purpose:** Identify countries with lowest gender inequality (best performers)

### Query 3: Average Inequality by Continent
```sql
SELECT continent, 
       ROUND(AVG(gii_2021), 3) AS avg_inequality,
       COUNT(*) AS country_count
FROM gender_inequality
WHERE gii_2021 IS NOT NULL
GROUP BY continent
ORDER BY avg_inequality DESC;
```
**Purpose:** Compare regional differences in gender inequality

### Query 4: Global Trend Analysis (1990-2021)
```sql
SELECT 'Global Average' AS region,
       ROUND(AVG(gii_1990), 3) AS avg_1990,
       ROUND(AVG(gii_2000), 3) AS avg_2000,
       ROUND(AVG(gii_2010), 3) AS avg_2010,
       ROUND(AVG(gii_2021), 3) AS avg_2021
FROM gender_inequality
WHERE gii_1990 IS NOT NULL 
  AND gii_2021 IS NOT NULL;
```
**Purpose:** Track how gender inequality has changed over 31 years

### Query 5: Biggest Improvements (1990-2021)
```sql
SELECT country, continent,
       gii_1990, gii_2021,
       ROUND(((gii_1990 - gii_2021) / gii_1990 * 100), 1) AS improvement_pct
FROM gender_inequality
WHERE gii_1990 IS NOT NULL AND gii_2021 IS NOT NULL
ORDER BY improvement_pct DESC
LIMIT 10;
```
**Purpose:** Identify countries that made the most progress

### Query 6: Africa-Specific Analysis
```sql
SELECT country, human_dev_groups, gii_2021,
       CASE 
           WHEN gii_2021 < 0.3 THEN 'Low Inequality'
           WHEN gii_2021 < 0.55 THEN 'Medium Inequality'
           ELSE 'High Inequality'
       END AS inequality_level
FROM gender_inequality
WHERE continent LIKE '%Africa%'
  AND gii_2021 IS NOT NULL
ORDER BY gii_2021 DESC
LIMIT 15;
```
**Purpose:** Deep dive into African countries' performance

### Query 7: Distribution Across Inequality Levels
```sql
SELECT 
    CASE 
        WHEN gii_2021 < 0.3 THEN 'Low Inequality'
        WHEN gii_2021 < 0.55 THEN 'Medium Inequality'
        ELSE 'High Inequality'
    END AS inequality_level,
    COUNT(*) AS country_count
FROM gender_inequality
WHERE gii_2021 IS NOT NULL
GROUP BY inequality_level
ORDER BY 
    CASE inequality_level
        WHEN 'Low Inequality' THEN 1
        WHEN 'Medium Inequality' THEN 2
        WHEN 'High Inequality' THEN 3
    END;
```
**Purpose:** Understand overall distribution of countries

---

## VISUALIZATIONS CREATED

1. Bar Chart: Top 10 Countries with Highest Gender Inequality
2. Bar Chart: Top 10 Countries with Lowest Gender Inequality
3. Column Chart: Average Gender Inequality by Continent
4. Line Chart: Global Gender Inequality Trend (1990-2021)
5. Pie Chart: Distribution of Countries by Inequality Level
6. Dashboard: Comprehensive summary with key statistics and all visualizations

---

## INSIGHTS & ANALYSIS

### Connection to Human Rights Background

As someone with a background in law and human rights, this analysis reveals critical insights:

1. **Economic Development & Gender Equality are Linked**  
   Countries with higher GDP, better education systems, and stronger institutions consistently show lower gender inequality. This suggests that addressing gender inequality requires holistic development approaches.

2. **Regional Disparities Demand Targeted Interventions**  
   Africa's high average inequality (0.525) compared to Europe's (0.103) indicates the need for region-specific policies addressing cultural, economic, and educational barriers.

3. **Progress is Possible**  
   The 34% global decrease since 1990 and countries like UAE achieving 92.6% improvement prove that gender equality can be significantly advanced through deliberate policy action.

4. **Human Development as a Foundation**  
   The correlation between Human Development Group and GII suggests that investments in education, healthcare, and economic opportunity are prerequisites for gender equality.

---

## CHALLENGES FACED

1. **MySQL Installation & Configuration**
   - Initial struggle with server setup and password configuration
   - Solution: Followed systematic installation guide and documented password carefully

2. **Data Import Issues**
   - CSV file formatting caused import errors
   - Solution: Used Table Data Import Wizard instead of LOAD DATA command

3. **Excel Chart Data Selection**
   - Charts initially displayed incorrect data or multiple series
   - Solution: Used Name Box to select specific cell ranges (A1:A11,D1:D11)

4. **Historical Trend Visualization**
   - Data arranged horizontally instead of vertically made chart creation difficult
   - Solution: Restructured data into Year-Value pairs for clean line chart

5. **Learning SQL Syntax**
   - Aggregate functions, GROUP BY, and CASE statements were initially confusing
   - Solution: Practiced with simpler queries first, then built complexity

---

## FUTURE IMPROVEMENTS

Given more time and resources, I would:

1. **Add More Variables**
   - Include economic indicators (GDP, unemployment)
   - Add education metrics (literacy rates, school enrollment)
   - Incorporate health data (maternal mortality, contraceptive access)

2. **Create Interactive Dashboard**
   - Use Tableau or Power BI for dynamic filtering
   - Add drill-down capabilities by country/region

3. **Predictive Analysis**
   - Build regression models to predict future GII values
   - Identify which factors most influence gender equality

4. **Policy Impact Analysis**
   - Research specific policies in high-performing countries
   - Analyze what interventions led to biggest improvements

5. **Expand Time Range**
   - Include data back to 1980s if available
   - Project trends forward to 2030 (UN Sustainable Development Goals target)

---

## TECHNICAL SKILLS DEMONSTRATED

- ✅ SQL database creation and management
- ✅ Complex SQL queries (JOINs, aggregations, CASE statements)
- ✅ Data cleaning and validation
- ✅ Statistical analysis and interpretation
- ✅ Data visualization (multiple chart types)
- ✅ Dashboard design
- ✅ Technical documentation
- ✅ Critical thinking and problem-solving

---

## PROJECT FILES

1. `Gender_Inequality_Analysis.sql` - All 7 SQL queries
2. `Gender_Inequality_Analysis.xlsx` - Excel workbook with data and visualizations
3. `Exports/` - 7 CSV files (query results)
4. `Images/` - Screenshots of dashboard, queries, and charts

---

## CONTACT INFORMATION

**Buhle Damane**  
Data Analyst | Law & Human Rights Background

- **LinkedIn:** [https://www.linkedin.com/in/buhle-damane/](https://www.linkedin.com/in/buhle-damane/)
- **GitHub:** [Add your GitHub profile link here]
- **Email:** ziziphodamane@gmail.com
- **Portfolio:** [Add your portfolio link here]

---

## ACKNOWLEDGMENTS

- **Data Source:** Kaggle Gender Inequality Index Dataset
- **Tools:** MySQL, Microsoft Excel

---

**Project Completion Date:** November 25, 2025  
**Total Time Investment:** ~20-25 hours over 7 days
