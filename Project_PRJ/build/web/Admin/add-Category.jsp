<%-- 
    Document   : add-Category
    Created on : Mar 7, 2022, 4:31:10 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
      <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <meta http-equiv="X-UA-Compatible" content="ie=edge" />
        <title>Add Category</title>
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
                                    <h2 class="tm-block-title d-inline-block">Add Category</h2>
                                    <div class="row tm-edit-product-row">
                                        <div class="col-xl-6 col-lg-6 col-md-12">
                                            <form action="../CategoryAdmin" method="post" class="tm-edit-product-form">
                                                <input id="type" type="text" name="type" value="add" style="display:none;" />
                                              
                                                 <div class="form-group mb-3">
                                            <label
                                                for="name"
                                                >Category Name
                                            </label>
                                            <input
                                                id="name"
                                                name="name"
                                                type="text"
                                                class="form-control validate"
                                                required
                                                />
                                        </div>
                                                <div class="col-12">
                                                     <input  name="type" value="add" style="display:none;" />
                                <button type="submit" class="btn btn-primary btn-block text-uppercase">Add Category Now</button>
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
    </head>
</html>
