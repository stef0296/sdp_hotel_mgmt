/****** Object:  Table [dbo].[location_master]    Script Date: 6/7/2021 5:43:42 PM ******/
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
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Department ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'location_master', @level2type=N'COLUMN',@level2name=N'loc_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Department Code' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'location_master', @level2type=N'COLUMN',@level2name=N'loc_code'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Department Name' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'location_master', @level2type=N'COLUMN',@level2name=N'loc_name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Location Status (null = Active | 1 = Inactive)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'location_master', @level2type=N'COLUMN',@level2name=N'loc_status'
GO
