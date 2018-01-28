package com.shoes.product;

import java.util.List;

public interface ProductDAO {
	void insert(Product p); 
	void update(Product p);
	void delete(int pid);
	
	Product getProduct(int id);
	List<Product>getProduct();
	public List<Product> getProductsbySupplierName(String name);
	List<Product> categoryProduct(String name);
}
