--درآمد هر استان
SELECT c.Region, SUM(od.UnitPrice * od.Quantity) AS TotalRevenue
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
JOIN [Order Details] od ON o.OrderID = od.OrderID
GROUP BY c.Region
order by TotalRevenue DESC