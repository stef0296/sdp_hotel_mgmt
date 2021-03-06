/****** Object:  Table [dbo].[book_trn]    Script Date: 6/7/2021 5:43:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[book_trn](
	[book_id] [int] IDENTITY(1,1) NOT NULL,
	[book_datetime] [datetime] NOT NULL,
	[book_hotel_id] [int] NOT NULL,
	[book_employee_id] [int] NOT NULL,
	[book_type] [tinyint] NULL,
	[book_room_discount] [decimal](5, 2) NOT NULL,
	[book_arrival_date] [date] NOT NULL,
	[book_departure_date] [date] NOT NULL,
	[book_total_days] [int] NOT NULL,
	[book_cust_fName] [varchar](200) NULL,
	[book_cust_mName] [varchar](200) NULL,
	[book_cust_lName] [varchar](200) NULL,
	[book_cust_doc_id] [varchar](50) NULL,
	[book_cust_address] [varchar](500) NULL,
	[book_cust_ph_num] [varchar](11) NULL,
	[book_cust_email] [varchar](100) NULL,
	[book_status] [tinyint] NULL,
 CONSTRAINT [PK_book_trn] PRIMARY KEY CLUSTERED 
(
	[book_id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[book_trn] ADD  CONSTRAINT [DF_book_trn_book_total_days]  DEFAULT ((0)) FOR [book_total_days]
GO
ALTER TABLE [dbo].[book_trn]  WITH CHECK ADD  CONSTRAINT [FK_book_employee_id] FOREIGN KEY([book_employee_id])
REFERENCES [dbo].[employee_master] ([employee_id])
GO
ALTER TABLE [dbo].[book_trn] CHECK CONSTRAINT [FK_book_employee_id]
GO
ALTER TABLE [dbo].[book_trn]  WITH CHECK ADD  CONSTRAINT [FK_book_hotel_id] FOREIGN KEY([book_hotel_id])
REFERENCES [dbo].[hotel_master] ([hotel_id])
GO
ALTER TABLE [dbo].[book_trn] CHECK CONSTRAINT [FK_book_hotel_id]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Booking ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'book_trn', @level2type=N'COLUMN',@level2name=N'book_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Booking Datetime' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'book_trn', @level2type=N'COLUMN',@level2name=N'book_datetime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Hotel ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'book_trn', @level2type=N'COLUMN',@level2name=N'book_hotel_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Employee ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'book_trn', @level2type=N'COLUMN',@level2name=N'book_employee_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(0 = offline | 1 = online)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'book_trn', @level2type=N'COLUMN',@level2name=N'book_type'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Discount' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'book_trn', @level2type=N'COLUMN',@level2name=N'book_room_discount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Arrival Date' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'book_trn', @level2type=N'COLUMN',@level2name=N'book_arrival_date'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Departure Date' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'book_trn', @level2type=N'COLUMN',@level2name=N'book_departure_date'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Total Days' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'book_trn', @level2type=N'COLUMN',@level2name=N'book_total_days'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Customer First Name' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'book_trn', @level2type=N'COLUMN',@level2name=N'book_cust_fName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Customer Middle Name' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'book_trn', @level2type=N'COLUMN',@level2name=N'book_cust_mName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Customer Last Name' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'book_trn', @level2type=N'COLUMN',@level2name=N'book_cust_lName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Customer Document ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'book_trn', @level2type=N'COLUMN',@level2name=N'book_cust_doc_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Phone Num' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'book_trn', @level2type=N'COLUMN',@level2name=N'book_cust_ph_num'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Status (null = Active | 1 = Inactive)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'book_trn', @level2type=N'COLUMN',@level2name=N'book_status'
GO
