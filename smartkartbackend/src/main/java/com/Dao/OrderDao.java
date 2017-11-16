package com.Dao;

import java.util.List;


import com.model.Orders;

public interface OrderDao {
	public boolean createOrder(Orders orders);
	public List<Orders> retrieveOrders(String userEmail);
}
