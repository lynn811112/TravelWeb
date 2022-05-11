CREATE DATABASE travel_web;

USE travel_web;

DROP TABLE IF EXISTS comments;

CREATE TABLE comments (
	com_id int IDENTITY(1,1) NOT NULL,
	item_tb varchar(25) NOT NULL,
	item_id int NOT NULL,
	user_id int NOT NULL,
	order_id int,
	com_date date,
	rate int,
	content nvarchar(200),
	status 
);






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


Lorem ipsum dolor, sit amet consectetur adipisicing elit. Dolor, aspernatur similique. Doloribus adipisci explicabo sit nostrum porro quae, iste maxime omnis enim unde, aliquam quisquam ratione eligendi laboriosam sunt sint!

--INSERT INTO comments (item_tb, item_id, user_id, com_date, rate, content, image) 
--SELECT 'hotel', 4, 2, getdate(), 4, 'Amazing Trip', BulkColumn 
--FROM Openrowset( Bulk 'C:\iSpan\Code\TravelWeb\ref\friends-min.jpg', Single_Blob) as com_image;

SELECT * FROM comments;

SELECT * FROM comments 
WHERE com_id = 1

DELETE comments WHERE com_id = 17

UPDATE comments SET item_tb='car', item_id=17, user_id=4, rate=2, content='Worst car I have ever rent' 
WHERE com_id = 14