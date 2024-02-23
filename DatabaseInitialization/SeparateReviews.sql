CREATE TABLE reviews AS
SELECT
  unnest(string_to_array(review_id, ',')) AS r_id,
  unnest(string_to_array(product_reviews, ',')) AS review,
  product_id,
  unnest(string_to_array(user_id, ',')) AS u_id
FROM
  combined_reviews;
  
DELETE FROM reviews
WHERE r_id IS NULL OR product_id IS NULL OR review is NULL;

ALTER TABLE reviews
ADD PRIMARY KEY (r_id,product_id),
ALTER COLUMN review TYPE varchar(150),
ALTER COLUMN u_id TYPE varchar(40),
ALTER COLUMN r_id TYPE varchar(30);

ALTER TABLE reviews
ADD FOREIGN KEY (product_id)
REFERENCES products(product_id)
ON DELETE SET NULL;

ALTER TABLE reviews
ADD FOREIGN KEY (u_id)
REFERENCES users(u_id)
ON DELETE SET NULL;
