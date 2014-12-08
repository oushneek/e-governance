<%-- 
    Document   : criminal_info
    Created on : Dec 2, 2014, 12:47:02 AM
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
        
        ArrayList<String> criminal = new ArrayList<String>();
        criminal.clear();
    
        criminal.add(request.getParameter("national_id"));
        criminal.add(session.getAttribute("organization_id").toString());
        criminal.add(request.getParameter("date"));
        criminal.add(request.getParameter("description"));
   
     
        Criminal criminalInfo=new Criminal();
        String result=criminalInfo.insertCriminalInfo(criminal);
    //    out.print(criminal.get(2));
    //    out.print(criminal.get(3));
    //    out.print(result);
    //        
    
        out.print("<div class='alert alert-success' role='alert'>Citizen "+criminal.get(0)+" has been added by "+session.getAttribute("organization_name")+"</div>");
        response.setHeader("Refresh", "2;url=../criminal.jsp"); 
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

