/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package shopping;

import products.BookDTO;
import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author ASUS
 */
public class Cart {
    private Map<String, BookDTO> cart;
    
    public Cart(){}
    
    public Cart(Map<String, BookDTO> cart){
        this.cart = cart;
    }

    public Map<String, BookDTO> getCart() {
        return cart;
    }

    public void setCart(Map<String, BookDTO> cart) {
        this.cart = cart;
    }
    
    public void add(BookDTO book){
        if(this.cart == null){
            this.cart = new HashMap<>();
        }
        if(this.cart.containsKey(book.getBookID())){
            int currenQuantity = this.cart.get(book.getBookID()).getBookQuantity();
            book.setBookQuantity(currenQuantity + book.getBookQuantity());
        }
        cart.put(book.getBookID(), book);
    }
    
    public void delete(String id){
        if(this.cart == null){
            return;
        }
        if(this.cart.containsKey(id)){
            this.cart.remove(id);
        }
    }
    
    public void update(String id, BookDTO newBook){
        if(this.cart == null){
            return;
        }
        if(this.cart.containsKey(id)){
            this.cart.replace(id, newBook);
        }
    }
}