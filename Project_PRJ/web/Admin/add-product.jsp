<%-- 
    Document   : add-product
    Created on : Mar 2, 2022, 11:57:16 AM
    Author     : Admin
--%>

<%@page import="java.util.List"%>
<%@page import="model.Category"%>
<%@page import="dal.DaoCategory"%>
<%@page import="dal.DaoCategory"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <meta http-equiv="X-UA-Compatible" content="ie=edge" />
        <title>Add Product</title>
        <link
            rel="stylesheet"
            href="https://fonts.googleapis.com/css?family=Roboto:400,700"
            />
        <!-- https://fonts.google.com/specimen/Roboto -->
        <link rel="stylesheet" href="http://localhost:8080/project/assets//css/fontawesome.min.css" />
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
            </nav>
            <div class="container tm-mt-big tm-mb-big">
                <div class="row">
                    <div class="col-xl-9 col-lg-10 col-md-12 col-sm-12 mx-auto">
                        <div class="tm-bg-primary-dark tm-block tm-block-h-auto">
                            <div class="row">
                                <div class="col-12">
                                    <h2 class="tm-block-title d-inline-block">Add Product</h2>
                                </div>
                            </div>
                            <div class="row tm-edit-product-row">
                                <div class="col-xl-6 col-lg-6 col-md-12">
                                    <form action="../Product" method="POST" class="tm-edit-product-form">
                                        <input id="type" type="text" name="type" value="add" style="display:none;" />
                                        <div class="form-group mb-3">
                                            <label
                                                for="name"

                                                >Product Name
                                            </label>
                                            <input
                                                id="name"
                                                name="name"
                                                type="text"
                                                class="form-control validate"
                                                required
                                                />
                                        </div>
                                        <div class="form-group mb-3">
                                            <label
                                                for="description"
                                                >Description</label
                                            >
                                            <input
                                                id="name"
                                                name="description"
                                                type="text"
                                                class="form-control validate"
                                                required
                                                />

                                        </div>
                                        <div class="form-group mb-3">
                                            <label
                                                for="Discount"
                                                >img 
                                            </label>
                                            <input

                                                name="img"
                                                type="text"
                                                value=""
                                                class="form-control validate"
                                                />
                                        </div>
                                        <div class="form-group mb-3">
                                            <label
                                                for="price"
                                                >Price
                                            </label>
                                            <input
                                                type="number"
                                                name="Price"
                                                class="form-control validate"
                                                required
                                                />
                                        </div>
                                        <div class="form-group mb-3">
                                            <label
                                                for="Quantity"
                                                >Quantity
                                            </label>
                                            <input
                                                type="number"
                                                name="Quantity"
                                                class="form-control validate"
                                                required
                                                />
                                        </div>
                                        <div class="form-group mb-3" name="category">
                                            <label
                                                for="category"
                                                >Category</label
                                            >
                                            <select
                                                class="custom-select tm-select-accounts"
                                                id="category" name="category"
                                                >
                                                <option>Select Category</option>
                                            <%
                                                DaoCategory dc = new DaoCategory();
                                                List<Category> ac = dc.getCategory();
                                                for (int i = 0; i < ac.size(); i++) {
                                                    Category ca = ac.get(i);

                                            %>

                                            <option value="<%=ca.getId()%>"><%=ca.getName()%></option>
                                            <%
                                                }
                                            %>

                                        </select>
                                    </div>
                                    <div class="row">
                                        <div class="form-group mb-3 col-xs-12 col-sm-6">
                                            <label
                                                for="Discount"
                                                >Discount
                                            </label>
                                            <input
                                                id="Discount"
                                                name="Discount"
                                                type="number"
                                                class="form-control validate"
                                                data-large-mode="true"
                                                />
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="form-group mb-3 col-xs-12 col-sm-6">
                                            <label
                                                for="size"
                                                >Size
                                            </label>
                                            <input
                                                id="Discount"
                                                name="size"
                                                type="text"
                                                class="form-control validate"
                                                data-large-mode="true"
                                                />
                                        </div>
                                    </div>

                            </div>
                       
                            <div class="col-7">
                                <input  name="type" value="add" style="display:none;" />
                                <button type="submit" class="btn btn-primary btn-block text-uppercase">Add Product Now</button>
                            </div>
                            </form>
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
            $(function () {
                $("#expire_date").datepicker();
            });
        </script>
    </body>
</html>
