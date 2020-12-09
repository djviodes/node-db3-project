-- Multi-Table Query Practice

-- Display the ProductName and CategoryName for all products in the database. Shows 77 records.

SELECT P.ProductName AS 'Product Name',
    C.CategoryName AS 'Category'
FROM Product AS P
    JOIN Category AS C ON P.CategoryId = C.Id;

-- Display the order Id and shipper CompanyName for all orders placed before August 9 2012. Shows 429 records.

SELECT "Order".id,
    S.CompanyName
FROM "Order"
    JOIN Shipper AS S ON "Order".ShipVia = S.id
WHERE "Order".OrderDate < '2012-08-09';

-- Display the name and quantity of the products ordered in order with Id 10251. Sort by ProductName. Shows 3 records.

SELECT P.ProductName AS 'Product Name',
    OD.Quantity
FROM OrderDetail AS OD
    JOIN Product AS P ON P.Id = OD.ProductId
WHERE OD.OrderId = 10251
ORDER BY P.ProductName;

-- Display the OrderID, Customer's Company Name and the employee's LastName for every order. All columns should be labeled clearly. Displays 16,789 records.

SELECT "Order".Id,
    C.CompanyName,
    E.LastName
FROM "Order"
    JOIN Customer AS C ON C.Id = "Order".CustomerId
    JOIN Employee AS E ON E.Id = "Order".EmployeeId;