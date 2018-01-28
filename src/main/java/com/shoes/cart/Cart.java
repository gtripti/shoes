package com.shoes.cart;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
public class Cart {

	@Id @GeneratedValue(strategy=GenerationType.AUTO)
	private int id;
	
	private int pid;
	private int qty;
	private String SAdd;
	private String BAdd;
	private String userid;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getPid() {
		return pid;
	}
	public void setPid(int pid) {
		this.pid = pid;
	}
	public int getQty() {
		return qty;
	}
	public void setQty(int qty) {
		this.qty = qty;
	}
	public String getSAdd() {
		return SAdd;
	}
	public void setSAdd(String sAdd) {
		SAdd = sAdd;
	}
	public String getBAdd() {
		return BAdd;
	}
	public void setBAdd(String bAdd) {
		BAdd = bAdd;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	
	
}
