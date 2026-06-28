package com.ziobite.servlet;

import java.io.IOException;

import com.ziobite.DAOImpl.UserImpl;
import com.ziobite.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String username = req.getParameter("username");

        String password =req.getParameter("password");

        UserImpl dao = new UserImpl();

        User user = dao.getUser(username, password);

        if(user != null) { HttpSession session = req.getSession();
        
      

            session.setAttribute("loggedUser", user);

            resp.sendRedirect("RestaurentServlet");

        } else {

            req.setAttribute("error", "Invalid Username or Password");

            req.getRequestDispatcher("login.jsp")
               .forward(req, resp);
        }
    }
}