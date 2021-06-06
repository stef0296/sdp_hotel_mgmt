/****** Object:  StoredProcedure [dbo].[spGetAvailableRooms]    Script Date: 6/5/2021 7:45:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[spGetAvailableRooms]
@hotel_id int,
@arr_date varchar(10),
@dep_date varchar(10)
as
begin
	set nocount on
	select 
	r.room_id, 
	r.room_rcat_id, 
	r.room_rtype_id, 
	b.bed_desc, 
	b.bed_count, 
	r.room_price 
	from room_details as r, bed_master as b where room_id not in 
	(
		select distinct book_room_id  
		from booking_trn
		left join reservation_details on res_book_id = book_id
		left join checkin_trn on cin_book_id = book_id
		where 
		(cin_id is not null)
		or
		(
			book_arrival_date between (select convert(date,@arr_date,105)) and 
										(select convert(date,@dep_date,105))
			and 
			book_departure_date between (select convert(date,@arr_date,105)) and 
										(select convert(date,@dep_date,105))
		)
	)
	and room_hotel_id = @hotel_id
	and room_status is null
	and r.room_bed_id = b.bed_id;
end
GO
