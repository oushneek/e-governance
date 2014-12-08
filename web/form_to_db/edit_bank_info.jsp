<%-- 
    Document   : edit_bank_info
    Created on : Dec 6, 2014, 8:51:23 PM
    Author     : Tazbeea Tazakka
--%>

<%@page import="database.bank.EditBankInfo"%>
<%@page contentType="application/json; charset=UTF-8"%>
<%@ page import="database.*" %>


<%
    String organization_id = session.getAttribute("organization_id").toString();
    String national_id = request.getParameter("national_id");
    String banking_id = request.getParameter("banking_id");

    EditBankInfo bank = new EditBankInfo();
    boolean decision = bank.update(banking_id, national_id);
 

    if (!decision) {
        out.print("0");
    } else {
        out.print("1");
    }
%>



