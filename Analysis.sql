/*
How is the quality of our products?

There is an average rating of 4.13 stars for our products
that have more than 1000 reviews.
*/
SELECT AVG(rating) as avg_rating
FROM products
WHERE rating_count > 1000;


/*
What are our top rated products?

Excluding products without many reviews and defining
top rated as higher than 4.5 stars
*/

SELECT product_name, actual_price_rs as price_rupees, smallest_category as item,
rating, rating_count
FROM products
WHERE rating > 4.5 and rating_count >1000 
ORDER BY rating DESC;

/*
What are our lowest rated products?

(Only looking at items with more than 100 reviews)
The lowest rated product is MR. BRAND Portable USB Juicer 
Electric... with a rating of 2.8
*/

SELECT product_name, actual_price_rs as price_rupees, smallest_category as item,
rating, rating_count
FROM products 
WHERE rating_count > 100
ORDER BY rating
LIMIT 100;

/*
What is the top rated main category?
The top rated category is OfficeProducts and Toys&Games
tied at 4.3 stars
*/

SELECT main_category as category, avg(rating) as avg_rating, 
sum(rating_count) as total_ratings
FROM products
GROUP BY category
ORDER BY avg(rating) DESC;

/*
What is the top rated item type?

The top rated item type is tablets with 4.6 stars
*/

SELECT smallest_category as item_type, avg(rating) as avg_rating, 
sum(rating_count) as total_ratings
FROM products
GROUP BY item_type
ORDER BY avg(rating) DESC;


/*
What is the average discount percentage?
*/

/*
How much of our userbase is rating products?
*/

/*
What products lack ratings
*/

