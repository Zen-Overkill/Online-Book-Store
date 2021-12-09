<%-- 
    Document   : unsignedHomepage
    Created on : Dec 2, 2021, 4:37:39 PM
    Author     : DELL
--%>

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

        <link rel="stylesheet" href="css/homepageStyle.css">


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

        <!-- home section starts  -->

        <section class="home" id="home">
            <img src="image/Bookstore-banner.png" class="banner" alt="">

        </section>

        <!-- home section ense  -->

        <!-- icons section starts  -->

        <section class="icons-container">

            <div class="icons">
                <i class="fas fa-shipping-fast"></i>
                <div class="content">
                    <h3>free shipping</h3>
                    <p>order over $100</p>
                </div>
            </div>

            <div class="icons">
                <i class="fas fa-lock"></i>
                <div class="content">
                    <h3>secure payment</h3>
                    <p>100 secure payment</p>
                </div>
            </div>

            <div class="icons">
                <i class="fas fa-redo-alt"></i>
                <div class="content">
                    <h3>easy returns</h3>
                    <p>10 days returns</p>
                </div>
            </div>

            <div class="icons">
                <i class="fas fa-headset"></i>
                <div class="content">
                    <h3>24/7 support</h3>
                    <p>call us anytime</p>
                </div>
            </div>

        </section>

        <!-- icons section ends -->

        <!-- featured section starts  -->

        <section class="featured" id="featured">

            <h1 class="heading"> <span>featured books</span> </h1>

            <div class="swiper featured-slider">

                <div class="swiper-wrapper">
                    <div class="swiper-slide grid-box">
                        <%
                            List<BookDTO> list = (List<BookDTO>) session.getAttribute("LIST_BOOK_USERS");
                            if (list != null) {
                                if (!list.isEmpty()) {
                                    for (BookDTO book : list) {

                        %>

                        <div class="box">

                            <div class="book-box">
                                <div class="image">
                                    <img src="<%= book.getImage()%>" alt="">
                                </div>
                                <div class="content">
                                    <h3><%= book.getBookName()%></h3>
                                    <div class="price"><%= book.getBookPrice()%>$ <span><%= book.getBookPrice() + 10%>$</span></div>
                                    <form action="MainController">
                                        <input type="hidden" name="searchBook" value="<%= searchBook%>"/>
                                        <input type="hidden" name="bookID" value="<%= book.getBookID()%>"/>
                                        <input type="hidden" name="bookDescription" value="<%= book.getBookDescription()%>"/>
                                        <input type="hidden" name="image" value="<%= book.getImage()%>"/>
                                        <input type="hidden" name="bookName" value="<%= book.getBookName()%>"/>
                                        <input type="hidden" name="bookPrice" value="<%= book.getBookPrice()%>"/>
                                        <input type="hidden" name="bookQuantity" value="<%= book.getBookQuantity()%>"/>
                                        <button style="background: inherit" type="submit" name="action" value="Add to Cart"><a class="btn">add to cart</a></button>
                                    </form>
                                </div>
                            </div>

                        </div>
                        <%
                                    }
                                }
                            }
                        %>
                    </div>
                </div>

                <!--                <div class="swiper-button-next"></div>
                                <div class="swiper-button-prev"></div>-->
                <!-- Add Pagination -->
                <div class="swiper-pagination"></div>

            </div>

        </section>

        <!-- featured section ends -->





        <!-- deal section starts  -->

        <section class="deal">

            <div class="content">
                <h3>deal of the day</h3>
                <h1>upto 50% off</h1>
                <p>The instant New York Times bestseller from Chris Cleave—the unforgettable novel about three lives entangled during World War II, told “with dazzling prose, sharp English wit, and compassion…a powerful portrait of war’s effects on those who fight and those left behind”.</p>
                <a href="#" class="btn">shop now</a>
            </div>

            <div class="image">
                <img src="image/deal-img.jpg" alt="">
            </div>

        </section>

        <!-- deal section ends -->



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
