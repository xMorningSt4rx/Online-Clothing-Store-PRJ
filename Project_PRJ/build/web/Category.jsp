<%@page import="model.Product"%>
<%@page import="java.util.ArrayList"%>
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
            <!-- Header BOttom End -->
            <jsp:include page="./common/header.jsp" ></jsp:include>
            </div><!-- Header Section End -->

            <!-- Page Banner Section Start -->
            <div class="page-banner-section section" style="background-image: url(assets/images/hero/t-t-1627-clothes-shop-display-banner-_ver_1.jpg)">
                <div class="container">
                    <div class="row">
                        <div class="page-banner-content col">

                            <h1>Shop</h1>
                            <ul class="page-breadcrumb">
                                <li><a href="index.jsp">Home</a></li>
                                <li><a href="shop.jsp">Shop</a></li>
                            </ul>

                        </div>
                    </div>
                </div>
            </div><!-- Page Banner Section End -->

            <!-- Page Section Start -->
            <div class="page-section section mt-80 mt-lg-60 mt-md-60 mt-sm-60 mt-xs-40 mb-80 mb-lg-60 mb-md-60 mb-sm-60 mb-xs-40">
                <div class="container">

                <%
                    if (request.getAttribute("error") != null) {
                %>
                <div class="row">
                    <div class="col-12">
                        <h2><%=request.getAttribute("error").toString()%></h2>
                    </div>
                </div>
                <%
                } else {
                %>

                <div class="row">

                    <div class="col-12">

                        <div class="product-short">
                            <form action="./search">
                                <% if (request.getAttribute("search") != null) {
                                %>
                                <input type="text" value="<%=request.getAttribute("search").toString()%>" name="searchString" id="searchString">
                                <%
                                } else {%>
                                <input type="text" value="" name="searchString" id="searchString">
                                <%}%>

                                <h4>Short by:</h4>
                                <select class="nice-select" id="sortby" name="sortby">
                                    <option value="1">Name Ascending</option>
                                    <option value="2">Name Descending</option>
                                    <option value="3">Price Ascending</option>
                                    <option value="4">Price Descending</option>
                                </select>
                                <button type="submit" class="btn">Re-Search</button>
                            </form>
                            <style>
                                #searchString{
                                    display: none;
                                }
                            </style>

                        </div>
                    </div>

                    <%
                        int a = Integer.parseInt(request.getAttribute("maxPage").toString());
                        ArrayList<Product> arr = (ArrayList<Product>) request.getAttribute("listsp");
                        for (int i = 0; i < arr.size(); i++) {
                    %>
                    <div class="col-xl-3 col-lg-4 col-md-6 col-12 mb-40">

                        <div class="product-item">
                            <div class="product-inner">

                                <div class="image">
                                    <img src="./assets/images/product/<%=arr.get(i).getImage()%>" alt="">

                                    <div class="image-overlay">
                                        <div class="action-buttons">
                                            <button><a href="detail?id=<%=arr.get(i).getProductid()%>">view Detail</a></button>
                                        </div>
                                    </div>

                                </div>
                                <style>
                                    h4{
                                        height: 50px;
                                    }
                                </style>
                                <div class="content">

                                    <div class="content-left">

                                        <h4 class="title"><a href="detail?id=<%=arr.get(i).getProductid()%>"><%=arr.get(i).getProductname()%></a></h4>

                                        <div class="ratting">

                                        </div>

                                        <h5 class="size">Size: <span><%=arr.get(i).getSize() %></span></h5>
                                        <h5 class="color">Color: <span style="background-color: #ffb2b0"></span><span style="background-color: #0271bc"></span><span style="background-color: #efc87c"></span><span style="background-color: #00c183"></span></h5>

                                    </div>

                                    <div class="content-right">
                                        <%
                                            if (arr.get(i).getDiscount() > 0) {

                                        %>
                                        <span class="price"><%=(arr.get(i).getPrice() * (100 - arr.get(i).getDiscount()) / 100)%>$<span class="old"><%=arr.get(i).getPrice()%>$</span></span>
                                        <%} else {
                                        %>
                                        <span class="price"><%=arr.get(i).getPrice()%>$</span>
                                        <% }%>
                                        <div class="ratting">
                                            <p></p>
                                        </div>
                                    </div>

                                </div>

                            </div>
                        </div>

                    </div>

                    <%
                        }
                    %>

                    <div class="col-12">
                        <ul class="page-pagination">
                            <li><a href="#"><i class="fa fa-angle-left"></i></a></li>

                            <%
                                String id = request.getAttribute("category").toString();
                                for (int i = 1; i <= a; i++) {

                                   %>
                                   <li class=""><a href="./Category?id=<%=id %>&page=<%=i%>"><%=i%></a></li>
                                   <%
                           
                                }
                                %>
                            <li><a href="#"><i class="fa fa-angle-right"></i></a></li>
                        </ul>
                    </div>

                </div>
                <% }%>
            </div>
        </div><!-- Page Section End -->

        <!-- Brand Section End -->
        <jsp:include page="./common/footer.jsp" ></jsp:include>
        <!-- Footer Top Section Start -->

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