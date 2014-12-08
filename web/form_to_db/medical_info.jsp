<%-- 
    Document   : medical_info
    Created on : Dec 1, 2014, 11:05:26 PM
    Author     : Tazbeea Tazakka
--%>

<%@page import="database.medical.AddMedicalInfo" %>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="database.*" %>
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
   
     
        AddMedicalInfo medicalInfo=new AddMedicalInfo();
        String result=medicalInfo.insert(medical);
//        out.print(medical.get(2));
//        out.print(medical.get(3));
//        out.print(result);
        
        out.print("<div class='alert alert-success' role='alert'>Citizen " + medical.get(0) + " has been added by " + session.getAttribute("organization_name") + "</div>");
        response.setHeader("Refresh", "2;url=../medical.jsp");
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


