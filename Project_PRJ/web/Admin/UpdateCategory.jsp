<%-- 
    Document   : UpdateCategory
    Created on : Mar 8, 2022, 11:30:33 AM
    Author     : Admin
--%>

<%@page import="model.Category"%>
<%@page import="model.Product"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <meta http-equiv="X-UA-Compatible" content="ie=edge" />
        <title>UPDATE Category</title>
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
                Category c = (Category) request.getAttribute("category");
            %>
        </nav>
        <div class="container tm-mt-big tm-mb-big">
            <div class="row">
                <div class="col-xl-9 col-lg-10 col-md-12 col-sm-12 mx-auto">
                    <div class="tm-bg-primary-dark tm-block tm-block-h-auto">
                        <div class="row">
                            <div class="col-12">
                                <h2 class="tm-block-title d-inline-block">Update Category</h2>
                                <div class="row tm-edit-product-row">
                                    <div class="col-xl-6 col-lg-6 col-md-12">
                                        <form action="CategoryAdmin" method="Post"class="tm-edit-product-form">
                                         
                                            <div class="form-group mb-3">
                                                <label 
                                                    for="id"
                                                    >Category ID
                                                </label>
                                                <input
                                                    readonly type="text"
                                                    name="id"
                                                    value="<%=c.getId()%>"
                                                    class="form-control validate"
                                                    required
                                                    />
                                            </div>
                                            <div class="form-group mb-3">
                                                <label
                                                    for="name"
                                                    >Category Name
                                                </label>
                                                <input
                                               
                                                    name="name"
                                                    type="text"
                                                    value="<%= c.getName()%>"
                                                    class="form-control validate"
                                                    required
                                                    />
                                            </div>
                                            <div class="col-12">
                                                <input id="type" type="text" name="type" value="edit" style="display:none;" />
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
