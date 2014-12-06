<%-- 
    Document   : criminal_delete
    Created on : Dec 6, 2014, 10:51:20 AM
    Author     : Tazbeea Tazakka
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="database.*"%>
<%
String national_id = request.getParameter("national_id");
String organization_id = session.getAttribute("organization_id").toString();
String criminal_id = request.getParameter("criminal_id");

Criminal criminal = new Criminal();
boolean decision =  criminal.delete(national_id,organization_id,criminal_id);

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
