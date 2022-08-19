
---1
select A.customerid,B.productid from orders as A
inner join OrderDetails as B on A.ORDERID = B.ORDERID

SELECT* INTO FILE1 FROM (select A.customerid,B.productid from orders as A
inner join OrderDetails as B on A.ORDERID = B.ORDERID)DRUM

select A.customerid,B.BRAND from FILE1 as A
inner join PRODUCTS as B on A.PRODUCTID = B.PRODUCTID
---2
select A.OrderID,B.Sale_Price from OrderDetails as A
inner join Products as B on A.ProductID = B.ProductID
WHERE B.Sale_Price >400
---3
select* from Products
select* from Customers

select C.CustomerID,b.Brand,SUM(A.QUANTITY) AS DS from OrderDetails as A INNER JOIN
Products AS b on A.ProductID =b.ProductID
INNER JOIN ORDERS AS C ON A.OrderID = C.OrderID
GROUP BY  C.CustomerID,b.Brand ORDER BY DS DESC
