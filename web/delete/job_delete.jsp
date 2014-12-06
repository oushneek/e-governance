<%-- 
    Document   : job_delete
    Created on : Dec 6, 2014, 10:40:52 AM
    Author     : Tazbeea Tazakka
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="database.*"%>
<%
String national_id = request.getParameter("national_id");
String organization_id = session.getAttribute("organization_id").toString();
String job_id = request.getParameter("job_id");

Job job = new Job();
boolean decision =  job.delete(national_id,organization_id,job_id);

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
