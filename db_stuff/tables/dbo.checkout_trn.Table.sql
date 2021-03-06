/****** Object:  Table [dbo].[checkout_trn]    Script Date: 6/7/2021 5:43:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[checkout_trn](
	[cout_id] [int] IDENTITY(1,1) NOT NULL,
	[cout_employee_id] [int] NOT NULL,
	[cout_date] [date] NOT NULL,
	[cout_book_id] [int] NOT NULL,
	[cout_room_total] [decimal](10, 2) NOT NULL,
	[cout_vas_total] [decimal](10, 2) NOT NULL,
	[cout_disc_perc] [decimal](10, 2) NOT NULL,
	[cout_disc_val] [decimal](10, 2) NOT NULL,
	[cout_gr_total] [decimal](10, 2) NOT NULL,
 CONSTRAINT [PK_checkout_trn] PRIMARY KEY CLUSTERED 
(
	[cout_id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[checkout_trn]  WITH CHECK ADD  CONSTRAINT [FK_cout_employee_id] FOREIGN KEY([cout_employee_id])
REFERENCES [dbo].[employee_master] ([employee_id])
GO
ALTER TABLE [dbo].[checkout_trn] CHECK CONSTRAINT [FK_cout_employee_id]
GO
ALTER TABLE [dbo].[checkout_trn]  WITH CHECK ADD  CONSTRAINT [FK_cout_room_id] FOREIGN KEY([cout_book_id])
REFERENCES [dbo].[book_trn] ([book_id])
GO
ALTER TABLE [dbo].[checkout_trn] CHECK CONSTRAINT [FK_cout_room_id]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Primary Key' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'checkout_trn', @level2type=N'COLUMN',@level2name=N'cout_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Employee ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'checkout_trn', @level2type=N'COLUMN',@level2name=N'cout_employee_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Check-out Date' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'checkout_trn', @level2type=N'COLUMN',@level2name=N'cout_date'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Room Booking ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'checkout_trn', @level2type=N'COLUMN',@level2name=N'cout_book_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Room Total Price' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'checkout_trn', @level2type=N'COLUMN',@level2name=N'cout_room_total'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Value Added Services Total' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'checkout_trn', @level2type=N'COLUMN',@level2name=N'cout_vas_total'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Discount Percentage' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'checkout_trn', @level2type=N'COLUMN',@level2name=N'cout_disc_perc'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Discount Value' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'checkout_trn', @level2type=N'COLUMN',@level2name=N'cout_disc_val'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Grand Total' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'checkout_trn', @level2type=N'COLUMN',@level2name=N'cout_gr_total'
GO
