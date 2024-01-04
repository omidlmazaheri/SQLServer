--متوسط تعداد سفارش
SELECT CustomerID, AVG(od.Quantity) AS AverageOrderQuantity
FROM Orders o
JOIN [Order Details] od ON o.OrderID = od.OrderID
GROUP BY CustomerID;