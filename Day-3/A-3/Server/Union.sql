USE Assignment1;
SELECT first_name,last_name,phone,email FROM customers
UNION
SELECT first_name,last_name,phone,email FROM staffs