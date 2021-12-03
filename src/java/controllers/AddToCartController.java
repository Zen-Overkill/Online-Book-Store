/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import shopping.Cart;

import products.BookDTO;

/**
 *
 * @author ASUS
 */
public class AddToCartController extends HttpServlet {
    private static final String ERROR="error.jsp";
    private static final String SUCCESS="homepage.jsp";
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            String bookID = request.getParameter("bookID");
            String bookName = request.getParameter("bookName");
            String bookDescription = request.getParameter("bookDescription");
            String image = request.getParameter("image");
            float price = Float.parseFloat(request.getParameter("bookPrice"));
            int quantity = 1;
            
            BookDTO book = new BookDTO(bookID, bookName, bookDescription, price, quantity, image);
            HttpSession session = request.getSession();
            Cart cart = (Cart)session.getAttribute("CART");
            if(cart == null){
                cart = new Cart();
            }
            cart.add(book);
            session.setAttribute("CART", cart);
            url = SUCCESS;
            String message = "Ban vua them " + quantity + " " + bookName + " thanh cong !";
            request.setAttribute("SHOPPING_MESSAGE", message);
            
        } catch (Exception e) {
            log("Error at AddToCartController: " + e.toString());
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}