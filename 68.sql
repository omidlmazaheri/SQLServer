--متوسط سفارش هر مشتری
SELECT CustomerID, AVG(OrderTotal) AS AverageOrderAmount
FROM (
    SELECT c.CustomerID, o.OrderID, SUM(od.UnitPrice * od.Quantity) AS OrderTotal
    FROM Customers c
    JOIN Orders o ON c.CustomerID = o.CustomerID
    JOIN [Order Details] od ON o.OrderID = od.OrderID
    GROUP BY c.CustomerID, o.OrderID
) AS OrderTotals
GROUP BY CustomerID;