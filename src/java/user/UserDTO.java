/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package user;

import java.util.Date;

/**
 *
 * @author ASUS
 */
public class UserDTO {
    private String userID;
    private String fullName;
    private String roleID;
    private String password;
    private String phone;
    private String address;
    private String createDate;
    private boolean statusID;
    public UserDTO(){
    }

    public UserDTO(String userID, String fullName, String roleID, String password, String phone, String address, String createDate) {
        this.userID = userID;
        this.fullName = fullName;
        this.roleID = roleID;
        this.password = password;
        this.phone = phone;
        this.address = address;
        this.createDate = createDate;
        this.statusID = true;
    }

    public UserDTO(String userID, String fullName, String roleID, String password, String phone, String address, String createDate, boolean statusID) {
        this.userID = userID;
        this.fullName = fullName;
        this.roleID = roleID;
        this.password = password;
        this.phone = phone;
        this.address = address;
        this.createDate = createDate;
        this.statusID = statusID;
    }

    
    public String getUserID() {
        return userID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getRoleID() {
        return roleID;
    }

    public void setRoleID(String roleID) {
        this.roleID = roleID;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getCreateDate() {
        return createDate;
    }

    public void setCreateDate(String createDate) {
        this.createDate = createDate;
    }

    

    public boolean getStatusID() {
        return statusID;
    }

    public void setStatusID(boolean statusID) {
        this.statusID = statusID;
    }
    
   
}