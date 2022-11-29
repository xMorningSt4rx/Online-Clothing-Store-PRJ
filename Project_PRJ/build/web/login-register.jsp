<%-- 
    Document   : login-register
    Created on : Feb 21, 2022, 11:16:01 PM
    Author     : Admin
--%>

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

                    <h1>Login & Register</h1>
                    <ul class="page-breadcrumb">
                        <li><a href="index.jsp">Home</a></li>
                       
                    </ul>

                </div>
            </div>
        </div>
    </div><!-- Page Banner Section End -->

    <!-- Page Section Start -->
    <div class="page-section section mt-80 mt-lg-60 mt-md-60 mt-sm-60 mt-xs-40 mb-40 mb-lg-20 mb-md-20 mb-sm-20 mb-xs-0">
        <div class="container">
            <div class="row">

                <div class="col-lg-4 col-12 mb-40">
                    <div class="login-register-form-wrap">
                        <h3>Login</h3>
                        <form action="./Login" method="POST" class="mb-30">
                            <div class="row">
                                <div class="col-12 mb-15"><input required type="text" name="username" placeholder="Username"></div>
                                <div class="col-12 mb-15"><input required type="password" name="password" placeholder="Password"></div>
                                <p style="color: red;">${requestScope.error}</p>
                                <div class="col-12"><input type="submit" value="Login"></div>
                            </div>
                        </form>
                      
                    </div>
                </div>

                <div class="col-lg-2 col-12 mb-40 text-center">
                    <span class="login-register-separator"></span>
                </div>

                <div class="col-lg-6 col-12 mb-40 ml-auto">
                    <div class="login-register-form-wrap">
                        <h3>Register</h3>
                        <form action="./Register" method="POST">
                            <div class="row">
                                <div class="col-md-6 col-12 mb-15"><input  required type="text" name="UserName" placeholder="User Name"></div>
                               
                                 <div class="col-md-6 col-12 mb-15"><input  required type="password" name="password" placeholder="Password"></div>
                                
                                <div class="col-md-6 col-12 mb-15"><input required type="text" name="address" placeholder="Address"></div>
                               <div class="col-md-6 col-12 mb-15"><input required type="text" name="phoneNumber" placeholder="Phone Number"></div>
                               <div class="col-md-6 col-12 mb-15"><input required type="text" name="yourName" placeholder="Your Name"></div>
                         
                           
                               <div class="col-md-6 col-12"><input type="submit" value="Register"></div>
                            </div>
                            <h3 style="color: saddlebrown;">${requestScope.mess}</h3>
                        </form>
                    </div>
                </div>
                
            </div>
        </div>
    </div><!-- Page Section End -->

   <!-- Brand Section End -->

    <!-- Footer Top Section Start -->
    <div class="footer-top-section section bg-theme-two-light pt-80 pt-lg-60 pt-md-60 pt-sm-60 pt-xs-40 pb-40 pb-lg-20 pb-md-20 pb-sm-20 pb-xs-0">
        <div class="container">
            <div class="row">

                <div class="footer-widget col-lg-3 col-md-6 col-12 mb-40">
                    <h4 class="title">CONTACT US</h4>
                    <p>You address will be here<br/> Lorem Ipsum text</p>
                    <p><a href="tel:01234567890">01234 567 890</a><a href="tel:01234567891">01234 567 891</a></p>
                    <p><a href="mailto:info@example.com">info@example.com</a><a href="#">www.example.com</a></p>
                </div>

                <div class="footer-widget col-lg-3 col-md-6 col-12 mb-40">
                    <h4 class="title">PRODUCTS</h4>
                    <ul>
                        <li><a href="#">New Arrivals</a></li>
                        <li><a href="#">Best Seller</a></li>
                        <li><a href="#">Trendy Items</a></li>
                        <li><a href="#">Best Deals</a></li>
                        <li><a href="#">On Sale Products</a></li>
                        <li><a href="#">Featured Products</a></li>
                    </ul>
                </div>

                <div class="footer-widget col-lg-3 col-md-6 col-12 mb-40">
                    <h4 class="title">INFORMATION</h4>
                    <ul>
                        <li><a href="#">About us</a></li>
                        <li><a href="#">Terms & Conditions</a></li>
                        <li><a href="#">Payment Method</a></li>
                        <li><a href="#">Product Warranty</a></li>
                        <li><a href="#">Return Process</a></li>
                        <li><a href="#">Payment Security</a></li>
                    </ul>
                </div>

                <div class="footer-widget col-lg-3 col-md-6 col-12 mb-40">
                    <h4 class="title">NEWSLETTER</h4>
                    <p>Subscribe our newsletter and get all update of our product</p>

                    <form id="mc-form" class="mc-form footer-subscribe-form" novalidate="true">
                        <input id="mc-email" autocomplete="off" placeholder="Enter your email here" name="EMAIL" type="email">
                        <button id="mc-submit"><i class="fa fa-paper-plane-o"></i></button>
                    </form>
                    <!-- mailchimp-alerts Start -->
                    <div class="mailchimp-alerts">
                        <div class="mailchimp-submitting"></div><!-- mailchimp-submitting end -->
                        <div class="mailchimp-success"></div><!-- mailchimp-success end -->
                        <div class="mailchimp-error"></div><!-- mailchimp-error end -->
                    </div><!-- mailchimp-alerts end -->

                    <h5>FOLLOW US</h5> 
                    <p class="footer-social"><a href="#">Facebook</a> - <a href="#">Twitter</a> - <a href="#">Google+</a></p>

                </div>

            </div>
        </div>
    </div><!-- Footer Top Section End -->

    <!-- Footer Bottom Section Start -->
    <div class="footer-bottom-section section bg-theme-two pt-15 pb-15">
        <div class="container">
            <div class="row">
                <div class="col text-center">
                    <p class="footer-copyright">Copyright &copy; All rights reserved</p>
                </div>
            </div>
        </div>
    </div><!-- Footer Bottom Section End -->

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
