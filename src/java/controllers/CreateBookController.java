/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import category.CategoryDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import products.BookDAO;
import products.BookDTO;
import products.BookError;

/**
 *
 * @author ASUS
 */
public class CreateBookController extends HttpServlet {
    private static final String ERROR="createBook.jsp";
    private static final String SUCCESS="bookManagement.jsp";
    
    DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
    long millis = System.currentTimeMillis();
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            String bookID = request.getParameter("bookID");
            String bookName = request.getParameter("bookName");
            String description = request.getParameter("bookDescription");
            String categoryName = request.getParameter("categoryName");
            float price = Float.parseFloat(request.getParameter("bookPrice"));
            int quantity = Integer.parseInt(request.getParameter("bookQuantity"));
            String imageURL = request.getParameter("image");
            
            boolean check = true;
            BookError bookError = new BookError();
            if(bookID.length() > 10 || bookID.length() < 1){
                bookError.setBookIDError("BookID length must be [1,5]");
                check = false;
            }
            if(bookName.length() < 5){
                bookError.setBookNameError("BookName length must be over 20 characters");
                check = false;
            }
            if(String.valueOf(price).contains("[a-zA-Z]")){
                bookError.setBookPriceError("Invalid value");
                check = false;
            }
            if(String.valueOf(quantity).contains("[a-zA-Z]")){
                bookError.setBookQuantityError("Invalid value");
                check = false;
            }
            if(!imageURL.contains(".jpg")){
                bookError.setImageError("Invalid image file");
                check = false;
            }
            if(check){
                Date date = new Date(millis);
                String createDate = formatter.format(date);
                CategoryDAO cate = new CategoryDAO();
                String categoryID = cate.getCategoryID(categoryName);
                BookDAO dao = new BookDAO();
                BookDTO book = new BookDTO(bookID, bookName, description, categoryID, price, quantity, true, createDate, imageURL);
                boolean checkDuplicate = dao.checkBookDuplicate(bookID);
                if(checkDuplicate){
                    bookError.setBookIDError("Duplicate BookID: " + bookID + " !");
                    request.setAttribute("BOOK_ERROR", bookError);
                } else {
                    boolean checkInsert = dao.insertBook(book);
                    if(checkInsert){
                        url = SUCCESS;
                    } else {
                        bookError.setMessageError("Cannot insert, unknown error !");
                        request.setAttribute("BOOK_ERROR", bookError);
                    }
                }
            } else {
                request.setAttribute("BOOK_ERROR", bookError);
            }
        } catch (Exception e) {
            log("Error at CreateBookController: " + e.toString());
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
