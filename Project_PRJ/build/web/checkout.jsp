<%-- 
    Document   : checkout
    Created on : Mar 10, 2022, 9:28:59 PM
    Author     : Admin
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

                <!-- Page Banner Section Start -->
                <div class="page-banner-section section" style="background-image: url(assets/images/hero/bannercarta.jpg)">
                    <div class="container">
                        <div class="row">
                            <div class="page-banner-content col">

                                <h1>Checkout</h1>
                                <ul class="page-breadcrumb">
                                    <li><a href="index.jsp">Home</a></li>
                                    <li><a href="checkout.jsp">Checkout</a></li>
                                </ul>

                            </div>
                        </div>
                    </div>
                </div><!-- Page Banner Section End -->

                <!-- Page Section Start -->
                <div class="page-section section mt-80 mt-lg-60 mt-md-60 mt-sm-60 mt-xs-40 mb-40 mb-lg-20 mb-md-20 mb-sm-20 mb-xs-0">
                    <div class="container">
                        <div class="row">

                            <div class="col-12">

                                <!-- Checkout Form s-->
                                <form action="InformationBill" method="post" class="checkout-form">
                                    <div class="row row-50">

                                        <div class="col-lg-7">
                                            <div class="row">

                                                <!-- Cart Total -->
                                                <div class="col-12 mb-40">

                                                    <h4 class="checkout-title">Cart Total</h4>

                                                    <div class="checkout-cart-total">

                                                        <h4>Product <span>Total</span></h4>

                                                        <ul>
                                                        <c:forEach items="${list}" var="cart">
                                                            <li>${cart.getProductname()} - ${cart.getQuantily()} <span>$${cart.getPrice()*(100-cart.getDiscount())/100*cart.getQuantily()}</span></li>

                                                        </c:forEach>
                                                    </ul>

                                                    <p>Sub Total <span>$${subtotal}</span></p>
                                                    <p>VAT <span>$${tax}</span></p>

                                                    <h4>Grand Total <span>$${total}</span></h4>

                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-5">
                                        <div class="row">
                                            <!-- Payment Method -->
                                            <div class="col-12 mb-40">

                                                <h4 class="checkout-title">Payment Method</h4>

                                                <div class="checkout-payment-method">
                                                    <div class="single-method">
                                                        <input type="radio" id="payment_bank" name="payment-method" value="bank">
                                                        <label for="payment_bank">Direct Bank Transfer</label>
                                                        <p data-method="bank">
                                                            Please transfer to:<br/>
                                                            recipient's name: nguyen van abc<br/>
                                                            account number :1221434343434<br/>
                                                            Bank name: viettinbank<br/>
                                                            <input type="text" id="payment_bank" name="note" value="" placeholder="Please enter your bank infomation">
                                                        </p>
                                                    </div>

                                                    <div class="single-method">
                                                        <input type="radio" id="payment_cash" name="payment-method" value="cash">
                                                        <label for="payment_cash">Cash on Delivery</label>
                                                        <p data-method="cash">Please pay for shipper</p>
                                                    </div>

                                                    <div class="single-method">
                                                        <input type="radio" id="payment_paypal" name="payment-method" value="paypal">
                                                        <label for="payment_paypal">Paypal</label>
                                                        <p data-method="paypal">Email:shopclothes@gmail.com<br/>
                                                            <input type="text" id="payment_bank" name="note" value="" placeholder="Please enter your paypal email">
                                                        </p>

                                                    </div>

                                                </div>

                                                <p style="color: red">${err}</p>
                                                <button class="place-order">Place order</button>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </form>

                        </div>
                    </div>
                </div>
            </div><!-- Page Section End -->

            <!-- Brand Section Start -->
            <div class="brand-section section mb-80 mb-lg-60 mb-md-60 mb-sm-60 mb-xs-40">
                <div class="container-fluid">
                    <div class="row">
                        <div class="brand-slider">

                            <div class="brand-item col">
                                <img src="assets/images/brands/brand-1.png" alt="">
                            </div>

                            <div class="brand-item col">
                                <img src="assets/images/brands/brand-2.png" alt="">
                            </div>

                            <div class="brand-item col">
                                <img src="assets/images/brands/brand-3.png" alt="">
                            </div>

                            <div class="brand-item col">
                                <img src="assets/images/brands/brand-4.png" alt="">
                            </div>

                            <div class="brand-item col">
                                <img src="assets/images/brands/brand-5.png" alt="">
                            </div>

                            <div class="brand-item col">
                                <img src="assets/images/brands/brand-6.png" alt="">
                            </div>

                        </div>
                    </div>
                </div>
            </div><!-- Brand Section End -->

            <!-- Footer Top Section Start -->


            <!-- Footer Bottom Section Start -->
            <jsp:include page="./common/footer.jsp" ></jsp:include>

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