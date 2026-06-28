package com.ziobite.DAOImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.ziobite.DAO.RestaurantDAO;
import com.ziobite.DBConnection.DBConnection;
import com.ziobite.model.Restaurant;

public class RestaurantImpl implements RestaurantDAO{
	
	
	         private static final String INSERT_QUERY =
			"INSERT INTO restaurant(name,address,rating,image,cuisine_type,delivery_time,is_active) VALUES(?,?,?,?,?,?,?)";

			private static final String GET_RESTAURANT =
			"SELECT * FROM restaurant WHERE id=?";

			private static final String UPDATE_RESTAURANT =
			"UPDATE restaurant SET name=?, address=?, rating=?, image=?, cuisine_type=?, delivery_time=?, is_active=? WHERE id=?";
			
			private static final String DELETE_RESTAURANT =
			"DELETE FROM restaurant WHERE id=?";
			
			private static final String GET_ALL_RESTAURANTS =
			"SELECT * FROM restaurant";


	@Override
	public void addRestaurant(Restaurant restaurant) {
		
		    Connection con = DBConnection.getconnection();

		    try {

		        PreparedStatement stmt = con.prepareStatement(INSERT_QUERY);

		        stmt.setString(1, restaurant.getName());
		        stmt.setString(2, restaurant.getAddress());
		        stmt.setDouble(3, restaurant.getRating());
		        stmt.setString(4, restaurant.getImage());
		        stmt.setString(5, restaurant.getCuisineType());
		        stmt.setInt(6, restaurant.getDeliveryTime());
		        stmt.setString(7, restaurant.getIsActive());

		        stmt.executeUpdate();

		    } catch (Exception e) {

		        e.printStackTrace();
		    }
		}
		
	

	@Override
	public Restaurant getRestaurant(int id) {
		 Restaurant restaurant = null;

		    Connection con = DBConnection.getconnection();

		    try {

		        PreparedStatement stmt = con.prepareStatement(GET_RESTAURANT);

		        stmt.setInt(1, id);

		        ResultSet rs = stmt.executeQuery();

		        if(rs.next()) {

		            restaurant = new Restaurant();

		            restaurant.setId(rs.getInt("id"));
		            restaurant.setName(rs.getString("name"));
		            restaurant.setAddress(rs.getString("address"));
		            restaurant.setRating(rs.getDouble("rating"));
		            restaurant.setImage(rs.getString("image"));
		            restaurant.setCuisineType(rs.getString("cuisine_type"));
		            restaurant.setDeliveryTime(rs.getInt("delivery_time"));
		            restaurant.setIsActive(rs.getString("is_active"));
		        }

		    } catch (Exception e) {

		        e.printStackTrace();
		    }

		    return restaurant;
	}

	@Override
	public void updateRestaurant(Restaurant restaurant) {
		 Connection con = DBConnection.getconnection();

		    try {

		        PreparedStatement stmt =con.prepareStatement(UPDATE_RESTAURANT);

		        stmt.setString(1, restaurant.getName());
		        stmt.setString(2, restaurant.getAddress());
		        stmt.setDouble(3, restaurant.getRating());
		        stmt.setString(4, restaurant.getImage());
		        stmt.setString(5, restaurant.getCuisineType());
		        stmt.setInt(6, restaurant.getDeliveryTime());
		        stmt.setString(7, restaurant.getIsActive());

		        stmt.setInt(8, restaurant.getId());

		        stmt.executeUpdate();

		    } catch (Exception e) {

		        e.printStackTrace();
		    }
	}

	@Override
	public void deleteRestaurant(int id) {
		Connection con = DBConnection.getconnection();

	    try {

	        PreparedStatement stmt = con.prepareStatement(DELETE_RESTAURANT);

	        stmt.setInt(1, id);

	        stmt.executeUpdate();

	    } catch (Exception e) {

	        e.printStackTrace();
	    }
	}

	@Override
	public List<Restaurant> getAllRestaurants() {
		List<Restaurant> restaurantList = new ArrayList<>();

	    Connection con = DBConnection.getconnection();

	    try {

	        PreparedStatement stmt = con.prepareStatement(GET_ALL_RESTAURANTS);

	        ResultSet rs = stmt.executeQuery();

	        while (rs.next()) {

	            Restaurant restaurant = new Restaurant();

	            restaurant.setId(rs.getInt("id"));
	            restaurant.setName(rs.getString("name"));
	            restaurant.setAddress(rs.getString("address"));
	            restaurant.setRating(rs.getDouble("rating"));
	            restaurant.setImage(rs.getString("image"));
	            restaurant.setCuisineType(rs.getString("cuisine_type"));
	            restaurant.setDeliveryTime(rs.getInt("delivery_time"));
	            restaurant.setIsActive(rs.getString("is_active"));

	            restaurantList.add(restaurant);
	        }

	    } catch (Exception e) {

	        e.printStackTrace();
	    }

	    return restaurantList;
	}

}
