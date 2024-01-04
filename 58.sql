--متوسط فروش سال
SELECT AVG(od.Quantity) AS AverageSalesQuantity
FROM [Order Details] od
JOIN Orders o ON od.OrderID = o.OrderID
WHERE YEAR(o.OrderDate) = 1998;