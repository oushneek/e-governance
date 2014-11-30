

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
                        response.setHeader("Refresh", "2;url=../index.jsp"); 
                  }
                  else{
                      ArrayList<String> loginDetails = new ArrayList<String>();
                      loginDetails = login.loginDetails(email, pass);
                      
                      out.print("<div class='alert alert-success' role='alert'>Login Successfull, Redirecting to your Panel</div>");

                       if(loginDetails.get(0).equals("1")){
                         response.setHeader("Refresh", "2;url=../education.jsp"); 
                      }
                      else if(loginDetails.get(0).equals("2")){
                         response.setHeader("Refresh", "2;url=../bank.jsp"); 
                      }
                      else if(loginDetails.get(0).equals("3")){
                         response.setHeader("Refresh", "2;url=../criminal.jsp"); 
                      }
                      else if(loginDetails.get(0).equals("4")){
                         response.setHeader("Refresh", "2;url=../medical.jsp"); 
                      }
                      else if(loginDetails.get(0).equals("5")){
                         response.setHeader("Refresh", "2;url=../job.jsp"); 
                      }
                      
                      else{
                         response.setHeader("Refresh", "2;url=../index.jsp"); 
                      }
                  }
                  %>
                    
              </div>
              <div class="col-lg-4" style="padding-top: 4%;padding-right: 2%;">
                  
              </div>
    </div>
           
    
    <!-- Include Footer -->
    <jsp:include page="../include/footer.jsp" />     
  </body>
</html>


