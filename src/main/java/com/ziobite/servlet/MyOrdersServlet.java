package com.ziobite.servlet;

import java.io.IOException;
import java.util.List;

import com.ziobite.DAOImpl.OrderImpl;
import com.ziobite.model.Order;
import com.ziobite.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/MyOrdersServlet")
public class MyOrdersServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req,HttpServletResponse resp) throws ServletException, IOException {

        HttpSession session = req.getSession();

        User user = (User) session.getAttribute("loggedUser");

        if(user == null) {

            resp.sendRedirect("login.jsp");
            return;
        }

        OrderImpl dao = new OrderImpl();

        List<Order> orders = dao.getOrdersByUserId(user.getId());

        req.setAttribute("orders", orders);

        req.getRequestDispatcher("orderHistory.jsp")
           .forward(req, resp);
    }
}