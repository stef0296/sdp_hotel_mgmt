/****** Object:  StoredProcedure [dbo].[spNewHotelBooking]    Script Date: 6/7/2021 5:44:25 PM ******/
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
	@discount varchar(10) null,
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
		@employee_id,
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
		SELECT ERROR_MESSAGE() AS ErrorMessage;
		select 0 [result_id];
	END CATCH

END
GO
