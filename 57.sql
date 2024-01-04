--تعداد محصولات فروش رفته در هر استان
SELECT c.region, AVG(od.Quantity) AS AverageSalesQuantity, sum(od.Quantity) as qty
FROM [Order Details] od
JOIN Orders o ON od.OrderID = o.OrderID
JOIN Customers c ON o.CustomerID = c.CustomerID
GROUP BY c.region
--having c.Region = 'CA';