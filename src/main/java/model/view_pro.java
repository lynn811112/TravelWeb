package model;

import java.io.Serializable;

public class view_pro implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String prod_no;
	private String prod_name;
	private String prod_Intro;
	private String open_week;
	private String open_time;
	private String end_time;
	private String phone;
	private String Country;
	private String City;
	private String Location;
	private String address;
	private int price;
	private String img_id;
//	private byte[] image;
//	private String image_Intro;
	
//	private Date new_date;
//	private String emp_id;
//	private String emp_name;
//	private String tag_no;
//	private String tag_name;
	
	
	
	public String getProd_no() {
		return prod_no;
	}
	public void setProd_no(String prod_no) {
		this.prod_no = prod_no;
	}
	public String getProd_name() {
		return prod_name;
	}
	public void setProd_name(String prod_name) {
		this.prod_name = prod_name;
	}
	public String getProd_Intro() {
		return prod_Intro;
	}
	public void setProd_Intro(String prod_Intro) {
		this.prod_Intro = prod_Intro;
	}
	public String getImg_id() {
		return img_id;
	}
	public void setImg_id(String img_id) {
		this.img_id = img_id;
	}
//	public byte[] getImage() {
//		return image;
//	}
//	public void setImage(byte[] image) {
//		this.image = image;
//	}
//	public String getImage_Intro() {
//		return image_Intro;
//	}
//	public void setImage_Intro(String image_Intro) {
//		this.image_Intro = image_Intro;
//	}
	public String getOpen_week() {
		return open_week;
	}
	public void setOpen_week(String open_week) {
		this.open_week = open_week;
	}
	public String getOpen_time() {
		return open_time;
	}
	public void setOpen_time(String open_time) {
		this.open_time = open_time;
	}
	public String getEnd_time() {
		return end_time;
	}
	public void setEnd_time(String end_time) {
		this.end_time = end_time;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getCountry() {
		return Country;
	}
	public void setCountry(String country) {
		Country = country;
	}
	public String getCity() {
		return City;
	}
	public void setCity(String city) {
		City = city;
	}
	public String getLocation() {
		return Location;
	}
	public void setLocation(String location) {
		Location = location;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
}


