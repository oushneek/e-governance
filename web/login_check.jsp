

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="database.*" %>

<!DOCTYPE html>
<html lang="en">
    
    <!-- Include Header -->
    <jsp:include page="include/header.jsp" />
 
    <body>
    <!-- Include Menu -->
    <jsp:include page="include/menu.jsp" />       

    <%
    //Get the Login Credential
    String email = request.getParameter("email");
    String pass = request.getParameter("password");
    
    Login login = new Login();
    boolean decision = login.loginCheck(email, pass);
        
    %>
    <div class="row show-grid">
              <div class="col-lg-8" style="padding-left: 8%;padding-top: 2%;">
                  <%
                  if(!decision){
                        out.print("<div class='alert alert-danger' role='alert'>Invalid Email/Password, Please Try Again</div>");
                        response.setHeader("Refresh", "2;url=index.jsp"); 
                  }
                  else{
                      out.print("<div class='alert alert-success' role='alert'>Login Successfull, Redirecting to your Panel</div>");
                      response.setHeader("Refresh", "2;url=index.jsp"); 
                  }
                  %>
                    
              </div>
              <div class="col-lg-4" style="padding-top: 4%;padding-right: 2%;">
                  
              </div>
    </div>
           
    
    <!-- Include Footer -->
    <jsp:include page="include/footer.jsp" />     
  </body>
</html>


