<%-- 
    Document   : medical_delete
    Created on : Dec 6, 2014, 10:56:55 AM
    Author     : Tazbeea Tazakka
--%>
<%@page import="database.medical.DeleteMedicalInfo"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="database.*"%>
<%
String national_id = request.getParameter("national_id");
String organization_id = session.getAttribute("organization_id").toString();
String medical_id = request.getParameter("medical_id");

DeleteMedicalInfo medical = new DeleteMedicalInfo();
boolean decision =  medical.delete(national_id,organization_id,medical_id);

if(decision){
    
    String referer = request.getHeader("Referer");
    out.print("<script>alert('Record Deleted');</script>");
    //response.sendRedirect(referer);
    response.setHeader("Refresh", "0;url="+referer);
}
else{
    String referer = request.getHeader("Referer");
    out.print("<script>alert('You are not Authorized to Delete This Data');</script>");
    //response.sendRedirect(referer);
    response.setHeader("Refresh", "0;url="+referer);
}

%>
