<%-- 
    Document   : medical_info
    Created on : Dec 1, 2014, 11:05:26 PM
    Author     : Tazbeea Tazakka
--%>

<%@page import="database.medical.AddMedicalInfo" %>
<%@page import="java.util.ArrayList"%>
<%@page contentType="application/json; charset=UTF-8"%>
<%@page import="database.*" %>

<%

    ArrayList<String> medical = new ArrayList<String>();
    medical.clear();

    medical.add(request.getParameter("national_id"));
    medical.add(session.getAttribute("organization_id").toString());
    medical.add(request.getParameter("date"));
    medical.add(request.getParameter("description"));

    AddMedicalInfo medicalInfo = new AddMedicalInfo();
    boolean decision = medicalInfo.insert(medical);

    if (!decision) {
        out.print("0");
    } else {
        out.print("1");
    }
%>
