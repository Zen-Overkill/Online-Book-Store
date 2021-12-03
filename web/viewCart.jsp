<%-- 
    Document   : viewCart
    Created on : Jun 27, 2021, 2:30:50 PM
    Author     : ASUS
--%>

<%@page import="shopping.Cart"%>
<%@page import="category.Category"%>
<%@page import="category.CategoryDAO"%>
<%@page import="java.util.List"%>
<%@page import="products.BookDTO"%>
<%@page import="products.BookDTO"%>
<%@page import="user.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Booklstore Homepage</title>
        <link rel="stylesheet" href="https://unpkg.com/swiper@7/swiper-bundle.min.css" />

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

        <link rel="stylesheet" href="css/viewCartStyle.css">


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
        <%
            String message = (String) request.getAttribute("SHOPPING_MESSAGE");
            if (message == null) {
                message = "";
            }
        %>
        <%
            List<Category> categoryList = (List<Category>) request.getAttribute("LIST_CATEGORY");
            CategoryDAO catedao = new CategoryDAO();
            categoryList = catedao.getListCategory();
            request.setAttribute("LIST_CATEGORY", categoryList);
        %>


        <!-- header section starts  -->

        <header class="header">

            <div class="header-1">

                <a href="#" class="logo"> <i class="fas fa-book"></i> book store </a>

                <form action="MainController" class="search-form">
                    <input type="text" name="searchBook" value="<%= searchBook%>" placeholder="search here..." id="search-box">
                    <button style="background: inherit" type="submit" value="searchBook" name="action"><label for="search-box" class="fas fa-search"></label></button>
                </form>


                <div class="icons">
                    <div id="search-btn" class="fas fa-search"></div>
                    <a href="#" class="fas fa-heart"></a>
                    <a href="viewCart.jsp" class="fas fa-shopping-cart"></a>
                    <!--<div id="login-btn" class="fas fa-user"></div>-->
                    <div class="dropdown">
                        <i class="fas fa-user"></i>
                        <div class="dropdown-content-profile">
                            <a href="#">My profile</a>
                            <a href="LogoutController">Logout</a>
                        </div>

                    </div>
                </div>

            </div>

            <div class="header-2">
                <nav class="navbar">
                    <div class="align-nav">
                        <a href="SearchBookController">home</a>
                        <div class="dropdown">
                            <a href="#featured" >category<i class="fa fa-caret-down" style="margin-left: 7px;"></i></a>
                            <div class="dropdown-content">
                                <%
                                    if (categoryList != null) {
                                        for (Category category : categoryList) {
                                %>
                                <a href="SearchBookController?categoryName=<%=category.getCategoryName()%>"><%=category.getCategoryName()%></a>
                                <%
                                        }
                                    }
                                %>
                            </div>

                        </div>
                    </div>
                </nav>
            </div>

        </header>

        <!-- header section ends -->

        <!-- bottom navbar  -->

        <nav class="bottom-navbar">
            <a href="#home" class="fas fa-home"></a>
            <a href="#featured" class="fas fa-list"></a>
            <a href="#arrivals" class="fas fa-tags"></a>
            <a href="#reviews" class="fas fa-comments"></a>
            <a href="#blogs" class="fas fa-blog"></a>
        </nav>

        <!-- login form  -->

        <div class="login-form-container">

            <div id="close-login-btn" class="fas fa-times"></div>

            <form action="">
                <h3>sign in</h3>
                <span>username</span>
                <input type="email" name="" class="box" placeholder="enter your email" id="">
                <span>password</span>
                <input type="password" name="" class="box" placeholder="enter your password" id="">
                <div class="checkbox">
                    <input type="checkbox" name="" id="remember-me">
                    <label for="remember-me"> remember me</label>
                </div>
                <input type="submit" value="sign in" class="btn">
                <p>forget password ? <a href="#">click here</a></p>
                <p>don't have an account ? <a href="#">create one</a></p>
            </form>

        </div>


        <section class="view-cart">
            <%
                Cart cart = (Cart) session.getAttribute("CART");
                if (cart == null) {
            %>
            <h1>You haven't add any book to your cart !</h1>
            <%
            } else {
            %>
            <table border="1">
                <thead>
                    <tr>
                        <th>Item</th>
                        <th></th>
                        <th>Quantity</th>
                        <th>Price</th>
                        <th>Modify</th>
                        <th>Remove</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        int count = 1;
                        float total = 0;
                        for (BookDTO book : cart.getCart().values()) {
                            total += book.getBookQuantity() * book.getBookPrice();
                    %>
                <form action="MainController">
                    <tr>

                        <td>
                            <div class="image">
                                <img src="<%= book.getImage()%>" alt="">
                            </div>
                        </td>
                        <td class="bookName"><%= book.getBookName()%></td>
                        <td>
                            <input class="bookQuantity" type="number" name="bookQuantity" value="<%= book.getBookQuantity()%>"/>
                        </td>
                        <td class="price">$<%= book.getBookPrice()%></td>
                        <td>
                            <input type="hidden" name="bookID" value="<%= book.getBookID()%>"/>
                            <input class="btn" type="submit" name="action" value="Modify"/>
                        </td>
                        <td>
                            <input type="hidden" name="bookID" value="<%= book.getBookID()%>"/>
                            <input class="btn" type="submit" name="action" value="Remove"/>
                        </td>
                    </tr>
                </form>
                <%
                    }
                %>
                </tbody>
            </table>
            <div class="total">
                <h1>Total: $<%=total%></h1>
                <%
                    }
                %>
                <a href="user.jsp">Add more</a>
            </div>
        </section>



        <!-- footer section starts  -->

        <section class="footer">

            <div class="box-container">

                <div class="box">
                    <h3>our locations</h3>
                    <a href="#"> <i class="fas fa-map-marker-alt"></i> india </a>
                    <a href="#"> <i class="fas fa-map-marker-alt"></i> USA </a>
                    <a href="#"> <i class="fas fa-map-marker-alt"></i> russia </a>
                    <a href="#"> <i class="fas fa-map-marker-alt"></i> france </a>
                    <a href="#"> <i class="fas fa-map-marker-alt"></i> japan </a>
                    <a href="#"> <i class="fas fa-map-marker-alt"></i> africa </a>
                </div>

                <div class="box">
                    <h3>quick links</h3>
                    <a href="#"> <i class="fas fa-arrow-right"></i> home </a>
                    <a href="#"> <i class="fas fa-arrow-right"></i> featured </a>
                    <a href="#"> <i class="fas fa-arrow-right"></i> arrivals </a>
                    <a href="#"> <i class="fas fa-arrow-right"></i> reviews </a>
                    <a href="#"> <i class="fas fa-arrow-right"></i> blogs </a>
                </div>

                <div class="box">
                    <h3>extra links</h3>
                    <a href="#"> <i class="fas fa-arrow-right"></i> account info </a>
                    <a href="#"> <i class="fas fa-arrow-right"></i> ordered items </a>
                    <a href="#"> <i class="fas fa-arrow-right"></i> privacy policy </a>
                    <a href="#"> <i class="fas fa-arrow-right"></i> payment method </a>
                    <a href="#"> <i class="fas fa-arrow-right"></i> our serivces </a>
                </div>

                <div class="box">
                    <h3>contact info</h3>
                    <a href="#"> <i class="fas fa-phone"></i> +123-456-7890 </a>
                    <a href="#"> <i class="fas fa-phone"></i> +111-222-3333 </a>
                    <a href="#"> <i class="fas fa-envelope"></i> shaikhanas@gmail.com </a>
                    <img src="image/worldmap.png" class="map" alt="">
                </div>

            </div>

            <div class="share">
                <a href="#" class="fab fa-facebook-f"></a>
                <a href="#" class="fab fa-twitter"></a>
                <a href="#" class="fab fa-instagram"></a>
                <a href="#" class="fab fa-linkedin"></a>
                <a href="#" class="fab fa-pinterest"></a>
            </div>

            <div class="credit"> Copyright © 2021 by <span>Nguyen</span> </div>

        </section>

        <!-- footer section ends -->

        <!-- loader  -->

        <!--        <div class="loader-container">
                    <img src="image/loader-img.gif" alt="">
                </div>-->


        <script src="https://unpkg.com/swiper@7/swiper-bundle.min.js"></script>

        <!-- custom js file link  -->
        <script src="js/homepageScript.js"></script>
    </body>
</html>

