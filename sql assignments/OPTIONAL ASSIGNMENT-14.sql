select* from orders
create procedure o1 @rk int
as
begin
select * from(select*,DENSE_RANK() over(order by total_order_amount desc)as rank from Orders)s where rank=@rk
end;

exec o1 1

select * from(select FirstName,LastName,City,Total_order_amount from Customers as A inner join
Orders as B on A.CustomerID = B.CustomerID)D WHERE City ='CHICAGO'

SELECT Product,COUNT(B.ORDERID),YEAR(ORDERDATE),MONTH(ORDERDATE) FROM Products

SELECT C.Product,SUM(A.QUANTITY),COUNT(B.OrderID),COUNT(B.CustomerID),YEAR(B.ORDERDATE),MONTH(B.ORDERDATE),(C.Market_Price-C.Sale_Price)AS DISC FROM OrderDetails AS A 
INNER JOIN Orders as B ON A.OrderID = B.OrderID
INNER JOIN Products as C ON A.ProductID = C.ProductID
GROUP BY C.Product,YEAR(B.ORDERDATE),MONTH(B.ORDERDATE),(C.Market_Price-C.Sale_Price)

SELECT*,(Market_Price-Sale_Price)AS DISC FROM Products GROUP BY 