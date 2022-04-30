CREATE DATABASE travel_web;

USE travel_web;

DROP TABLE IF EXISTS comments

CREATE TABLE comments (
	com_id int IDENTITY(0001,1) NOT NULL,
	object_tb varchar(25) NOT NULL,
	object_id int NOT NULL,
	user_id int NOT NULL,
	com_date date,
	score int,
	content nvarchar(200),
	--images varbinary(max),
);

INSERT INTO comments 
VALUES ('hotel', 0004, 0002, getdate(), 4, 'Amazing Trip');