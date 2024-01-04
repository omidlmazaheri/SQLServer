-- Query to retrieve the total sales amount for each employee
--درآمد هر یک از کارکنان
SELECT EmployeeID, SUM(UnitPrice * Quantity) AS TotalSalesAmount
FROM Orders o
JOIN [Order Details] od ON o.OrderID = od.OrderID
GROUP BY EmployeeID;