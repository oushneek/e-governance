<%-- 
    Document   : edit_bank_info
    Created on : Dec 6, 2014, 8:51:23 PM
    Author     : Tazbeea Tazakka
--%>

<%@page import="database.bank.EditBankInfo"%>
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
        String national_id=request.getParameter("national_id");
        String banking_id=request.getParameter("banking_id");
    
        EditBankInfo bank=new EditBankInfo();
        String result=bank.update(banking_id,national_id);
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


