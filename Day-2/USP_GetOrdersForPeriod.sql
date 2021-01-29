DELIMITER //
CREATE PROCEDURE USP_GetOrdersForPeriod (IN stdate varchar(50),IN endate varchar(50))
BEGIN
	SELECT ord.order_id AS 'Order Id',cus.customer_id AS 'Customer Id',
			cus.first_name AS 'Customer Name',cus.city AS 'Customer City',
			ord.order_status AS 'Order Status',ord.order_date AS 'Order Date',
			(ordit.quantity * ordit.list_price) AS 'Order Total Value',
			ord.store_id AS 'Store Id',sto.store_name AS 'Store Name',
			sto.city AS 'Store City',sta.staff_id AS 'Staff Id',
			sta.first_name AS 'Staff Name',sta.manager_id AS 'Staff Manager Id',
			sta.first_name AS 'Staff Manager Name'
--
	FROM customers AS cus
	LEFT OUTER JOIN orders AS ord
	ON cus.customer_id = ord.customer_id
	LEFT OUTER JOIN order_items AS ordit
	ON ord.order_id = ordit.order_id
	LEFT OUTER JOIN stores AS sto
	ON ord.store_id = sto.store_id
	LEFT OUTER JOIN staffs AS sta
	ON ord.staff_id = sta.staff_id AND sta.staff_id = sta.manager_id

	WHERE order_date BETWEEN stdate AND endate ;
END //
DELIMITER ;
CALL USP_GetOrdersForPeriod('01-01-2020','09-01-2020')
--
DROP PROCEDURE USP_GetOrdersForPeriod

