<%-- 
    Document   : show_citizen
    Created on : Dec 1, 2014, 3:45:41 PM
    Author     : Tazbeea Tazakka
--%>

<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="database.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <%
        
            ArrayList<String> info=new ArrayList<String>();
            Citizen citizens=new Citizen();
            info=citizens.showcitizen();
            for(int i=0;i<info.size();i++){
                out.println(info.get(i));
            }
        
        
        %>
    </body>
</html>
