<%-- 
    Document   : edit_education_info
    Created on : Dec 7, 2014, 9:51:49 PM
    Author     : Tazbeea Tazakka
--%>
<%@page import="database.education.EditEducationInfo" %>
<%@page import="java.util.ArrayList"%>
<%@page contentType="application/json; charset=UTF-8"%>
<%@ page import="database.*" %>


<%
    String organization_id = session.getAttribute("organization_id").toString();
    ArrayList<String> educationInfo = new ArrayList<String>();

    educationInfo.add(request.getParameter("education_id"));
    educationInfo.add(request.getParameter("national_id"));
    educationInfo.add(request.getParameter("exam"));
    educationInfo.add(request.getParameter("board"));
    educationInfo.add(request.getParameter("year"));
    educationInfo.add(request.getParameter("cgpa"));

    EditEducationInfo education = new EditEducationInfo();
    boolean decision = education.edit(educationInfo);
    if (!decision) {
        out.print("0");
    } else {
        out.print("1");
    }

%>

