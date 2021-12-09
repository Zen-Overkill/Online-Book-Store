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
        <link href="css/adminStyle.css" rel="stylesheet" />
        <link rel="stylesheet" href="https://unpkg.com/swiper@7/swiper-bundle.min.css" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
        <link rel="stylesheet" href="https://maxst.icons8.com/vue-static/landings/line-awesome/line-awesome/1.3.0/css/line-awesome.min.css" />
        <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
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
        
        
        
        <div class="sidebar close">
            <div class="logo-details">
                <i class="fas fa-book" style="font-size: 2.5rem"></i><span class="logo_name"> book store </span>
            </div>
            <div class="sidebar-line"></div>
            <ul class="nav-links">
                <div class="sidebar-align">
                    <li>

                        <a href="SearchUserController">
                            <i class='bx bxs-user'></i>
                            <span class="links_name">User management</span>
                        </a>

                        <span class="tooltip">User management</span>
                    </li>
                    <li>

                        <a href="createUser.jsp">
                            <i class='bx bxs-user-plus' ></i>
                            <span class="links_name">Add user</span>
                        </a>

                        <span class="tooltip">Add user</span>
                    </li>
                    <li>

                        <a href="SearchBookController">
                            <i class='bx bxs-book-alt' ></i>
                            <span class="links_name">Book management</span>
                        </a>

                        <span class="tooltip">Book management</span>
                    </li>
                    <li>

                        <a href="createBook.jsp">
                            <i class='bx bxs-book-add' ></i>
                            <span class="links_name">Add book</span>
                        </a>

                        <span class="tooltip">Add book</span>
                    </li>
                </div>
            </ul>
        </div>
        <div class="main-content">
            <header class="header">

                <div class="sidebar-button">
                    <i class='bx bx-menu sidebarBtn' ></i>
                    <span class="dashboard">Dashboard</span>
                </div>

                <form action="MainController" class="search-form">
                    <input type="text" name="search_book" value="<%= searchBook%>" placeholder="search here..." id="search-box">
                    <button style="background: inherit" type="submit" value="searchBook" name="action"><label for="search-box" class="fas fa-search"></label></button>
                </form>


                <div class="icons">
                    <div id="search-btn" class="fas fa-search"></div>
                    <!--<div id="login-btn" class="fas fa-user"></div>-->
                    <div class="dropdown">
                        <i class='bx bxs-user-circle' ></i>
                        <div class="dropdown-content-profile">
                            <a href="#">My profile</a>
                            <a href="LogoutController">Logout</a>
                        </div>

                    </div>
                </div>
            </header>
            <main>
                <div class="align">
                    <%
            List<BookDTO> list = (List<BookDTO>) request.getAttribute("LIST_BOOK_ADMIN");
            if (list != null) {
                if (!list.isEmpty()) {

        %>
        
        <table class="content-table">
            <thead>
                <tr>
                    <th>Image</th>
                    <th>Name</th>
                    <!--<th>Description</th>-->
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
                    
                    <!--<td><%= book.getBookDescription()%></td>-->
                    
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
                            <button class="btn" type="submit">Update</button>
                        </form>
                    </td>
                    <td>
                        <form action="MainController">
                            <input type="hidden" value="<%=book.getBookID()%>" name="bookID">
                            <button class="btn" type="submit" value="deleteBook" name="action">Delete</button>
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
                </div>
            </main>
            <footer class="footer">
                <div class="credit"> Copyright © 2021 by <span>Nguyen</span> </div>
            </footer>
        </div>
        <script  src="js/DashboardBtn.js"></script>    
        <script src="js/homepageScript.js"></script>

        
    </body>
</html>
