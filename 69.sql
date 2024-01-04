--تعداد ارسال از شرکت های ارسال کننده
SELECT Shippers.CompanyName, COUNT(Orders.OrderID) AS NumberOfOrders FROM Orders
inner JOIN Shippers ON Orders.ShipVia = Shippers.ShipperID
GROUP BY CompanyName;

SELECT Shippers.CompanyName, COUNT(Orders.OrderID) AS NumberOfOrders FROM Orders
left JOIN Shippers ON Orders.ShipVia = Shippers.ShipperID
GROUP BY CompanyName;