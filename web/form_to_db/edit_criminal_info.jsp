<%-- 
    Document   : edit_criminal_info
    Created on : Dec 6, 2014, 10:08:57 PM
    Author     : Tazbeea Tazakka
--%>

<%@page import="database.criminal.EditCriminalInfo"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="application/json; charset=UTF-8"%>
<%@ page import="database.*" %>

<%
    String organization_id = session.getAttribute("organization_id").toString();
    ArrayList<String> criminalInfo = new ArrayList<String>();

    criminalInfo.add(request.getParameter("national_id"));
    criminalInfo.add(request.getParameter("criminal_id"));
    criminalInfo.add(request.getParameter("date"));
    criminalInfo.add(request.getParameter("description"));



    EditCriminalInfo criminal = new EditCriminalInfo();
    boolean decision = criminal.update(criminalInfo);

    if (!decision) {
        out.print("0");
    } else {
        out.print("1");
    }
%>
