--متوسط سفرش هر مشتری
SELECT c.CustomerID, AVG(od.UnitPrice * od.Quantity) AS AverageOrderValue
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
JOIN [Order Details] od ON o.OrderID = od.OrderID
GROUP BY c.CustomerID;