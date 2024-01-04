--درآمد هر یک از کارکنان
SELECT EmployeeID,  SUM(od.UnitPrice * od.Quantity) AS TotalRevenue
FROM Orders o
JOIN [Order Details] od ON o.OrderID = od.OrderID
GROUP BY EmployeeID;