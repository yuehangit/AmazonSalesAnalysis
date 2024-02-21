CREATE TABLE products (
    product_id VARCHAR(15) PRIMARY KEY,
    product_name TEXT,
	main_category VARCHAR(50),
	smallest_category VARCHAR(50),
	discounted_price_RS NUMERIC(10, 2),
	actual_price_RS NUMERIC(10, 2),
	discount_percentage INT,
	rating NUMERIC(2,1),
	rating_count INT,
	about_product TEXT	
);