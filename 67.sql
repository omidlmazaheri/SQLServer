-- Query to retrieve the total number of orders for each customer
--تعداد محصولات سفارش داده شده در هر مشتری
SELECT CustomerID, COUNT(OrderID) AS TotalOrders
FROM Orders
GROUP BY CustomerID;