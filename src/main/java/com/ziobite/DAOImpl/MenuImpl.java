package com.ziobite.DAOImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.ziobite.DAO.MenuDAO;
import com.ziobite.DBConnection.DBConnection;
import com.ziobite.model.Menu;

public class MenuImpl implements MenuDAO {

    private static final String INSERT_MENU =
            "INSERT INTO menu(restaurant_id,item_name,description,price,is_available,image_path) VALUES(?,?,?,?,?,?)";

    private static final String GET_MENU =
            "SELECT * FROM menu WHERE menu_id=?";

    private static final String UPDATE_MENU =
            "UPDATE menu SET restaurant_id=?, item_name=?, description=?, price=?, is_available=?, image_path=? WHERE menu_id=?";

    private static final String DELETE_MENU =
            "DELETE FROM menu WHERE menu_id=?";

    private static final String GET_ALL_MENUS =
            "SELECT * FROM menu";

    private static final String GET_MENU_BY_RESTAURANT =
            "SELECT * FROM menu WHERE restaurant_id=?";

    @Override
    public void addMenu(Menu menu) {

        try {

            Connection con = DBConnection.getconnection();

            PreparedStatement stmt =con.prepareStatement(INSERT_MENU);

            stmt.setInt(1, menu.getRestaurantId());
            stmt.setString(2, menu.getItemName());
            stmt.setString(3, menu.getDescription());
            stmt.setDouble(4, menu.getPrice());
            stmt.setBoolean(5, menu.isAvailable());
            stmt.setString(6, menu.getImagePath());

            stmt.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public Menu getMenu(int menuId) {

        Menu menu = null;

        try {

            Connection con = DBConnection.getconnection();

            PreparedStatement stmt = con.prepareStatement(GET_MENU);

            stmt.setInt(1, menuId);

            ResultSet rs = stmt.executeQuery();

            if(rs.next()) {

                menu = new Menu();

                menu.setMenuId(rs.getInt("menu_id"));
                menu.setRestaurantId(rs.getInt("restaurant_id"));
                menu.setItemName(rs.getString("item_name"));
                menu.setDescription(rs.getString("description"));
                menu.setPrice(rs.getDouble("price"));
                menu.setAvailable(rs.getBoolean("is_available"));
                menu.setImagePath(rs.getString("image_path"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return menu;
    }

    @Override
    public void updateMenu(Menu menu) {

        try {

            Connection con = DBConnection.getconnection();

            PreparedStatement stmt = con.prepareStatement(UPDATE_MENU);

            stmt.setInt(1, menu.getRestaurantId());
            stmt.setString(2, menu.getItemName());
            stmt.setString(3, menu.getDescription());
            stmt.setDouble(4, menu.getPrice());
            stmt.setBoolean(5, menu.isAvailable());
            stmt.setString(6, menu.getImagePath());

            stmt.setInt(7, menu.getMenuId());

            stmt.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public void deleteMenu(int menuId) {

        try {

            Connection con = DBConnection.getconnection();

            PreparedStatement stmt =con.prepareStatement(DELETE_MENU);

            stmt.setInt(1, menuId);

            stmt.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public List<Menu> getAllMenus() {

        List<Menu> menuList = new ArrayList<>();

        try {

            Connection con = DBConnection.getconnection();

            PreparedStatement stmt = con.prepareStatement(GET_ALL_MENUS);

            ResultSet rs = stmt.executeQuery();

            while(rs.next()) {

                Menu menu = new Menu();

                menu.setMenuId(rs.getInt("menu_id"));
                menu.setRestaurantId(rs.getInt("restaurant_id"));
                menu.setItemName(rs.getString("item_name"));
                menu.setDescription(rs.getString("description"));
                menu.setPrice(rs.getDouble("price"));
                menu.setAvailable(rs.getBoolean("is_available"));
                menu.setImagePath(rs.getString("image_path"));

                menuList.add(menu);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return menuList;
    }

    @Override
    public List<Menu> getMenusByRestaurant(int restaurantId) {

        List<Menu> menuList = new ArrayList<>();

        try {

            Connection con = DBConnection.getconnection();

            PreparedStatement stmt = con.prepareStatement(GET_MENU_BY_RESTAURANT);

            stmt.setInt(1, restaurantId);

            ResultSet rs = stmt.executeQuery();

            while(rs.next()) {

                Menu menu = new Menu();

                menu.setMenuId(rs.getInt("menu_id"));
                menu.setRestaurantId(rs.getInt("restaurant_id"));
                menu.setItemName(rs.getString("item_name"));
                menu.setDescription(rs.getString("description"));
                menu.setPrice(rs.getDouble("price"));
                menu.setAvailable(rs.getBoolean("is_available"));
                menu.setImagePath(rs.getString("image_path"));

                menuList.add(menu);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return menuList;
    }
}