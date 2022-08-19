use Ecommerce;

select* from OrderDetails
select* from Products
select* from Suppliers


alter table orderdetails drop constraint prim_key 
alter table orderdetails add constraint prim_key primary key (orderdetailid);
alter table products add constraint prim_key1 primary key (productid);
alter table suppliers add constraint prim_key2 primary key (supplierid);
alter table orderdetails add constraint for_key foreign key (productid) references products(productid);
alter table orderdetails add constraint for_key1 foreign key (supplierid) references suppliers(supplierid);
alter table orderdetails drop constraint for_key1
alter table suppliers drop constraint prim_key2