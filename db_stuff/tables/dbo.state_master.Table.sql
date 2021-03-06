/****** Object:  Table [dbo].[state_master]    Script Date: 6/7/2021 5:43:42 PM ******/
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
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'State ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'state_master', @level2type=N'COLUMN',@level2name=N'state_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'State Code' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'state_master', @level2type=N'COLUMN',@level2name=N'state_code'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'State Name' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'state_master', @level2type=N'COLUMN',@level2name=N'state_name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'State Status (null = Active | 1 = Inactive)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'state_master', @level2type=N'COLUMN',@level2name=N'state_status'
GO
