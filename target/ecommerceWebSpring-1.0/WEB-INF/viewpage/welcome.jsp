<%-- 
    Document   : welcome
    Created on : 26 Aug, 2020, 1:11:04 PM
    Author     : Home
--%>
<%@page import="com.star.ecommercewebspring.Helper"%>
<%@page import="com.star.entities.Product"%>
<%@page import="java.util.List"%>
<%@page import="com.star.entities.Category"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="/bootstrap_CSS_JS.jsp" %>
        <script src="<c:url value="/resources/js/script.js" />" ></script>
        <link href="<c:url value="/resources/css/wel.css" />" rel="stylesheet" />
    </head>
    <body>
        <%@include file="/navbar.jsp" %>
        <%            List<Category> allcategory = (List<Category>) request.getAttribute("AllCategory");

            List<Product> allproduct = (List<Product>) request.getAttribute("AllProducts");
            List<Product> allproductbyid = (List<Product>) request.getAttribute("productsbyCategoryid");
//            String path=(String)request.getAttribute("path");
            
             List<Product> products=null;
             
             if(allproductbyid != null){
                 products=allproductbyid;
             }
             else{
                 products=allproduct;
             }

        %>


        <div class="container-fluid">
            <div class="row " style="margin-top: 3%">
                <div class="col-md-2">
                    <ul class="list-group">
                        <a href="welcome?categoryf=All" class="list-group-item list-group-item-action active">All Products</a>

                        <%                            for (Category ca : allcategory) {
                        %>


                        <a  href="welcome?categoryf=<%=ca.getcId()%>" class="list-group-item list-group-item-action"><%= ca.getcTitle()%></a>
                        <%
                            }
                        %>
                    </ul>
                </div>

                <div class="col-md-10">
                    <div class="container">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="card-columns">
                                    <%
                                        for (Product p : products) {


                                    %>



                                    <div class="card">
                                        <div class="container text-center">
                                            <img class="card-img-top " alt="Card image cap" style="height:200px;width:250px" src="resources/upload/<%= p.getPimagename()%>" /> 

                                        </div>
                                        <div class="card-body">
                                            <h5 class="card-title"><%= p.getpName()%></h5>
                                            <p class="card-text"><%= Helper.get10words(p.getpDesc()) %> </p>
                                        </div>
                                        <div class="card-footer">
                                            <button class="btn btn-outline-primary" onclick="add_to_cart(<%= p.getpId() %>,'<%= p.getpName() %>','<%= p.getpriceafterDiscount() %>')" >Add To Cart</button>
                                            <button class="btn btn-outline-success">&#8377 <%= p.getpriceafterDiscount()%><span class="text-secondary discount-label"> &#8377 <%= p.getpPrice() %> </span> <span><%= p.getpDiscount()%>% off</span></button>
                                        </div>
                                    </div>
                                    <%

                                        }
                                    %>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>

         



    </body>
</html>
