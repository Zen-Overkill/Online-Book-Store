<%-- 
    Document   : userManagement
    Created on : Jul 9, 2021, 8:52:29 PM
    Author     : ASUS
--%>

<%@page import="status.StatusDAO"%>
<%@page import="user.UserDTO"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manage Users Page</title>
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

            String searchUser = (String) request.getParameter("searchUser");
            if (searchUser == null) {
                searchUser = "";
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
                    <input type="text" name="search_user" value="<%= searchUser%>" placeholder="search here..." id="search-box">
                    <button style="background: inherit" type="submit" value="searchUser" name="action"><label for="search-box" class="fas fa-search"></label></button>
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
                        List<UserDTO> list = (List<UserDTO>) request.getAttribute("LIST_USER");
                        if (list != null) {
                            if (!list.isEmpty()) {
                    %>
                    <!--<h3>Đã tìm thấy <%= list.size()%> kết quả</h3>-->
                    <table class="content-table">
                        <thead>
                            <tr>
                                <th>Username</th>
                                <th>Full Name</th>
                                <th>RoleID</th>
                                <th>Password</th>
                                <th>Phone</th>
                                <th>Address</th>
                                <th>CreateDate</th>
                                <th>Status</th>         
                                <th>Update</th>
                                <th>Delete</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                int count = 1;
                                for (UserDTO user : list) {
                            %>
                        <form action="MainController">
                            <tr>

                                <td>
                                    <%= user.getUserID()%>
                                </td>

                                <td>
                                    <input type="text" name="fullName" value="<%= user.getFullName()%>"/>
                                </td>

                                <td>
                                    <input type="text" name="roleID" value="<%= user.getRoleID()%>"/>
                                </td>

                                <td><%= user.getPassword()%></td>

                                <td>
                                    <input type="text" name="phone" value="<%= user.getPhone()%>"/>
                                </td>

                                <td>
                                    <input type="text" name="address" value="<%= user.getAddress()%>"/>
                                </td>
                                <td><%= user.getCreateDate()%></td>

                                <%
                                    StatusDAO st = new StatusDAO();
                                    String statusName = st.getStatusName(user.getStatusID());
                                    if (statusName.equals("Enabled")) {
                                %>
                                <td style="color: green"><%= statusName%></td>
                                <%
                                } else if (statusName.equals("Disabled")) {
                                %>
                                <td style="color: red"><%= statusName%></td>
                                <%
                                    }
                                %>
                                <td>
                                    <button class="btn" type="submit" name="action" value="Update">Update</button>
                                    <input type="hidden" name="userID" value="<%= user.getUserID()%>"/>
                                    <input type="hidden" name="search" value="<%= searchUser%>"/>
                                </td>

                                <td>
                                    <button class="btn" type="submit" value="deleteUser" name="action">Delete</button>
                                </td>
                            </tr> 
                        </form>

                        <%
                            }
                        %>

                        </tbody>
                    </table>
                    .
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
