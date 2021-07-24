<%-- 
    Document   : loggedpage
    Created on : 28 Aug, 2020, 6:10:47 PM
    Author     : Home
--%>
<%@page import="java.util.List"%>
<%@page import="com.star.entities.Category"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>  
<!DOCTYPE html>
<%
    String name = (String) session.getAttribute("username");
    String pass = (String) session.getAttribute("password");

    if (name == null || pass == null) {

        response.sendRedirect("/ecommerceWebSpring/login");

    }
    int C_Size = (int) request.getAttribute("categorySize");
    int p_Size = (int) request.getAttribute("totalproducts");
    int u_Size = (int) request.getAttribute("totalusers");
%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

        <link href="<c:url value="/resources/css/newcss.css"/>" rel="stylesheet" />
        <%@include file="/bootstrap_CSS_JS.jsp" %>
    </head>
    <body>
        <!--navbar-->
        <%@include file="/navbar.jsp" %>
        <!-------------------------------------->

        <!-- Modal For Add Category -->
        <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Add New Category</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form action="addcategory" method="post" >
                            <div class="form-group">
                                <input type="text" name="ctitle" class="form-control" placeholder="Enter Title here..." />

                            </div>
                            <div class="form-group">
                                <textarea name="cdesc" style="height:300px" class="form-control" placeholder="Enter Description..." ></textarea>
                            </div>
                            <div class="container text-center">
                                <div class="form-group">
                                    <button  style="width:6em" type="submit " class="btn btn-outline-success  " >Add</button>
                                </div>
                            </div>


                        </form>
                    </div>

                </div>
            </div>
        </div>
        <!-------------------------------------------------------->
        <!-- Modal For Add Product -->
        <div class="modal fade" id="exampleModal2" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Add New Product</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form action="addproduct" method="post" enctype="multipart/form-data">
                            <div class="form-group">
                                <input type="text" name="pName" class="form-control" placeholder="Enter product Title here..." />

                            </div>
                            <div class="form-group">
                                <textarea name="pDesc" style="height:300px" class="form-control" placeholder="Enter Description..." ></textarea>
                            </div>

                            <div class="form-group">
                                <input type="number" name="pPrice" class="form-control" placeholder="Enter price of your Product..." />

                            </div>
                            <div class="form-group">
                                <input type="number" name="pDiscount" class="form-control" placeholder="Enter Product discount..." />

                            </div>
                            <div class="form-group">
                                <input type="number" name="pQuantity" class="form-control" placeholder="Enter Product Quantity..." />

                            </div>
                            <!------------------------>
                            <div class="form-group">
                                <select name="category" class="form-control" >
                                    <%                                List<Category> allcategory = (List<Category>) session.getAttribute("allcategory");

                                        for (Category ct : allcategory) {
                                    %>
                                    <!----------------------------->

                                    <option value="<%= ct.getcId()%>"><%= ct.getcTitle()%></option> 


                                    <%
                                        }
                                    %>
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="formfile">Select Image of your product :</label>
                                <input type="file" name="file" class="form-control-file" id="formfile">
                            </div>


                            <div class="container text-center">
                                <div class="form-group">
                                    <input  type="submit" value="Addd"  style="width:6em" class="btn btn-outline-success  " />
                                </div>
                            </div>


                        </form>
                    </div>

                </div>
            </div>
        </div> 
        <!--------------------------------------------------->
        <!--message-->
        <%            String message = (String) session.getAttribute("msg");

            if (message != null) {
        %>    
        <div class="alert  alert-success alert-dismissible fade show" role="alert">
            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                <span aria-hidden="true">&times;</span>
            </button>
            <div class="container text-center">
                <%= message%>
            </div>


        </div>
        <%
                session.removeAttribute("msg");
            }
        %>
        <!--------------------------------------------->
        <div class="container admin">
            <div class="row mt3" style="margin-top: 20px">
                <div class="col-md-4">
                    <div class="card" style="width: 19em;height: 20em">
                        <div class="card-body text-center">
                            <div class="container ">
                                <div class="img-fluid rounded">

                                    <img class="img-fluid rounded"  src="<c:url value="/resources/image/ug.jpg"/> " style="height:160px;width:170px" />

                                </div>

                            </div>
                            <h3><%= u_Size%></h3>
                            <h3>Users</h3> 
                        </div>
                    </div>  
                </div>
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body text-center">
                            <div class="container ">
                                <div class="img-fluid rounded">

                                    <img class="img-fluid rounded"  src="<c:url value="/resources/image/cata.jpg"/> " style="height:160px;width:170px" />

                                </div>

                            </div>
                            <h1><%= C_Size%></h1>
                            <h1>Categories</h1>
                        </div>
                    </div>  
                </div>
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body text-center">
                            <div class="container ">
                                <div class="img-fluid rounded">

                                    <img class="img-fluid rounded"  src="<c:url value="/resources/image/pro.jpg"/> " style="height:160px;width:170px" />

                                </div>

                            </div>
                            <h1><%= p_Size%></h1>
                            <h1>products</h1>
                        </div>
                    </div>  
                </div>
            </div>
            <div class="row mt3" style="margin-top: 20px;margin-bottom: 10em;">
                <div class="col-md-6">
                    <div class="card">
                        <div class="card-body text-center" data-toggle="modal" data-target="#exampleModal" >
                            <div class="container  " data-toggle="modal" data-target="#exampleModal">
                                <div class="img-fluid rounded" >

                                    <img class="img-fluid rounded"  src="<c:url value="/resources/image/addcata.jpg"/> " style="height:160px;width:170px" />

                                </div>

                            </div>
                            <h1>Add Category</h1>
                        </div>
                    </div>

                </div>
                <div class="col-md-6">
                    <div class="card">
                        <div class="card-body text-center">
                            <div class="container " data-toggle="modal" data-target="#exampleModal2">
                                <div class="img-fluid rounded">

                                    <img class="img-fluid rounded"  src="<c:url value="/resources/image/addprod.jpg"/> " style="height:160px;width:170px" />

                                </div>

                            </div>
                            <h1>Add Products</h1>
                        </div>
                    </div>

                </div>
            </div>
        </div>


    </body>
</html>