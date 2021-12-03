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

/**
 *
 * @author ASUS
 */
public class MainController extends HttpServlet {
    private static final String ERROR="error.jsp";
    private static final String LOGIN="LoginController";
    private static final String SEARCH_USER="SearchUserController";
    private static final String SEARCH_BOOK="SearchBookController";
    private static final String LOGOUT="LogoutController";
    private static final String DELETE_USER="DeleteUserController";
    private static final String DELETE_BOOK="DeleteBookController";
    private static final String UPDATE_USER="UpdateUserController";
    private static final String UPDATE_BOOK="UpdateBookController";
    private static final String CREATE_USER="CreateUserController";
    private static final String CREATE_BOOK="CreateBookController";
    private static final String ADD_TO_CART="AddToCartController";
    private static final String VIEW_CART="viewCart.jsp";
    private static final String UPDATE_CART="UpdateCartController";
    private static final String REMOVE_CART="RemoveCartController";
    private static final String USER_MANAGEMENT="userManagement.jsp";
    private static final String BOOK_MANAGEMENT="bookManagement.jsp";
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            HttpSession session = request.getSession();
            String action = request.getParameter("action");
            if("Login".equals(action)){
                url = LOGIN;
            }else if("searchUser".equals(action)){
                url = SEARCH_USER; 
            }else if("searchBook".equals(action)){
                url = SEARCH_BOOK;
            }else if("Logout".equals(action)){
                url = LOGOUT;
            }else if("deleteUser".equals(action)){
                url = DELETE_USER;
            }else if("deleteBook".equals(action)){
                url = DELETE_BOOK;
            }else if("Update".equals(action)){
                url = UPDATE_USER;
            }else if("updateBook".equals(action)){
                url = UPDATE_BOOK;
            }else if("createUser".equals(action)){
                url = CREATE_USER;
            }else if("createBook".equals(action)){
                url = CREATE_BOOK;
            }else if("Add to Cart".equals(action)){
                url = ADD_TO_CART;
            }else if("View Cart".equals(action)){
                url = VIEW_CART;
            }else if("Modify".equals(action)){
                url = UPDATE_CART;
            }else if("Remove".equals(action)){
                url = REMOVE_CART;
            }else if("User Management".equals(action)){
                url = USER_MANAGEMENT;
            }else if("Book Management".equals(action)){
                url = BOOK_MANAGEMENT;
            }
            else {
                session.setAttribute("ERROR_MESSAGE", "Function is not available");
            }
        } catch (Exception e) {
            log("Error at MainController:" +e.toString());
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
