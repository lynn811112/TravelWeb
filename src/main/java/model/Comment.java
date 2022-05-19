package model;

import java.io.InputStream;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class Comment implements Serializable {

	private static final long serialVersionUID = 1L;
	private int comId;
	private String itemTb;
	private int itemId;
	private String userId;
	private Date comDate;
	private int rating;
	private String content;
//	private List<String> imageStrs;
	private String image1;
	private String image2;
	private String image3;
	private List<InputStream> imageBytes;


	public int getComId() {
		return comId;
	}

	public void setComId(int comId) {
		this.comId = comId;
	}

	public String getItemTb() {
		return itemTb;
	}

	public void setItemTb(String itemTb) {
		this.itemTb = itemTb;
	}

	public int getItemId() {
		return itemId;
	}

	public void setItemId(int itemId) {
		this.itemId = itemId;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public Date getComDate() {
		return comDate;
	}
	
	public void setComDate(Date comDate) {
		this.comDate = comDate;
	}

	public int getRating() {
		return rating;
	}

	public void setRating(int rating) {
		this.rating = rating;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getImage1() {
		return image1;
	}

	public String getImage2() {
		return image2;
	}

	public String getImage3() {
		return image3;
	}

	public void setImage1(String image1) {
		this.image1 = image1;
	}

	public void setImage2(String image2) {
		this.image2 = image2;
	}

	public void setImage3(String image3) {
		this.image3 = image3;
	}

	public List<InputStream> getImageBytes() {
		return imageBytes;
	}
	
	public void setImageBytes(List<InputStream> images) {
		this.imageBytes = (ArrayList<InputStream>) images;
	}
	
//	public List<String> getImageStrs() {
//		return (ArrayList<String>) imageStrs;
//	}
//	
//	public void setImageStrs(List<String> imageStrs) {
//		this.imageStrs = imageStrs;
//	}




}
