/****** Object:  Table [dbo].[room_details]    Script Date: 6/7/2021 5:43:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[room_details](
	[room_id] [int] IDENTITY(1,1) NOT NULL,
	[room_hotel_id] [int] NOT NULL,
	[room_num] [varchar](4) NOT NULL,
	[floor_num] [int] NOT NULL,
	[room_rtype_id] [int] NOT NULL,
	[room_rcat_id] [int] NOT NULL,
	[room_bed_id] [int] NOT NULL,
	[room_price] [decimal](10, 2) NOT NULL,
	[room_status] [tinyint] NULL,
 CONSTRAINT [PK_room_details] PRIMARY KEY CLUSTERED 
(
	[room_id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[room_details]  WITH CHECK ADD  CONSTRAINT [FK_room_bed_id] FOREIGN KEY([room_bed_id])
REFERENCES [dbo].[bed_master] ([bed_id])
GO
ALTER TABLE [dbo].[room_details] CHECK CONSTRAINT [FK_room_bed_id]
GO
ALTER TABLE [dbo].[room_details]  WITH CHECK ADD  CONSTRAINT [FK_room_hotel_id] FOREIGN KEY([room_hotel_id])
REFERENCES [dbo].[hotel_master] ([hotel_id])
GO
ALTER TABLE [dbo].[room_details] CHECK CONSTRAINT [FK_room_hotel_id]
GO
ALTER TABLE [dbo].[room_details]  WITH CHECK ADD  CONSTRAINT [FK_room_rcat_id] FOREIGN KEY([room_rcat_id])
REFERENCES [dbo].[rcat_master] ([rcat_id])
GO
ALTER TABLE [dbo].[room_details] CHECK CONSTRAINT [FK_room_rcat_id]
GO
ALTER TABLE [dbo].[room_details]  WITH CHECK ADD  CONSTRAINT [FK_room_rtype_id] FOREIGN KEY([room_rtype_id])
REFERENCES [dbo].[rtype_master] ([rtype_id])
GO
ALTER TABLE [dbo].[room_details] CHECK CONSTRAINT [FK_room_rtype_id]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Room ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'room_details', @level2type=N'COLUMN',@level2name=N'room_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Hotel ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'room_details', @level2type=N'COLUMN',@level2name=N'room_hotel_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Room Number' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'room_details', @level2type=N'COLUMN',@level2name=N'room_num'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Floor Number' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'room_details', @level2type=N'COLUMN',@level2name=N'floor_num'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Room Type ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'room_details', @level2type=N'COLUMN',@level2name=N'room_rtype_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Category ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'room_details', @level2type=N'COLUMN',@level2name=N'room_rcat_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Room Price' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'room_details', @level2type=N'COLUMN',@level2name=N'room_price'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Status (null = Active | 1 = Inactive)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'room_details', @level2type=N'COLUMN',@level2name=N'room_status'
GO
