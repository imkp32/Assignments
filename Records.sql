INSERT INTO customers(`customer_id`,`first_name`,`last_name`,`phone`,`e-mail`,`street`,`city`,`state`,`zip_code`)
VALUES
(1,'Karthik','Prabhu','984343045','pjksmr@gmail.com','Somanur','Coimbatore','TN','641668'),
(2,'Gowtham','Karthik','9845520214','ndak@gmail.com','Peelamedu','Coimbatore','TN','641014'),
(3,'Gowtham','Karthik','9845520214','ndak@gmail.com','Hopes','Coimbatore','TN','641014'),
(4,'Kumar','Vel','9845520214','ndak@gmail.com','Hopes','Coimbatore','TN','641014'),
(5,'Madhan','Kumar','9845520214','ndak@gmail.com','Hopes','Coimbatore','TN','641014');

INSERT INTO stores (`store_id`, `store_name`, `phone`, `e-mail`, `street`, `city`, `state`, `zip_code`)
 VALUES (1, 'abc', '9842563014', 'abc@gmail.com', 'hopes', 'cbe', 'TN', '641014'),
(2, 'hjk', '9842563014', 'hjk@gmail.com', 'tnagar', 'cbe', 'TN', '641014'),
(3, 'klj', '9842563014', 'kjk@gmail.com', 'peelamedu', 'cbe', 'TN', '641014'),
(4, 'nba', '9842563014', 'nba@gmail.com', 'ramnagar', 'cbe', 'TN', '641014'),
(5, 'ten', '9842563014', 'ten@gmail.com', 'hopes', 'cbe', 'TN', '641014');

INSERT INTO staffs (`staff_id`, `first_name`, `last_name`, `e-mail`, `phone`, `active`, `store_id`, `manager_id`)
 VALUES (1, 'ms', 'dhoni', 'msd@gmail.com', '1254698745', 'yes', 1, 1),
(2, 'sachin', 'tendulkar', 'srt@gmail.com', '8524569852', 'yes', 2, 2),
(3, 'virat', 'kohli', 'vrk@gmail.com', '7456981256', 'yes', 3, 3),
(4, 'kumar ', 'sanga', 'ksg@gmail.com', '7869845632', 'no', 4, 4),
(5, 'glenn ', 'maxwell', 'gmax@gmail.com', '7854123658', 'yes', 5, 5);

INSERT INTO orders (`order_id`, `customer_id`, `order_status`, `order_date`, `required_date`, `shipped_date`, `store_id`, `staff_id`) 
VALUES (1, 1, 'yes', '01-01-2020', '02-01-2020', '01-01-2020', 1, 1),
(2, 2, 'yes', '04-01-2020', '06-01-2020', '05-01-2020', 2, 2),
(3, 3, 'yes', '09-01-2020', '11-01-2020', '10-01-2020', 3, 3),
(4, 4, 'yes', '15-01-2020', '17-01-2020', '16-01-2020', 4, 4),
(5, 5, 'yes', '23-01-2020', '25-01-2020', '24-01-2020', 5, 5);

INSERT INTO brands(brand_id,brand_name)
VALUES
(1,'Nike'),
(2,'Puma'),
(3,'Adidas'),
(4, 'Titan'),
(5, 'Casio');

INSERT INTO categories (`category_id`, `category_name`)
 VALUES (1, 'movie'),
	    (2, 'park'),
        (3, 'beach'),
        (4, 'school'),
        (5, 'office');
        
INSERT INTO products (`product_id`, `product_name`, `brand_id`, `category_id`, `model_year`, `list_price`) 
VALUES (1, 'gold', 1, 1, 1990, 20),
(2, 'silver', 2, 2, 1996, 15),
(3, 'copper', 3, 3, 1990, 10),
(4, 'platinum', 4, 4, 1892, 30),
(5, 'diamond', 5, 5, 1999, 45);


INSERT INTO stocks (`store_id`, `product_id`, `quantity`)
 VALUES (1, 1, 20),
(2, 2, 30),
(3, 3, 40),
(4, 4, 50),
(5, 5, 60);


INSERT INTO order_items (`order_id`, `item_id`, `product_id`, `quantity`, `list_price`, `discount`)
VALUES (1, 1, 1, 20, 65, 17),
(2, 2, 2, 45, 52, 12),
(3, 3, 3, 98, 74, 23),
(4, 4, 4, 42, 26, 2),
(5, 5, 5, 100, 54, 20);

