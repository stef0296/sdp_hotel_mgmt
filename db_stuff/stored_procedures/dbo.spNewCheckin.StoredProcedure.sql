/****** Object:  StoredProcedure [dbo].[spNewCheckin]    Script Date: 6/7/2021 5:44:25 PM ******/
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
		2,
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

		SELECT ERROR_MESSAGE() AS ErrorMessage;
		select 0 [result_id];
	END CATCH
END
GO
