Original data from https://www.kaggle.com/datasets/karkavelrajaj/amazon-sales-dataset?resource=download
Using PostgreSQL
Analyzing Amazon sales data using SQL
Cleaned and manipulated data.
Changes include:
Removing uneeded columns (category and links) and characters (unknown/irrelevant characters, currency characters)
Renamed some columns
Removed duplicates
Added new columns such as main_category and smallest_category

Created 3 tables called products, reviews, and users
Analyzed and answered questions like 
  How is the quality of our products?
  What are our top and lowest rated products?
  What is the top rated product category?
  What is the top rated item type?
Created a table from reviews and users to get individual reviews and users
![DrawSQL Diagram](https://github.com/yuehangit/AmazonSalesAnalysis/blob/main/Database.png)


