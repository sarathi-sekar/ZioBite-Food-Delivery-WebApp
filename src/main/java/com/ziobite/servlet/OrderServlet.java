package com.ziobite.servlet;

import java.io.IOException;

import com.ziobite.DAOImpl.OrderImpl;
import com.ziobite.DAOImpl.OrderItemImpl;
import com.ziobite.model.Cart;
import com.ziobite.model.CartItem;
import com.ziobite.model.Order;
import com.ziobite.model.OrderItem;
import com.ziobite.model.User;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/OrderServlet")
public class OrderServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {

        HttpSession session = req.getSession();

        User user = (User) session.getAttribute("loggedUser");

        Cart cart = (Cart) session.getAttribute("cart");

        if(user == null) {

            resp.sendRedirect("login.jsp");
            return;
        }

        if(cart == null || cart.getItems().isEmpty()) {

            resp.sendRedirect("cart.jsp");
            return;
        }

        CartItem firstItem = cart.getItems().iterator().next();

        int restaurantId = firstItem.getRestaurantId();

        double foodTotal = cart.getTotalPrice();

        double deliveryFee = 30;
        double platformFee = 10;
        double gst = foodTotal * 0.05;

        double totalAmount = foodTotal + deliveryFee + platformFee + gst;

        String paymentMethod = req.getParameter("paymentMethod");

        Order order = new Order();

        order.setUserId(user.getId());
        order.setRestaurantId(restaurantId);
        order.setPaymentMethod(paymentMethod);
        order.setFoodTotal(foodTotal);
        order.setDeliveryFee(deliveryFee);
        order.setPlatformFee(platformFee);
        order.setTotalAmount(totalAmount);
        order.setStatus("PLACED");

        OrderImpl orderDAO = new OrderImpl();

        int orderId = orderDAO.addOrder(order);

        OrderItemImpl orderItemDAO =  new OrderItemImpl();

        for(CartItem item : cart.getItems()) {

            OrderItem orderItem = new OrderItem();

            orderItem.setOrderId(orderId);
            orderItem.setMenuId(item.getMenuId());
            orderItem.setQuantity(item.getQuantity());
            orderItem.setItemTotal(item.getTotalPrice());

            orderItemDAO.addOrderItem(orderItem);
        }

        session.removeAttribute("cart");

        resp.sendRedirect("orderSuccess.jsp");
    }
}