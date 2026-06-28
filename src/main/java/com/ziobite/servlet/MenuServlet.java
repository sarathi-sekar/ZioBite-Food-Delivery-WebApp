package com.ziobite.servlet;

import java.io.IOException;
import java.util.List;

import com.ziobite.DAO.MenuDAO;
import com.ziobite.DAOImpl.MenuImpl;
import com.ziobite.model.Menu;
import com.ziobite.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/MenuServlet")
public class MenuServlet extends HttpServlet {

	protected void doGet(HttpServletRequest req, HttpServletResponse resp)throws ServletException, IOException {

			HttpSession session = req.getSession(false);

					User user = null;
					
					if(session != null){
						
					user =(User)session.getAttribute("loggedUser");
					
					}
					
					if(user == null){
					
					resp.sendRedirect("login.jsp");
					return;
       }


     int restaurantId =Integer.parseInt(req.getParameter("restaurantId"));

     	MenuDAO dao =new MenuImpl();

			List<Menu> menus =dao.getMenusByRestaurant( restaurantId);
			
			req.setAttribute("menus", menus);
			
			req.getRequestDispatcher("menu.jsp")
			.forward(req, resp);
    }
} 










