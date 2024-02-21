CREATE TABLE reviews (
    review_id VARCHAR(300),
	product_reviews TEXT,
	user_id VARCHAR(300),
	product_id VARCHAR(50) REFERENCES products(product_id),
	PRIMARY KEY (review_id, product_id)
);