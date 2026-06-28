package com.ziobite.DAO;

import java.util.List;

import com.ziobite.model.Menu;

public interface MenuDAO {

    void addMenu(Menu menu);

    Menu getMenu(int menuId);

    void updateMenu(Menu menu);

    void deleteMenu(int menuId);

    List<Menu> getAllMenus();

    List<Menu> getMenusByRestaurant(int restaurantId);
	
	
	
	
}
