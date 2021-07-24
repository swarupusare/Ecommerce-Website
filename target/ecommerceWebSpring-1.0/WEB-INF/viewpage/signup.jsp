<%-- 
    Document   : signup
    Created on : 27 Aug, 2020, 1:09:28 PM
    Author     : Home
--%>

<%@page import="com.star.entities.Person"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>  
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="/bootstrap_CSS_JS.jsp" %>
    </head>
    <body >
        <%@include  file="/navbar.jsp" %>
        <div class="container">
            <div class="row">
                <div class="card " style="width: 600px;height: 500px;margin-left:25%;margin-top:5%">


                    <div class="card-header text-center">
                        <i><ion-icon name="person" ></ion-icon> </i> Register HERE

                    </div>
                    <%
                        HttpSession s = request.getSession();

                        String message = (String) s.getAttribute("msg");

                    %>
                    <%    if (message != null) {

                    %>

                    <div class="alert alert-warning" role="alert">
                        <%=  message %>
                    </div>
                    <%    
                        s.removeAttribute("msg");

                        }
                    %>



                    <form action="registerdata" method="post">
                        <div class="card-body">

                            <div class="form-group">
                                <label>Name :</label>
                                <input type="text" name="puname" class="form-control" placeholder="enter yourname..." />

                            </div>
                            <div class="form-group">

                                <label>Email :</label>
                                <input type="email" name="puemail" class="form-control" placeholder="enter email..">
                            </div> 
                            <div class="form-group">

                                <label>Password :</label>
                                <input type="password" name="pupass" class="form-control" placeholder="password..">
                            </div> 
                            <div class="form-group">

                                <label>Mobile_no :</label>
                                <input type="number" name="pumobile" class="form-control" placeholder="Mobile no..">

                            </div> 
                            <div class="form-group">
                                <select class="form-control" name="pustate">
                                    <option selected >===select state===</option>
                                    <option>Maharashtra</option>
                                    <option>Gujrat</option>
                                    <option>UP</option>
                                    <option>Goa</option>
                                    <option>bihar</option>
                                </select>
                            </div>
                            <div class="form-group ">
                                <input type="checkbox" class="form-check-input" id="ch" style="margin-left:6px" />
                                <span style="margin-left: 27px">Accept <a href="#">terms & condition</a></span>

                            </div>
                            <label>Gender:</label>
                            Male <input type="radio"  name="pgender" value="male" > 
                            Female <input type="radio"  name="pgender" value="female" > 

                            <input type="text" hidden="true" name="userType" value="normal" />


                            <div class="card-footer text-center">
                                <span class="spinner spinner-border" id="sp" style="color:skyblue;display:none"></span>
                                <button type="submit" id="regb" class="btn btn-outline-primary mt2" style="margin-top:8px">
                                    Submit
                                </button>
                            </div>



                        </div>


                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
