<%-- 
    Document   : bank_edit
    Created on : Dec 6, 2014, 8:28:22 PM
    Author     : Tazbeea Tazakka
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
        <jsp:include page="../form/edit_bank_form.jsp" />


        <!-- Include Footer -->
        <jsp:include page="footer.jsp" />     
    </body>
</html>
