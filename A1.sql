CREATE TABLE `customers` (
  `customer_id` int NOT NULL,
  `first_name` varchar(255) ,
  `last_name` varchar(255) ,
  `phone` varchar(20) ,
  `e-mail` varchar(255) ,
  `street` varchar(255) ,
  `city` varchar(255) ,
  `state` varchar(255),
  `zip_code` varchar(20),
  PRIMARY KEY (`customer_id`)
);
CREATE TABLE `stores` (
  `store_id` int NOT NULL,
  `store_name` varchar(255) ,
  `phone` varchar(255) ,
  `e-mail` varchar(255) ,
  `street` varchar(255) ,
  `city` varchar(255) ,
  `state` varchar(255) ,
  `zip_code` varchar(255) ,
  PRIMARY KEY (`store_id`)
);
CREATE TABLE `staffs` (
  `staff_id` int NOT NULL,
  `first_name` varchar(255) ,
  `last_name` varchar(255) ,
  `e-mail` varchar(255) ,
  `phone` varchar(255) ,
  `active` varchar(255) ,
  `store_id` int ,
  `manager_id` int NOT NULL,
  PRIMARY KEY (`staff_id`),
  FOREIGN KEY (`manager_id`) REFERENCES `staffs` (`staff_id`),
  FOREIGN KEY (`store_id`) REFERENCES `stores` (`store_id`)
);
CREATE TABLE `orders` (
  `order_id` int NOT NULL,
  `customer_id` int NOT NULL,
  `order_status` varchar(255) ,
  `order_date` varchar(255) ,
  `required_date` varchar(255) ,
  `shipped_date` varchar(255) ,
  `store_id` int NOT NULL,
  `staff_id` int NOT NULL,
  PRIMARY KEY (`order_id`),
  FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`),
  FOREIGN KEY (`staff_id`) REFERENCES `staffs` (`staff_id`),
  FOREIGN KEY (`store_id`) REFERENCES `stores` (`store_id`)
);

CREATE TABLE `brands` (
  `brand_id` int NOT NULL,
  `brand_name` varchar(255) ,
   PRIMARY KEY (`brand_id`)
);
CREATE TABLE `categories` (
  `category_id` int NOT NULL,
  `category_name` varchar(255) ,
  PRIMARY KEY (`category_id`)
);
CREATE TABLE `products` (
  `product_id` int NOT NULL,
  `product_name` varchar(255) ,
  `brand_id` int NOT NULL,
  `category_id` int NOT NULL,
  `model_year` int ,
  `list_price` int ,
  PRIMARY KEY (`product_id`),
  FOREIGN KEY (`brand_id`) REFERENCES `brands` (`brand_id`),
  FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`)
);
CREATE TABLE `order_items` (
  `order_id` int NOT NULL,
  `item_id` int NOT NULL,
  `product_id` int NOT NULL,
  `quantity` int ,
  `list_price` int ,
  `discount` int ,
  PRIMARY KEY (`order_id`,`item_id`),
  FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`),
  FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`)
);

CREATE TABLE `stocks` (
  `store_id` int NOT NULL,
  `product_id` int NOT NULL,
  `quantity` int NOT NULL,
  PRIMARY KEY (`store_id`,`product_id`),
  FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`),
  FOREIGN KEY (`store_id`) REFERENCES `stores` (`store_id`)
);
