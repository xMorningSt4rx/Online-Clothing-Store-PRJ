<%-- 
    Document   : UpdateRole
    Created on : Mar 9, 2022, 12:29:25 AM
    Author     : Admin
--%>

<%@page import="model.Account"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <meta http-equiv="X-UA-Compatible" content="ie=edge" />
        <title>UPDATE Role Account</title>
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
                Account a = (Account) request.getAttribute("account");
            %>
            </nav>
       
        <div class="container tm-mt-big tm-mb-big">
            <div class="row">
                <div class="col-xl-9 col-lg-10 col-md-12 col-sm-12 mx-auto">
                    <div class="tm-bg-primary-dark tm-block tm-block-h-auto">
                        <div class="row">
                            <div class="col-12">
                                <h2 class="tm-block-title d-inline-block">UPDATE Role Account </h2>
                                <div class="row tm-edit-product-row">
                                    <div class="col-xl-6 col-lg-6 col-md-12">
                                        <form action="Account" method="post"class="tm-edit-product-form">

                                            <div class="form-group mb-3">
                                                <label 
                                                    for="id"
                                                    >User ID
                                                </label>
                                                <input
                                                    readonly type="text"
                                                    name="id"
                                                    value="<%=a.getId() %>"
                                                    class="form-control validate"
                                                    required
                                                    />
                                            </div>
                                            <div class="form-group mb-3">
                                                <label
                                                    for="name"
                                                    >User Name
                                                </label>
                                                <input
                                                     readonly 
                                                    name="name"
                                                    type="text"
                                                    value="<%=a.getName() %>"
                                                    class="form-control validate"
                                                    required
                                                    />
                                            </div>
                                            <div class="form-group mb-3">
                                                <label
                                                    for="name"
                                                    >Role
                                                </label>
                                                <select name="Role" class="custom-select tm-select-accounts">
                                                    <option value="1">Admin</option>
                                                    <option value="2">User</option>
                                                </select>
                                            </div>
                                            <div class="col-12">

                                                <button type="submit" class="btn btn-primary btn-block text-uppercase">Update Now</button>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
