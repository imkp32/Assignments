USE Day2;  
GO  
CREATE LOGIN sys1 WITH PASSWORD = '12345';  
CREATE LOGIN sys2 WITH PASSWORD = '54321';  
GO  
CREATE USER karthik FOR LOGIN sys1;  
CREATE USER prabhu FOR LOGIN sys2;  
GO  
--table
CREATE TABLE customers (
  customer_id int NOT NULL,
  first_name varchar(255) ,
  last_name varchar(255) ,
  phone varchar(20) ,
  email varchar(255) ,
  street varchar(255) ,
  city varchar(255) ,
  state varchar(255),
  zip_code varchar(20),
  PRIMARY KEY (customer_id)
)

INSERT INTO customers(customer_id,first_name,last_name,phone,email,street,city,state,zip_code)
VALUES
(1,'Karthik','Prabhu','984343045','pjksmr@gmail.com','Somanur','Coimbatore','TN','641668')

GRANT INSERT ON customers TO karthik
SELECT SUSER_NAME(), USER_NAME();  
EXECUTE AS LOGIN = 'sys1';  

SELECT SUSER_NAME(), USER_NAME();  
DELETE FROM customers
REVERT
EXECUTE AS USER = 'prabhu';  
--insert values
INSERT INTO customers(customer_id,first_name,last_name,phone,email,street,city,state,zip_code)
VALUES
(2,'Karthik','Prabhu','984343045','pjksmr@gmail.com','Somanur','Coimbatore','TN','641668')

SELECT SUSER_NAME(), USER_NAME();    
REVERT;  

DROP LOGIN sys1;  
DROP LOGIN sys2;  
DROP USER karthik;  
DROP USER prabhu;  
GO
