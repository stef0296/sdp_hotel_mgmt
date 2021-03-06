/****** Object:  Table [dbo].[department_master]    Script Date: 6/7/2021 5:43:42 PM ******/
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
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Department ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'department_master', @level2type=N'COLUMN',@level2name=N'dept_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Department Code' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'department_master', @level2type=N'COLUMN',@level2name=N'dept_code'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Department Name' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'department_master', @level2type=N'COLUMN',@level2name=N'dept_name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Department Status(null = Active | 1 = Inactive)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'department_master', @level2type=N'COLUMN',@level2name=N'dept_status'
GO
