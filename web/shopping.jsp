<%-- 
    Document   : shopping
    Created on : Jun 27, 2021, 2:03:03 PM
    Author     : ASUS
--%>

<%@page import="products.BookDTO"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tea Page</title>
    </head>
    <body>
        <h1>Welcome !</h1>
        <form action="MainController">
            Choose tea: 
            <select name="bookName">
                <option value="T01-Tea_1-10">Tea 1</option>
                <option value="T02-Tea_2-20">Tea 2</option>
                <option value="T03-Tea_3-30">Tea 3</option>
                <option value="T04-Tea_4-40">Tea 4</option>
            </select>
            <input type ="number" name="quantity" value="1"/>
            <input type="submit" name="action" value="Add to Cart"/>
            <input type="submit" name="action" value="View Cart"/>
        </form>
        <%
            String message = (String) request.getAttribute("SHOPPING_MESSAGE");
            if (message == null) {
                message = "";
            }
        %>
        <%= message%>
    </body>
</html>
