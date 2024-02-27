UPDATE products
SET rating_count = subquery.review_count
FROM (
    SELECT product_id, COUNT(*) AS review_count
    FROM reviews
    WHERE product_id IN (
        SELECT product_id
        FROM products
        WHERE rating_count IS NULL
    )
    GROUP BY product_id
) AS subquery
WHERE products.product_id = subquery.product_id;

