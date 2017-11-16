package com.DaoImpl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.Dao.OrderDao;

import com.model.Orders;

@Repository("OrdersDao")
public class OrderDaoImpl implements OrderDao{

	@Autowired
	SessionFactory sessionFactory;
	
	@Transactional
	public boolean createOrder(Orders orders) {
		try
		{
			sessionFactory.getCurrentSession().saveOrUpdate(orders);
			return true;
		}
		catch(Exception e)
		{
			return false;
		}
	}

	public List<Orders> retrieveOrders(String userEmail) {
		
			Session session=sessionFactory.openSession();
			Query query=session.createQuery("from Orders where email=:email").setString("email",userEmail);
			List<Orders> listOrders=query.list();
			session.close();
			return listOrders;
		}

	}


