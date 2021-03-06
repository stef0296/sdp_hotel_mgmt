/****** Object:  Table [dbo].[hotel_master]    Script Date: 6/7/2021 5:43:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[hotel_master](
	[hotel_id] [int] IDENTITY(1,1) NOT NULL,
	[hotel_name] [varchar](500) NOT NULL,
	[hotel_location_id] [int] NOT NULL,
	[hotel_addr_l1] [varchar](max) NOT NULL,
	[hotel_addr_l2] [varchar](max) NULL,
	[hotel_addr_l3] [varchar](max) NULL,
	[hotel_city_id] [int] NOT NULL,
	[hotel_state_id] [int] NOT NULL,
	[hotel_country_id] [int] NOT NULL,
	[hotel_pin_num] [varchar](10) NOT NULL,
	[hotel_status] [tinyint] NULL,
 CONSTRAINT [PK_hotel_master] PRIMARY KEY CLUSTERED 
(
	[hotel_id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[hotel_master]  WITH CHECK ADD  CONSTRAINT [FK_hotel_city_id] FOREIGN KEY([hotel_city_id])
REFERENCES [dbo].[city_master] ([city_id])
GO
ALTER TABLE [dbo].[hotel_master] CHECK CONSTRAINT [FK_hotel_city_id]
GO
ALTER TABLE [dbo].[hotel_master]  WITH CHECK ADD  CONSTRAINT [FK_hotel_country_id] FOREIGN KEY([hotel_country_id])
REFERENCES [dbo].[country_master] ([country_id])
GO
ALTER TABLE [dbo].[hotel_master] CHECK CONSTRAINT [FK_hotel_country_id]
GO
ALTER TABLE [dbo].[hotel_master]  WITH CHECK ADD  CONSTRAINT [FK_hotel_location_id] FOREIGN KEY([hotel_location_id])
REFERENCES [dbo].[location_master] ([loc_id])
GO
ALTER TABLE [dbo].[hotel_master] CHECK CONSTRAINT [FK_hotel_location_id]
GO
ALTER TABLE [dbo].[hotel_master]  WITH CHECK ADD  CONSTRAINT [FK_hotel_state_id] FOREIGN KEY([hotel_state_id])
REFERENCES [dbo].[state_master] ([state_id])
GO
ALTER TABLE [dbo].[hotel_master] CHECK CONSTRAINT [FK_hotel_state_id]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Hotel ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'hotel_master', @level2type=N'COLUMN',@level2name=N'hotel_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Location ID (location_master)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'hotel_master', @level2type=N'COLUMN',@level2name=N'hotel_location_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Address Line 1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'hotel_master', @level2type=N'COLUMN',@level2name=N'hotel_addr_l1'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Address Line 2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'hotel_master', @level2type=N'COLUMN',@level2name=N'hotel_addr_l2'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Address Line 3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'hotel_master', @level2type=N'COLUMN',@level2name=N'hotel_addr_l3'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'City ID (city_master)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'hotel_master', @level2type=N'COLUMN',@level2name=N'hotel_city_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'State ID (state_master)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'hotel_master', @level2type=N'COLUMN',@level2name=N'hotel_state_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Country ID (country_master)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'hotel_master', @level2type=N'COLUMN',@level2name=N'hotel_country_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Pin Code' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'hotel_master', @level2type=N'COLUMN',@level2name=N'hotel_pin_num'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Hotel Status (null = Active | 1 = Inactive)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'hotel_master', @level2type=N'COLUMN',@level2name=N'hotel_status'
GO
