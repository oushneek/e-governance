<%-- 
    Document   : bank_delete
    Created on : Dec 6, 2014, 4:06:24 AM
    Author     : Ratul
--%>

<%@page import="database.bank.DeleteBankInfo"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="database.*"%>
<%
    String national_id = request.getParameter("national_id");
    String organization_id = session.getAttribute("organization_id").toString();
    String banking_id = request.getParameter("banking_id");

    DeleteBankInfo bank = new DeleteBankInfo();
    boolean decision = bank.delete(national_id, organization_id, banking_id);

    if (decision) {

        String referer = request.getHeader("Referer");
        out.print("<script>alert('Record Deleted');</script>");
        //response.sendRedirect(referer);
        response.setHeader("Refresh", "0;url=" + referer);
    } else {
        String referer = request.getHeader("Referer");
        out.print("<script>alert('You are not Authorized to Delete This Data');</script>");
        //response.sendRedirect(referer);
        response.setHeader("Refresh", "0;url=" + referer);
    }

%>
