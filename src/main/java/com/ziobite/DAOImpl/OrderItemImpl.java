package com.ziobite.DAOImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.ziobite.DAO.OrderItemDAO;
import com.ziobite.DBConnection.DBConnection;
import com.ziobite.model.OrderItem;

public class OrderItemImpl implements OrderItemDAO {

    private static final String INSERT_QUERY =
            "INSERT INTO order_item(order_id,menu_id,quantity,item_total) VALUES(?,?,?,?)";

    private static final String GET_ITEMS_BY_ORDER =
            "SELECT oi.*, m.item_name, m.image_path " +
            "FROM order_item oi " +
            "JOIN menu m ON oi.menu_id = m.menu_id " +
            "WHERE oi.order_id = ?";

    @Override
    public void addOrderItem(OrderItem item) {

        try {

            Connection con = DBConnection.getconnection();

            PreparedStatement pstmt = con.prepareStatement(INSERT_QUERY);

            pstmt.setInt(1, item.getOrderId());
            pstmt.setInt(2, item.getMenuId());
            pstmt.setInt(3, item.getQuantity());
            pstmt.setDouble(4, item.getItemTotal());

            pstmt.executeUpdate();

            pstmt.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public List<OrderItem> getItemsByOrderId(int orderId) {

        List<OrderItem> itemList = new ArrayList<>();

        try {

            Connection con = DBConnection.getconnection();

            PreparedStatement pstmt = con.prepareStatement(GET_ITEMS_BY_ORDER);

            pstmt.setInt(1, orderId);

            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {

                OrderItem item = new OrderItem();

                item.setOrderItemId(rs.getInt("order_item_id"));
                item.setOrderId(rs.getInt("order_id"));
                item.setMenuId(rs.getInt("menu_id"));
                item.setQuantity(rs.getInt("quantity"));
                item.setItemTotal(rs.getDouble("item_total"));
                item.setItemName(rs.getString("item_name"));
                item.setImagePath(rs.getString("image_path"));

                itemList.add(item);
            }

            rs.close();
            pstmt.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return itemList;
    }
}