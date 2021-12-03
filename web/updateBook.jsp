<%-- 
    Document   : updateBook
    Created on : Jul 11, 2021, 9:48:26 PM
    Author     : ASUS
--%>

<%@page import="user.UserDTO"%>
<%@page import="products.BookError"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Book Page</title>
    </head>
    <body>
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
            
            ArrayList<String> listCategory = (ArrayList<String>) session.getAttribute("LIST_CATEGORY");
        %>
        <form action="MainController">
            <input type="hidden" name="bookID" value="<%=request.getParameter("bookID")%>"/>
            
            Image
            <input type="text" name="image" value="<%=request.getParameter("image")%>"/> (must contain .jpg)</br></br>
            
            Name
            <input type="text" name="bookName" value="<%=request.getParameter("bookName")%>" /></br></br>

            Description	
            <input type="text" name="bookDescription" value="<%=request.getParameter("bookDescription")%>"/></br></br>
            
            Category
            <select name="categoryName">
                <% 
                    for (String category : listCategory) {
                %>
                    <option value="<%=category%>"><%=category%></option>
                <%
                    }
                %>
            </select></br></br>
            
            Price
            <input type="text" name="bookPrice" value="<%=request.getParameter("bookPrice")%>"/></br></br>
            
            Quantity
            <input type="text" name="bookQuantity" value="<%=request.getParameter("bookQuantity")%>"/></br></br>
           
            Status
            <select name="statusName">
                <option value="Enabled">Enabled</option>
                <option value="Disabled">Disabled</option>
            </select></br></br>
            
            <button type="submit" value="updateBook" name="action">Confirm Update</button>
            
            <%= bookError.getMessageError()%>
        </form>
    </body>
</html>
