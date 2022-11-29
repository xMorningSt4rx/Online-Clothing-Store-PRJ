<%-- 
    Document   : single-product
    Created on : Mar 1, 2022, 8:44:55 PM
    Author     : Admin
--%>

<%@page import="java.util.List"%>
<%@page import="dal.DaoCategory"%>
<%@page import="model.Product"%>
<%@page import="dal.DaoProduct"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

    <body  >



        <!-- Header Section Start -->
        <jsp:include page="./common/header.jsp" ></jsp:include>
            <!-- Header Section End -->

            <!-- Page Banner Section Start -->
            <div class="page-banner-section section" style="background-image: url(assets/images/hero/t-t-1627-clothes-shop-display-banner-_ver_1.jpg)">
                <div class="container">
                    <div class="row">
                        <div class="page-banner-content col">

                            <h1>Single Product</h1>
                            <ul class="page-breadcrumb">
                                <li><a href="index.jsp">Home</a></li>
                                <li><a href="single-product.jsp">Single Product</a></li>
                            </ul>

                        </div>
                    </div>
                </div>
            </div><!-- Page Banner Section End -->

            <!-- Page Section Start -->
            <div class="page-section section mt-80 mt-lg-60 mt-md-60 mt-sm-60 mt-xs-40 mb-80 mb-lg-60 mb-md-60 mb-sm-60 mb-xs-40">
                <div class="container">
                    <div class="row row-30">
                    <%
                        Product product = (Product) request.getAttribute("product");


                    %>
                    <div class="col-12">
                        <div class="row row-20 mb-20 mb-xs-0">

                            <div class="col-lg-6 col-12 mb-40">

                                <div class="pro-large-img mb-10 fix easyzoom easyzoom--overlay easyzoom--with-thumbnails">
                                    <a href="./assets/images/product/<%=product.getImage()%>">
                                        <img src="./assets/images/product/<%=product.getImage()%>" alt=""/>
                                    </a>
                                </div>

                            </div>

                            <div class="col-lg-6 col-12 mb-40">
                                <div class="single-product-content">

                                    <div class="head">
                                        <div class="head-left">

                                            <h3 class="title"><%= product.getProductname()%></h3>

                                            <div class="ratting">
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star-half-o"></i>
                                                <i class="fa fa-star-o"></i>
                                            </div>

                                        </div>

                                        <div class="head-right">
                                            <%
                                                if (product.getDiscount() > 0) {

                                            %>
                                            <span class="price"><%=(product.getPrice() * (100 - product.getDiscount()) / 100)%>$
                                                <br/>

                                                <span class="old" style=" text-decoration: line-through"><%=product.getPrice()%>$</span></span>
                                                <%} else {
                                                %>

                                            <span class="price"><%=product.getPrice()%>$</span>
                                            <% }%>
                                        </div>
                                    </div>

                                    <div class="description">
                                        <p><%= product.getDetail()%></p>
                                    </div>

                                    <span class="availability">Availability: <span><%=product.getQuantily() > 0 ? "In Stock" : "not In Stock"%></span></span>

                                    <div class="quantity-colors">
                                        <form action="Cart">
                                            <div class="quantity">
                                                <h5>Quantity:</h5>
                                                <div class="pro-qty"><input name="quantity" type="number" value="1" min="<%= product.getQuantily() > 0 ? "1" :"0" %>" max="<%= product.getQuantily() > 0 ?product.getQuantily() :"0"%>" />
                                            </div>                            

                                            <input type="hidden" name="id" value="<%= product.getProductid()%>" >
                                            <div class="colors">
                                                <h5>SIZE</h5>
                                                <div class="color-options">
                                                    <div class="pro-si">
                                                        <select name="size">
                                                            <% String s[] = product.getSize().split("-");
                                                                pageContext.setAttribute("size", s);
                                                            %>
                                                            <c:forEach var="s" items="${size}">
                                                                <option value="${s}">   
                                                                    ${s}
                                                                </option> 
                                                            </c:forEach>



                                                        </select> <br/>

                                                    </div>

                                                </div>
                                            </div>    


                                    </div>

                                    <div class="actions">

                                        <button type="submit"><i class="ti-shopping-cart"></i><span>ADD TO CART</span></button>
                                        <button class="box" data-tooltip="Compare"><i class="ti-control-shuffle"></i></button>


                                    </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div><!-- Page Section End -->
        <div class="row mb-60 mb-xs-40">

        </div>
        <%
            DaoCategory category = new DaoCategory();
            List<Product> list = category.RelatedCattegory(product.getCategoryID(), product.getProductid());

        %>
        <div class="row">

            <div class="section-title text-left col col mb-60 mb-sm-40 mb-xs-30">
                <h1> Related Product </h1>
            </div>

            <div class="related-product-slider related-product-slider-1 col-12 p-0">
                <%  for (int i = 0; i < list.size(); i++) {
                        Product pd = list.get(i);

                %>
                <div class="col">

                    <div class="product-item">
                        <div class="product-inner">

                            <div class="image">
                                <img src="./assets/images/product/<%=pd.getImage()%>" alt="">

                                <div class="image-overlay">
                                    <div class="action-buttons">
                                        <button><a href="detail?id=<%=pd.getProductid()%>">view Detail</a></button> 
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
                                    <span class="price"><%=(pd.getPrice() * (100 - pd.getDiscount()) / 100)%>$
                                        <span class="old"><%=pd.getPrice()%> $</span></span>
                                </div>

                            </div>

                        </div>
                    </div>

                </div>
                <% }%>
            </div>

        </div>
        <div class="brand-section section mb-80 mb-lg-60 mb-md-60 mb-sm-60 mb-xs-40">
            <div class="container-fluid">
                <div class="row">

                </div>
            </div>
        </div>

        <jsp:include page="./common/footer.jsp" ></jsp:include>
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
