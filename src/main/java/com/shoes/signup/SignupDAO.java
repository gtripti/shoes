package com.shoes.signup;

import java.util.List;


public interface SignupDAO {

	void insert(Signup s);
	void update(Signup s);
	void delete(int id);
	
	Signup getSign(int id);
	List<Signup>getAll();
	List<Signup> getAllEmail();
}
