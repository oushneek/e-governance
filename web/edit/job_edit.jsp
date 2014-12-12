<%-- 
    Document   : job_edit
    Created on : Dec 8, 2014, 3:14:27 AM
    Author     : Ratul
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
    <%
        //Secure the Page from UnAuthorised Access
        if (session.getAttribute("organization_id") == null) {
            response.setHeader("Refresh", "0;url=../index.jsp");
        }
    %>

    <!-- Include Header -->
    <jsp:include page="header.jsp" />

    <body>
        <!-- Include Menu -->
        <jsp:include page="menu.jsp" />       

        <!-- Include Bank Form -->
        <jsp:include page="../form/edit_job_form.jsp" />


        <!-- Include Footer -->
        <jsp:include page="footer.jsp" />     
    </body>
</html>