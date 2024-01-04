--تعداد فروش محصولات در هر کتگوری محصول
SELECT c.Categoryname,  SUM(od.Quantity) AS SumProductsPerOrder
FROM [Order Details] od
JOIN Products p ON od.ProductID = p.ProductID
JOIN Categories c ON p.CategoryID = c.CategoryID
GROUP BY c.Categoryname 