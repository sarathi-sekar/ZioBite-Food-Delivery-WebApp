package com.ziobite.DAOImpl;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import com.ziobite.DAO.UserDAO;
import com.ziobite.DBConnection.DBConnection;
import com.ziobite.model.User;

public class UserImpl implements UserDAO{
	
	private static final String INSERT_QUERY ="INSERT INTO  user(name,email,phone,address,password,role ) values (?,?,?,?,?,?)";
	private static final String LOGIN_QUERY ="SELECT * FROM user WHERE name=? AND password=?";

	@Override
	public  void addUser(User user) {
		Connection connection = DBConnection.getconnection();
		try {
			PreparedStatement stmt = connection.prepareStatement(INSERT_QUERY);
			
			stmt.setString(1,user.getName());
			stmt.setString(2,user.getEmail());
			stmt.setString(3,user.getPhone());
			stmt.setString(4,user.getAddress());
			stmt.setString(5,user.getPassword());
			stmt.setString(6,user.getRole());
			
			int i = stmt.executeUpdate();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
	}

	@Override
	public User getUser(String username, String password) {

	    User user = null;

	    try {

	        Connection connection =
	                DBConnection.getconnection();

	        PreparedStatement stmt =
	                connection.prepareStatement(LOGIN_QUERY);

	        stmt.setString(1, username);
	        stmt.setString(2, password);

	        ResultSet rs = stmt.executeQuery();

	        if(rs.next()) {

	            user = new User();

	            user.setId(rs.getInt("id")); 
	            user.setName(rs.getString("name"));
	            user.setEmail(rs.getString("email"));
	            user.setPhone(rs.getString("phone"));
	            user.setAddress(rs.getString("address"));
	            user.setPassword(rs.getString("password"));
	            user.setRole(rs.getString("role"));
	        }

	    } catch(Exception e) {

	        e.printStackTrace();
	    }

	    return user;
	}

	@Override
	public void updateUser(User user) {
		
	}

	
	@Override
	public List<User> getAllUser() {
		return null;
	}

	@Override
	public void deleteUser(int id) {
		
	}



}
