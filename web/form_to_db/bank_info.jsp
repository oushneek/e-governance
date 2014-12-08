<%-- 
    Document   : bank_info
    Created on : Dec 1, 2014, 4:33:44 PM
    Author     : Tazbeea Tazakka
--%>

<%@page import="database.bank.AddBankInfo"%>
<%@page contentType="application/json; charset=UTF-8"%>
<%@ page import="database.*" %>


<%
    String organization_id = session.getAttribute("organization_id").toString();
    String national_id = request.getParameter("national_id");

    AddBankInfo bank = new AddBankInfo();
    boolean decision = bank.insert(organization_id, national_id);

    if (!decision) {
        out.print("0");
    } else {
        out.print("1");
    }
%>


