<%-- 
    Document   : index
    Created on : Feb 21, 2022, 10:01:03 PM
    Author     : Admin
--%>

<%@page import="java.util.List"%>
<%@page import="model.Product"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dal.DaoProduct"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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

            <!-- Header -->
            <jsp:include page="./common/header.jsp" ></jsp:include>

                <!-- Hero Section Start -->
                <div class="hero-section section">
                    <!-- Hero Item Start -->
                    <!-- Hero Slider Start -->
                    <div class="hero-slider hero-slider-one fix">
                        <!-- Hero Item Start -->
                        <div class="hero-item"><img width="1950px" src="assets/images/hero/bannerend.jpg"></div>
                    </div><!-- Hero Item End -->

                </div><!-- Hero Slider End -->

            </div><!-- Hero Section End -->

            <!-- Banner Section Start -->
            <div class="banner-section section mt-40 mt-xs-20 mb-60 mb-lg-40 mb-md-40 mb-sm-40 mb-xs-20">
                <div class="container-fluid">
                    <div class="row row-10">

                        <div class="col-lg-4 col-md-6 col-12 mb-20">
                            <div class="banner banner-1 content-left content-middle">

                                <a href="#" class="image"><img height="560" src="assets/images/banner/Men Long-Sleeved1.jpg" alt="Banner Image"></a>

                                <div class="content">
                                    <h1 style="color: tomato" >New Arrival</h1><br/>
                                    <h2 style="color: tomato">Men's Shirt</h2>
                              
                                </div>

                            </div>
                        </div>

                        <div class="col-lg-4 col-md-6 col-12 mb-20">
                            <a href="#" class="banner banner-2">

                                <img height="560"src="assets/images/banner/mau-vay-xoe-lien-than-du-tiec_dc9cdcb87903419aa9a6f7875ffd46e8.jpg" alt="Banner Image">

                                <div class="content bg-theme-one">
                                    <h1>Very hot new dress model</h1>
                                </div>

                                <span class="banner-offer">25% off</span>

                            </a>
                        </div>

                        <div class="col-lg-4 col-md-6 col-12 mb-20">
                            <div class="banner banner-1 content-left content-top">

                                <a href="#" class="image"><img height="560" src="assets/images/banner/ttl836-ao-thun-tay-lo-form-rong-hinh-dia-bay7-1.jpg" alt="Banner Image"></a>

                                <div class="content">
                                    <h1>Trendy collection</h1>
                               
                                </div>

                            </div>
                        </div>

                    </div>
                </div>
            </div><!-- Banner Section End -->

            <!-- Product Section Start -->
            <div class="product-section section mb-40 mb-lg-20 mb-md-20 mb-sm-20 mb-xs-0">
                <div class="container">

                    <div class="row">
                        <div class="section-title text-center col mb-30">
                            <h1>Popular Products</h1>
                         
                        </div>
                    </div>

                    <div class="row">
                    <%
                        DaoProduct dp = new DaoProduct();
                        List<Product> arrp = dp.getTop();
                        for (int i = 0; i < arrp.size(); i++) {
                            Product pd = arrp.get(i);
                    %>
                    <div class="col-xl-3 col-lg-4 col-md-6 col-12 mb-40">

                        <div class="product-item">
                            <div class="product-inner">

                                <div class="image">
                                    <img height="270" width="320" src="./assets/images/product/<%=pd.getImage()%>" alt="">

                                    <div class="image-overlay">
                                        <div class="action-buttons">
                                            <button><a href="detail?id=<%=pd.getProductid()%>">view Detail</a>
                                            </button> 
                                        </div>
                                    </div>

                                </div>

                                <div class="content">

                                    <div class="content-left">

                                        <h4 class="title"><a href="detail?id=<%=pd.getProductid()%>"><%=pd.getProductname()%></a></h4>

                                        <div class="ratting">
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star-half-o"></i>
                                            <i class="fa fa-star-o"></i>
                                        </div>

                                        <h5 class="size">Size: <span><%=pd.getSize()%></span></h5>
                                        <h5 class="color">Color: <span style="background-color: #ffb2b0"></span><span style="background-color: #0271bc"></span><span style="background-color: #efc87c"></span><span style="background-color: #00c183"></span></h5>

                                    </div>

                                    <div class="content-right">
                                  <span class="price"><%=(pd.getPrice() * (100 - pd.getDiscount()) / 100)%>$<span class="old"><%=pd.getPrice()%>$</span></span>
                                    </div>

                                </div>

                            </div>
                        </div>

                    </div>
                    <%
                        }
                    %>

                </div>

            </div>
        </div><!-- Product Section End -->

        <!-- Banner Section Start -->
        <div class="banner-section section fix mb-70 mb-lg-50 mb-md-50 mb-sm-50 mb-xs-30">
            <div class="row row-5">

                <div class="col-lg-4 col-md-6 col-12 mb-10">
                    <div class="banner banner-3">

                        <a href="#" class="image"><img src="assets/images/banner/freeship.jpg" alt="Banner Image"></a>

                        <div class="content" style="background-image: url(assets/images/banner/banner-3-shape.png)">
                            <h1>New Arrivals</h1>

                            <h2>Up to 35% off</h2>

                        </div>

                        <a href="#" class="shop-link" data-hover="SHOP NOW">SHOP NOW</a>

                    </div>
                </div>

                <div class="col-lg-4 col-md-6 col-12 mb-10">
                    <div class="banner banner-4">

                        <a href="#" class="image"><img src="assets/images/banner/sale50.png" alt="Banner Image"></a>

                        <div class="content">
                            <div class="content-inner">
                                <h1>Online Shopping</h1>
                                <h2>SALE 50%</h2>
                                <a href="#" data-hover="SHOP NOW">SHOP NOW</a>
                            </div>
                        </div>


                    </div>
                </div>

                <div class="col-lg-4 col-md-6 col-12 mb-10">
                    <div class="banner banner-5">

                        <a href="#" class="image"><img src="assets/images/banner/dd.jpg" alt="Banner Image"></a>

                        <div class="content" style="background-image: url(assets/images/banner/banner-5-shape.png)">
                            <h2>Collection</h2>
                            <h2>for friend</h2>
                            <h3>SALE 35%</h3>
                        </div>

                        <a href="#" class="shop-link" data-hover="SHOP NOW">SHOP NOW</a>

                    </div>
                </div>

            </div>
        </div><!-- Banner Section End -->

        <!-- Product Section Start -->
        <div class="product-section section mb-40 mb-lg-20 mb-md-20 mb-sm-20 mb-xs-0">
            <div class="container">
                <div class="row">

                    <div class="col-lg-4 col-md-6 col-12 mb-40">

                        <div class="row">
                            <div class="section-title text-left col mb-30">
                                <h1>Best Deal</h1>
                                <p>Exclusive deals for you</p>
                            </div>
                        </div>
                        <%
                            List<Product> d = dp.getDiscountBest();
                            for (int j = 0; j < d.size(); j++) {
                        %>
                        <div class="best-deal-slider row">

                            <div class="slide-item col">
                                <div class="best-deal-product">

                                    <div class="image"><img height="370" width="547" src="./assets/images/product/<%=d.get(j).getImage()%>" alt=""></div>

                                    <div class="content-top">

                                        <div class="content-top-left">
                                            <h4 class="title"><a href="#"><%=d.get(j).getProductname() %></a></h4>
                                            <div class="ratting">
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star-half-o"></i>
                                            </div>
                                        </div>

                                        <div class="content-top-right">
                                            <span class="price"><%=(d.get(j).getPrice() * (100 - d.get(j).getDiscount()) / 100)%>$
                                                <span class="old"><%=d.get(j).getPrice() %>$</span></span>
                                        </div>

                                    </div>

                                    <div class="content-bottom">

                                        <a href="detail?id=<%=d.get(j).getProductid()%>" data-hover="SHOP NOW">SHOP NOW</a>
                                    </div>

                                </div>
                            </div>

                            <div class="slide-item col">
                                <div class="best-deal-product">

                                    <div class="image"><img src="assets/images/product/best-deal-2.jpg" alt=""></div>

                                    <div class="content-top">

                                        <div class="content-top-left">
                                            <h4 class="title"><a href="#">Kelly Shirt Set</a></h4>
                                            <div class="ratting">
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star-o"></i>
                                            </div>
                                        </div>

                                        <div class="content-top-right">
                                            <span class="price">$09 <span class="old">$25</span></span>
                                        </div>

                                    </div>

                                    <div class="content-bottom">
                                        <div class="countdown" data-countdown="2019/06/20"></div>
                                        <a href="#" data-hover="SHOP NOW">SHOP NOW</a>
                                    </div>

                                </div>
                            </div>

                        </div>
                                           <% }%>

                    </div>

                    <div class="col-lg-8 col-md-6 col-12 pl-50 pl-sm-15 pl-xs-15">

                        <div class="row">
                            <div class="section-title text-left col mb-30">
                                <h1>On Sale Products</h1>


                            </div>
                        </div>

                        <div class="small-product-slider row row-7">
                            <%
                                List<Product> discount = dp.getDiscountProduct();
                                for (int i = 0; i < discount.size(); i++) {
                            %>
                            <div class="col mb-40">
                                <div class="on-sale-product">
                                    <a href="single-product.jsp" class="image"><img height="174" width="165"src="./assets/images/product/<%=discount.get(i).getImage()%>" alt=""></a>
                                    <div class="content text-center">
                                        <h4 class="title"><a href="detail?id=<%=discount.get(i).getProductid()%>"> <%=discount.get(i).getProductname()%></a></h4>
                                        <span class="price"><%=(discount.get(i).getPrice() * (100 - discount.get(i).getDiscount()) / 100)%>$<span class="old"><%=discount.get(i).getPrice()%>$</span></span>
                                        <div class="ratting">
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star-half-o"></i>
                                            <i class="fa fa-star-o"></i>
                                        </div>
                                    </div>
                                </div>

                            </div>
                            <% }%>
                        </div>

                    </div>

                </div>
            </div>
        </div><!-- Product Section End -->

        <!-- Feature Section Start -->
        <div class="feature-section section bg-theme-two pt-65 pt-lg-55 pt-md-45 pt-sm-45 pt-xs-25 pb-65 pb-lg-55 pb-md-45 pb-sm-45 pb-xs-25 fix" style="background-image: url(assets/images/pattern/pattern-dot.png);">
            <div class="container">
                <div class="feature-wrap row justify-content-between">

                    <div class="col-md-4 col-12 mt-15 mb-15">
                        <div class="feature-item text-center">

                            <div class="icon"><img src="assets/images/feature/feature-1.png" alt=""></div>
                            <div class="content">
                                <h3>Free Shipping</h3>

                            </div>

                        </div>
                    </div>

                    <div class="col-md-4 col-12 mt-15 mb-15">
                        <div class="feature-item text-center">

                            <div class="icon"><img src="assets/images/feature/feature-2.png" alt=""></div>
                            <div class="content">
                                <h3>100% good product, good quality and affordable price</h3>

                            </div>

                        </div>
                    </div>

                    <div class="col-md-4 col-12 mt-15 mb-15">
                        <div class="feature-item text-center">

                            <div class="icon"><img src="assets/images/feature/feature-3.png" alt=""></div>
                            <div class="content">
                                <h3>Secure Payment</h3>
                                <p>Payment Security</p>

                            </div>

                        </div>
                    </div>

                </div>
            </div>
        </div><!-- Feature Section End -->

        <!-- Blog Section Start -->
        <!-- Blog Section End -->

        <!-- Brand Section Start -->
        <!-- Brand Section End -->

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