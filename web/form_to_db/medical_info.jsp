<%-- 
    Document   : medical_info
    Created on : Dec 1, 2014, 11:05:26 PM
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
        
    ArrayList<String> medical = new ArrayList<String>();
    medical.clear();
    
    medical.add(request.getParameter("national_id"));
    medical.add(session.getAttribute("organization_id").toString());
    medical.add(request.getParameter("date"));
    medical.add(request.getParameter("description"));
   
     
    Medical medicalInfo=new Medical();
    String result=medicalInfo.insertMedicalInfo(medical);
    out.print(medical.get(2));
    out.print(medical.get(3));
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

