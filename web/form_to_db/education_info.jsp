<%-- 
    Document   : education_info
    Created on : Dec 1, 2014, 10:35:58 PM
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

            ArrayList<String> education = new ArrayList<String>();
            education.clear();

            education.add(request.getParameter("national_id"));
            education.add(session.getAttribute("organization_id").toString());
            education.add(request.getParameter("exam"));
            education.add(request.getParameter("year"));
            education.add(request.getParameter("board"));
            education.add(request.getParameter("cgpa"));

            Education eduInfo = new Education();
            String result = eduInfo.insertEducationInfo(education);
            //out.print(result);

            out.print("<div class='alert alert-success' role='alert'>Citizen " + education.get(0) + " has been added by " + session.getAttribute("organization_name") + "</div>");
            response.setHeader("Refresh", "2;url=../education.jsp");
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


