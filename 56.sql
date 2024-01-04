--درآمد حاص از هر مشتری
SELECT c.CustomerID, SUM(od.UnitPrice * od.Quantity) AS TotalRevenue
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
JOIN [Order Details] od ON o.OrderID = od.OrderID
GROUP BY c.CustomerID;
