package com.ziobite.DAOImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.ziobite.DAO.OrderDAO;
import com.ziobite.DBConnection.DBConnection;
import com.ziobite.model.Order;

public class OrderImpl implements OrderDAO {

    private static final String INSERT_ORDER =
            "INSERT INTO orders(user_id,restaurant_id,food_total,delivery_fee,platform_fee,total_amount,payment_method,status) VALUES(?,?,?,?,?,?,?,?)";

    private static final String GET_USER_ORDERS =
            "SELECT * FROM orders WHERE user_id=? ORDER BY order_id DESC";

    @Override
    public int addOrder(Order order) {

        int orderId = 0;

        try {

            Connection con = DBConnection.getconnection();

            PreparedStatement pstmt = con.prepareStatement(INSERT_ORDER, Statement.RETURN_GENERATED_KEYS);

            pstmt.setInt(1, order.getUserId());
            pstmt.setInt(2, order.getRestaurantId());
            pstmt.setDouble(3, order.getFoodTotal());
            pstmt.setDouble(4, order.getDeliveryFee());
            pstmt.setDouble(5, order.getPlatformFee());
            pstmt.setDouble(6, order.getTotalAmount());
            pstmt.setString(7, order.getPaymentMethod());
            pstmt.setString(8, order.getStatus());

            pstmt.executeUpdate();

            ResultSet rs = pstmt.getGeneratedKeys();

            if (rs.next()) {
                orderId = rs.getInt(1);
            }

            rs.close();
            pstmt.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return orderId;
    }

    @Override
    public List<Order> getOrdersByUserId(int userId) {

        List<Order> orders = new ArrayList<>();

        try {

            Connection con = DBConnection.getconnection();

            PreparedStatement pstmt = con.prepareStatement(GET_USER_ORDERS);

            pstmt.setInt(1, userId);

            ResultSet rs = pstmt.executeQuery();

           
            OrderItemImpl itemDAO = new OrderItemImpl();

            while (rs.next()) {

                Order order = new Order();

                order.setOrderId(rs.getInt("order_id"));
                order.setUserId(rs.getInt("user_id"));
                order.setRestaurantId(rs.getInt("restaurant_id"));

                order.setFoodTotal(rs.getDouble("food_total"));
                order.setDeliveryFee(rs.getDouble("delivery_fee"));
                order.setPlatformFee(rs.getDouble("platform_fee"));
                order.setTotalAmount(rs.getDouble("total_amount"));

                order.setPaymentMethod(rs.getString("payment_method"));
                order.setStatus(rs.getString("status"));
                order.setOrderDate(rs.getString("order_date"));

                order.setItems(itemDAO.getItemsByOrderId(order.getOrderId()  ) );

                orders.add(order);
            }

            rs.close();
            pstmt.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return orders;
    }
}