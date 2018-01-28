package com.shoes.category;

import java.util.List;

public interface CategoryDAO {
	void insert(Category c);
	void update (Category c);
	void delete(int id);
	
	Category getCategory(int id);
	List<Category>getCategory();
	Category getCategory(String name);

}
