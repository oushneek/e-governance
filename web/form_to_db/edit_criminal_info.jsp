<%-- 
    Document   : edit_criminal_info
    Created on : Dec 6, 2014, 10:08:57 PM
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
    String organization_id=session.getAttribute("organization_id").toString();
    ArrayList<String> criminalInfo= new ArrayList<String>();
    
    criminalInfo.add(request.getParameter("national_id"));
    criminalInfo.add(request.getParameter("criminal_id"));
    criminalInfo.add(request.getParameter("date"));
    criminalInfo.add(request.getParameter("description"));
    
    for(int i=0;i<criminalInfo.size();i++){
        out.println(criminalInfo.get(i));
    }
    
    
    
    Criminal criminal=new Criminal();
    String result=criminal.editCriminalInfo(criminalInfo);
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


