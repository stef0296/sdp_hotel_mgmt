/****** Object:  StoredProcedure [dbo].[spNewVasDetailsRecord]    Script Date: 6/7/2021 5:44:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[spNewVasDetailsRecord]
@vas_book_id int,
@vas_service_id int,
@vas_price varchar(10)
as
begin
	BEGIN TRY

		declare @price decimal(8,2);
		select @price = convert(decimal(8, 2), @vas_price);

		begin tran;
		
		insert into vas_details(
			vas_book_id,
			vas_service_id,
			vas_price
		)
		select
		@vas_book_id,
		@vas_service_id,
		@price;
		
		commit tran;

		select 1 [result_id];
	END TRY
	BEGIN CATCH
		if @@TRANCOUNT > 0
			rollback tran;
		SELECT ERROR_MESSAGE() AS ErrorMessage;
		select 0 [result_id];
	END CATCH
end
GO
