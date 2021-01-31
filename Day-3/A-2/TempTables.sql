-- CREATING TEMPORARY TABLE FOR THE YEAR(2017 -2019)
CREATE TEMPORARY TABLE MonthlyAverageSales 
	SELECT MONTH(ord.order_date) AS `Month`,ord.store_id AS `Store Id`,sto.store_name AS `Store Name`,ROUND((COUNT(ord.order_id))/3) AS `Average Orders`FROM orders ord 
	LEFT JOIN stores sto
	ON sto.store_id=ord.store_id
	WHERE YEAR(ord.order_date) BETWEEN 2017 AND 2019
	GROUP BY MONTH(ord.order_date)
    ORDER BY MONTH(ord.order_date);

    
-- CREATING THE TEMPORARY TABLE FOR THE YEAR 2020
CREATE TEMPORARY TABLE MonthlyAverageSalesN 
	SELECT MONTH(ord.order_date) AS `Month`,YEAR(ord.order_date) AS `Year`,ord.store_id AS `Store Id`,sto.store_name AS `Store Name`,COUNT(ord.order_id) AS `Orders Count` FROM orders ord 
	LEFT JOIN stores sto
	ON sto.store_id=ord.store_id
	WHERE YEAR(ord.order_date) = 2020
	GROUP BY MONTH(ord.order_date)
    ORDER BY MONTH(ord.order_date);
    
-- SALES DIRECTION
SELECT masn.`Month` AS `Month`,masn.`Year` AS `Year`,masn.`Orders Count`AS `Orders Count`,mas.`Average Orders` AS `Avg Orders`,
CASE 
	WHEN (`Orders Count` > mas.`Average Orders`) THEN 'INCREASE'
	WHEN (`Orders Count` < mas.`Average Orders`) THEN 'REDUCE'
    WHEN (`Orders Count` = mas.`Average Orders`) THEN 'EQUAL'
END AS `Sales Direction`
FROM MonthlyAverageSalesN masn
LEFT JOIN MonthlyAverageSales mas 
ON masn.`Month`= mas.`Month` 
GROUP BY `Month`
ORDER BY `Month`;




    
-- DROPPING THE TABLE (2017 -2019)
DROP TABLE MonthlyAverageSales;

-- DROPPING THE TABLE(2020)
DROP TABLE MonthlyAverageSalesN;

-- SELECTING ALL THE COLUMNS (2017- 2019)
SELECT * FROM MonthlyAverageSales;

-- SELECTING ALL THE COLUMNS (2020)
SELECT * FROM MonthlyAverageSalesN;