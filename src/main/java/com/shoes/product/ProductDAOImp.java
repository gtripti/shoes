package com.shoes.product;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.shoes.category.Category;

@Transactional
@Repository
public class ProductDAOImp implements ProductDAO {

	@Autowired
	SessionFactory sessionFactory;
	
	public void insert(Product p) {
		sessionFactory.getCurrentSession().save(p);
		
	}

	public void update(Product p) {
		this.sessionFactory.getCurrentSession().update(p);
		
	}

	public void delete(int pid) {
		sessionFactory.getCurrentSession().createQuery("Delete from Product where id = :somevalue").setInteger("somevalue", pid).executeUpdate();
		
	}

	public Product getProduct(int id) {
		return (Product) sessionFactory.getCurrentSession().get(Product.class, id);
	}

	public List<Product> getProduct() {
		return sessionFactory.getCurrentSession().createQuery("from Product").list();
	}

	public List<Product> getProductsbySupplierName(String name) {
		return (List<Product>)this.sessionFactory.getCurrentSession().createQuery("from Products where suppliername=:name").setString("name", name).list();
	}

	public List<Product> categoryProduct(String name) {
		return (List<Product>)this.sessionFactory.getCurrentSession().createQuery("from Products where categories=:name").setString("name" , name).list();
	}
	

}
