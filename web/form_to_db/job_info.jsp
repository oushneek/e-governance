<%-- 
    Document   : job_info
    Created on : Dec 3, 2014, 3:18:56 PM
    Author     : Tazbeea Tazakka
--%>

<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="database.*" %>

<!DOCTYPE html>
<html lang="en">
    
    <!-- Include Header -->
    <jsp:include page="../include/header.jsp" />
 
    <body>
    <!-- Include Menu -->
    <jsp:include page="../include/menu.jsp" />       

    <%
        
    ArrayList<String> job = new ArrayList<String>();
    job.clear();
    
    job.add(request.getParameter("national_id"));
    job.add(session.getAttribute("organization_id").toString());
    job.add(request.getParameter("joining_date"));
    job.add(request.getParameter("leaving_date"));
    job.add(request.getParameter("post"));
   
     
    Job jobInfo=new Job();
    String result=jobInfo.insertJobInfo(job);
    out.print(result);
        
    %>
    <div class="row show-grid">
              <div class="col-lg-8" style="padding-left: 8%;padding-top: 2%;">
                  <%
                  %>
                    
              </div>
              <div class="col-lg-4" style="padding-top: 4%;padding-right: 2%;">
                  
              </div>
    </div>
           
    
    <!-- Include Footer -->
    <jsp:include page="../include/footer.jsp" />     
  </body>
</html>


