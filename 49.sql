--تعداد فروش محصولات
SELECT  p.ProductName, sum(p.ProductID)  FROM Products p
JOIN [Order Details] od ON p.ProductID= od.ProductID
JOIN Orders o ON o.OrderID=od.OrderID
GROUP BY p.ProductName