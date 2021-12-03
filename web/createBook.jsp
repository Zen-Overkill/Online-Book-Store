<%-- 
    Document   : createBook
    Created on : Jul 11, 2021, 12:21:22 PM
    Author     : ASUS
--%>

<%@page import="user.UserDTO"%>
<%@page import="category.CategoryDAO"%>
<%@page import="java.util.List"%>
<%@page import="products.BookError"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create Page</title>
    </head>
    <body>
        <h1>Create New Book</h1>
        <%
            BookError bookError = (BookError)request.getAttribute("BOOK_ERROR");
            if(bookError == null){
                bookError = new BookError();
            }
            
            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
            if (loginUser == null || !"AD".equals(loginUser.getRoleID())) {
                response.sendRedirect("login.html");
                return;
            }
        %>
        <form action="MainController" method="POST">
            BookID<input type="text" name="bookID" required=""/>
            <%= bookError.getBookIDError()%></br></br>
            Book Name<input type="text" name="bookName" required=""/>
            <%= bookError.getBookNameError()%></br></br>
            Description<input type="text" name="bookDescription"/></br></br>
            Category:
            <select name="categoryName">
                <%
                    CategoryDAO dao = new CategoryDAO();
                    List<String> list = dao.getListCategoryName();
                    for(String categoryName : list){
                %>
                <option value="<%=categoryName%>"><%= categoryName%></option>
                <%   
                    }
                %>
            </select></br></br>
            Price<input type="text" name="bookPrice" required=""/>
            <%= bookError.getBookPriceError()%></br></br>
            Quantity<input type="text" name="bookQuantity" required=""/>
            <%= bookError.getBookQuantityError()%></br></br>
            Image URL<input type="text" name="image" required=""/>(must be contained .jpg)
            <%= bookError.getImageError()%></br></br>
            <button type="submit" value="createBook" name="action">Create</button>
            <input type="reset" value="Reset"/>
            <%= bookError.getMessageError()%>
        </form>
    </body>
</html>
