--هر مشتری چند سفارش دارد
SELECT c.CustomerID, COUNT(o.OrderID) AS OrderCount
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID;