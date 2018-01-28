package com.shoes.cart;

import java.util.List;

public interface CartDAO {
	
	void add(Cart c);
	void update(Cart c);
	public void update( String user, String ship, String bill );
	void delete(int id);
	
	Cart getCart(int id);
	List<Cart>getCart();
	public List<Cart> getProductsbyName(String name);

}
