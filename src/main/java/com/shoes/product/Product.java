package com.shoes.product;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Transient;


import org.springframework.web.multipart.MultipartFile;

@Entity
public class Product {

	@Id @GeneratedValue( strategy = GenerationType.AUTO )
	private int id;
	
	private String name;
	private String description;
	private String price;
	private String category;
	private String qty;
	
	@Transient
	private MultipartFile f;
	
	private String imagePath;
	
	
	public MultipartFile getF() {
		return f;
	}
	public void setF(MultipartFile f) {
		this.f = f;
	}
	public String getImagePath() {
		return imagePath;
	}
	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getQty() {
		return qty;
	}
	public void setQty(String qty) {
		this.qty = qty;
	}
	public Product() {
		super();
	}
	
	
}
