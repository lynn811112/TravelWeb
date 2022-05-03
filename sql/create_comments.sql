CREATE DATABASE travel_web;

USE travel_web;

DROP TABLE IF EXISTS comments;

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

--INSERT INTO comments (item_tb, item_id, user_id, com_date, rate, content, image) 
--SELECT 'hotel', 4, 2, getdate(), 4, 'Amazing Trip', BulkColumn 
--FROM Openrowset( Bulk 'C:\iSpan\Code\TravelWeb\ref\friends-min.jpg', Single_Blob) as com_image;

SELECT * FROM comments;

SELECT * FROM comments 
WHERE com_id = 1

DELETE comments WHERE com_id = 17

UPDATE comments SET item_tb='car', item_id=17, user_id=4, rate=2, content='Worst car I have ever rent' 
WHERE com_id = 14