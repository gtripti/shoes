package com.shoes.signup;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Transactional
@Repository
public class SignupDAOImp implements SignupDAO {

	@Autowired
	SessionFactory sessionfactory;
	
	public void insert(Signup s) {
		sessionfactory.getCurrentSession().save(s);
		
	}

	public void update(Signup s) {
		this.sessionfactory.getCurrentSession().update(s);
	}

	public void delete(int id) {
		this.sessionfactory.getCurrentSession().createQuery("delete from Profiles where id=:id").setInteger("id", id).executeUpdate();
		
	}

	public Signup getSign(int id) {
		return (Signup)this.sessionfactory.getCurrentSession().createQuery("from Profiles where id=:id").setInteger("id", id).list().get(0);
	}

	public List<Signup> getAll() {
		return (List<Signup>)this.sessionfactory.getCurrentSession().createQuery("from Signup").list();
	}

	public List<Signup> getAllEmail() {
		return (List<Signup>)this.sessionfactory.getCurrentSession().createQuery("select email from Profiles").list();
	}
	
}
