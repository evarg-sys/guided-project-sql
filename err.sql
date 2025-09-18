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

CREATE TABLE Customers (
    customerID INT PRIMARY KEY,
    customerName VARCHAR(255)
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

CREATE TABLE Sales (
    saleID INT PRIMARY KEY,
    itemID INT,
    customerID INT,
    saleDate DATE,
    price DECIMAL(6,2),
    quantitySold INT,
    FOREIGN KEY (itemID) REFERENCES Items(itemID),
    FOREIGN KEY (customerID) REFERENCES Customers(customerID)
);

CREATE TABLE Inventory (
    inventoryID INT PRIMARY KEY,
    itemID INT,
    quantityOnHand INT,
    FOREIGN KEY (itemID) REFERENCES Items(itemID)
);
