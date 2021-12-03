/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package status;

/**
 *
 * @author ASUS
 */
public class Status {
    private boolean statusID;
    private String statusName;
    
    public Status(){}
    
    public Status(boolean statusID, String statusName){
        this.statusID = statusID;
        this.statusName = statusName;
    }

    public boolean isStatusID() {
        return statusID;
    }

    public void setStatusID(boolean statusID) {
        this.statusID = statusID;
    }

    public String getStatusName() {
        return statusName;
    }

    public void setStatusName(String statusName) {
        this.statusName = statusName;
    }
    
    
}