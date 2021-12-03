<%-- 
    Document   : bookManagement
    Created on : Jul 9, 2021, 8:53:09 PM
    Author     : ASUS
--%>

<%@page import="status.StatusDAO"%>
<%@page import="category.CategoryDAO"%>
<%@page import="java.util.List"%>
<%@page import="products.BookDTO"%>
<%@page import="user.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manage Books Page</title>
    </head>
    <body>
        <%
            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
            if (loginUser == null || !"AD".equals(loginUser.getRoleID())) {
                response.sendRedirect("login.html");
                return;
            }

            String searchBook = request.getParameter("searchBook");
            if (searchBook == null) {
                searchBook = "";
            }
        %>
        <a href="createBook.jsp">Create New Book</a></br></br>
        <form action="MainController">
            Search Book<input type="text" name="searchBook" value="<%= searchBook%>"/>
            <button type="submit" value="searchBook" name="action">Search</button>
        </form></br>
        <form action="admin.jsp">
            <button type="submit" name="action">Go Back</button>
        </form></br>    
        </br>

        <%
            List<BookDTO> list = (List<BookDTO>) request.getAttribute("LIST_BOOK_ADMIN");
            if (list != null) {
                if (!list.isEmpty()) {

        %>
        
        <table border="1">
            <thead>
                <tr>
                    <th>Image</th>
                    <th>Name</th>
                    <th>Description</th>
                    <th>Category</th>
                    <th>Price</th>
                    <th>Quantity</th>
                    <th>Create Date</th>
                    <th>Status</th>
                    <th>Update</th>
                    <th>Delete</th>
                </tr>
            </thead>
            <tbody>
                <%   
                    for (BookDTO book : list) {
                %>

                <tr>
<!--                    <td>
                        <img src="images/<%= book.getImage()%>" alt="<%= book.getBookName()%>" width="100" height="100">
                    </td>-->
                    <td>
                        <img src="<%= book.getImage()%>" alt="<%= book.getBookName()%>" width="100" height="100">
                    </td>
                    
                    <td><%= book.getBookName()%></td>
                    
                    <td><%= book.getBookDescription()%></td>
                    
                    <%
                        CategoryDAO cate = new CategoryDAO();
                        String categoryName = cate.getCategoryName(book.getCategoryID());
                    %>
                    
                    <td><%= categoryName%></td>
                    
                    <td><%= book.getBookPrice()%></td>
                    
                    <%
                        if (book.getBookQuantity() > 0) {
                    %>
                    
                            <td><%= book.getBookQuantity()%></td>
                    
                    <%
                        } else { 
                    %> 
                    
                        <td style="color: red">Sold out</td>
                   
                    <%        
                        }
                    %>
                    
                    <td><%= book.getCreateDate()%></td>
                    
                    <%
                        StatusDAO dao = new StatusDAO();
                        String statusName = dao.getStatusName(book.getStatusID());
                    %>
                    
                    <%
                        if(statusName.equals("Enabled")){
                    %>
                        <td style="color: green"><%= statusName%></td>
                    <%
                        } else if(statusName.equals("Disabled")){
                    %>
                        <td style="color: red"><%= statusName%></td>
                    <%
                        }
                    %>
                    
                    
                    <td>
                        <form action="updateBook.jsp">
                            <input type="hidden" value="<%=book.getBookID()%>" name="bookID">
                            <input type="hidden" value="<%=book.getImage()%>" name="image">
                            <input type="hidden" value="<%=book.getBookName()%>" name="bookName">
                            <input type="hidden" value="<%=book.getBookDescription()%>" name="bookDescription">
                            <input type="hidden" value="<%=book.getBookPrice()%>" name="bookPrice">
                            <input type="hidden" value="<%=book.getBookQuantity()%>" name="bookQuantity">
                            <button type="submit">Update</button>
                        </form>
                    </td>
                    <td>
                        <form action="MainController">
                            <input type="hidden" value="<%=book.getBookID()%>" name="bookID">
                            <button type="submit" value="deleteBook" name="action">Delete</button>
                        </form>
                    </td>
                </tr>

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
