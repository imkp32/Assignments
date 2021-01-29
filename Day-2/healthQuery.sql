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

-- id query
SELECT * FROM train WHERE id='200950';    -- 0.485s

-- with index
CREATE INDEX cus_id
ON train(id);
SELECT * FROM train WHERE id='200950';		-- 0.000s

-- gender query
SELECT * FROM train WHERE Gender='Male';    -- 0.015s/0.782s
SELECT * FROM train WHERE Age > 40;         -- 0.000s/0.672s
-- with index
CREATE INDEX gen
ON train(Gender);
SELECT * FROM train WHERE Gender='Male';    -- 0.000s/0.766s

CREATE INDEX age_info
ON train(Age);
SELECT * FROM train WHERE Age > 40;         -- 0.015s/0.656s

-- Count of male & female responded '1'
SELECT Count(Response) AS 'ONES', Gender
FROM train
WHERE Response='1'
GROUP BY Gender

-- Response of 0/1
SELECT COUNT(Response) AS 'ZEROS/ONES',Response, Gender
FROM train
WHERE Response = '0' OR '1'
GROUP BY GENDER,Response

-- Vehicle Age
SELECT COUNT(Vehicle_Age) AS 'V_Age', Vehicle_Age
FROM train
GROUP BY Vehicle_age

-- Avg of males
SELECT AVG(Age) AS 'Average age',Gender
FROM train
WHERE Gender='Male' AND Response='1'

-- Max premium of females responded '1'
SELECT MAX(Annual_premium) AS 'Max Premium', Gender
FROM train
WHERE GENDER='female' AND Response='1'