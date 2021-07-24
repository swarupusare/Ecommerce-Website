<%-- 
    Document   : checkout
    Created on : 4 Sep, 2020, 7:05:08 PM
    Author     : Home
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String name = (String) session.getAttribute("username");
    String pass = (String) session.getAttribute("password");

    if (name == null || pass == null) {

        response.sendRedirect("/ecommerceWebSpring/login");

    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="/bootstrap_CSS_JS.jsp" %>
        <script src="<c:url value="/resources/js/script.js" />" ></script>
    </head>
    <body>
        <%@include file="/navbar.jsp" %>

        <div class="container-fluid">
            <div class="row">
                <div class="col-md-6 offset-md-1 mt-3" >
                    <div class="card">
                        <div class="card-title text-center" style="font-size: 22px;color:#ff66ff"><b>Order All Items</b></div>
                        <div class="card-body">
                            <div class="cart-body">

                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-5 mt-3">
                    <div class="card">
                        <div class="card-title text-center " style="font-size: 22px;color:#ff66ff"><b>Fill up your details</b></div>
                        <div class="card-body">
                            <form>
                                <div class="form-group">
                                    <label for="email">Email ID :</label>
                                    <input type="text" value="" placeholder="enter you email id.." class="form-control" />
                                </div> 
                                <div class="form-group">
                                    <label for="email">Contact No :</label>
                                    <input type="text" value="" placeholder="enter you email id.." class="form-control" />
                                </div> <div class="form-group">
                                    <label for="email">Shipping Address :</label>
                                    <input type="text"  placeholder="enter your shipping  Address.." class="form-control" />
                                </div> 
                                <div class="container text-center">
                                      <button class="btn btn-outline-secondary">Place Order</button>
                                       <button class="btn btn-outline-primary">Continue Shopping</button>
                                </div>
                                
                                    
                                
                            </form>

                        </div>
                    </div>



                </div>
            </div>
        </div>


        <%@include file="/commonmodel.jsp" %>
    </body>
</html>
