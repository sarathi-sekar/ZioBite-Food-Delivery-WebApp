package com.ziobite.DAO;

import java.util.List;

import com.ziobite.model.Order;

public interface OrderDAO {

    int addOrder(Order order);
    List<Order> getOrdersByUserId(int userId);

}