CREATE TABLE sep_reviews AS
SELECT
  unnest(string_to_array(review_id, ',')) AS r_id,
  unnest(string_to_array(product_reviews, ',')) AS review,
  product_id,
  unnest(string_to_array(user_id, ',')) AS u_id
FROM
  reviews;
  
DELETE FROM sep_reviews
WHERE r_id IS NULL OR product_id IS NULL OR review is NULL;

ALTER TABLE sep_reviews
ADD PRIMARY KEY (r_id,product_id),
ALTER COLUMN review TYPE varchar(150),
ALTER COLUMN u_id TYPE varchar(40),
ALTER COLUMN r_id TYPE varchar(30);
