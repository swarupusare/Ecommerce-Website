<%-- 
    Document   : navbar
    Created on : 26 Aug, 2020, 6:25:33 PM
    Author     : Home
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>  
<!DOCTYPE html>
<%
    String name1 = (String) session.getAttribute("username");

    String pass1 = (String) session.getAttribute("password");


%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="/bootstrap_CSS_JS.jsp" %>
        <style> 
            /*            table { 
                            border-collapse: collapse; 
                        } 
                        th { 
                            background-color:green; 
                            Color:white; 
                        } 
                        th, td { 
                            width:150px; 
                            text-align:center; 
                     
                            border:1px solid #3399ff; 
                            padding:5px 
                          
                        } */
         
        </style>
    </head>
    <body>
        <nav class="navbar sticky-top navbar-expand-lg navbar-dark bg-primary">
            <a class="navbar-brand" href="#">
                <img src="<c:url value="/resources/image/ecom.png"/>" style="background-color: #6600ff;color: #6600ff" width="50" height="40"  alt=""/>
            </a>

            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active">
                        <a class="nav-link" href="welcome?categoryf=All">Home <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Link</a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            Dropdown
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item" href="#">Action</a>
                            <a class="dropdown-item" href="#">Another action</a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="#">Something else here</a>
                        </div>
                    </li>
                    <%                        if (name1 == null || pass1 == null) {


                    %>
                    <li class="nav-item">
                        <a class="nav-link " href="login">Login</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link " href="register">Register</a>
                    </li>
                    <%                        } else {


                    %> 
                    <li class="nav-item">
                        <a class="nav-link " href="profile"><%= name1%></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link " href="logout">Logout</a>
                    </li>
                    <%
                        }
                    %>

                </ul>
                <form class="form-inline my-2 my-lg-0">

                    <li class="nav-item">
                        <a href="#" data-toggle="modal" data-target="#cartmodal" class="nav-link btn btn-primary " style="padding: 0px;margin-right: 40px">
                            <i class="fa fa-shopping-cart  " style="font-size: 30px;color: #66ffff" > <span class="cart-item"></span></i>
                        </a>
                    </li>

                    <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
                    <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
                </form>
            </div>
        </nav>
        <%@include file="/commonmodel.jsp" %>


        <script>
            $('.dropdown-toggle').dropdown();
        </script>

    </body>
</html>
