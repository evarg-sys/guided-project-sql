SELECT i.description, s.saleDate, s.price, s.quantitySold, c.customerName
FROM Sales s
JOIN Items i ON s.itemID = i.itemID
JOIN Customers c ON s.customerID = c.customerID;
SELECT v.vendorName, i.description
FROM Purchases p
JOIN Vendors v ON p.vendorID = v.vendorID
JOIN Items i ON p.itemID = i.itemID
JOIN Inventory inv ON i.itemID = inv.itemID
WHERE inv.quantityOnHand = 0;
SELECT i.description, v.vendorName, c.customerName, p.purchaseDate, s.saleDate
FROM Items i
JOIN Purchases p ON i.itemID = p.itemID
JOIN Vendors v ON p.vendorID = v.vendorID
JOIN Sales s ON i.itemID = s.itemID
JOIN Customers c ON s.customerID = c.customerID;
