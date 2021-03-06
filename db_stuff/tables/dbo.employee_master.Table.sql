/****** Object:  Table [dbo].[employee_master]    Script Date: 6/7/2021 5:43:42 PM ******/
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
