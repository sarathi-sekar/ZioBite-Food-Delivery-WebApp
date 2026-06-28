package com.ziobite.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import com.ziobite.DAOImpl.UserImpl;
import com.ziobite.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/Registerservlet")
public class RegisterServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String name = req.getParameter("username");
        String email = req.getParameter("email");
        String phone = req.getParameter("phone");
        String address = req.getParameter("address");
        String password = req.getParameter("password");
        String confirmPassword = req.getParameter("confirmPassword");
        String role = req.getParameter("role");

        PrintWriter out = resp.getWriter();

     
        if (!password.equals(confirmPassword)) {
            out.print("Password and Confirm Password do not match!");
            return;
        }

        User u = new User(
                name,
                email,
                phone,
                address,
                password,
                confirmPassword,
                role);

       
        UserImpl userimpl = new UserImpl();
        userimpl.addUser(u);

        resp.sendRedirect("login.jsp");

    }
}