package com.DaoImpl;



import org.hibernate.Session;
import org.hibernate.SessionFactory;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.Dao.UserDao;
import com.model.User;

@Repository("userDao")

public class UserDaoImpl implements UserDao {

	@Autowired 
	SessionFactory sessionFactory;

	@Transactional
	public boolean addUser(User user) {
		try
		{
		sessionFactory.getCurrentSession().saveOrUpdate(user);
		return true;
		}
		catch(Exception e)
		{
			System.out.println("Exception arised"+e);
		return false;
		}
	}

	
	public User getUser(String useremail) {
		Session session = sessionFactory.openSession();
		User user = (User)session.get(User.class,useremail);
		session.close();
		return user;
	}
	
	
	

}
