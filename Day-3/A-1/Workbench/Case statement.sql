CREATE TABLE train(
	id VARCHAR(50),
    Gender VARCHAR(25),
    Age INT,
    Driving_license VARCHAR(50),
    Region_Code FLOAT,
    Previously_Insured VARCHAR(50),
    Vehicle_Age VARCHAR(5),
    Vehicle_Damage VARCHAR(50),
    Annual_Premium FLOAT, 
    Policy_Sales_Channel FLOAT,
    Vintage INT,
    Response VARCHAR(50)
);

LOAD DATA LOCAL INFILE 'C:\\Users\\Ghost\\Desktop\\train.csv'
INTO TABLE train 
CHARACTER SET latin1
FIELDS TERMINATED BY ','
ENCLOSED BY '"' LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

SELECT * FROM train


-- Age Bucketing 1
SELECT COUNT(Response) AS `Response Count as 1`,
CASE
	WHEN Age <= 10 THEN '10s'
    WHEN (Age >10 AND Age <=20) THEN '20s'
    WHEN (Age >20 AND Age <=30) THEN '30s'
    WHEN (Age >30 AND Age <=40) THEN '40s'
    WHEN (Age >40 AND Age <=50) THEN '50s'
	WHEN (Age >50 AND Age <=60) THEN '60s'
	WHEN (Age >60 AND Age <=70) THEN '70s'
	WHEN (Age >70 AND Age <=80) THEN '80s'
	WHEN (Age >80 AND Age <=90) THEN '90s'
	WHEN (Age >90 AND Age <=100) THEN '100s'
    WHEN Age >100 THEN '100s'
END AS 'Age_bucket'
FROM train WHERE Response ='1'
GROUP BY `Age_bucket`
ORDER BY `Age_bucket`;

-- Age Bucketing 2
SELECT COUNT(Response) AS `Response Count as 0`,
CASE
	WHEN Age <= 10 THEN '10s'
    WHEN (Age >10 AND Age <=20) THEN '20s'
    WHEN (Age >20 AND Age <=30) THEN '30s'
    WHEN (Age >30 AND Age <=40) THEN '40s'
    WHEN (Age >40 AND Age <=50) THEN '50s'
	WHEN (Age >50 AND Age <=60) THEN '60s'
	WHEN (Age >60 AND Age <=70) THEN '70s'
	WHEN (Age >70 AND Age <=80) THEN '80s'
	WHEN (Age >80 AND Age <=90) THEN '90s'
	WHEN (Age >90 AND Age <=100) THEN '100s'
    WHEN Age >100 THEN '100s'
END AS 'Age_bucket'
FROM train WHERE Response ='0'
GROUP BY `Age_bucket`
ORDER BY `Age_bucket`;
