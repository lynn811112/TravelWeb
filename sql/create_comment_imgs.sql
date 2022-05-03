USE travel_web;

DROP TABLE IF EXISTS comment_images

CREATE TABLE comment_images (
	com_id int NOT NULL,
	img_id int IDENTITY(1,1) NOT NULL,
	com_image varbinary(max),
);

INSERT INTO comment_images (com_id, com_image) 
SELECT 2, BulkColumn 
FROM Openrowset( Bulk 'C:\iSpan\Code\TravelWeb\ref\lake.jpg', Single_Blob) as image;

SELECT * 
FROM comment_images;

SELECT * FROM comment_images WHERE com_id = 1