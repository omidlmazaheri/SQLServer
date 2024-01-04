--تعداد محصولات هر کتگوری
SELECT c.CategoryName, COUNT(p.ProductID) AS TotalProducts
FROM Categories c
JOIN Products p ON c.CategoryID = p.CategoryID
GROUP BY c.CategoryName;