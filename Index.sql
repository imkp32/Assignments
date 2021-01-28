CREATE INDEX location on customers(street,city);
SHOW INDEX from customers;
-- Table 2 --
CREATE INDEX location on stores(city,state);
SHOW INDEX FROM stores;
-- Table 3--
CREATE INDEX staffname on staffs(first_name,last_name,active);
SHOW INDEX FROM staffs;
-- Table 4--
CREATE INDEX cust_info ON orders(order_id,customer_id);
SHOW INDEX FROM orders;
-- products--
CREATE INDEX price_info ON order_items(list_price,discount);
SHOW INDEX FROM order_items;
