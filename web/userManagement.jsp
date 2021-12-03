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

        <form action="MainController">
            Find User<input type="text" name="search_user" value="<%= searchUser%>"/>
            <button type="submit" value="searchUser" name="action">Search</button>
        </form></br>   
        <form action="admin.jsp">
            <button type="submit" name="action">Go Back</button>
        </form></br>

        <%
            List<UserDTO> list = (List<UserDTO>) request.getAttribute("LIST_USER");
            if (list != null) {
                if (!list.isEmpty()) {
        %>
        <h3>Đã tìm thấy <%= list.size()%> kết quả</h3>
        <table border="1">
            <thead>
                <tr>
                    <th>No</th>
                    <th>UserID</th>
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
                    <td><%= count++%></td>

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
                            if(statusName.equals("Enabled")){
                    %>
                            <td style="color: green"><%= statusName%></td>
                    <%
                            }else if(statusName.equals("Disabled")){
                    %>
                            <td style="color: red"><%= statusName%></td>
                    <%
                        }
                    %>
                    <td>
                        <input type="submit" name="action" value="Update"/>
                        <input type="hidden" name="userID" value="<%= user.getUserID()%>"/>
                        <input type="hidden" name="search" value="<%= searchUser%>"/>
                    </td>
                   
                    <td>
                        <button type="submit" value="deleteUser" name="action">Delete</button>
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
</body>
</html>
