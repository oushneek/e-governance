<%-- 
    Document   : edit_medical_info
    Created on : Dec 8, 2014, 3:04:40 AM
    Author     : Ratul
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
        ArrayList<String> medicalInfo= new ArrayList<String>();
        
        medicalInfo.add(request.getParameter("medical_id"));
        medicalInfo.add(request.getParameter("national_id"));
        medicalInfo.add(request.getParameter("date"));
        medicalInfo.add(request.getParameter("description"));
    
        for(int i=0;i<medicalInfo.size();i++){
            out.println(medicalInfo.get(i));
        }
    
    
    
        Medical medical=new Medical();
        String result=medical.editMedicalInfo(medicalInfo);
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



