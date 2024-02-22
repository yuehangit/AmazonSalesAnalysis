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

Created a table from reviews and users to get individual reviews and users

<iframe width="100%" height="500px" style="box-shadow: 0 2px 8px 0 rgba(63,69,81,0.16); border-radius:15px;" allowtransparency="true" allowfullscreen="true" scrolling="no" title="Embedded DrawSQL IFrame" frameborder="0" src="https://drawsql.app/teams/projects-46/diagrams/amazon-database/embed"></iframe> 


