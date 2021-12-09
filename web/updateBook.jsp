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
        <link rel="stylesheet" href="https://unpkg.com/swiper@7/swiper-bundle.min.css" />

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

        <link rel="stylesheet" href="css/createUserStyle.css">
    </head>
    <body>
        <%
            BookError bookError = (BookError) request.getAttribute("BOOK_ERROR");
            if (bookError == null) {
                bookError = new BookError();
            }

            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
            if (loginUser == null || !"AD".equals(loginUser.getRoleID())) {
                response.sendRedirect("login.html");
                return;
            }

            ArrayList<String> listCategory = (ArrayList<String>) session.getAttribute("LIST_CATEGORY");
        %>
        <div class="login-form-container">
            <form action="MainController">
                <input type="hidden" name="bookID" value="<%=request.getParameter("bookID")%>"/>
                <h3>Update Book: <%=request.getParameter("bookName")%></h3>
                <span>Image (must contain .jpg)</span>
                <input class="box" placeholder="enter book's image url" type="text" name="image" value="<%=request.getParameter("image")%>"/>

                <span>Name</span>
                <input class="box" placeholder="enter book's name" type="text" name="bookName" value="<%=request.getParameter("bookName")%>" />

                <span>Description</span>
                <input class="box" placeholder="enter book's description" type="text" name="bookDescription" value="<%=request.getParameter("bookDescription")%>"/>

                <span>Category</span>
                <select name="categoryName">
                    <%
                        for (String category : listCategory) {
                    %>
                    <option value="<%=category%>"><%=category%></option>
                    <%
                        }
                    %>
                </select>

                <span>Price</span>
                <input class="box" placeholder="enter book's name" type="text" name="bookPrice" value="<%=request.getParameter("bookPrice")%>"/>

                <span>Quantity</span>
                <input class="box" placeholder="enter book's name" type="text" name="bookQuantity" value="<%=request.getParameter("bookQuantity")%>"/>

                <span>Status</span>
                <select name="statusName">
                    <option value="Enabled">Enabled</option>
                    <option value="Disabled">Disabled</option>
                </select></br></br>

                <button class="btn" type="submit" value="updateBook" name="action">Confirm Update</button>
                <a class="btn" href="SearchBookController">Back</a>

                <%= bookError.getMessageError()%>
            </form>
        </div>
    </body>
</html>
