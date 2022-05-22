USE [travel_web]
GO

/****** Object:  Table [dbo].[member_data]    Script Date: 2022/5/21 ¤U¤È 11:08:51 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[member_data](
 [user_no] [int] IDENTITY(1,1) NOT NULL,
 [email] [nvarchar](50) NOT NULL,
 [ch_name] [nvarchar](10) NULL,
 [en_name] [nvarchar](20) NULL,
 [password] [nvarchar](20) NOT NULL,
 [gender] [nvarchar](10) NULL,
 [birthday] [nvarchar](10) NULL,
 [phone] [nvarchar](20) NULL,
 [city] [nvarchar](20) NULL,
 [location] [nvarchar](20) NULL,
 [address] [nvarchar](50) NULL,
 CONSTRAINT [PK_mamber_data] PRIMARY KEY CLUSTERED 
(
 [user_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO