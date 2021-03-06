/****** Object:  StoredProcedure [dbo].[spGetCheckoutDetails]    Script Date: 6/7/2021 5:44:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      Stefano Alvares
-- Create Date: 06-06-2021
-- Description: SP to get checkout details
-- =============================================

CREATE PROCEDURE [dbo].[spGetCheckoutDetails]
(
    @room_no varchar(4)
)
AS
BEGIN
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON

	declare @room_id int;
	declare @book_id int;
	declare @total_days int;
	declare @discount decimal(8,2);
	declare @room_total decimal(10,2);
	declare @vas_total decimal(10,2);
	declare @reservation_det table(
		room_id int,
		room_num int,
		room_price decimal(10, 2),
		total_days int,
		total decimal(10, 2)
	);

	declare @vas table(
		vas_id int,
		vas_code varchar(10),
		vas_desc varchar(100),
		vas_price decimal(8, 2)
	);

    select
	@room_id = room_id
	from room_details
	where room_num = @room_no;

	-- get the latest booking id for the room number
	-- cout_id = null means that the customer has not yet checked out
	select
	@book_id = book_id,
	@discount = book_room_discount,
	@total_days = book_total_days
	from reservation_details
	left join book_trn on book_id = res_book_id
	left join checkout_trn on cout_book_id = book_id
	where res_room_id = @room_id
	and cout_id is null;

	insert into @reservation_det(
		room_id,
		room_num,
		room_price,
		total_days,
		total
	)
	select
	room_id,
	room_num,
	res_room_price,
	@total_days,
	res_room_price * @total_days
	from reservation_details
	left join room_details on room_id = res_room_id
	where res_book_id = @book_id;

	insert into @vas(
		vas_id,
		vas_code,
		vas_desc,
		vas_price
	)
	select
	vas_id,
	service_code,
	service_desc,
	vas_price
	from vas_details
	left join service_master on service_id = vas_service_id
	where vas_book_id = @book_id;

	select
	@room_total = sum(total)
	from @reservation_det;

	select
	@vas_total = sum(vas_price)
	from @vas;

	select @book_id [book_id];

	select
	room_id,
	room_num,
	room_price,
	total_days,
	total
	from @reservation_det;

	select
	vas_id,
	vas_code,
	vas_desc,
	vas_price
	from @vas;

	select
	@room_total [room_total],
	@discount [disc_perc],
	format(ROUND((@room_total * @discount) / 100, 2), 'N2') [disc_val],
	@vas_total [vas_total],
	format(@room_total + @vas_total - ROUND((@room_total * @discount) / 100, 2), 'N2') [gr_total];


END
GO
