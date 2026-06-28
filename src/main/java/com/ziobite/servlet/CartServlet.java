package com.ziobite.servlet;

import java.io.IOException;

import com.ziobite.DAO.MenuDAO;
import com.ziobite.DAOImpl.MenuImpl;
import com.ziobite.model.Cart;
import com.ziobite.model.CartItem;
import com.ziobite.model.Menu;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/CartServlet")
public class CartServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {

        String action = req.getParameter("action");

        HttpSession session = req.getSession();

        Cart cart = (Cart) session.getAttribute("cart");

        if(cart == null) {
           cart = new Cart();
        }

        MenuDAO dao = new MenuImpl();

        if("add".equals(action)) {

            int menuId =Integer.parseInt( req.getParameter("menuId"));

            Menu menu = dao.getMenu(menuId);

            if(!cart.isEmpty()) {

                CartItem existingItem = cart.getItems() .iterator() .next();

                if(existingItem.getRestaurantId() != menu.getRestaurantId()) {

                    session.setAttribute( "error", "Cart contains items from another restaurant. Please clear cart first.");

                    resp.sendRedirect("cart.jsp");
                    return;
                }
            }

            CartItem item = new CartItem(menu.getMenuId(), menu.getRestaurantId(), menu.getItemName(), menu.getPrice(), 1 , menu.getImagePath() );

            cart.addItem(item);
        }

        else if("increase".equals(action)) {

            int menuId = Integer.parseInt( req.getParameter("menuId"));

            cart.increaseItem(menuId);
        }

        else if("decrease".equals(action)) {

            int menuId = Integer.parseInt( req.getParameter("menuId"));

            cart.decreaseItem(menuId);
        }

        else if("remove".equals(action)) {

            int menuId = Integer.parseInt(  req.getParameter("menuId"));

            cart.removeItem(menuId);
        }

        else if("clear".equals(action)) {

            cart.clearCart();
        }

        session.setAttribute("cart", cart);

        resp.sendRedirect("cart.jsp");
    }
}