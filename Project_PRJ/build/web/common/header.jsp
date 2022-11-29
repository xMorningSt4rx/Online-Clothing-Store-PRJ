<%-- 
    Document   : header
    Created on : Feb 28, 2022, 9:55:59 PM
    Author     : Admin
--%>

<%@page import="model.Account"%>
<%@page import="model.Category"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dal.DaoCategory"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- Header Section Start -->
<div class="header-section section">

    <!-- Header Top Start -->
    <div class="header-top header-top-one bg-theme-two">
        <div class="container-fluid">
            <div class="row align-items-center justify-content-center">

                <div class="col mt-10 mb-10 d-none d-md-flex">
                    <!-- Header Top Left Start -->
                    <div class="header-top-left">
                        <p>Welcome to CLOTHES SHOP</p>
                        <p>Hotline: <a href="tel:0123456789">0123 456 789</a></p>
                    </div><!-- Header Top Left End -->
                </div>

                <div class="col mt-10 mb-10">
                    <!-- Header Language Currency Start -->
                    <ul class="header-lan-curr">



                    </ul><!-- Header Language Currency End -->
                </div>

                <div class="col mt-10 mb-10">
                    <!-- Header Shop Links Start -->
                    <div class="header-top-right">
                        <%
                            if (session.getAttribute("account") != null) {
                                Account a = (Account) session.getAttribute("account");
                                String role = "";
                        %>
                        <p><a href="Userdetail?id=<%=a.getId() %>" >Hello, <%=a.getName()%> (<%=role = a.getRoll() == 1 ? "admin" : "custommer"  %>)! </a>  | <a href="./Logout">Logout</a></p>
                        <%
                        } else {
                        %>
                        <p><a href="login-register.jsp">Register</a><a href="login-register.jsp">Login</a></p>
                        <%
                            }
                        %>


                    </div><!-- Header Shop Links End -->
                </div>

            </div>
        </div>
    </div><!-- Header Top End -->

    <!-- Header Bottom Start -->
    <div class="header-bottom header-bottom-one header-sticky">
        <div class="container-fluid">
            <div class="row menu-center align-items-center justify-content-between">

                <div class="col mt-15 mb-15">
                    <!-- Logo Start -->
                    <div class="header-logo">
                        <a href="index.jsp">
                            <img src="" alt="">
                        </a>
                    </div><!-- Logo End -->
                </div>

                <div class="col order-2 order-lg-3">
                    <!-- Header Advance Search Start -->
                    <div class="header-shop-links">

                        <div class="header-search">
                            <button class="search-toggle"><img src="assets/images/icons/search.png" alt="Search Toggle"><img class="toggle-close" src="assets/images/icons/close.png" alt="Search Toggle"></button>
                            <div class="header-search-wrap">
                                <form action="./search">
                                    <input type="text" placeholder="Type and hit enter" name="searchString">
                                    <button><img src="assets/images/icons/search.png" alt="Search"></button>
                                </form>
                            </div>
                        </div>



                        <div class="header-mini-cart">
                            <a href="CartDetail"><img src="assets/images/icons/cart.png" alt="Cart"> <span>(Cart)</span></a>
                        </div>

                    </div><!-- Header Advance Search End -->
                </div>

                <div class="col order-3 order-lg-2">
                    <div class="main-menu">
                        <nav>
                            <ul>
                                <li class="active"><a href="index.jsp">HOME</a>

                                </li>
                                <li><a href="search">SHOP</a>

                                </li>

                                <li><a href="#">CATEGORY</a>
                                    <ul class="sub-menu">
                                        <%
                                            DaoCategory dc = new DaoCategory();
                                            ArrayList<Category> ac = (ArrayList<Category>) dc.getCategory();
                                            for (int i = 0; i < ac.size(); i++) {


                                        %>
                                        <li><a href="./Category?id=<%=ac.get(i).getId() %>"><%=ac.get(i).getName()%></a></li>
                                            <%                                                }
                                            %>
                                    </ul>
                                </li>
                                

                            </ul>
                        </nav>
                    </div>
                </div>

                <!-- Mobile Menu -->
                <div class="mobile-menu order-12 d-block d-lg-none col"></div>

            </div>
        </div>
    </div><!-- Header BOttom End -->
  
</div><!-- Header Section End -->
