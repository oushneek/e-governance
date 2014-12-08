<%-- 
    Document   : index
    Created on : Nov 7, 2014, 11:56:55 PM
    Author     : Ratul
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
    <%
    if(session.getAttribute("organization_id") != null)
    {
      if(session.getAttribute("type_id").equals("1")){
       response.sendRedirect("education.jsp");
      }
      else if (session.getAttribute("type_id").equals("2")){
       response.sendRedirect("bank.jsp");
      }
      else if (session.getAttribute("type_id").equals("3")){
       response.sendRedirect("criminal.jsp");
      }
      else if (session.getAttribute("type_id").equals("4")){
       response.sendRedirect("medical.jsp");
      }
      else if (session.getAttribute("type_id").equals("5")){
       response.sendRedirect("job.jsp");
      }
      else if (session.getAttribute("type_id").equals("6")){
       response.sendRedirect("add_new_citizen.jsp");
      }
    }
    
    %>
    <!-- Include Header -->
    <jsp:include page="include/header.jsp" />

    <body>
        <!-- Include Menu -->
        <jsp:include page="include/menu.jsp" />       

        <!-- Include Login Form -->
        <jsp:include page="form/admin_login.jsp" />


        <!-- Include Footer -->
        <jsp:include page="include/footer.jsp" />     
    </body>
</html>

