<%-- 
    Document   : edit-product
    Created on : Mar 2, 2022, 12:21:14 PM
    Author     : Admin
--%>

<%@page import="model.Product"%>
<%@page import="dal.DaoProduct"%>
<%@page import="java.util.List"%>
<%@page import="model.Category"%>
<%@page import="dal.DaoCategory"%>
<%@page import="dal.DaoCategory"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <meta http-equiv="X-UA-Compatible" content="ie=edge" />
        <title>UPDATE Product</title>
        <link
            rel="stylesheet"
            href="https://fonts.googleapis.com/css?family=Roboto:400,700"
            />
        <!-- https://fonts.google.com/specimen/Roboto -->
        <link rel="stylesheet" href="http://localhost:8080/project/assets/css/fontawesome.min.css" />
        <!-- https://fontawesome.com/ -->
        <link rel="stylesheet" href="http://localhost:8080/project/assets/jquery-ui-datepicker/jquery-ui.min.css" type="text/css" />
        <!-- http://api.jqueryui.com/datepicker/ -->
        <link rel="stylesheet" href="http://localhost:8080/project/assets/css/bootstrap.min.css" />
        <!-- https://getbootstrap.com/ -->
        <link rel="stylesheet" href="http://localhost:8080/project/assets/css/templatemo-style.css">
        <!--
            Product Admin CSS Template
            https://templatemo.com/tm-524-product-admin
        -->
    </head>

    <body>
        <nav class="navbar navbar-expand-xl">
            <jsp:include page="./AdminCommon/header.jsp" ></jsp:include>
            <%
                Product p = (Product) request.getAttribute("product");
            %>
        </nav>
        <div class="container tm-mt-big tm-mb-big">
            <div class="row">
                <div class="col-xl-9 col-lg-10 col-md-12 col-sm-12 mx-auto">
                    <div class="tm-bg-primary-dark tm-block tm-block-h-auto">
                        <div class="row">
                            <div class="col-12">
                                <h2 class="tm-block-title d-inline-block">Edit Product</h2>
                            </div>
                        </div>

                        <div class="row tm-edit-product-row">
                            <div class="col-xl-6 col-lg-6 col-md-12">
                                <p>${requestScope.messenger}</p>
                                <form action="Product" method="POST" class="tm-edit-product-form">
                                    <input id="type" type="text" style="display:none;" />
                                    <div class="form-group mb-3">
<!--                                        <label
                                            for="ProductID"
                                            >Product ID
                                        </label>-->
                                        <input id="ID" name="id" type="text" value="<%=p.getProductid()%>" class="form-control validate" style="display: none;"/>
                                    </div>
                                    <div class="form-group mb-3">
                                        <label
                                            for="name"
                                            >Product Name
                                        </label>
                                        <input
                                            id="name"
                                            name="name"
                                            type="text"
                                            value="<%=p.getProductname()%>"
                                            class="form-control validate"
                                            />
                                    </div>
                                    <div class="form-group mb-3">
                                        <label
                                            for="description"
                                            >Description</label
                                        >
                                        <input
                                            id="description"
                                            name="description"
                                            type="text"
                                            value="<%=p.getDetail()%>"
                                            class="form-control validate"
                                            />
                                    </div>
                                             <div class="form-group mb-3">
                                        <label
                                            for="Discount"
                                            >img 
                                        </label>
                                        <input
                                            id="Discount"
                                            name="img"
                                            type="text"
                                            value="<%=p.getImage()%>"
                                            class="form-control validate"
                                            />
                                    </div>
                                    <div class="form-group mb-3">
                                        <label
                                            for="Price"
                                            >Price
                                        </label>
                                        <input
                                            id="Price"
                                            name="Price"
                                            type="text"
                                            value="<%=p.getPrice()%>"
                                            class="form-control validate"
                                            />
                                    </div>
                                    <div class="form-group mb-3">
                                        <label
                                            for="Quantity"
                                            >Quantity
                                        </label>
                                        <input
                                            id="Quantity"
                                            name="Quantity"
                                            type="text"
                                            value="<%=p.getQuantily()%>"
                                            class="form-control validate"
                                            />
                                    </div>
                                    <div class="form-group mb-3">
                                        <label
                                            for="category"
                                            >Category</label
                                        >
                                        <select class="custom-select tm-select-accounts" id="category" name="category">
                                            <%
                                                DaoCategory dc = new DaoCategory();
                                                List<Category> ac = dc.getCategory();
                                                for (int j = 0; j < ac.size(); j++) {
                                                    Category ca = ac.get(j);

                                            %>

                                            <option name="category" value="<%=ca.getId()%>"><%=ca.getName()%></option>
                                            <%
                                                }
                                            %>

                                        </select>

                                    </div>
                                    <div class="form-group mb-3">
                                        <label
                                            for="Discount"
                                            >Discount
                                        </label>
                                        <input
                                            id="Discount"
                                            name="Discount"
                                            type="text"
                                            value="<%=p.getDiscount()%>"
                                            class="form-control validate"
                                            />
                                    </div>
                                               <div class="form-group mb-3">
                                        <label
                                            for="size"
                                            >Size
                                        </label>
                                        <input
                                            id="Discount"
                                            name="size"
                                            type="text"
                                            value="<%=p.getSize()%>"
                                            class="form-control validate"
                                            />
                                    </div>
                                   
                                    <div class="col-12">
                                        <input id="type" type="text" name="type" value="edit" style="display:none;" />
                                        <button type="submit" class="btn btn-primary btn-block text-uppercase">Update Now</button>
                                    </div>      
                                </form>

                            </div>

                            <div class="col-xl-6 col-lg-6 col-md-12 mx-auto mb-4">
                                <div class="tm-product-img-edit mx-auto">
                                    <img src="./assets/images/product/<%=p.getImage()%>" alt="Product image" class="img-fluid d-block mx-auto">
                                </div>
                                <div class="custom-file mt-3 mb-3">
                                    <form method="post" action="./Product?id=<%=p.getProductid()%>" enctype="multipart/form-data">
                                        <input id="fileInput" type="file" name="file" style="display:none;" />

                                       
                                      
                                    </form>
                                </div>
                            </div>

                        </div>

                    </div>
                </div>
            </div>
        </div>
        <footer class="tm-footer row tm-mt-small">

        </footer> 

        <script src="js/jquery-3.3.1.min.js"></script>
        <!-- https://jquery.com/download/ -->
        <script src="jquery-ui-datepicker/jquery-ui.min.js"></script>
        <!-- https://jqueryui.com/download/ -->
        <script src="js/bootstrap.min.js"></script>
        <!-- https://getbootstrap.com/ -->
        <script>
                                                document.getElementById("category").value = <%=p.getCategoryID()%>;
        </script> 
    </body>
</html>

