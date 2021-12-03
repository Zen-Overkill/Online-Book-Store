/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import category.CategoryDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import products.BookDAO;
import products.BookDTO;
import products.BookError;
import status.StatusDAO;

/**
 *
 * @author ASUS
 */
public class UpdateBookController extends HttpServlet {

    private static final String ERROR="SearchBookController";
    private static final String SUCCESS="bookManagement.jsp";
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            String bookID = request.getParameter("bookID");
            String image = request.getParameter("image");
            String bookName = request.getParameter("bookName");
            String description = request.getParameter("bookDescription");
            String categoryName = request.getParameter("categoryName");
            String statusString = request.getParameter("statusName");
            CategoryDAO cDao = new CategoryDAO();
            String categoryID = cDao.getCategoryID(categoryName);
            boolean statusID = false;
            if(statusString.equals("Enabled")){
                statusID = true;
            }else if(statusString.equals("Disabled")){
                statusID = false;
            }
            float price = Float.parseFloat(request.getParameter("bookPrice"));
            int quantity = Integer.parseInt(request.getParameter("bookQuantity"));
            
            
            BookError error = new BookError();
            BookDAO dao = new BookDAO();
            BookDTO updateBook = new BookDTO(bookID, bookName, description, categoryID, price, quantity, statusID, "", image);
            boolean check = dao.updateBook(updateBook);
            if(check){
                url = SUCCESS;
            }else{
                error.setMessageError("Cannot update !");
                request.setAttribute("BOOK_ERROR", error);
            }
        } catch (Exception e) {
            log("Error at UpdateBookController");
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
