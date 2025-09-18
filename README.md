Grocery Store Database Project

This repository contains a database design project for managing grocery store purchases, sales, inventory, customers, and vendors. The project is based on the sample dataset GreenspotDataset.csv, which originally mixed purchase and sales data into a single file.

Contents

GreenspotDataset.csv – original sample dataset

schema.sql – SQL script to create the database schema

queries.sql – example queries for testing the database

eer_diagram.png – Extended Entity-Relationship (EER) diagram

report.md – project write-up

How to Use

Clone this repository:

git clone https://github.com/yourusername/grocery-database.git
cd grocery-database


Create the database schema:

mysql -u root -p < schema.sql


Load the sample data (if provided):

mysql -u root -p < sample_data.sql


Run the test queries:

mysql -u root -p < queries.sql

Project Overview

Database Design: Created an EER diagram with entities for Items, Vendors, Customers, Purchases, Sales, and Inventory.

Database Creation: Normalized schema with primary keys, foreign keys, and appropriate datatypes.

Database Testing: Example SQL queries demonstrate joins, reporting, and business insights.

Conclusions: The new design eliminates redundancy, prevents anomalies, and supports business scalability.

Author

Eric Varghese
University of Illinois Chicago
