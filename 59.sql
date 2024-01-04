--متوسط فروش هر سال
SELECT YEAR(o.OrderDate) AS OrderYear, AVG(od.Quantity) AS AverageSalesQuantity
FROM [Order Details] od
JOIN Orders o ON od.OrderID = o.OrderID
GROUP BY YEAR(o.OrderDate);