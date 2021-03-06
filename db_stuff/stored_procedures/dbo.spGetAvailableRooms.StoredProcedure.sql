/****** Object:  StoredProcedure [dbo].[spGetAvailableRooms]    Script Date: 6/7/2021 5:44:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      Balamurugan Govindaraj
-- Create Date: 05-06-2021
-- Description: SP to get available rooms
-- =============================================
CREATE proc [dbo].[spGetAvailableRooms]
@hotel_id int,
@arr_date varchar(10),
@dep_date varchar(10)
as
begin
	set nocount on

	-- declare all local variables at the start of the procedure
	declare @arrivaldate date;	
	declare @departuredate date;

	-- Convert arrival date and departure date from string to date
	select @arrivaldate = convert(date,@arr_date,105);
	select @departuredate = convert(date,@dep_date,105);

	select 
	r.room_id,
	r.room_num,
	rcat_desc, 
	rtype_detail, 
	b.bed_desc, 
	b.bed_count, 
	r.room_price 
	from room_details as r
	left join bed_master as b on b.bed_id = r.room_bed_id
	left join rcat_master on rcat_id = r.room_rcat_id
	left join rtype_master on rtype_id = r.room_rtype_id
	where room_id not in 
	(
		select distinct res_room_id  
		from book_trn
		left join reservation_details on res_book_id = book_id
		left join checkin_trn on cin_book_id = book_id
		where 
		(cin_id is not null)
		or
		(
			book_arrival_date between @arrivaldate and @departuredate
			and 
			book_departure_date between @arrivaldate and @departuredate
		)
	)
	and room_hotel_id = @hotel_id
	and room_status is null;
end
GO
