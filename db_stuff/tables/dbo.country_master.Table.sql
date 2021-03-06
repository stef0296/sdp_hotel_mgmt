/****** Object:  Table [dbo].[country_master]    Script Date: 6/7/2021 5:43:42 PM ******/
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
