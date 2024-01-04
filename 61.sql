--مجموع فروش هر محصول در سال
SELECT p.ProductID, p.ProductName, YEAR(o.OrderDate) AS OrderYear, SUM(od.Quantity) AS TotalSalesQuantity
FROM Products p
JOIN [Order Details] od ON p.ProductID = od.ProductID
JOIN Orders o ON od.OrderID = o.OrderID
GROUP BY p.ProductID, p.ProductName, YEAR(o.OrderDate);