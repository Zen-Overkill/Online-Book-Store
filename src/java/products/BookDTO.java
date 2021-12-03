/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package products;

/**
 *
 * @author ASUS
 */
public class BookDTO {
    private String bookID;
    private String bookName;
    private String bookDescription;
    private String categoryID;
    private float bookPrice;
    private int bookQuantity;
    private boolean statusID;
    private String createDate;
    private String image;

    public BookDTO(String bookID, String bookName, String bookDescription, String categoryID, float bookPrice, int bookQuantity, String createDate, String image) {
        this.bookID = bookID;
        this.bookName = bookName;
        this.bookDescription = bookDescription;
        this.categoryID = categoryID;
        this.bookPrice = bookPrice;
        this.bookQuantity = bookQuantity;
        this.statusID = true;
        this.createDate = createDate;
        this.image = image;
    }

    public BookDTO(String bookID, String bookName, String bookDescription, String categoryID, float bookPrice, int bookQuantity, boolean statusID, String createDate, String image) {
        this.bookID = bookID;
        this.bookName = bookName;
        this.bookDescription = bookDescription;
        this.categoryID = categoryID;
        this.bookPrice = bookPrice;
        this.bookQuantity = bookQuantity;
        this.statusID = statusID;
        this.createDate = createDate;
        this.image = image;
    }
    public BookDTO(String bookID, String bookName, String bookDescription, float bookPrice, int bookQuantity, String image) {
        this.bookID = bookID;
        this.bookName = bookName;
        this.bookDescription = bookDescription;
        this.bookPrice = bookPrice;
        this.bookQuantity = bookQuantity;
        this.image = image;
    }

    public BookDTO(String bookID, String bookName, float bookPrice, int bookQuantity) {
        this.bookID = bookID;
        this.bookName = bookName;
        this.bookPrice = bookPrice;
        this.bookQuantity = bookQuantity;
    }


    public String getBookID() {
        return bookID;
    }

    public void setBookID(String bookID) {
        this.bookID = bookID;
    }

    public String getBookName() {
        return bookName;
    }

    public void setBookName(String bookName) {
        this.bookName = bookName;
    }

    public String getBookDescription() {
        return bookDescription;
    }

    public void setBookDescription(String bookDescription) {
        this.bookDescription = bookDescription;
    }

    public String getCategoryID() {
        return categoryID;
    }

    public void setCategoryID(String categoryID) {
        this.categoryID = categoryID;
    }

    public float getBookPrice() {
        return bookPrice;
    }

    public void setBookPrice(float bookPrice) {
        this.bookPrice = bookPrice;
    }

    public int getBookQuantity() {
        return bookQuantity;
    }

    public void setBookQuantity(int bookQuantity) {
        this.bookQuantity = bookQuantity;
    }

    public boolean getStatusID() {
        return statusID;
    }

    public void setStatusID(boolean statusID) {
        this.statusID = statusID;
    }

    public String getCreateDate() {
        return createDate;
    }

    public void setCreateDate(String createDate) {
        this.createDate = createDate;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }
    
    
}