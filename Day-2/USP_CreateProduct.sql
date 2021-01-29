DELIMITER //
CREATE PROCEDURE USP_CreateProduct(IN `pro_name` VARCHAR(50),IN `pro_cat` VARCHAR(50),IN `bran` VARCHAR(50),IN `mod_y` INT,IN `lis_p` INT)
BEGIN
     IF EXISTS(SELECT `product_name` FROM `products` WHERE `product_name` = `pro_name`) THEN  											-- 4
     BEGIN 
		SELECT `product_id` FROM `products` WHERE `product_name` = `pro_name`;
	 END;
     ELSE
     BEGIN
		IF EXISTS(SELECT `category_id` FROM `categories` WHERE `category_name` = `pro_cat`) THEN 										-- 3
        BEGIN
			SET @cat_i = (SELECT `category_id` FROM `categories` WHERE `category_name` = `pro_cat`);
			IF EXISTS(SELECT `brand_id` FROM `brands` WHERE `brand_name` =`bran`) THEN													-- 2
            BEGIN
				SET @bran_i=(SELECT`brand_id` FROM `brands` WHERE `brand_name`=`bran`);
				INSERT INTO `products`(`product_name`,`brand_id`,`category_id`,`model_year`,`list_price`)
				VALUES(`pro_name`,@bran_i,@cat_i,`mod_y`,`lis_p`);
                SET @pro_i=LAST_INSERT_ID();
                SELECT @pro_i AS 'Last Pro Id';
			END;
            ELSE
            BEGIN
				INSERT INTO `brands`(`brand_name`)
                VALUES(`bran`);
                SET @bran_i=LAST_INSERT_ID();
                INSERT INTO `products`(`product_name`,`brand_id`,`category_id`,`model_year`,`list_price`)
				VALUES(`pro_name`,@bran_i,@cat_i,`mod_y`,`lis_p`);
                SET @pro_i=LAST_INSERT_ID();
                SELECT @pro_i AS 'Last Pro Id';
			END;
            END IF;
		END;
		ELSE
        BEGIN
			INSERT INTO`categories`(`category_name`)
            VALUES(`pro_cat`);
            SET @cat_i=LAST_INSERT_ID();
            IF EXISTS(SELECT`brand_id` FROM `brands` WHERE `brand_name`=`bran`) THEN    										-- 1
            BEGIN
				SET @bran_i=(SELECT`brand_id` FROM `brands` WHERE `brand_name`=`bran`);
				INSERT INTO `products`(`product_name`,`brand_id`,`category_id`,`model_year`,`list_price`)
				VALUES(`pro_name`,@bran_i,@cat_i,`mod_y`,`lis_p`);
                SET @pro_i=LAST_INSERT_ID();
                SELECT @pro_i AS 'Last Pro Id';
			END;
            ELSE
            BEGIN
				INSERT INTO `brands`(`brand_name`)
                VALUES(`bran`);
                SET @bran_i=LAST_INSERT_ID();
                INSERT INTO `products`(`product_name`,`brand_id`,`category_id`,`model_year`,`list_price`)
				VALUES(`pro_name`,@bran_i,@cat_i,`mod_y`,`lis_p`);
                SET @pro_i=LAST_INSERT_ID();
                SELECT @pro_i AS 'Last Pro Id';
			END;
            END IF;
		END;
	END IF;
	END;
END IF;
END; // 
DELIMITER ;
	
-- CALLING THE PROCEDURE
CALL USP_CreateProduct('dhoti','cloth','max',1546,521)
-- DROPPING THE PROCEDURE
DROP PROCEDURE USP_CreateProduct

-- PRODUCTS TABLE
SELECT * FROM products

-- CATEGORIES TABLE
SELECT * FROM categories

-- BRANDS TABLE
SELECT * FROM brands