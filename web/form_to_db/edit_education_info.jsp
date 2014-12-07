<%-- 
    Document   : edit_education_info
    Created on : Dec 7, 2014, 9:51:49 PM
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
    ArrayList<String> educationInfo= new ArrayList<String>();
        
    educationInfo.add(request.getParameter("education_id"));
    educationInfo.add(request.getParameter("national_id"));
    educationInfo.add(request.getParameter("exam"));
    educationInfo.add(request.getParameter("board"));
    educationInfo.add(request.getParameter("year"));
    educationInfo.add(request.getParameter("cgpa"));
    
    for(int i=0;i<educationInfo.size();i++){
        out.println(educationInfo.get(i));
    }
    
    
    
    Education education=new Education();
    String result=education.editEducationInfo(educationInfo);
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


