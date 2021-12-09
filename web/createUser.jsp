<%-- 
    Document   : createUser
    Created on : Jun 22, 2021, 9:16:03 AM
    Author     : ASUS
--%>

<%@page import="user.UserDTO"%>
<%@page import="user.UserError"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create account page</title>
        <link rel="stylesheet" href="https://unpkg.com/swiper@7/swiper-bundle.min.css" />

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

        <link rel="stylesheet" href="css/createUserStyle.css">
    </head>
    <body>
        <%
            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
            if (loginUser == null || !"AD".equals(loginUser.getRoleID())) {
                response.sendRedirect("login.html");
                return;
            }
            
            UserError userError = (UserError) request.getAttribute("USER_ERROR");
            if (userError == null) {
                userError = new UserError();
            }
        %>
        
        
        <div class="login-form-container">
            <form action="MainController" method="POST">
                <h3>Create New User</h3>
                <span>username</span>
                <input type="text" name="userID" class="box" placeholder="enter your username" >
                <span>full name</span>
                <input type="text" name="fullName" class="box" placeholder="enter your full name" >
                <span>roleID</span>
                <input type="text" name="roleID" class="box" placeholder="enter your role id" >
                <span>password</span>
                <input type="password" name="password" class="box" placeholder="enter your password">
                <span>confirm password</span>
                <input type="password" name="confirm" class="box" placeholder="confirm your password">
                <span>phone number</span>
                <input type="password" name="phone" class="box" placeholder="enter your phone number">
                <span>address</span>
                <input type="password" name="address" class="box" placeholder="enter your address">
                <button type="submit" value="createUser" name="action" class="btn">Create account</button>
                <!--<input type="reset" value="Reset" class="btn">-->
                <a class="btn" href="SearchUserController">Back</a>
                <%= userError.getMessageError()%>
            </form>
            
        </div>
    </body>
</html>
