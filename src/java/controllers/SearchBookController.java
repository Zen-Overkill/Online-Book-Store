/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import products.BookDAO;
import products.BookDTO;
import user.UserDTO;

/**
 *
 * @author ASUS
 */
public class SearchBookController extends HttpServlet {

    private static final String USER_ERROR = "homepage.jsp";
    private static final String USER_SUCCESS = "homepage.jsp";
    private static final String ADMIN_ERROR = "admin.jsp";
    private static final String ADMIN_SUCCESS = "bookManagement.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = "";
        try {
            String searchBook = request.getParameter("search_book");
            if (searchBook == null) {
                searchBook = "";
            }
            String categoryName = request.getParameter("categoryName");
            if (categoryName == null) {
                categoryName = "";
            }
            BookDAO dao = new BookDAO();
            HttpSession session = request.getSession();
            String roleID = ((UserDTO) session.getAttribute("LOGIN_USER")).getRoleID();
            List<BookDTO> list_admin = dao.getListBooks(searchBook);
            List<BookDTO> list_users = dao.getListBooksForUsers(searchBook, categoryName);
            if (!list_admin.isEmpty()) {
                if ("AD".equals(roleID)) {
                    request.setAttribute("LIST_BOOK_ADMIN", list_admin);
                    url = ADMIN_SUCCESS;
                }
            }

            if (!list_users.isEmpty()) {
                if ("US".equals(roleID)) {
                    session.setAttribute("LIST_BOOK_USERS", list_users);
                    url = USER_SUCCESS;
                }
            }

        } catch (Exception e) {
            log("Error at SearchBookController: " + e.toString());
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
