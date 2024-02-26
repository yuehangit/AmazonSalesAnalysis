/*
How is the quality of our products?

There is an average rating of 4.13 stars for our products
that have more than 1000 reviews.
*/

SELECT AVG(rating) AS avg_rating
FROM products
WHERE rating_count > 1000;


/*
What are our top rated products?

Excluding products without many reviews and defining
top rated as higher than 4.5 stars
*/

SELECT product_name, actual_price_rs AS price_rupees, smallest_category AS item,
rating, rating_count
FROM products
WHERE rating > 4.5 AND rating_count >1000 
ORDER BY rating DESC;

/*
What are our lowest rated products?

(Only looking at items with more than 100 reviews)
The lowest rated product is MR. BRAND Portable USB Juicer 
Electric... with a rating of 2.8
*/

SELECT product_name, actual_price_rs AS price_rupees, smallest_category AS item,
rating, rating_count
FROM products 
WHERE rating_count > 100
ORDER BY rating
LIMIT 100;

/*
What is the top rated main product category?
The top rated category is OfficeProducts and Toys&Games
tied at 4.3 stars
*/

SELECT main_category AS category, AVG(rating) AS avg_rating, 
SUM(rating_count) AS total_ratings
FROM products
GROUP BY category
ORDER BY AVG(rating) DESC;

/*
What is the top rated item type?

The top rated item type is tablets with 4.6 stars
*/

SELECT smallest_category AS item_type, AVG(rating) AS avg_rating, 
SUM(rating_count) AS total_ratings
FROM products
GROUP BY item_type
ORDER BY AVG(rating) DESC;


/*
What is the average discount percentage for each category?
*/

SELECT main_category AS category, ROUND(AVG(discount_percentage),2) AS 
avg_discount_percent, COUNT(main_category) AS count_products
FROM products
GROUP BY category
HAVING COUNT(main_category) > 5
ORDER BY avg_discount_percent;


/*
How much of our userbase is rating products?
About 84.93% of the userbase is rating products
*/
SELECT COUNT(DISTINCT r.u_id) as reviewers, ROUND(100*COUNT(DISTINCT r.u_id)::numeric/COUNT(u.u_id),2)
AS reviewers_percentage
FROM reviews as r
RIGHT JOIN users as u ON r.u_id = u.u_id;


/*
What products lack ratings
If we had information on the amount of each product sold
I would compare the amount of ratings to that.
However since we don't have that information I will 
be comparing the amount of ratings compared to the 
average of amount of ratings for that item type
*/


SELECT product_name, smallest_category AS item_type, rating_count, ROUND(item_avg_rating, 0) AS avg_item_rating
FROM (
  SELECT product_name, smallest_category, rating_count, AVG(rating_count) OVER (PARTITION BY smallest_category) AS item_avg_rating
  FROM products
) AS subquery
WHERE rating_count < item_avg_rating
ORDER BY rating_count;

/*
Who are our top reviewers
*/

SELECT r.u_id, COUNT(review) AS reviews_done
FROM reviews AS r
INNER JOIN users AS u ON r.u_id = u.u_id
GROUP BY r.u_id
ORDER BY reviews_done DESC
LIMIT 10;



