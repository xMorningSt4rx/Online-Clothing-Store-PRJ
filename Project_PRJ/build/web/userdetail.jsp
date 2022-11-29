<%-- 
    Document   : checkout
    Created on : Feb 21, 2022, 9:56:44 PM
    Author     : Admin
--%>

<%@page import="model.Account"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!doctype html>
<html class="no-js" lang="en">

    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>CLOTHES SHOP</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- Favicon -->
        <link rel="shortcut icon" type="image/x-icon" href="assets/images/favicon.ico">

        <!-- CSS
            ============================================ -->

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="assets/css/bootstrap.min.css">

        <!-- Icon Font CSS -->
        <link rel="stylesheet" href="assets/css/icon-font.min.css">

        <!-- Plugins CSS -->
        <link rel="stylesheet" href="assets/css/plugins.css">

        <!-- Helper CSS -->
        <link rel="stylesheet" href="assets/css/helper.css">

        <!-- Main Style CSS -->
        <link rel="stylesheet" href="assets/css/style.css">

        <!-- Modernizer JS -->
        <script src="assets/js/vendor/modernizr-2.8.3.min.js"></script>
    </head>

    <body>

        <div class="main-wrapper">

            <!-- Header Section Start -->
            <jsp:include page="./common/header.jsp" ></jsp:include>
                <!-- Header Section End -->

                <!-- Page Banner Section Start -->
                <div class="page-banner-section section" style="background-image: url(assets/images/hero/hero-1.jpg)">
                    <div class="container">
                        <div class="row">
                            <div class="page-banner-content col">

                                <h1>User detail</h1>
                                <ul class="page-breadcrumb">
                                    <li><a href="index.jsp">Home</a></li>
                                    <li><a href="userdetail.jsp">User detail</a></li>
                                </ul>

                            </div>
                        </div>
                    </div>
                </div><!-- Page Banner Section End -->
            <%
                if (session.getAttribute("account") != null) {
                    Account a = (Account) session.getAttribute("account");

            %>
            <!-- Page Section Start -->
            <div class="page-section section mt-80 mt-lg-60 mt-md-60 mt-sm-60 mt-xs-40 mb-40 mb-lg-20 mb-md-20 mb-sm-20 mb-xs-0">
                <div class="container">
                    <div class="row">

                        <div class="col-12">

                            <!-- Checkout Form s-->
                            <form action="Userdetail" method="Post" class="checkout-form">
                                <div class="row row-50">

                                    <div class="col-lg-12">

                                        <!-- Info -->
                                        <div id="billing-form" class="mb-20">
                                            <input id="type" type="text" name="type" value="ChangeInfor" style="display:none;" />
                                            <h4 class="checkout-title">Your Information</h4>

                                            <div class="row">
                                                <div class="col-md-0 col-0 mb-0">
                                                    <input type="hidden" name="id" value="<%=a.getId()%>" placeholder="First Name">
                                                </div>
                                                <div class="col-md-6 col-12 mb-5">
                                                    <label>Your Name</label>
                                                    <input type="text" name="yourName" value="<%=a.getYourname()%>" placeholder="First Name">
                                                </div>
                                                <div class="col-md-6 col-12 mb-5">
                                                    <label>User Name</label>
                                                    <input type="text" name="UserName" value="<%=a.getName()%>" placeholder="Address">
                                                </div>
                                                <div class="col-md-6 col-12 mb-5">
                                                    <label>Phone</label>
                                                    <input name="phoneNumber" value="<%=a.getContact()%>"  placeholder="Phone" >
                                                </div>

                                                <div class="col-md-6 col-12 mb-5">
                                                    <label>Address</label>
                                                    <input type="text" name="address" value="<%=a.getAddress()%>" placeholder="Address">
                                                </div>
                                                <h3 style="color: royalblue">${requestScope.mess}</h3>
                                                <button  class="place-order" type="submit">Change Information</button>
                                            </div>

                                        </div>
                                        </form>

                                        <hr>
                                        <!-- Pas -->
                                        <form action="Userdetail" method="Post" class="checkout-form">
                                            <div id="billing-form" class="mb-20">
                                                <input  name="type" value="ChangePass" style="display:none;" />
                                                <h4 class="checkout-title">Change Password</h4>

                                                <div class="row">
                                                    <div class="col-md-0 col-0 mb-0">
                                                        <input type="hidden" name="id" value="<%=a.getId()%>" placeholder="First Name">
                                                    </div>
                                                    <div class="col-md-6 col-12 mb-5">
                                                        <label>Current Password</label>
                                                        <input type="password" name="currPass" placeholder="Current Password">
                                                    </div>

                                                    <div class="col-md-6 col-12 mb-5">
                                                        <label>New Password</label>
                                                        <input type="password" name="newPass" placeholder="New Password">
                                                    </div>

                                                    <div class="col-12 mb-5">
                                                        <label>Re-enter New Password</label>
                                                        <input type="password" name="rePass" placeholder="Re-enter New Password">
                                                    </div>
                                                        <h3 style="color: red">${requestScope.error}</h3>
                                                    <button class="place-order" type="submit">Change Pass</button>

                                                </div>
                                            </div>
                                        </form>        

                                    </div>

                                </div>

                            </form>

                        </div>
                    </div>
                </div>
            </div><!-- Page Section End -->
            <% }%>
            <!-- Brand Section End -->

            <!-- Footer Top Section Start -->
            <jsp:include page="./common/footer.jsp" ></jsp:include>
            <!-- Footer Top Section End -->

            <!-- Footer Bottom Section Start -->
            <!-- Footer Bottom Section End -->

        </div>

        <!-- JS
        ============================================ -->

        <!-- jQuery JS -->
        <script src="assets/js/vendor/jquery-1.12.4.min.js"></script>
        <!-- Popper JS -->
        <script src="assets/js/popper.min.js"></script>
        <!-- Bootstrap JS -->
        <script src="assets/js/bootstrap.min.js"></script>
        <!-- Plugins JS -->
        <script src="assets/js/plugins.js"></script>
        <!-- Ajax Mail -->
        <script src="assets/js/ajax-mail.js"></script>
        <!-- Main JS -->
        <script src="assets/js/main.js"></script>

    </body>

</html>
