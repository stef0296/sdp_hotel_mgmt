/****** Object:  StoredProcedure [dbo].[get_countries]    Script Date: 6/5/2021 7:43:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      <Author, , Name>
-- Create Date: 03-06-2021
-- Description: SP to get list of active countries
-- =============================================
CREATE PROCEDURE [dbo].[get_countries](
	@show_inactive int null
)
AS
BEGIN
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON
	
    -- Insert statements for procedure here
    BEGIN TRY
		select
		country_id,
		country_code,
		country_name,
		country_ext
		from country_master
		where isnull(country_status, 0) = isnull(@show_inactive, 0);

		select
		country_id,
		country_code,
		country_name,
		country_ext
		from country_master
		where isnull(country_status, 0) != isnull(@show_inactive, 0);

	END TRY
	BEGIN CATCH
		select 1;
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[spGetAvailableRooms]    Script Date: 6/5/2021 7:43:58 PM ******/
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
/****** Object:  StoredProcedure [dbo].[spGetBookingDetails]    Script Date: 6/5/2021 7:43:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      Stefano Alvares
-- Create Date: 05-06-2021
-- Description: SP to get booking details for room_no
-- =============================================
CREATE PROCEDURE [dbo].[spGetBookingDetails]
(
    @book_id int
)
AS
BEGIN
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON;

	-- get customer detail for book id
	select
	CONVERT(varchar(10), book_datetime, 105) [book_datetime],
	isnull(book_cust_fName, '') [book_cust_fName],
	isnull(book_cust_mName, '') [book_cust_mName],
	isnull(book_cust_lName, '') [book_cust_lName],
	book_cust_doc_id,
	book_cust_address,
	book_cust_ph_num
	from book_trn
	where book_id = @book_id;

	-- room details for book id
	select
	room_num,
	rcat_code,
	rtype_code,
	bed_desc,
	bed_count,
	res_room_price
	from reservation_details
	left join room_details on room_num = res_room_id
	left join rcat_master on rcat_id = room_rcat_id
	left join rtype_master on rtype_id= room_rtype_id
	left join bed_master on bed_id = room_bed_id
	where res_book_id = @book_id;
END
GO
/****** Object:  StoredProcedure [dbo].[spGetHotelDetails]    Script Date: 6/5/2021 7:43:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[spGetHotelDetails]
as
begin
	select hotel_id, 
	CONCAT(hotel_name, ' - ', loc_name) hotel_location 
	from hotel_master
	left join location_master on loc_id = hotel_location_id
	where hotel_status is null
	and loc_status is null;
end
GO
/****** Object:  StoredProcedure [dbo].[spNewCheckin]    Script Date: 6/5/2021 7:43:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      Stefano Alvares
-- Create Date: 05-06-2021
-- Description: SP to check-in a customer
-- =============================================
CREATE PROCEDURE [dbo].[spNewCheckin]
(
    @book_id int,
	@checkin_date varchar(10),
	@cin_clean_status int,
	@cin_fridge_status int,
	@cin_maint_status int
)
AS
BEGIN
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON

    BEGIN TRY
		-- declare all local variables at the start of the procedure
		declare @cin_id int;
		declare @cin_dt date;

		-- date conversion
		select @cin_dt = convert(date, @checkin_date, 105);

		begin tran;

		-- insert entry in checkin table
		insert into checkin_trn(
			cin_date,
			cin_hotel_id,
			cin_employee_id,
			cin_book_id,
			cin_clean_status,
			cin_fridge_status,
			cin_maint_status
		) select
		@cin_dt,
		1,
		1,
		@book_id,
		@cin_clean_status,
		@cin_fridge_status,
		@cin_maint_status;

		-- get the checkin id for the inserted entry
		SELECT @cin_id = SCOPE_IDENTITY();
		
		commit tran;

		select 1 [result_id];
		select @cin_id [cin_id];
	END TRY
	BEGIN CATCH
		if @@TRANCOUNT > 0
			rollback tran;
		select 0 [result_id];
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[spNewHotelBooking]    Script Date: 6/5/2021 7:43:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      Stefano Alvares
-- Create Date: 05-06-2021
-- Description: SP to create a hotel booking transaction
-- =============================================
CREATE PROCEDURE [dbo].[spNewHotelBooking]
(
    @hotel_id int,
	@employee_id int,
	@book_type int,
	@discount varchar null,
	@book_arrival_date varchar(10),
	@book_departure_date varchar(10),
	@room_id int,
	@price varchar(10),
	@book_cust_fName varchar(200),
	@book_cust_mName varchar(200) null,
	@book_cust_lName varchar(200) null,
	@book_cust_doc_id varchar(50),
	@book_cust_address varchar(500) null,
	@book_cust_ph_num varchar(11) null,
	@book_cust_email varchar(100) null,
	@book_status int
)
AS
BEGIN
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON

	BEGIN TRY

		-- declare all local variables at the start of the procedure
		declare @book_id int;
		declare @arrival_date date;
		declare @departure_date date;
		declare @book_discount decimal(10, 2);
		declare @room_price decimal(10, 2);

		-- perform all data type conversions before the transaction begins
		select
		@arrival_date = CONVERT(date, @book_arrival_date, 105),
		@departure_date = CONVERT(date, @book_departure_date, 105),
		@book_discount = convert(decimal(10,2), @discount),
		@room_price = convert(decimal(10,2), @price);

		begin tran;

		-- insert an entry in the booking table
		insert into book_trn (
			book_datetime,
			book_hotel_id,
			book_employee_id,
			book_type,
			book_room_discount,
			book_arrival_date,
			book_departure_date,
			book_total_days,
			book_cust_fName,
			book_cust_mName,
			book_cust_lName,
			book_cust_doc_id,
			book_cust_address,
			book_cust_ph_num,
			book_cust_email,
			book_status
		)
		select
		getdate(),
		@hotel_id,
		1,
		@book_type,
		@book_discount,
		@arrival_date,
		@departure_date,
		datediff(day, @arrival_date, @departure_date),
		@book_cust_fName,
		@book_cust_mName,
		@book_cust_lName,
		@book_cust_doc_id,
		@book_cust_address,
		@book_cust_ph_num,
		@book_cust_email,
		@book_status;

		-- get the booking id for the inserted entry
		SELECT @book_id = SCOPE_IDENTITY();

		-- insert the room details in the reservation table
		insert into reservation_details(
			res_book_id,
			res_room_id,
			res_room_price
		) select
		@book_id,
		@room_id,
		@room_price;

		commit tran;

		select 1 [result_id];
		select @book_id [booking_id];

	END TRY
	BEGIN CATCH
		if @@TRANCOUNT > 0
			rollback tran;
		select 0 [result_id];
	END CATCH

END
GO
