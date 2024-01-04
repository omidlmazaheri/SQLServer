--مجموع درآمد هر گروه از محصولات
SELECT c.CategoryName, SUM(od.UnitPrice * od.Quantity) AS TotalSalesAmount
FROM Categories c
JOIN Products p ON c.CategoryID = p.CategoryID
JOIN [Order Details] od ON p.ProductID = od.ProductID
GROUP BY c.CategoryName;