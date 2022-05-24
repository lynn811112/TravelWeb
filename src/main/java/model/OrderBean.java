package model;

import java.io.Serializable;
import java.math.BigDecimal;
import java.sql.*;

public class OrderBean implements Serializable {
	private int orderId;
	private String orderDate;
	private String orderCategory;
	private int userNo;
	private int orderTotal;
	private int orderDiscount;
	private int couponId;
	private int orderStatus;
	private int orderPayStatus;
	private Timestamp orderDatePlus;
	public OrderBean() {
		// TODO Auto-generated constructor stub
	}
	
	public OrderBean(
	Timestamp orderDatePlus,String orderCategory,int userNo,int orderTotal,
	 int orderDiscount,int couponId,int orderStatus,int orderPayStatus)
	{
		
		 this.orderDatePlus = orderDatePlus;
		 this.orderCategory = orderCategory;
		 this.userNo = userNo;
		 this.orderTotal = orderTotal; 
		 this.orderDiscount = orderDiscount;
		 this.couponId = couponId;
		 this.orderStatus = orderStatus;
		 this.orderPayStatus = orderPayStatus;
	}
	
	public Timestamp getOrderDatePlus() {
		return orderDatePlus;
	}

	public void setOrderDatePlus(Timestamp orderDatePlus) {
		this.orderDatePlus = orderDatePlus;
	}

	public int getOrderId() {
		return orderId;
	}

	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}

	public String getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(String orderDate) {
		this.orderDate = orderDate;
	}

	public String getOrderCategory() {
		return orderCategory;
	}

	public void setOrderCategory(String orderCategory) {
		this.orderCategory = orderCategory;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public int getOrderTotal() {
		return orderTotal;
	}

	public void setOrderTotal(int orderTotal) {
		this.orderTotal = orderTotal;
	}

	public int getOrderDiscount() {
		return orderDiscount;
	}

	public void setOrderDiscount(int orderDiscount) {
		this.orderDiscount = orderDiscount;
	}

	public int getCouponId() {
		return couponId;
	}

	public void setCouponId(int couponId) {
		this.couponId = couponId;
	}

	public int getOrderStatus() {
		return orderStatus;
	}

	public void setOrderStatus(int orderStatus) {
		this.orderStatus = orderStatus;
	}

	public int getOrderPayStatus() {
		return orderPayStatus;
	}

	public void setOrderPayStatus(int orderPaystatus) {
		this.orderPayStatus = orderPaystatus;
	}
	
}
