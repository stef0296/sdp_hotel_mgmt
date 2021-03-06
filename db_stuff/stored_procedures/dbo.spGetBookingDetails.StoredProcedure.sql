/****** Object:  StoredProcedure [dbo].[spGetBookingDetails]    Script Date: 6/7/2021 5:44:25 PM ******/
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
	book_cust_ph_num,
	book_cust_email,
	convert(varchar(10), book_arrival_date, 105) [arr_date],
	convert(varchar(10), book_departure_date, 105) [dep_date]
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
	left join room_details on room_id = res_room_id
	left join rcat_master on rcat_id = room_rcat_id
	left join rtype_master on rtype_id= room_rtype_id
	left join bed_master on bed_id = room_bed_id
	where res_book_id = @book_id;
END
GO
