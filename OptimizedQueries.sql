drop procedure if exists GetMaxQuantity;
drop procedure if exists CancelOrder;
delimiter //

# Task 1
create procedure GetMaxQuantity() 
begin
	select max(Quantity) as MaxOrderQty from Orders;
end//

# Task 2
prepare GetOrderDetail from 'select OrderID, Quantity, TotalCost from Orders where CustomerID = ?'//
set @id = 1//
execute GetOrderDetail using @id//

# Task 3
create procedure CancelOrder(in orderid int) 
begin
	delete from Orders where OrderID = orderid;
    select ('Order '+orderid+' is cancelled') as Confirmation;
end//

delimiter ;