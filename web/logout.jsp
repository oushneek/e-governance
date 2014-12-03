<%-- 
    Document   : logout
    Created on : Dec 3, 2014, 10:52:46 PM
    Author     : Tazbeea Tazakka
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
    Logout
</head>
<%
    //session destroyer 
    session.invalidate();
    response.sendRedirect("index.jsp");
%>