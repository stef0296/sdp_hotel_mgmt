/****** Object:  Table [dbo].[bed_master]    Script Date: 6/5/2021 7:39:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[bed_master](
	[bed_id] [int] IDENTITY(1,1) NOT NULL,
	[bed_desc] [varchar](20) NOT NULL,
	[bed_count] [int] NOT NULL,
 CONSTRAINT [PK_bed_masater] PRIMARY KEY CLUSTERED 
(
	[bed_id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[book_trn]    Script Date: 6/5/2021 7:39:49 PM ******/
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
	[book_cust_doc_id] [varchar](50) NOT NULL,
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
/****** Object:  Table [dbo].[checkin_trn]    Script Date: 6/5/2021 7:39:49 PM ******/
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
/****** Object:  Table [dbo].[checkout_trn]    Script Date: 6/5/2021 7:39:49 PM ******/
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
/****** Object:  Table [dbo].[city_master]    Script Date: 6/5/2021 7:39:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[city_master](
	[city_id] [int] IDENTITY(1,1) NOT NULL,
	[city_code] [varchar](10) NOT NULL,
	[city_name] [varchar](200) NOT NULL,
	[city_status] [tinyint] NULL,
 CONSTRAINT [PK_city_master] PRIMARY KEY CLUSTERED 
(
	[city_id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[country_master]    Script Date: 6/5/2021 7:39:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[country_master](
	[country_id] [int] IDENTITY(1,1) NOT NULL,
	[country_code] [varchar](10) NOT NULL,
	[country_name] [varchar](200) NOT NULL,
	[country_ext] [varchar](5) NULL,
	[country_status] [tinyint] NULL,
 CONSTRAINT [PK_country_master] PRIMARY KEY CLUSTERED 
(
	[country_id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[department_master]    Script Date: 6/5/2021 7:39:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[department_master](
	[dept_id] [int] IDENTITY(1,1) NOT NULL,
	[dept_code] [varchar](10) NOT NULL,
	[dept_name] [varchar](100) NOT NULL,
	[dept_status] [tinyint] NULL,
 CONSTRAINT [PK_department_master] PRIMARY KEY CLUSTERED 
(
	[dept_id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[employee_master]    Script Date: 6/5/2021 7:39:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[employee_master](
	[employee_id] [int] IDENTITY(1,1) NOT NULL,
	[employee_hotel_id] [int] NOT NULL,
	[employee_dept_id] [int] NOT NULL,
	[employee_desg] [varchar](100) NOT NULL,
	[employee_addr_l1] [varchar](max) NOT NULL,
	[employee_addr_l2] [varchar](max) NULL,
	[employee_addr_l3] [varchar](max) NULL,
	[employee_city_id] [int] NOT NULL,
	[employee_state_id] [int] NOT NULL,
	[employee_country_id] [int] NOT NULL,
	[employee_pin_num] [varchar](10) NOT NULL,
	[employee_ph_num] [varchar](10) NULL,
	[employee_email] [varchar](200) NULL,
	[employee_dob] [date] NOT NULL,
	[employee_status] [tinyint] NULL,
 CONSTRAINT [PK_employee_master] PRIMARY KEY CLUSTERED 
(
	[employee_id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[hotel_master]    Script Date: 6/5/2021 7:39:49 PM ******/
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
/****** Object:  Table [dbo].[location_master]    Script Date: 6/5/2021 7:39:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[location_master](
	[loc_id] [int] IDENTITY(1,1) NOT NULL,
	[loc_code] [varchar](10) NOT NULL,
	[loc_name] [varchar](200) NOT NULL,
	[loc_status] [tinyint] NULL,
 CONSTRAINT [PK_location_master] PRIMARY KEY CLUSTERED 
(
	[loc_id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[payment_master]    Script Date: 6/5/2021 7:39:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[payment_master](
	[pymt_id] [int] IDENTITY(1,1) NOT NULL,
	[pymt_code] [varchar](10) NOT NULL,
	[pymt_desc] [varchar](100) NOT NULL,
	[pymt_status] [tinyint] NULL,
 CONSTRAINT [PK_payment_master] PRIMARY KEY CLUSTERED 
(
	[pymt_id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[rcat_master]    Script Date: 6/5/2021 7:39:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[rcat_master](
	[rcat_id] [int] IDENTITY(1,1) NOT NULL,
	[rcat_code] [varchar](10) NOT NULL,
	[rcat_desc] [varchar](100) NOT NULL,
	[rcat_status] [tinyint] NULL,
 CONSTRAINT [PK_rcat_master] PRIMARY KEY CLUSTERED 
(
	[rcat_id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[reservation_details]    Script Date: 6/5/2021 7:39:49 PM ******/
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
/****** Object:  Table [dbo].[room_details]    Script Date: 6/5/2021 7:39:49 PM ******/
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
/****** Object:  Table [dbo].[rtype_master]    Script Date: 6/5/2021 7:39:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[rtype_master](
	[rtype_id] [int] NOT NULL,
	[rtype_code] [varchar](10) NOT NULL,
	[rtype_detail] [varchar](100) NOT NULL,
	[rtype_status] [tinyint] NULL,
 CONSTRAINT [PK_rtype_master] PRIMARY KEY CLUSTERED 
(
	[rtype_id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[service_master]    Script Date: 6/5/2021 7:39:49 PM ******/
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
/****** Object:  Table [dbo].[state_master]    Script Date: 6/5/2021 7:39:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[state_master](
	[state_id] [int] IDENTITY(1,1) NOT NULL,
	[state_code] [varchar](10) NOT NULL,
	[state_name] [varchar](200) NOT NULL,
	[state_status] [tinyint] NULL,
 CONSTRAINT [PK_state_master] PRIMARY KEY CLUSTERED 
(
	[state_id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sysdiagrams]    Script Date: 6/5/2021 7:39:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sysdiagrams](
	[name] [sysname] NOT NULL,
	[principal_id] [int] NOT NULL,
	[diagram_id] [int] IDENTITY(1,1) NOT NULL,
	[version] [int] NULL,
	[definition] [varbinary](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[diagram_id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UK_principal_name] UNIQUE NONCLUSTERED 
(
	[principal_id] ASC,
	[name] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[vas_details]    Script Date: 6/5/2021 7:39:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[vas_details](
	[vas_id] [int] NOT NULL,
	[vas_book_id] [int] NOT NULL,
	[vas_service_id] [int] NOT NULL,
	[vas_price] [decimal](10, 2) NOT NULL,
 CONSTRAINT [PK_vas_details] PRIMARY KEY CLUSTERED 
(
	[vas_id] ASC
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
ALTER TABLE [dbo].[employee_master]  WITH CHECK ADD  CONSTRAINT [FK_employee_city_id] FOREIGN KEY([employee_city_id])
REFERENCES [dbo].[city_master] ([city_id])
GO
ALTER TABLE [dbo].[employee_master] CHECK CONSTRAINT [FK_employee_city_id]
GO
ALTER TABLE [dbo].[employee_master]  WITH CHECK ADD  CONSTRAINT [FK_employee_country_id] FOREIGN KEY([employee_country_id])
REFERENCES [dbo].[country_master] ([country_id])
GO
ALTER TABLE [dbo].[employee_master] CHECK CONSTRAINT [FK_employee_country_id]
GO
ALTER TABLE [dbo].[employee_master]  WITH CHECK ADD  CONSTRAINT [FK_employee_dept_id] FOREIGN KEY([employee_dept_id])
REFERENCES [dbo].[department_master] ([dept_id])
GO
ALTER TABLE [dbo].[employee_master] CHECK CONSTRAINT [FK_employee_dept_id]
GO
ALTER TABLE [dbo].[employee_master]  WITH CHECK ADD  CONSTRAINT [FK_employee_hotel_id] FOREIGN KEY([employee_hotel_id])
REFERENCES [dbo].[hotel_master] ([hotel_id])
GO
ALTER TABLE [dbo].[employee_master] CHECK CONSTRAINT [FK_employee_hotel_id]
GO
ALTER TABLE [dbo].[employee_master]  WITH CHECK ADD  CONSTRAINT [FK_employee_state_id] FOREIGN KEY([employee_state_id])
REFERENCES [dbo].[state_master] ([state_id])
GO
ALTER TABLE [dbo].[employee_master] CHECK CONSTRAINT [FK_employee_state_id]
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
ALTER TABLE [dbo].[service_master]  WITH CHECK ADD  CONSTRAINT [FK_service_hotel_id] FOREIGN KEY([service_hotel_id])
REFERENCES [dbo].[hotel_master] ([hotel_id])
GO
ALTER TABLE [dbo].[service_master] CHECK CONSTRAINT [FK_service_hotel_id]
GO
ALTER TABLE [dbo].[vas_details]  WITH CHECK ADD  CONSTRAINT [FK_vas_book_id] FOREIGN KEY([vas_book_id])
REFERENCES [dbo].[book_trn] ([book_id])
GO
ALTER TABLE [dbo].[vas_details] CHECK CONSTRAINT [FK_vas_book_id]
GO
ALTER TABLE [dbo].[vas_details]  WITH CHECK ADD  CONSTRAINT [FK_vas_service_id] FOREIGN KEY([vas_service_id])
REFERENCES [dbo].[service_master] ([service_id])
GO
ALTER TABLE [dbo].[vas_details] CHECK CONSTRAINT [FK_vas_service_id]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Bed ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'bed_master', @level2type=N'COLUMN',@level2name=N'bed_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Description (King, Queen size, twin beds)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'bed_master', @level2type=N'COLUMN',@level2name=N'bed_desc'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Bed count' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'bed_master', @level2type=N'COLUMN',@level2name=N'bed_count'
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
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'City ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'city_master', @level2type=N'COLUMN',@level2name=N'city_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'City Code' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'city_master', @level2type=N'COLUMN',@level2name=N'city_code'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'City Name' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'city_master', @level2type=N'COLUMN',@level2name=N'city_name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'City Status (null = Active | 1 = Inactive)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'city_master', @level2type=N'COLUMN',@level2name=N'city_status'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Country ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'country_master', @level2type=N'COLUMN',@level2name=N'country_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Country Code' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'country_master', @level2type=N'COLUMN',@level2name=N'country_code'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Country Name' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'country_master', @level2type=N'COLUMN',@level2name=N'country_name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Country Extension' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'country_master', @level2type=N'COLUMN',@level2name=N'country_ext'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Country Status (null = Active | 1 = Inactive)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'country_master', @level2type=N'COLUMN',@level2name=N'country_status'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Department ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'department_master', @level2type=N'COLUMN',@level2name=N'dept_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Department Code' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'department_master', @level2type=N'COLUMN',@level2name=N'dept_code'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Department Name' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'department_master', @level2type=N'COLUMN',@level2name=N'dept_name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Department Status(null = Active | 1 = Inactive)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'department_master', @level2type=N'COLUMN',@level2name=N'dept_status'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Employee ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'employee_master', @level2type=N'COLUMN',@level2name=N'employee_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Hotel ID (hotel_master)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'employee_master', @level2type=N'COLUMN',@level2name=N'employee_hotel_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Department ID (department_master)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'employee_master', @level2type=N'COLUMN',@level2name=N'employee_dept_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Employee Designation' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'employee_master', @level2type=N'COLUMN',@level2name=N'employee_desg'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Address Line 1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'employee_master', @level2type=N'COLUMN',@level2name=N'employee_addr_l1'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Address Line 2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'employee_master', @level2type=N'COLUMN',@level2name=N'employee_addr_l2'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Address Line 3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'employee_master', @level2type=N'COLUMN',@level2name=N'employee_addr_l3'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'City ID (city_master)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'employee_master', @level2type=N'COLUMN',@level2name=N'employee_city_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'State ID (state_master)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'employee_master', @level2type=N'COLUMN',@level2name=N'employee_state_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Country ID (country_master)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'employee_master', @level2type=N'COLUMN',@level2name=N'employee_country_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Pin Number' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'employee_master', @level2type=N'COLUMN',@level2name=N'employee_pin_num'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Phone Number' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'employee_master', @level2type=N'COLUMN',@level2name=N'employee_ph_num'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Email ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'employee_master', @level2type=N'COLUMN',@level2name=N'employee_email'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Date of Birth' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'employee_master', @level2type=N'COLUMN',@level2name=N'employee_dob'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Employee Status (null = Active | 1 = Inactive)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'employee_master', @level2type=N'COLUMN',@level2name=N'employee_status'
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
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Department ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'location_master', @level2type=N'COLUMN',@level2name=N'loc_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Department Code' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'location_master', @level2type=N'COLUMN',@level2name=N'loc_code'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Department Name' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'location_master', @level2type=N'COLUMN',@level2name=N'loc_name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Location Status (null = Active | 1 = Inactive)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'location_master', @level2type=N'COLUMN',@level2name=N'loc_status'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Payment ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'payment_master', @level2type=N'COLUMN',@level2name=N'pymt_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Payment Code' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'payment_master', @level2type=N'COLUMN',@level2name=N'pymt_code'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Payment Desc' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'payment_master', @level2type=N'COLUMN',@level2name=N'pymt_desc'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Status (null = Inactive | 1 = active)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'payment_master', @level2type=N'COLUMN',@level2name=N'pymt_status'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Category ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'rcat_master', @level2type=N'COLUMN',@level2name=N'rcat_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Category Code' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'rcat_master', @level2type=N'COLUMN',@level2name=N'rcat_code'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Category Desc' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'rcat_master', @level2type=N'COLUMN',@level2name=N'rcat_desc'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Status (null = Active | 1 = Inactive)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'rcat_master', @level2type=N'COLUMN',@level2name=N'rcat_status'
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
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Room Type ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'rtype_master', @level2type=N'COLUMN',@level2name=N'rtype_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Type Code' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'rtype_master', @level2type=N'COLUMN',@level2name=N'rtype_code'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Room Details' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'rtype_master', @level2type=N'COLUMN',@level2name=N'rtype_detail'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Status (null = Active | 1 = Inactive)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'rtype_master', @level2type=N'COLUMN',@level2name=N'rtype_status'
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
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'State ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'state_master', @level2type=N'COLUMN',@level2name=N'state_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'State Code' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'state_master', @level2type=N'COLUMN',@level2name=N'state_code'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'State Name' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'state_master', @level2type=N'COLUMN',@level2name=N'state_name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'State Status (null = Active | 1 = Inactive)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'state_master', @level2type=N'COLUMN',@level2name=N'state_status'
GO
EXEC sys.sp_addextendedproperty @name=N'microsoft_database_tools_support', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sysdiagrams'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'VAS ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'vas_details', @level2type=N'COLUMN',@level2name=N'vas_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Booking ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'vas_details', @level2type=N'COLUMN',@level2name=N'vas_book_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Service ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'vas_details', @level2type=N'COLUMN',@level2name=N'vas_service_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'VAS Price' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'vas_details', @level2type=N'COLUMN',@level2name=N'vas_price'
GO
