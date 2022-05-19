USE travel_web;

DROP TABLE IF EXISTS employees;

CREATE TABLE employees (
	emp_id int IDENTITY(1,1) NOT NULL,
	email varchar(30) NOT NULL,
	password varchar(25) NOT NULL,
);

INSERT INTO employees VALUES ('manager@travelweb.com', 'manager');
INSERT INTO employees VALUES ('david@travelweb.com', 'david');