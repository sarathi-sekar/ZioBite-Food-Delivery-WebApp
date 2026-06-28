package com.ziobite.DAO;

import java.util.List;

import com.ziobite.model.Restaurant;

public interface RestaurantDAO {
	
	    void addRestaurant(Restaurant restaurant);

	    Restaurant getRestaurant(int id);

	    void updateRestaurant(Restaurant restaurant);

	    void deleteRestaurant(int id);
	    
	    List<Restaurant> getAllRestaurants();
	
	

}
