<%-- 
    Document   : edit_medical_info
    Created on : Dec 8, 2014, 3:04:40 AM
    Author     : Ratul
--%>

<%@page import="database.medical.EditMedicalInfo" %>
<%@page import="java.util.ArrayList"%>
<%@page contentType="application/json; charset=UTF-8"%>
<%@page import="database.*" %>


<%
    String organization_id = session.getAttribute("organization_id").toString();
    ArrayList<String> medicalInfo = new ArrayList<String>();

    medicalInfo.add(request.getParameter("medical_id"));
    medicalInfo.add(request.getParameter("national_id"));
    medicalInfo.add(request.getParameter("date"));
    medicalInfo.add(request.getParameter("description"));

    EditMedicalInfo medical = new EditMedicalInfo();
    boolean decision = medical.edit(medicalInfo);

    if (!decision) {
        out.print("0");
    } else {
        out.print("1");
    }

%>



