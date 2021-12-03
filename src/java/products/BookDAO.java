/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package products;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import utils.DBUtils;
/**
 *
 * @author ASUS
 */
public class BookDAO {
    public boolean checkBookDuplicate(String bookID) throws SQLException{
        boolean check = false;
        Connection connect = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            connect = DBUtils.getConnection();
            if(connect != null){
                String sql = "SELECT bookID "
                        + " FROM tblBooks "
                        + " WHERE bookID=?";
                stm = connect.prepareStatement(sql);
                stm.setString(1, bookID);
                rs = stm.executeQuery();
                if(rs.next()){
                    check = true;
                }
            }
        } catch (Exception e) {
        } finally{
            if(rs != null) rs.close();
            if(stm != null) stm.close();
            if(connect != null) connect.close();
        }
        return check;
    }
    
    public boolean insertBook(BookDTO book) throws SQLException{
        boolean check = false;
        Connection connect = null;
        PreparedStatement stm = null;
        try {
            connect = DBUtils.getConnection();
            if(connect != null){
                String sql = "INSERT INTO tblBooks(bookID, bookName, description, categoryID, price, quantity, statusID, createDate, image) "
                        + " VALUES(?,?,?,?,?,?,?,?,?)";
                stm = connect.prepareStatement(sql);
                stm.setString(1, book.getBookID());
                stm.setString(2, book.getBookName());
                stm.setString(3, book.getBookDescription());
                stm.setString(4, book.getCategoryID());
                stm.setString(5, String.valueOf(book.getBookPrice()));
                stm.setString(6, String.valueOf(book.getBookQuantity()));
                stm.setString(7, String.valueOf(book.getStatusID()));
                stm.setString(8, book.getCreateDate());
                stm.setString(9, book.getImage());
                check = stm.executeUpdate() > 0;
            }
        } catch (Exception e) {
        } finally{
            if(stm != null) stm.close();
            if(connect != null) connect.close();
        }
        return check;
    }
    
    public boolean deleteBook(String bookID) throws SQLException{
        boolean result = false;
        Connection connect = null;
        PreparedStatement stm = null;
        try {
            connect = DBUtils.getConnection();
            if(connect != null){
                String sql = "UPDATE tblBooks "
                        + " SET statusID=0 "
                        + " WHERE bookID=?";
                stm = connect.prepareStatement(sql);
                stm.setString(1, bookID);
                int value = stm.executeUpdate();
                result = value > 0 ? true : false;
            }
        } catch (Exception e) {
        } finally{
            if(stm != null) stm.close();
            if(connect != null) connect.close();
        }
        return result;
    }
    
    public boolean updateBook(BookDTO book) throws SQLException{
        boolean check = false;
        Connection connect = null;
        PreparedStatement stm = null;
        try {
            connect = DBUtils.getConnection();
            if(connect != null){
                String sql = "UPDATE tblBooks "
                        + " SET bookName=?, description=?, categoryID=?, price=?, quantity=?, image=?, statusID=? "
                        + " WHERE bookID=?";
                stm = connect.prepareStatement(sql);
                stm.setString(1, book.getBookName());
                stm.setString(2, book.getBookDescription());
                stm.setString(3, book.getCategoryID());
                stm.setString(4, String.valueOf(book.getBookPrice()));
                stm.setString(5, String.valueOf(book.getBookQuantity()));
                stm.setString(6, book.getImage());
                stm.setString(7, String.valueOf(book.getStatusID()));
                stm.setString(8, book.getBookID());
                check = stm.executeUpdate() > 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if(stm != null) stm.close();
            if(connect != null) connect.close();
        }
        return check;
    }
    
    public List<BookDTO> getListBooks(String bookSearch) throws SQLException{
        List<BookDTO> list = new ArrayList<>();
        Connection connect = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            connect = DBUtils.getConnection();
            if(connect != null){
                String sql = "SELECT bookID, image, bookName, description, price, quantity, statusID, categoryID, createDate "
                        + " FROM tblBooks "
                        + " WHERE bookName like ? ";
                stm = connect.prepareStatement(sql);
                stm.setString(1, "%" + bookSearch + "%");
                rs = stm.executeQuery();
                while(rs.next()){
                    String image = rs.getString("image");
                    String bookName = rs.getString("bookName");
                    String description = rs.getString("description");
                    float price = Float.parseFloat(rs.getString("price"));
                    int quantity = Integer.parseInt(rs.getString("quantity"));
                    String categoryID = rs.getString("categoryID");
                    String bookID = rs.getString("bookID");
                    String createDate = rs.getString("createDate");
                    boolean statusID;
                    String checkStringStatus = rs.getString("statusID");
                    if(checkStringStatus.equals("1")){
                        statusID = true;
                    }else{
                        statusID = false;
                    }
                    list.add(new BookDTO(bookID, bookName, description, categoryID, price, quantity, statusID, createDate, image));
                }
            }
        } catch (Exception e) {
        } finally {
            if(rs != null) rs.close();
            if(stm != null) stm.close();
            if(connect != null) connect.close();
        }
        return list;
    }
    
    public List<BookDTO> getListBooksForUsers(String bookSearch, String categoryName) throws SQLException{
        List<BookDTO> list = new ArrayList<>();
        Connection connect = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            connect = DBUtils.getConnection();
            if(connect != null){
                String sql = "SELECT bookID, image, bookName, description, price, quantity, statusID, tblBooks.categoryID, createDate , categoryName"
                        + " FROM tblBooks, tblCategory "
                        + " WHERE bookName like ? AND tblBooks.categoryID = tblCategory.categoryID AND categoryName like ? AND statusID=1 ";
                stm = connect.prepareStatement(sql);
                stm.setString(1, "%" + bookSearch + "%");
                stm.setString(2, "%" + categoryName + "%");
                rs = stm.executeQuery();
                while(rs.next()){
                    String image = rs.getString("image");
                    String bookName = rs.getString("bookName");
                    String description = rs.getString("description");
                    float price = Float.parseFloat(rs.getString("price"));
                    int quantity = Integer.parseInt(rs.getString("quantity"));
                    String categoryID = rs.getString("categoryID");
                    String bookID = rs.getString("bookID");
                    String createDate = rs.getString("createDate");
                    boolean statusID;
                    String checkStringStatus = rs.getString("statusID");
                    if(checkStringStatus.equals("1")){
                        statusID = true;
                    }else{
                        statusID = false;
                    }
                    list.add(new BookDTO(bookID, bookName, description, categoryID, price, quantity, statusID, createDate, image));
                }
            }
        } catch (Exception e) {
        } finally {
            if(rs != null) rs.close();
            if(stm != null) stm.close();
            if(connect != null) connect.close();
        }
        return list;
    }
    
}