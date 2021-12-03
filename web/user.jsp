<%-- 
    Document   : user
    Created on : Jun 15, 2021, 10:14:50 PM
    Author     : ASUS
--%>

<%@page import="category.CategoryDAO"%>
<%@page import="products.BookDTO"%>
<%@page import="java.util.List"%>
<%@page import="user.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Page</title>
    </head>

    <body>
        <%
            String searchBook = (String) request.getParameter("searchBook");
            if (searchBook == null) {
                searchBook = "";
            }

            UserDTO user = (UserDTO) session.getAttribute("LOGIN_USER");
            if (user == null || !"US".equals(user.getRoleID())) {
                response.sendRedirect("login.html");
                return;
            }
        %>
        <h1>Hello User: <%= user.getFullName()%></h1>
        <%
            String message = (String) request.getAttribute("SHOPPING_MESSAGE");
            if (message == null) {
                message = "";
            }
        %>


        <form action="MainController">
            <input type="submit" name="action" value="Logout"/>
        </form></br>

        <form action="MainController">
            Search Book<input type="text" name="searchBook" value="<%= searchBook%>"/>
            <button type="submit" value="searchBook" name="action">Search</button>
            <input type="submit" name="action" value="View Cart" style="margin-left: 10px"/>
        </form></br>

        <%= message%>

        <%
            List<BookDTO> list = (List<BookDTO>) session.getAttribute("LIST_BOOK_USERS");
            if (list != null) {
                if (!list.isEmpty()) {

        %>
        
        <table border="1">
            <thead>
                <tr>
                    <th>Image</th>
                    <th>Name</th>
                    <th>Description</th>
                    <th>Price</th>
                    <th>Quantity</th>
                    <th>Category</th>
                    <th>Add to Cart</th>
                </tr>
            </thead>
            <tbody>
                <%                    
                    for (BookDTO book : list) {
                %>
            <form action="MainController">
                <tr>
                    <td>
                        <img src="<%= book.getImage() %>" alt="<%= book.getBookName()%>" width="100" height="100">
                    </td>
                    <td><%= book.getBookName()%></td>
                    <td><%= book.getBookDescription()%></td>
                    <td><%= book.getBookPrice()%></td>
                    <%
                        if(book.getBookQuantity() > 0){
                    %>
                            <td><%= book.getBookQuantity()%></td>
                    <%
                        } else {

                    %>
                            <td>Sold out</td>
                    <%
                        }
                    %>
                    
                    <% 
                            CategoryDAO cate = new CategoryDAO();
                            String categoryName = cate.getCategoryName(book.getCategoryID());
                    %>
                    <td><%= categoryName%></td>
                    <td>
                        <input type="hidden" name="searchBook" value="<%= searchBook%>"/>
                        <input type="hidden" name="bookID" value="<%= book.getBookID()%>"/>
                        <input type="hidden" name="bookName" value="<%= book.getBookName()%>"/>
                        <input type="hidden" name="bookPrice" value="<%= book.getBookPrice()%>"/>
                        <input type="hidden" name="bookQuantity" value="<%= book.getBookQuantity()%>"/>
                        <input type="submit" name="action" value="Add to Cart"/>
                    </td>
                </tr>
            </form>
            <%
                }
            %>
        </tbody>
    </table>
    <%
            }
        }
    %>


    </body>
</html>
