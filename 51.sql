--متوسط فروش محصولات در هر کتگوری محصولات
SELECT c.Categoryname,  AVG(od.Quantity) AS AverageProductsPerOrder
FROM [Order Details] od
JOIN Products p ON od.ProductID = p.ProductID
JOIN Categories c ON p.CategoryID = c.CategoryID
GROUP BY c.Categoryname 