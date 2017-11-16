package com.Dao;



import com.model.User;

public interface UserDao {
	public boolean addUser(User user);
	
	public User getUser(String useremail);
	
}
