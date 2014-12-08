<%-- 
    Document   : bank_info
    Created on : Dec 1, 2014, 4:33:44 PM
    Author     : Tazbeea Tazakka
--%>

<%@page import="database.bank.AddBankInfo"%>
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
    
        AddBankInfo bank=new AddBankInfo();
        String result=bank.insert(organization_id,national_id);
        //out.print(result);
        
        out.print("<div class='alert alert-success' role='alert'>Citizen "+national_id+" has been added to "+session.getAttribute("organization_name")+"</div>");
        response.setHeader("Refresh", "2;url=../bank.jsp"); 
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


