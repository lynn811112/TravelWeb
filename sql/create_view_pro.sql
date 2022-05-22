USE [travel_web]
GO

/****** Object:  Table [dbo].[view_pro]    Script Date: 2022/5/21 ¤U¤È 11:59:40 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[view_pro](
	[prod_no] [int] IDENTITY(1,1) NOT NULL,
	[prod_name] [nvarchar](15) NULL,
	[prod_Intro] [nvarchar](500) NULL,
	[open_week] [nvarchar](15) NULL,
	[open_time] [nvarchar](5) NULL,
	[end_time] [nvarchar](5) NULL,
	[phone] [char](10) NULL,
	[Country] [nvarchar](10) NULL,
	[City] [nvarchar](10) NULL,
	[Location] [nvarchar](10) NULL,
	[address] [nchar](30) NULL,
	[price] [int] NULL,
	[image] [varbinary](max) NULL,
	[image_Intro] [nvarchar](200) NULL,
	[emp_id] [varchar](5) NULL,
	[emp_name] [nvarchar](10) NULL,
 CONSTRAINT [PK__view_pro__5695E32E39A6B607] PRIMARY KEY CLUSTERED 
(
	[prod_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO


