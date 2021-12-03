<%-- 
    Document   : admin
    Created on : Jun 15, 2021, 10:10:56 PM
    Author     : ASUS
--%>

<%@page import="java.util.List"%>
<%@page import="user.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>-
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Page</title>
    </head>
    <body>
        <%
            //Phân quyền Admin
            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
            if (loginUser == null || !"AD".equals(loginUser.getRoleID())) {
                response.sendRedirect("login.html");
                return;
            }
        %>
        <h1>Hello Admin: <%= loginUser.getFullName()%></h1>

        <form action="MainController">
            <input type="submit" name="action" value="Logout"/>
        </form></br>

        <a href="userManagement.jsp">Manage Users</a></br>
        <a href="bookManagement.jsp">Manage Books</a>
        
    </body>
</html>
