/****** Object:  Table [dbo].[service_master]    Script Date: 6/7/2021 5:43:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[service_master](
	[service_id] [int] IDENTITY(1,1) NOT NULL,
	[service_hotel_id] [int] NOT NULL,
	[service_code] [varchar](10) NOT NULL,
	[service_desc] [varchar](100) NOT NULL,
	[service_price] [decimal](8, 2) NOT NULL,
	[service_status] [tinyint] NULL,
 CONSTRAINT [PK_service_master] PRIMARY KEY CLUSTERED 
(
	[service_id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[service_master]  WITH CHECK ADD  CONSTRAINT [FK_service_hotel_id] FOREIGN KEY([service_hotel_id])
REFERENCES [dbo].[hotel_master] ([hotel_id])
GO
ALTER TABLE [dbo].[service_master] CHECK CONSTRAINT [FK_service_hotel_id]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Service ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'service_master', @level2type=N'COLUMN',@level2name=N'service_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Hotel ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'service_master', @level2type=N'COLUMN',@level2name=N'service_hotel_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Service Code' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'service_master', @level2type=N'COLUMN',@level2name=N'service_code'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Service Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'service_master', @level2type=N'COLUMN',@level2name=N'service_desc'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Service Price' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'service_master', @level2type=N'COLUMN',@level2name=N'service_price'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Status (null = Active | 1 = Inactive)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'service_master', @level2type=N'COLUMN',@level2name=N'service_status'
GO
