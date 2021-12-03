/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package category;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import utils.DBUtils;

/**
 *
 * @author ASUS
 */
public class CategoryDAO {
    public String getCategoryName(String categoryID) throws SQLException{
        String categoryName = "";
        Connection connect = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            connect = DBUtils.getConnection();
            if(connect != null){
                String sql = "SELECT categoryName "
                        + " FROM tblCategory "
                        + " WHERE categoryID=?";
                stm = connect.prepareStatement(sql);
                stm.setString(1, categoryID);
                rs = stm.executeQuery();
                while(rs.next()){
                    categoryName = rs.getString("categoryName");
                }
            }
        } catch (Exception e) {
        } finally{
            if(rs != null) rs.close();
            if(stm != null) stm.close();
            if(connect != null) connect.close();
        }
        return categoryName;
    }

    public String getCategoryID(String categoryName) throws SQLException{
        String categoryID = "";
        Connection connect = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            connect = DBUtils.getConnection();
            if(connect != null){
                String sql = "SELECT categoryID "
                        + " FROM tblCategory "
                        + " WHERE categoryName=?";
                stm = connect.prepareStatement(sql);
                stm.setString(1, categoryName);
                rs = stm.executeQuery();
                while(rs.next()){
                    categoryID = rs.getString("categoryID");
                }
            }
        } catch (Exception e) {
        } finally {
            if(rs != null) rs.close();
            if(stm != null) stm.close();
            if(connect != null) connect.close();
        }
        return categoryID;
    }
    
    public List<String> getListCategoryName() throws SQLException{
        List<String> list = new ArrayList<>();
        Connection connect = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            connect = DBUtils.getConnection();
            if(connect != null){
                String sql = "SELECT categoryName "
                        + " FROM tblCategory";
                stm = connect.prepareStatement(sql);
                rs = stm.executeQuery();
                while(rs.next()){
                    String categoryName = rs.getString("categoryName");
                    list.add(categoryName);
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
    public List<Category> getListCategory() throws SQLException {
        List<Category> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "SELECT categoryID, categoryName FROM tblCategory";
                stm = conn.prepareStatement(sql);
                rs = stm.executeQuery();
                while (rs.next()) {
                    String categoryID = rs.getString("categoryID");
                    String categoryName = rs.getString("categoryName");
                    list.add(new Category(categoryID, categoryName));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return list;
    }
}