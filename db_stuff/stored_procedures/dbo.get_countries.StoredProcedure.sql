/****** Object:  StoredProcedure [dbo].[get_countries]    Script Date: 6/5/2021 7:45:06 PM ******/
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
