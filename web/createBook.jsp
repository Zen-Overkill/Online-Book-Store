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
        %>
        <div class="login-form-container">
            <form action="MainController" method="POST">
                <h3>Create New Book</h3>
                <span>Book ID</span>
                <input class="box" placeholder="enter book's id" type="text" name="bookID" required=""/>
                <%= bookError.getBookIDError()%>
                <span>Book Name</span>
                <input class="box" placeholder="enter book's name" type="text" name="bookName" required=""/>
                <%= bookError.getBookNameError()%>
                <span>Description</span>
                <input class="box" placeholder="enter description" type="text" name="bookDescription"/>
                <span>Category</span>
                <select name="categoryName"">
                    <%
                        CategoryDAO dao = new CategoryDAO();
                        List<String> list = dao.getListCategoryName();
                        for (String categoryName : list) {
                    %>
                    <option value="<%=categoryName%>"><%= categoryName%></option>
                    <%
                        }
                    %>
                </select></br></br>
                <span>Price</span>
                <input class="box" placeholder="enter book's price" type="text" name="bookPrice" required=""/>
                <%= bookError.getBookPriceError()%>
                <span>Quantity</span>
                <input class="box" placeholder="enter book's quantity" type="text" name="bookQuantity" required=""/>
                <%= bookError.getBookQuantityError()%></br></br>
                <span>Image URL (must be contained .jpg)</span>
                <input class="box" placeholder="enter book's image url" type="text" name="image" required=""/>
                <%= bookError.getImageError()%></br></br>
                <button class="btn" type="submit" value="createBook" name="action">Create</button>
                <a class="btn" href="SearchBookController">Back</a>
                <%= bookError.getMessageError()%>
            </form>
        </div>
    </body>
</html>
