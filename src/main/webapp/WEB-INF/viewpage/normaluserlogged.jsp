<%-- 
    Document   : normaluserlogged
    Created on : 29 Aug, 2020, 11:50:47 AM
    Author     : Home
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String name = (String) request.getAttribute("username");
    int id = (int) request.getAttribute("id");
    String email = (String) request.getAttribute("email");
    String usertype = (String) request.getAttribute("uType");
    String password = (String) request.getAttribute("password");
    if (name == null || password == null) {
        response.sendRedirect("/ecommerceWebSpring/login");
    }
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="/bootstrap_CSS_JS.jsp" %>
    </head>
    <body>
        <%@include file="/navbar.jsp" %>
        <h1>Hello Normal User</h1>

        <h4 style="color:#660066">HELLO <%= name%></h4>
        <h4 style="color:#6600ff">you are <%= usertype%> user</h4>
        <h4 style="color:#3399ff">ID number <%= id%></h4>

    
    </body>
</html>
