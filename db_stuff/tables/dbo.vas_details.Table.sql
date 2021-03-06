/****** Object:  Table [dbo].[vas_details]    Script Date: 6/7/2021 5:43:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[vas_details](
	[vas_id] [int] IDENTITY(1,1) NOT NULL,
	[vas_book_id] [int] NOT NULL,
	[vas_service_id] [int] NOT NULL,
	[vas_price] [decimal](10, 2) NOT NULL,
 CONSTRAINT [PK_vas_details] PRIMARY KEY CLUSTERED 
(
	[vas_id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[vas_details]  WITH CHECK ADD  CONSTRAINT [FK_vas_book_id] FOREIGN KEY([vas_book_id])
REFERENCES [dbo].[book_trn] ([book_id])
GO
ALTER TABLE [dbo].[vas_details] CHECK CONSTRAINT [FK_vas_book_id]
GO
ALTER TABLE [dbo].[vas_details]  WITH CHECK ADD  CONSTRAINT [FK_vas_service_id] FOREIGN KEY([vas_service_id])
REFERENCES [dbo].[service_master] ([service_id])
GO
ALTER TABLE [dbo].[vas_details] CHECK CONSTRAINT [FK_vas_service_id]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'VAS ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'vas_details', @level2type=N'COLUMN',@level2name=N'vas_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Booking ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'vas_details', @level2type=N'COLUMN',@level2name=N'vas_book_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Service ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'vas_details', @level2type=N'COLUMN',@level2name=N'vas_service_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'VAS Price' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'vas_details', @level2type=N'COLUMN',@level2name=N'vas_price'
GO
