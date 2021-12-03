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
public class BookError {
    private String bookIDError;
    private String bookNameError;
    private String categoryIDError;
    private String bookPriceError;
    private String bookQuantityError;
    private String imageError;
    private String messageError;
    
    public BookError(){
        this.bookIDError = "";
        this.bookNameError = "";
        this.categoryIDError = "";
        this.bookPriceError = "";
        this.bookQuantityError = "";
        this.imageError = "";
        this.messageError = "";
    }

    public BookError(String bookIDError, String bookNameError, String categoryIDError, String bookPriceError, String bookQuantityError, String imageError, String messageError) {
        this.bookIDError = bookIDError;
        this.bookNameError = bookNameError;
        this.categoryIDError = categoryIDError;
        this.bookPriceError = bookPriceError;
        this.bookQuantityError = bookQuantityError;
        this.imageError = imageError;
        this.messageError = messageError;
    }

    public String getBookIDError() {
        return bookIDError;
    }

    public void setBookIDError(String bookIDError) {
        this.bookIDError = bookIDError;
    }

    public String getBookNameError() {
        return bookNameError;
    }

    public void setBookNameError(String bookNameError) {
        this.bookNameError = bookNameError;
    }

    public String getCategoryIDError() {
        return categoryIDError;
    }

    public void setCategoryIDError(String categoryIDError) {
        this.categoryIDError = categoryIDError;
    }

    public String getBookPriceError() {
        return bookPriceError;
    }

    public void setBookPriceError(String bookPriceError) {
        this.bookPriceError = bookPriceError;
    }

    public String getBookQuantityError() {
        return bookQuantityError;
    }

    public void setBookQuantityError(String bookQuantityError) {
        this.bookQuantityError = bookQuantityError;
    }

    public String getImageError() {
        return imageError;
    }

    public void setImageError(String imageError) {
        this.imageError = imageError;
    }
    
    public String getMessageError() {
        return messageError;
    }

    public void setMessageError(String messageError) {
        this.messageError = messageError;
    }
    
}