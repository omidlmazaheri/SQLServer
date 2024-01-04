--متوسط فروش محصولات در هر سال
SELECT p.ProductID, p.ProductName, YEAR(o.OrderDate) AS OrderYear,sum(od.Quantity) AS sumSalesQuantity
FROM Products p
JOIN [Order Details] od ON p.ProductID = od.ProductID
JOIN Orders o ON od.OrderID = o.OrderID
GROUP BY p.ProductID, p.ProductName, YEAR(o.OrderDate);