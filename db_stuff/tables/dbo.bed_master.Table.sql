/****** Object:  Table [dbo].[bed_master]    Script Date: 6/7/2021 5:43:41 PM ******/
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
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Bed ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'bed_master', @level2type=N'COLUMN',@level2name=N'bed_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Description (King, Queen size, twin beds)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'bed_master', @level2type=N'COLUMN',@level2name=N'bed_desc'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Bed count' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'bed_master', @level2type=N'COLUMN',@level2name=N'bed_count'
GO
