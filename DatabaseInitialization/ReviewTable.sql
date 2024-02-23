/* 
Temp table since this dataset has reviews combined together in rows
*/

CREATE TABLE combined_reviews (
    review_id VARCHAR(300),
	product_reviews TEXT,
	user_id VARCHAR(300),
	product_id VARCHAR(50)
);