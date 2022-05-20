DROP TABLE IF EXISTS Hotel;

CREATE TABLE [dbo].[Hotel](
 [ID] [int] IDENTITY(1,1) NOT NULL,
 [hotel_name] [nvarchar](50) NULL,
 [price] [int] NULL,
 [boss_name] [nvarchar](50) NULL,
 [phone] [nvarchar](50) NULL,
 [status] [nvarchar](50) NULL,
 [roomtype] [nvarchar](50) NULL
) ON [PRIMARY]
GO

insert into hotel
values ('Mark_hotel',9000,N'³\®a»Ê',0912958727,'ok','single');

insert into hotel
values ('Nieming_hotel',9000,N'¾G¤D¹ç',0912958727,'ok','double');

insert into hotel
values ('WangZezeikg_Hotel',19000,N'¤ý¤lã¸',0912958327,'ok','single');

insert into hotel
values ('HoutsHtop_Hotel',3000,N'¾G¥ü¯§',0912958727,'ok','double');

insert into hotel
values ('Good_Hotel',13000,N'¼ï«³ºû',0912958727,'ok','single');