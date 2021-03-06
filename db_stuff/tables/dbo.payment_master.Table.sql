/****** Object:  Table [dbo].[payment_master]    Script Date: 6/7/2021 5:43:42 PM ******/
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
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Payment ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'payment_master', @level2type=N'COLUMN',@level2name=N'pymt_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Payment Code' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'payment_master', @level2type=N'COLUMN',@level2name=N'pymt_code'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Payment Desc' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'payment_master', @level2type=N'COLUMN',@level2name=N'pymt_desc'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Status (null = Inactive | 1 = active)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'payment_master', @level2type=N'COLUMN',@level2name=N'pymt_status'
GO
