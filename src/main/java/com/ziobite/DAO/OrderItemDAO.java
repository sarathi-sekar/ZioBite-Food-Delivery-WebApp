package com.ziobite.DAO;

import java.util.List;

import com.ziobite.model.OrderItem;

public interface OrderItemDAO {

    void addOrderItem(OrderItem item);
    List<OrderItem> getItemsByOrderId(int orderId);

}