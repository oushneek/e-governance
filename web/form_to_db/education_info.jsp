<%-- 
    Document   : education_info
    Created on : Dec 1, 2014, 10:35:58 PM
    Author     : Tazbeea Tazakka
--%>
<%@page import="database.education.AddEducationInfo" %>
<%@page import="java.util.ArrayList"%>
<%@page contentType="application/json; charset=UTF-8"%>
<%@ page import="database.*" %>


<%

    ArrayList<String> education = new ArrayList<String>();
    education.clear();

    education.add(request.getParameter("national_id"));
    education.add(session.getAttribute("organization_id").toString());
    education.add(request.getParameter("exam"));
    education.add(request.getParameter("year"));
    education.add(request.getParameter("board"));
    education.add(request.getParameter("cgpa"));

    AddEducationInfo eduInfo = new AddEducationInfo();
    boolean decision = eduInfo.insert(education);

    if (!decision) {
        out.print("0");
    } else {
        out.print("1");
    }

%>
