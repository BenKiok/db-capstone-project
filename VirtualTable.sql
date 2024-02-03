# Task 1
create view OrdersView as 
select 
	Orders.OrderID, 
    Orders.Quantity, 
    Orders.TotalCost 
where Orders.Quantity > 2;

# Task 2
select
	Customers.CustomerID,
    Customers.Name,
    Orders.OrderID,
    Orders.TotalCost,
    Menu.MenuID,
    Menu.Starter,
    Menu.Course
from Customers inner join Orders inner join Menu
	on Customers.CustomerID = Orders.CustomerID
	on Orders.MenuID = Menu.MenuID
where Orders.TotalCost > 150
order by Orders.TotalCost asc;

# Task 3
select Name, Course from Menu 
where MenuID = any
(
	select MenuID from Orders
    where count(MenuID) > 2
);