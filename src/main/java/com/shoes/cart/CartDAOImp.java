package com.shoes.cart;

import java.util.List;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Transactional
@Repository
public class CartDAOImp implements CartDAO {
	
	@Autowired
	SessionFactory sessionFactory;

	public void update(Cart c) {
		sessionFactory.getCurrentSession().update(c);
		
	}

	public void delete(int id) {
		sessionFactory.getCurrentSession().createQuery("delete from Cart where id= :id").setInteger("id",id).executeUpdate();
	}

	public Cart getCart(int id) {
		return (Cart)this.sessionFactory.getCurrentSession().createQuery("from Cart where id=:id").setInteger("id", id).list().get(0);
	}

	public List<Cart> getCart() {
		return sessionFactory.getCurrentSession().createQuery("from Cart").list();
	}

	public void add(Cart c) {
		sessionFactory.getCurrentSession().save(c);
		
	}

	public void update(String user, String ship, String bill) {
		
		System.out.println("Update Cart");
		
		System.out.println(user);
		System.out.println(ship);
		System.out.println(bill);
		
		this.sessionFactory.getCurrentSession().createQuery("update Cart set SAdd = :ship, BAdd= :bill where userid=:user").setString("ship", ship).setString("bill", bill).setString("user", user).executeUpdate();
		
	}

	public List<Cart> getProductsbyName(String name) {
		return (List<Cart>)this.sessionFactory.getCurrentSession().createQuery("from Cart where userid=:name").setString("name", name).list();
	}

}
