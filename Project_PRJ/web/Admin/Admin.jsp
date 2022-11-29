<%-- 
    Document   : Admin
    Created on : Mar 2, 2022, 5:22:11 PM
    Author     : Admin
--%>

<%@page import="model.OderList"%>
<%@page import="model.Product"%>

<%@page import="java.util.List"%>
<%@page import="dal.DaoAccount"%>
<%@page import="dal.DaoProduct"%>
<%@page import="dal.DaoCategory"%>
<%@page import="model.Category"%>
<%@page import="model.Account"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>CLOTHES SHOP-ADMIN</title>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:400,700">
        <!-- https://fonts.google.com/specimen/Roboto -->
        <link rel="stylesheet" href="http://localhost:8080/project/assets/css/fontawesome.min.css">
        <!-- https://fontawesome.com/ -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <!-- https://getbootstrap.com/ -->
        <link rel="stylesheet" href="http://localhost:8080/project/assets/css/templatemo-style.css">
        <!--
            Product Admin CSS Template
            https://templatemo.com/tm-524-product-admin
        -->
    </head>

    <body id="reportsPage">
        <div class="" id="home">
            <nav class="navbar navbar-expand-xl">
                <jsp:include page="./AdminCommon/header.jsp" ></jsp:include>

                </nav>
                <div class="container">
                    <div class="row">
                        <div class="col">
                        <%
                            Account a = new Account();
                            a = (Account) session.getAttribute("account");
                        %>
                        <%
                            DaoCategory dc = new DaoCategory();
                            int total = dc.getTotalCategory();
                        %>
                        <%
                            DaoProduct dp = new DaoProduct();
                            int totalPro = dp.getTotalProduct();
                            int totalSell = dp.getTotalProductBySell();
                        %>
                        <%
                            DaoAccount da = new DaoAccount();
                            int totalAc = da.getTotalUser();
                        %>

                        <p class="text-white mt-5 mb-5">Welcome back, <%=a.getName()%> <b></b></p>
                    </div>
                </div>
                <!-- row -->

                <div class="row tm-content-row">
                    <div class="col-sm-12 col-md-12 col-lg-3 col-xl-3 tm-block-col">
                        <div class="tm-bg-primary-dark tm-block">
                            <h2 class="tm-block-title" style="color: turquoise">Total Category: </br> <h1 class="productss"style="color:  tomato"><%=total%></h1></h2>

                        </div>
                    </div>
                    <div class="col-sm-12 col-md-12 col-lg-3 col-xl-3 tm-block-col">
                        <div class="tm-bg-primary-dark tm-block">
                            <h2 class="tm-block-title"style="color: turquoise">Total Product: </br> <h1 class="productss" style="color:  tomato"> <%=totalPro%></h1></h2>
                            <!--                                <h2 class="tm-block-title">Storage Information</h2>                       -->
                        </div>
                    </div>
                    <div class="col-sm-12 col-md-12 col-lg-3 col-xl-3 tm-block-col">
                        <div class="tm-bg-primary-dark tm-block">
                            <h2 class="tm-block-title" style="color: turquoise">Total number of user:  </br> <h1 class="productss" style="color:  tomato"><%=totalAc%></h1></h2>

                        </div>
                    </div>
                    <div class="col-sm-12 col-md-12 col-lg-3 col-xl-3 tm-block-col">
                        <div class="tm-bg-primary-dark tm-block">
                            <h2 class="tm-block-title" style="color: turquoise">Total number of product sell:</br> <h1 class="productss" style="color:  tomato"><%= totalSell%></h1> </h2>

                        </div>
                    </div>



                    <div class="col-12 tm-block-col">

                        <div class="tm-bg-primary-dark tm-block tm-block-taller tm-block-scroll">

                            <h2 class="tm-block-title">Orders List</h2>
                            <table class="table">

                                <thead>
                                    <tr>
                                        <th scope="col">ORDER ID</th>
                                        <th scope="col">UserID</th>
                                        <th scope="col">OrderDate</th>
                                        <th scope="col">ProductName</th>
                                        <th scope="col">Category</th>
                                        <th scope="col">Quantity</th>
                                        <th scope="col">Total Price</th>
                                        <th scope="col">status</th>

                                    </tr>
                                </thead>
                                <tbody>

                                    <tr>
                                        <%
                                            DaoProduct dpa = new DaoProduct();
                                            List<OderList> arrp = dp.getAllListOder();
                                            for (int i = 0; i < arrp.size(); i++) {
                                                OderList pd = arrp.get(i);
                                        %> 
                                        <th scope="row"><b><%= pd.getOderID()%></b></th>
                                        <td><%= pd.getUserID()%></td>
                                        <td><b><%= pd.getOrderDate()%></b></td>

                                        <td><b><%= pd.getProductName()%></b></td>

                                        <td><b><%= pd.getCategoryName()%></b></td>
                                        <td><%= pd.getQuantity()%></td>
                                        <td><%= pd.getTotal()%></td>
                                        <td><a data-toggle="modal" data-target="#oder<%=i%>" href="#" style="color: #ffffff"><%=pd.getStatus()%></a></td>
                                <div class="modal fade" id="oder<%=i%>" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                    <div class="modal-dialog" role="document">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="exampleModalLabel">Change Status</h5>
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                </button>
                                            </div>
                                            <form action="../UpdateStatus">
                                                <div class="modal-body">
                                                    <div class="form-group">
                                                        <input name="id" type="text" value="<%=pd.getId() %>" style="display: none;"/>
                                                        <label for="exampleInputEmail1">Email address</label>
                                                        <input type="text" class="form-control validate" name="status" placeholder="Enter status" value="<%=pd.getStatus()%>">
                                                    </div>
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                                    <button type="submit" class="btn btn-primary">Save changes</button>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                                </tr>
                                <% }%>
                                </tbody>


                            </table>

                        </div>

                    </div>




                </div>

            </div>
            <footer class="tm-footer row tm-mt-small">
                <jsp:include page="./AdminCommon/footer.jsp" ></jsp:include>
            </footer>
        </div>

        <script src="http://localhost:8080/project/assets/js/jquery-3.3.1.min.js"></script>
        <!-- https://jquery.com/download/ -->
        <script src="http://localhost:8080/project/assets/js/moment.min.js"></script>
        <!-- https://momentjs.com/ -->
        <script src="http://localhost:8080/project/assets/js/Chart.min.js"></script>
        <!-- http://www.chartjs.org/docs/latest/ -->
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <!-- https://getbootstrap.com/ -->
        <script src="http://localhost:8080/project/assets/js/tooplate-scripts.js"></script>
        <style>
            .tm-block{
                min-height: 25px !important ;
            }
            .productss{
                padding-left: 60px;
            }
        </style>
    </body>

</html>