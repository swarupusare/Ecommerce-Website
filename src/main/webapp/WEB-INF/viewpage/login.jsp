<%-- 
    Document   : login
    Created on : 27 Aug, 2020, 11:47:29 AM
    Author     : Home
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="/bootstrap_CSS_JS.jsp" %>
    </head>

    <body>
        <%@include file="/navbar.jsp" %>
        <div class="container">
            <div class="row">
                <div class="card " style="width: 600px;height: 350px;margin-left:25%;margin-top:6%">


                    <div class="card-header text-center">
                        <i><ion-icon name="person" ></ion-icon> </i> LOGIN HERE

                    </div>
                    <%
                        String msg = (String) session.getAttribute("msg");

                        if (msg != null) {
                    %>  

                    <div class="alert alert-warning" role="alert">
                        <%= msg %>
                    </div>
                    <%
                            session.removeAttribute("msg");
                        }
                    %>

                    <form action="log" method="post">
                        <div class="card-body">

                            <div class="form-group">
                                <label class="form-text">UserName :</label>
                                <input type="text" name="uname" class="form-control " placeholder="enter email..."  /> 
                            </div>
                            <div class="form-group">
                                <label class="form-text">Password :</label>
                                <input type="password" name="upass" class="form-control " placeholder="enter password..."  /> 

                            </div>

                        </div>
                        <a href="signup" class="text-center pb-3 pt-0 pl-3" > create account</a>
                        <div class="card-footer text-center ">

                            <button type="submit" class="btn btn-primary text-center">
                                Login
                            </button>    
                        </div> 
                    </form>
                </div>
            </div>
        </div>


    </body>
</html>
