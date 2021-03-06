/****** Object:  StoredProcedure [dbo].[spNewCheckout]    Script Date: 6/7/2021 5:44:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      spNewCheckout
-- Create Date: 06-06-2021
-- Description: SP to checkout a customer
-- =============================================
-- spNewCheckout 4, 800.00, 250.00, 30.00, 240.00, 810.0
CREATE PROCEDURE [dbo].[spNewCheckout]
(
    @cout_book_id int,
	@room_total varchar(10),
	@vas_total varchar(10),
	@disc_perc varchar(10),
	@disc_val varchar(10),
	@gr_total varchar(10)
)
AS
BEGIN
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON

    BEGIN TRY

		declare @cout_id int;
		declare @cout_room_total decimal(10, 2);
		declare @cout_vas_total decimal(10, 2);
		declare @cout_disc_perc decimal(10, 2);
		declare @cout_disc_val decimal(10, 2);
		declare @count_gr_total decimal(10, 2);

		select
		@cout_room_total = convert(decimal(10, 2), @room_total),
		@cout_vas_total = convert(decimal(10, 2), @vas_total),
		@cout_disc_perc = convert(decimal(10, 2), @disc_perc),
		@cout_disc_val = convert(decimal(10, 2), @disc_val),
		@count_gr_total = convert(decimal(10, 2), @gr_total);

		
		BEGIN TRAN;
		
		insert into checkout_trn(
			cout_employee_id,
			cout_date,
			cout_book_id,
			cout_room_total,
			cout_vas_total,
			cout_disc_perc,
			cout_disc_val,
			cout_gr_total
		) select
		2,
		getdate(),
		@cout_book_id,
		@cout_room_total,
		@cout_vas_total,
		@cout_disc_perc,
		@cout_disc_val,
		@count_gr_total;

		select @cout_id = SCOPE_IDENTITY();
		COMMIT TRAN;

		select 1 [result_id];
		select @cout_id [cout_id];
	END TRY
	BEGIN CATCH
		if @@TRANCOUNT > 0
			rollback tran;
		select ERROR_MESSAGE() as ERRORMESSAGE;
		select 0 [result_id];
	END CATCH
END
GO
