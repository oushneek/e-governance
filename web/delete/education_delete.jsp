<%-- 
    Document   : education_delete
    Created on : Dec 6, 2014, 3:36:17 AM
    Author     : Ratul
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="database.education.DeleteEducationInfo"%>
<%
    String national_id = request.getParameter("national_id");
    String organization_id = session.getAttribute("organization_id").toString();
    String education_id = request.getParameter("education_id");
    DeleteEducationInfo education = new DeleteEducationInfo();
    boolean decision = education.delete(national_id, organization_id, education_id);

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
