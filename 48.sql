SELECT AVG(od.Quantity) AS AverageProductsPerOrder
FROM [Order Details] od
JOIN Products p ON od.ProductID = p.ProductID;