drop procedure if exists AddBooking;
drop procedure if exists UpdateBooking;
drop procedure if exists CancelBooking;
delimiter //

# Task 1
create procedure AddBooking(in book int, in cust int, in date datetime, in num int)
begin
	insert into Booking(BookingID, Date, TableNo, BookedByID, StaffID)
    values (book, date, num, cust, 3);
    select 'New booking added' as Confirmation;
end//

# Task 2
create procedure UpdateBooking(in book int, in date datetime)
begin
	update Booking set Date = date where BookingID = book;
    select 'Booking '+book+' updated' as Confirmation;
end//

# Task 3
create procedure CancelBooking(in book int)
begin
	delete from Bookings where BookingID = book;
    select 'Booking '+book+' cancelled' as Confirmation;
end//