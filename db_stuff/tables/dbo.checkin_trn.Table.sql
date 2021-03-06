/****** Object:  Table [dbo].[checkin_trn]    Script Date: 6/7/2021 5:43:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[checkin_trn](
	[cin_id] [int] IDENTITY(1,1) NOT NULL,
	[cin_date] [date] NOT NULL,
	[cin_hotel_id] [int] NOT NULL,
	[cin_employee_id] [int] NOT NULL,
	[cin_book_id] [int] NOT NULL,
	[cin_clean_status] [tinyint] NOT NULL,
	[cin_fridge_status] [tinyint] NOT NULL,
	[cin_maint_status] [tinyint] NOT NULL,
 CONSTRAINT [PK_checkin_trn] PRIMARY KEY CLUSTERED 
(
	[cin_id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[checkin_trn]  WITH CHECK ADD  CONSTRAINT [FK_cin_book_id] FOREIGN KEY([cin_book_id])
REFERENCES [dbo].[book_trn] ([book_id])
GO
ALTER TABLE [dbo].[checkin_trn] CHECK CONSTRAINT [FK_cin_book_id]
GO
ALTER TABLE [dbo].[checkin_trn]  WITH CHECK ADD  CONSTRAINT [FK_cin_employee_id] FOREIGN KEY([cin_employee_id])
REFERENCES [dbo].[employee_master] ([employee_id])
GO
ALTER TABLE [dbo].[checkin_trn] CHECK CONSTRAINT [FK_cin_employee_id]
GO
ALTER TABLE [dbo].[checkin_trn]  WITH CHECK ADD  CONSTRAINT [FK_cin_hotel_id] FOREIGN KEY([cin_hotel_id])
REFERENCES [dbo].[hotel_master] ([hotel_id])
GO
ALTER TABLE [dbo].[checkin_trn] CHECK CONSTRAINT [FK_cin_hotel_id]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Primary key' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'checkin_trn', @level2type=N'COLUMN',@level2name=N'cin_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Check-in Date' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'checkin_trn', @level2type=N'COLUMN',@level2name=N'cin_date'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Hotel ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'checkin_trn', @level2type=N'COLUMN',@level2name=N'cin_hotel_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Employee ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'checkin_trn', @level2type=N'COLUMN',@level2name=N'cin_employee_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Booking ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'checkin_trn', @level2type=N'COLUMN',@level2name=N'cin_book_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Clean Status (0 = no | 1 = yes)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'checkin_trn', @level2type=N'COLUMN',@level2name=N'cin_clean_status'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Fridge Restock Status (0 = no | 1 = yes)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'checkin_trn', @level2type=N'COLUMN',@level2name=N'cin_fridge_status'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Room Maintainence Status (0 = no | 1 = yes)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'checkin_trn', @level2type=N'COLUMN',@level2name=N'cin_maint_status'
GO
