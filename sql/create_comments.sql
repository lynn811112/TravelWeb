CREATE DATABASE travel_web;

USE travel_web;

DROP TABLE IF EXISTS comments;

CREATE TABLE comments (
	com_id int IDENTITY(1,1) NOT NULL PRIMARY KEY,
	item_tb varchar(25) NOT NULL,
	item_id int NOT NULL,
	user_id varchar(20) NOT NULL,
	com_date date,
	rating int,
	content nvarchar(200),
	image1 varbinary(max),
	image2 varbinary(max),
	image3 varbinary(max),
	status char(1),
);

ALTER TABLE comments 
ADD image1 varbinary(max),
	image2 varbinary(max),
	image3 varbinary(max),
	status char(1);


ALTER TABLE comments DROP COLUMN status;

----------old query-----------

CREATE TABLE comments (
	com_id int IDENTITY(1,1) NOT NULL,
	item_tb varchar(25) NOT NULL,
	item_id int NOT NULL,
	user_id int NOT NULL,
	com_date date,
	rate int,
	content nvarchar(200),
);

INSERT INTO comments VALUES ('hotel', 4, 2, getdate(), 4, 'Amazing Trip');
--INSERT INTO comments VALUES ('hotel', 4, 2, getdate(), 4, N'Amazing Trip!\n 有點貴就是了><');
INSERT INTO comments VALUES ('hotel', 4, 2, getdate(), 4, N'Amazing Trip!<br> 有點貴就是了><');

--INSERT INTO comments (item_tb, item_id, user_id, com_date, rate, content, image) 
--SELECT 'hotel', 4, 2, getdate(), 4, 'Amazing Trip', BulkColumn 
--FROM Openrowset( Bulk 'C:\iSpan\Code\TravelWeb\ref\friends-min.jpg', Single_Blob) as com_image;

SELECT * FROM comments ORDER BY com_id;

SELECT * FROM comments 
WHERE com_id = 1

SELECT image1, image2, image3 FROM comments WHERE com_id = 6;


DELETE comments WHERE com_id = 17

UPDATE comments SET image2 = null
WHERE com_id = 14

UPDATE comments SET user_id='employee' WHERE com_id = 27;



SELECT count(*) FROM comments;

INSERT INTO comments (item_tb, item_id, user_id, com_date, rate, content, image1, image2, image3, status) 
SELECT 'hotel', 4, 2, getdate(), 4, 'upload pics', 
	   (Select BulkColumn FROM Openrowset( Bulk 'C:\iSpan\Code\TravelWeb\ref\lake.jpg', Single_Blob) as image), 
	   (Select BulkColumn FROM Openrowset( Bulk 'C:\iSpan\Code\TravelWeb\ref\fall-min.jpg', Single_Blob) as image), 
	   (Select BulkColumn FROM Openrowset( Bulk 'C:\iSpan\Code\TravelWeb\ref\friends-min.jpg', Single_Blob) as image), 
	   'y';

INSERT INTO comments (item_tb, item_id, user_id, com_date, rate, content, image1, image2, status) 
SELECT 'hotel', 4, 2, getdate(), 4, 'upload pics', 
	   (Select BulkColumn FROM Openrowset( Bulk 'C:\iSpan\Code\TravelWeb\ref\lake.jpg', Single_Blob) as image), 
	   (Select BulkColumn FROM Openrowset( Bulk 'C:\iSpan\Code\TravelWeb\ref\fall-min.jpg', Single_Blob) as image), 
	   'y';

UPDATE comments SET image2=(Select BulkColumn FROM Openrowset( Bulk 'C:\iSpan\Code\TravelWeb\ref\pizza.jpg', Single_Blob) as image) WHERE com_id = 6;