/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package user;

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

public class UserDAO {
    DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
    
    public UserDTO checkLogin(String userID, String password) throws SQLException {
        UserDTO user = null;
        Connection connect = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            connect = DBUtils.getConnection();
            if (connect != null) {
                String sql = "SELECT name, roleID, statusID "
                        + " FROM tblUsers "
                        + " WHERE userID =? AND password =? ";
                stm = connect.prepareStatement(sql);
                stm.setString(1, userID);
                stm.setString(2, password);
                rs = stm.executeQuery(); //dòng này không được quên
                if (rs.next()) {
                    boolean statusID;
                    String checkStringStatus = rs.getString("statusID");
                    if(checkStringStatus.equals("1")){
                        statusID = true;
                    }else{
                        statusID = false;
                    }
                    if(!statusID){
                        return null;
                    }else{
                       String name = rs.getString("name");
                        String roleID = rs.getString("roleID");                  
                        user = new UserDTO(userID, name, roleID, "", "", "", "", statusID); 
                    }               
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
            if (connect != null) {
                connect.close();
            }
        }
        return user;
    }

    public List<UserDTO> getListUser(String search) throws SQLException {
        List<UserDTO> list = new ArrayList<>();
        Connection connect = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            connect = DBUtils.getConnection();
            if (connect != null) {
                String sql = "SELECT userID, name, roleID, phone, address, createDate, statusID "
                        + " FROM tblUsers "
                        + " WHERE name like ? ";
                stm = connect.prepareStatement(sql);
                stm.setString(1, "%" + search + "%");
                rs = stm.executeQuery();
                while (rs.next()) {
                    String userID = rs.getString("userID");
                    String name = rs.getString("name");
                    String roleID = rs.getString("roleID");
                    String password = "***";
                    String phone = rs.getString("phone");
                    String address = rs.getString("address");
                    if(address == null){
                        address = "";
                    }
                    String createDate = rs.getString("createDate");
                    boolean statusID;
                    String checkStringStatus = rs.getString("statusID");
                    if(checkStringStatus.equals("1")){
                        statusID = true;
                    }else{
                        statusID = false;
                    }
                    list.add(new UserDTO(userID, name, roleID, password, phone, address, createDate, statusID));
                }
            }
        } catch (Exception e) {
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (connect != null) {
                connect.close();
            }
        }
        return list;
    }

    //change status
    public boolean deleteUser(String userID) throws SQLException {
        boolean result = false;
        Connection connect = null;
        PreparedStatement stm = null;
        try {
            connect = DBUtils.getConnection();
            if (connect != null) {
                String sql = "UPDATE tblUsers "
                        + " SET statusID=0 "
                        + " WHERE userID=?";
                stm = connect.prepareStatement(sql);
                stm.setString(1, userID);
                int value = stm.executeUpdate();
                result = value > 0 ? true : false;
            }
        } catch (Exception e) {
        } finally {
            if (stm != null) {
                stm.close();
            }
            if (connect != null) {
                connect.close();
            }
        }
        return result;
    }

    public boolean updateUser(UserDTO user) throws SQLException {
        boolean check = false;
        Connection connect = null;
        PreparedStatement stm = null;
        try {
            connect = DBUtils.getConnection();
            if (connect != null) {
                String sql = "UPDATE tblUsers "
                        + " SET name=?, roleID=?, phone=?, address=?"
                        + " WHERE userID=?";
                stm = connect.prepareStatement(sql);
                stm.setString(1, user.getFullName());
                stm.setString(2, user.getRoleID());
                stm.setString(3, user.getPhone());
                stm.setString(4, user.getAddress());
                stm.setString(5, user.getUserID());
                check = stm.executeUpdate() > 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (stm != null) {
                stm.close();
            }
            if (connect != null) {
                connect.close();
            }
        }
        return check;
    }

    public boolean checkUserDuplicate(String userID) throws SQLException {
        boolean check = false;
        Connection connect = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            connect = DBUtils.getConnection();
            if (connect != null) {
                String sql = "SELECT userID"
                        + " FROM tblUsers "
                        + " WHERE userID=?";
                stm = connect.prepareStatement(sql);
                stm.setString(1, userID);
                rs = stm.executeQuery();
                if (rs.next()) {
                    check = true;
                }
            }
        } catch (Exception e) {
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (connect != null) {
                connect.close();
            }
        }
        return check;
    }

    public boolean insert(UserDTO user) throws SQLException {
        boolean check = false;
        Connection connect = null;
        PreparedStatement stm = null;
        try {
            connect = DBUtils.getConnection();
            if (connect != null) {
                
                String sql = "INSERT INTO tblUsers(userID, name, password, phone, address, createDate, roleID, statusID) "
                        + " VALUES(?,?,?,?,?,?,?,?)";
                stm = connect.prepareStatement(sql);
                stm.setString(1, user.getUserID());
                stm.setString(2, user.getFullName());
                stm.setString(3, user.getPassword());
                stm.setString(4, user.getPhone());
                stm.setString(5, user.getAddress());
                stm.setString(6, user.getCreateDate());
                stm.setString(7, user.getRoleID());
                stm.setString(8, String.valueOf(user.getStatusID()));
                check = stm.executeUpdate() > 0;
            }
        } catch (Exception e) {
        } finally {
            if (stm != null) {
                stm.close();
            }
            if (connect != null) {
                connect.close();
            }
        }
        return check;
    }
    
    
    
}
