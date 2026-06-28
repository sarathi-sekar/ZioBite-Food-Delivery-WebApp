package com.ziobite.servlet;

import java.io.IOException;
import java.util.List;

import com.ziobite.DAO.RestaurantDAO;
import com.ziobite.DAOImpl.RestaurantImpl;
import com.ziobite.model.Restaurant;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/RestaurentServlet")
public class RestaurentServlet extends HttpServlet {

    protected void doGet(HttpServletRequest req,  HttpServletResponse resp) throws ServletException, IOException {

        RestaurantDAO dao = new RestaurantImpl();

        List<Restaurant> restaurants = dao.getAllRestaurants();

        req.setAttribute("restaurants", restaurants);

        req.getRequestDispatcher("restaurent.jsp")
           .forward(req, resp);
    }
}