<%-- 
    Document   : accounts
    Created on : Mar 5, 2022, 4:33:58 PM
    Author     : Admin
--%>

<%@page import="model.Account"%>
<%@page import="java.util.List"%>
<%@page import="dal.DaoAccount"%>
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
        <div class="" id="home">
            <nav class="navbar navbar-expand-xl">
                <jsp:include page="./AdminCommon/header.jsp" ></jsp:include>
                </nav>
                <div class="container mt-5">
                    <div class="row tm-content-row">
                        <div class="col-sm-12 col-md-12 col-lg-12 col-xl-12 tm-block-col">
                            <form action="" method="">
                                <div class="tm-bg-primary-dark tm-block tm-block-products">
                                    <div class="tm-product-table-container">
                                        <table class="table table-hover tm-table-small tm-product-table">
                                            <thead>
                                                <tr>

                                                    <th scope="col">User ID</th>
                                                    <th scope="col">User Name</th>
                                                  
                                                    <th scope="col">Your Name</th>

                                                    <th scope="col">Address</th>
                                                    <th scope="col">Phone</th>

                                                    <th scope="col">Role</th>
                                                    <th scope="col">Action</th>

                                                    <th scope="col">&nbsp;</th>
                                                </tr>
                                            </thead>

                                            <tbody>
                                            <%
                                                DaoAccount account = new DaoAccount();
                                                List<Account> a = account.account();
                                                for (int i = 0; i < a.size(); i++) {
                                                    Account ac = a.get(i);
                                            %>
                                            <tr>

                                                <td><%=ac.getId()%></td>
                                                <td><%=ac.getName()%></td>
                                               
                                                <td><%=ac.getYourname()%></td>
                                                <td><%=ac.getAddress()%></td>
                                                <td><%=ac.getContact()%></td>
                                                <td><%=ac.getRoll()%></td>
                                                <td><a href="../Account?id=<%=ac.getId()%>"> Change Role</a></td>
                                            <tr/>

                                            </tr>

                                        </tbody>
                                        <% }%>
                                    </table>
                                </div>


                            </div>
                        </form>
                    </div>

                </div>

                <script src="http://localhost:8080/project/assets/js/jquery-3.3.1.min.js"></script>
                <!-- https://jquery.com/download/ -->
                <script src="http://localhost:8080/project/assets/js/bootstrap.min.js"></script>
                <!-- https://getbootstrap.com/ -->
                </body>
                </html>

