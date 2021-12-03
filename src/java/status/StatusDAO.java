/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package status;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import utils.DBUtils;

/**
 *
 * @author ASUS
 */
public class StatusDAO {
    public String getStatusName(boolean statusID) throws SQLException{
        String statusName = "";
        String statusString = "";
        if(statusID == true){
            statusString = "1";
        }else{
            statusString = "0";
        }
        Connection connect = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            connect = DBUtils.getConnection();
            if(connect != null){
                String sql = "SELECT statusName "
                        + " FROM tblStatus "
                        + " WHERE statusID=?";
                stm = connect.prepareStatement(sql);
                stm.setString(1, statusString);
                rs = stm.executeQuery();
                while(rs.next()){
                    statusName = rs.getString("statusName");
                }
            }
        } catch (Exception e) {
        } finally {
            if(rs != null) rs.close();
            if(stm != null) stm.close();
            if(connect != null) connect.close();
        }
        return statusName;
    }

}