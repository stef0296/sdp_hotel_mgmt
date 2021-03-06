/****** Object:  Table [dbo].[city_master]    Script Date: 6/7/2021 5:43:42 PM ******/
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
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'City ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'city_master', @level2type=N'COLUMN',@level2name=N'city_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'City Code' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'city_master', @level2type=N'COLUMN',@level2name=N'city_code'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'City Name' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'city_master', @level2type=N'COLUMN',@level2name=N'city_name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'City Status (null = Active | 1 = Inactive)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'city_master', @level2type=N'COLUMN',@level2name=N'city_status'
GO
