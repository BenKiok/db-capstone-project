drop procedure if exists CheckBooking;
drop procedure if exists AddValidBooking;
delete from Bookings where BookingID between 0 and 4;

# Task 1
insert into Bookings(BookingID, Date, TableNo, BookedByID, StaffID)
values (1, '2022-10-10', 5, 1, 2),
	   (2, '2022-11-12', 3, 3, 1),
       (3, '2022-10-11', 2, 2, 4),
       (4, '2022-10-13', 2, 1, 3);
       
delimiter //

# Task 2
create procedure CheckBooking(in num int, in date datetime)
begin
	declare status int;
	select status = BookingID from Bookings where TableNo = num and Date = date;
    if status is not null then
		select ('Table '+num+'is already booked') as 'Booking status';
	else
		select ('Table '+num+'is free to book') as 'Booking status';
	end
end//

# Task 3
create procedure AddValidBooking(in num int, in date datetime)
begin
	declare status int;
    select status = BookingID from Bookings where TableNo = num and Date = date;
    
	start transaction;
	insert into Bookings(Date, TableNo)
	values (date, num);
		
	if status is not null then
		rollback;
	else
		commit;
	end
end//