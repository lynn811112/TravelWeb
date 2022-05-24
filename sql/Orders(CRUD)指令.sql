INSERT INTO ORDERS
VALUES (GETDATE(),'訂房',1234,500,100,2,2,2);

INSERT INTO ORDERS VALUES (GETDATE(),?,?,?,?,?,?,?)

SELECT ALL{

SELECT order_id,CONVERT(varchar(16),order_date,120) order_date,order_category,user_no,order_total,
								order_discount,coupon_id,order_status,order_paystatus FROM ORDERS;
}

SELECT ONE{

SELECT order_id,CONVERT(varchar(16),order_date,120) order_date,order_category,user_no,order_total,
			   order_discount,coupon_id,order_status,order_paystatus FROM orders WHERE order_id = ? 
}

UPDATE fullversion{

UPDATE orders SET order_category= '訂票' , user_no= 1234, order_total = 500, order_discount = 100, coupon_id =  1, order_status = 1, order_paystatus = 1  WHERE order_id = 1000

UPDATE orders SET order_category= ? , user_no= ?, order_total = ?, order_discount = ?, coupon_id =  ?, order_status = ?, order_paystatus = ?  WHERE order_id = ?

}

DELETE {

DELETE orders WHERE order_id = ?

}