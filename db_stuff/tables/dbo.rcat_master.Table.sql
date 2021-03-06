/****** Object:  Table [dbo].[rcat_master]    Script Date: 6/7/2021 5:43:42 PM ******/
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
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Category ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'rcat_master', @level2type=N'COLUMN',@level2name=N'rcat_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Category Code' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'rcat_master', @level2type=N'COLUMN',@level2name=N'rcat_code'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Category Desc' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'rcat_master', @level2type=N'COLUMN',@level2name=N'rcat_desc'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Status (null = Active | 1 = Inactive)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'rcat_master', @level2type=N'COLUMN',@level2name=N'rcat_status'
GO
