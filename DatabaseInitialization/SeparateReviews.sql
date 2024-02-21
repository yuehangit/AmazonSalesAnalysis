CREATE TABLE sep_reviews AS
SELECT
  unnest(string_to_array(review_id, ',')) AS r_id,
  unnest(string_to_array(product_reviews, ',')) AS review,
  product_id,
  unnest(string_to_array(user_id, ',')) AS u_id
FROM
  reviews;
  
DELETE FROM sep_reviews
WHERE r_id IS NULL OR product_id IS NULL;

ALTER TABLE sep_reviews
ADD PRIMARY KEY (r_id,product_id);

SELECT
  kcu.column_name
FROM
  information_schema.key_column_usage kcu
  JOIN information_schema.table_constraints tc ON kcu.constraint_name = tc.constraint_name
WHERE
  tc.table_name = 'sep_reviews'
  AND tc.constraint_type = 'PRIMARY KEY';
