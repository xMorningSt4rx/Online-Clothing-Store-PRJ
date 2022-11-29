<%-- 
    Document   : ManageProduct
    Created on : Mar 2, 2022, 11:32:39 AM
    Author     : Admin
--%>

<%@page import="model.Category"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dal.DaoCategory"%>
<%@page import="java.util.List"%>
<%@page import="model.Product"%>
<%@page import="dal.DaoProduct"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <meta http-equiv="X-UA-Compatible" content="ie=edge" />
        <title>CLOTHES SHOP-ADMIN</title>
        <link
            rel="stylesheet"
            href="https://fonts.googleapis.com/css?family=Roboto:400,700"
            />
        <!-- https://fonts.google.com/specimen/Roboto -->
        <link rel="stylesheet" href="http://localhost:8080/project/assets/css/fontawesome.min.css" />
        <!-- https://fontawesome.com/ -->
        <link rel="stylesheet" href="http://localhost:8080/project/assets/css/bootstrap.min.css" />
        <!-- https://getbootstrap.com/ -->
        <link rel="stylesheet" href="http://localhost:8080/project/assets/css/templatemo-style.css">
        <!--
            Product Admin CSS Template
            https://templatemo.com/tm-524-product-admin
        -->
    </head>

    <body id="reportsPage">
        <nav class="navbar navbar-expand-xl">
            <jsp:include page="./AdminCommon/header.jsp" ></jsp:include>
            </nav>
            <div class="container mt-5">
                <div class="row tm-content-row">
                    <div class="col-sm-12 col-md-12 col-lg-8 col-xl-8 tm-block-col">
                        <form action="Product" method="POST">
                            <div class="tm-bg-primary-dark tm-block tm-block-products">
                                <div class="tm-product-table-container">
                                    <table class="table table-hover tm-table-small tm-product-table">
                                        <thead>
                                            <tr>

                                                <th scope="col">Product ID</th>
                                                <th scope="col">Product Name</th>
                                                <th scope="col">Decription</th>
                                                <th scope="col">Image</th>
                                                <th scope="col">Price</th>
                                                <th scope="col">Quantity</th>
                                                <th scope="col">Category</th>
                                                <th scope="col">Discount</th>
                                                <th scope="col">SIZE</th>
                                                <th scope="col">Action</th>

                                                <th scope="col">&nbsp;</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        <%
                                            DaoProduct dp = new DaoProduct();
                                            List<Product> arrp = dp.getProduct();
                                            for (int i = 0; i < arrp.size(); i++) {
                                                Product pd = arrp.get(i);
                                        %>
                                        <tr onclick="editProduct(<%=pd.getProductid()%>)">

                                            <td><%= pd.getProductid()%></td>
                                            <td class="tm-product-name"><%= pd.getProductname()%></td>
                                            <td><%= pd.getDetail()%></td>
                                            <td><img height="50px" width="50px" src="..//assets/images/product/<%=pd.getImage()%>"></td>
                                            <td><%= pd.getPrice()%></td>
                                            <td><%= pd.getQuantily()%></td>
                                            <td><%= pd.getCategoryID()%></td>
                                            <td><%= pd.getDiscount()%></td>
                                            <td><%= pd.getSize()%></td>
                                            <td>
                                                <input id="type" type="text" name="type" value="delete" style="display:none;" />
                                                <a href="../Product?id=<%= pd.getProductid()%>&type=delete" class="tm-product-delete-link">
                                                    <i class="far fa-trash-alt tm-product-delete-icon"></i>
                                                </a>
                                            </td>
                                        </tr>

                                    </tbody>
                                    <%
                                        }
                                    %>
                                </table>
                            </div>
                            <!-- table container -->
                            <a
                                href="add-product.jsp"
                                class="btn btn-primary btn-block text-uppercase mb-3">Add new product</a>

                        </div>
                    </form>
                </div>
                <div class="col-sm-12 col-md-12 col-lg-4 col-xl-4 tm-block-col">
                    <div class="tm-bg-primary-dark tm-block tm-block-product-categories">
                        <h2 class="tm-block-title">Product Categories</h2>
                        <div class="tm-product-table-container">
                            <table class="table tm-table-small tm-product-table">
                                <tbody>
                                    <%
                                        DaoCategory dc = new DaoCategory();
                                        List<Category> ac = dc.getCategory();
                                        for (int i = 0; i < ac.size(); i++) {
                                            Category ca = ac.get(i);

                                    %>
                                    <tr onclick="editCategory(<%=ca.getId()%>)">
                                        <td class="tm-product-name"><%=ca.getId()%></td>
                                        <td><%=ca.getName()%></td>
                                        <td class="text-center">
                                            <input id="type" type="text" name="type" value="delete" style="display:none;" />
                                            <a href="../CategoryAdmin?id=<%= ca.getId()%>&type=delete" class="tm-product-delete-link">
                                                <i class="far fa-trash-alt tm-product-delete-icon"></i>
                                            </a>
                                        </td>
                                    </tr>

                                </tbody>
                                <%
                                    }
                                %>
                            </table>
                        </div>
                        <!-- table container -->
                        <a
                            href="add-Category.jsp"
                            class="btn btn-primary btn-block text-uppercase mb-3">   Add new category</a>

                    </div>
                </div>
            </div>
        </div>
        <footer class="tm-footer row tm-mt-small">
            <jsp:include page="./AdminCommon/footer.jsp" ></jsp:include>
        </footer>

        <script src="http://localhost:8080/project/assets/js/jquery-3.3.1.min.js"></script>
        <!-- https://jquery.com/download/ -->
        <script src="http://localhost:8080/project/assets/js/bootstrap.min.js"></script>
        <!-- https://getbootstrap.com/ -->
        <script>
                                        function editProduct(id) {
                                            window.location.href = "../Product?id=" + id;
                                        }
                                        function editCategory(id) {
                                            window.location.href = "../CategoryAdmin?id=" + id;
                                        }
        </script>
    </body>
</html>