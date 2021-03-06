/****** Object:  Table [dbo].[rtype_master]    Script Date: 6/7/2021 5:43:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[rtype_master](
	[rtype_id] [int] IDENTITY(1,1) NOT NULL,
	[rtype_code] [varchar](10) NOT NULL,
	[rtype_detail] [varchar](100) NOT NULL,
	[rtype_status] [tinyint] NULL,
 CONSTRAINT [PK_rtype_master] PRIMARY KEY CLUSTERED 
(
	[rtype_id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Room Type ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'rtype_master', @level2type=N'COLUMN',@level2name=N'rtype_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Type Code' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'rtype_master', @level2type=N'COLUMN',@level2name=N'rtype_code'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Room Details' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'rtype_master', @level2type=N'COLUMN',@level2name=N'rtype_detail'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Status (null = Active | 1 = Inactive)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'rtype_master', @level2type=N'COLUMN',@level2name=N'rtype_status'
GO
