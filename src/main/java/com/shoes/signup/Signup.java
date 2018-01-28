package com.shoes.signup;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;

import org.hibernate.validator.constraints.NotEmpty;
@Entity
public class Signup {
	
	@Id @GeneratedValue(strategy = GenerationType.AUTO)
	private int id;
	@NotNull(message="First name cannot be null")
	@NotEmpty(message="First name cannot be empty")
	private String fname;
	private String lname;
	@Pattern(regexp="^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+.['com','co.in','co']+$", message="Email is not in correct format (***@abc.com)")
	private String email;
	@NotNull(message="Password cannot be null")
	@NotEmpty(message="Password cannot be empty")
	private String pass;
	@Pattern (regexp="^[7-9]{1}[0-9]{9}$", message="Phone number format must be as that of an Indian mobile number")
	private String phone;
	private String address;
	
	private String role="ROLE_USER";
	
	private boolean active = true;
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	public boolean isActive() {
		return active;
	}
	public void setActive(boolean active) {
		this.active = active;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getFname() {
		return fname;
	}
	public void setFname(String fname) {
		this.fname = fname;
	}
	public String getLname() {
		return lname;
	}
	public void setLname(String lname) {
		this.lname = lname;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	
	public Signup(){
		super();
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	

}
