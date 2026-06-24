-- Top 10 Highest Paying Majors

SELECT Major, Median FROM majors ORDER BY Median DESC LIMIT 10;

-- TOP 10 Highest ROI Majors
SELECT Major, ROI_Score FROM majors ORDER BY ROI_Score DESC LIMIT 10;

-- Majors with over $60,000 median salary 
SELECT Major, Median FROM majors WHERE  Median > 60000;

-- majors with Unemployment_rate less than 3%
SELECT Major, Unemployment_rate FROM majors WHERE  Unemployment_rate < 0.03;

-- Majors with both median salary above 60,000 and unemployment below 3%
SELECt Major, Median, Unemployment_rate FROM majors WHERE Unemployment_rate < 0.03 AND Median > 60000;

--Avg. Salary
SELECT AVG(Median) FROM majors;

--Max salary
SELECT Major,Median AS Max_Median FROM majors ORDER BY Median DESC LIMIT 1;

--Min Salary
SELECT Major, Median AS Min_Median FROM majors ORDER BY Median LIMIT 1;

--Average ROI Score
SELECT AVG(ROI_Score) FROM majors;

-- Average Salary by Category 

SELECT Major_category, AVG(Median) AS Avg_Salary FROM majors GROUP BY Major_category ORDER BY Avg_Salary DESC;

-- # of majors in each category
SELECT Major_category, COUNT(*) AS Num_Majors FROM majors GROUP BY Major_category ORDER BY Num_Majors DESC;

-- Average unemployment by category
SELECT Major_category, AVG(Unemployment_rate) AS Avg_Unemp FROM majors GROUP BY Major_category ORDER BY Avg_Unemp DESC;

-- majors that have higher median salaries than the overall average
SELECT Major, Median FROM majors 
WHERE Median > 
(
    SELECT AVG(Median) FROM majors
)
ORDER BY Median DESC;

-- average ROI scores for each major category 

SELECT Major_category,
       AVG(ROI_Score) AS Avg_ROI
FROM majors
GROUP BY Major_category
ORDER BY Avg_ROI DESC;

-- Above-Average ROI 

SELECT Major, ROI_Score FROM majors WHERE ROI_Score > 
(
    SELECT AVG(ROI_Score)
    FROM majors


)
ORDER BY ROI_Score DESC;


-- Categories with above-average salaries

SELECT Major_category, AVG(Median) AS Avg_Salary FROM majors GROUP BY Major_category 
HAVING AVG(median) >
(
    SELECT AVG(Median)
    FROM majors

)
ORDER BY Avg_Salary DESC;