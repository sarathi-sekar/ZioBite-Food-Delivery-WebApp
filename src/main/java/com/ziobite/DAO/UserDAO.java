package com.ziobite.DAO;

import java.util.List;

import com.ziobite.model.User;


public interface UserDAO {
	
		void addUser(User user);
	    User getUser(String username, String password);
		void updateUser(User user);
		void deleteUser(int id);
		List<User>getAllUser();
	    

	}

	
