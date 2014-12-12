<%-- 
    Document   : criminal
    Created on : Nov 30, 2014, 1:26:59 PM
    Author     : Ratul
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <%
        //Secure the Page from UnAuthorised Access
        if (session.getAttribute("organization_id") == null) {
            response.setHeader("Refresh", "0;url=index.jsp");
        }
    %>

    <!-- Include Header -->
    <jsp:include page="include/header.jsp" />

    <body>
        <!-- Include Menu -->
        <jsp:include page="include/menu.jsp" />       

        <!-- Include Bank Form -->
        <jsp:include page="form/criminal_form.jsp" />


        <!-- Include Footer -->
        <jsp:include page="include/footer.jsp" />     
    </body>
</html>
