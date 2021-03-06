/****** Object:  StoredProcedure [dbo].[spGetHotelDetails]    Script Date: 6/7/2021 5:44:25 PM ******/
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
