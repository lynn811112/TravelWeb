package model;

import java.io.Serializable;
import java.util.Date;

public class Comment implements Serializable {

	private int comId;
	private String itemTb;
	private int itemId;
//	private int orderId;
	private int userId;
	private Date comDate;
	private int rate;
	private String content;

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

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public Date getComDate() {
		return comDate;
	}
	
	public void setComDate(Date comDate) {
		this.comDate = comDate;
	}

	public int getRate() {
		return rate;
	}

	public void setRate(int rate) {
		this.rate = rate;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

}
