# guided-project-sql
Grocery Store Database Design Project

This project demonstrates the design, creation, and testing of a relational database for managing grocery store purchases, sales, inventory, customers, and vendors. The dataset (GreenspotDataset.csv) provided raw mixed purchase/sales records, which were normalized into a clean, scalable database schema.

Project Overview

The goal of this project is to transform an unstructured dataset into a fully functional, normalized database. This includes:

Database Design: Creating an Extended Entity-Relationship (EER) diagram to model entities and relationships.

Database Creation: Implementing the schema in SQL with appropriate datatypes, primary/foreign keys, and constraints.

Database Testing: Running SQL queries to validate relationships and answer real business questions.

Insights: Identifying anomalies in the original dataset and explaining how the new design resolves them.

Dataset

The source dataset (GreenspotDataset.csv) contains 28 rows of mixed purchase and sales transactions, with attributes such as:

Item details: Item num, description, item type, location, unit

Purchases: cost, purchase date, vendor, quantity on-hand

Sales: price, date sold, cust, Quantity

The dataset combines purchases and sales in a single file, leading to redundancy and anomalies.

Database Design
EER Model

Key entities and relationships:

Items (itemID, description, itemType, location, unit)

Vendors (vendorID, vendorName, vendorAddress)

Customers (customerID, customerName)

Purchases (purchaseID, itemID, vendorID, purchaseDate, cost, quantityPurchased)

Sales (saleID, itemID, customerID, saleDate, price, quantitySold)

Inventory (inventoryID, itemID, quantityOnHand)

Each entity is connected with primary keys, foreign keys, and appropriate constraints.

Database Creation

SQL schema (excerpt):

CREATE TABLE Items (
    itemID INT PRIMARY KEY,
    description VARCHAR(255),
    itemType VARCHAR(50),
    location VARCHAR(10),
    unit VARCHAR(50)
);

CREATE TABLE Vendors (
    vendorID INT PRIMARY KEY,
    vendorName VARCHAR(255),
    vendorAddress VARCHAR(255)
);

CREATE TABLE Purchases (
    purchaseID INT PRIMARY KEY,
    itemID INT,
    vendorID INT,
    purchaseDate DATE,
    cost DECIMAL(6,2),
    quantityPurchased INT,
    FOREIGN KEY (itemID) REFERENCES Items(itemID),
    FOREIGN KEY (vendorID) REFERENCES Vendors(vendorID)
);


Full schema includes Customers, Sales, and Inventory tables.

Database Testing

Example SQL queries used to validate design:

Join Query

SELECT i.description, s.saleDate, s.price, s.quantitySold, c.customerName
FROM Sales s
JOIN Items i ON s.itemID = i.itemID
JOIN Customers c ON s.customerID = c.customerID;


Business Question: Which vendors supplied items that are now sold out?

SELECT v.vendorName, i.description
FROM Purchases p
JOIN Vendors v ON p.vendorID = v.vendorID
JOIN Items i ON p.itemID = i.itemID
JOIN Inventory inv ON i.itemID = inv.itemID
WHERE inv.quantityOnHand = 0;


Comprehensive Query (retrieving across all tables):

SELECT i.description, v.vendorName, c.customerName, p.purchaseDate, s.saleDate
FROM Items i
JOIN Purchases p ON i.itemID = p.itemID
JOIN Vendors v ON p.vendorID = v.vendorID
JOIN Sales s ON i.itemID = s.itemID
JOIN Customers c ON s.customerID = c.customerID;

Insights and Conclusions
Issues in Original Dataset

Mixed purchase/sale data caused insertion, deletion, and update anomalies.

Missing or duplicate values decreased data integrity.

Improvements in New Database

Normalized structure separates items, vendors, customers, purchases, and sales.

Eliminates redundancy, ensures referential integrity.

Supports scalability and complex reporting.

Future Enhancements

Add Employee table to track staff sales.

Add Category table for product grouping.

Add Discounts/Promotions support.

Extend to multi-store support with a Store table.

Deliverables

GreenspotDataset.csv (original dataset)

SQL schema (schema.sql)

EER diagram (eer_diagram.png)

SQL test queries (queries.sql)

Project Report (report.md or report.pdf)

How to Run

Clone this repository:

git clone https://github.com/yourusername/grocery-database.git
cd grocery-database


Import schema into MySQL:

mysql -u root -p < schema.sql


Load sample data:

mysql -u root -p < sample_data.sql


Run test queries:

mysql -u root -p < queries.sql

Author

Eric Varghese
University of Illinois Chicago
evarg22@uic.edu
