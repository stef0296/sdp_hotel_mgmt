/****** Object:  Table [dbo].[reservation_details]    Script Date: 6/7/2021 5:43:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[reservation_details](
	[res_id] [int] IDENTITY(1,1) NOT NULL,
	[res_book_id] [int] NOT NULL,
	[res_room_id] [int] NOT NULL,
	[res_room_price] [decimal](10, 2) NOT NULL,
	[res_status] [tinyint] NULL,
 CONSTRAINT [PK_reservation_details] PRIMARY KEY CLUSTERED 
(
	[res_id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[reservation_details]  WITH CHECK ADD  CONSTRAINT [FK_res_book_id] FOREIGN KEY([res_book_id])
REFERENCES [dbo].[book_trn] ([book_id])
GO
ALTER TABLE [dbo].[reservation_details] CHECK CONSTRAINT [FK_res_book_id]
GO
ALTER TABLE [dbo].[reservation_details]  WITH CHECK ADD  CONSTRAINT [FK_res_room_id] FOREIGN KEY([res_room_id])
REFERENCES [dbo].[room_details] ([room_id])
GO
ALTER TABLE [dbo].[reservation_details] CHECK CONSTRAINT [FK_res_room_id]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Reservation ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'reservation_details', @level2type=N'COLUMN',@level2name=N'res_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Booking ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'reservation_details', @level2type=N'COLUMN',@level2name=N'res_book_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Room ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'reservation_details', @level2type=N'COLUMN',@level2name=N'res_room_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Room Price' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'reservation_details', @level2type=N'COLUMN',@level2name=N'res_room_price'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Reservation Status (null = inactive | 1 = active)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'reservation_details', @level2type=N'COLUMN',@level2name=N'res_status'
GO
