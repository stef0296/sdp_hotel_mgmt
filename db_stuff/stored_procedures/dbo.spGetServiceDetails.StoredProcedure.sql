/****** Object:  StoredProcedure [dbo].[spGetServiceDetails]    Script Date: 6/7/2021 5:44:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spGetServiceDetails]
as
begin
	set nocount on
	select 
	service_id, 
	service_desc,
	service_price
	from service_master
	where service_status is null
end
GO
