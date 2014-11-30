<%-- 
    Document   : new_citizen
    Created on : Nov 30, 2014, 11:17:10 PM
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
    //Get the Login Credential
    String name_en = request.getParameter("name_en");
    String name_bn = request.getParameter("name_bn");
    String father = request.getParameter("father");
    String mother = request.getParameter("mother");
    String date_of_birth = request.getParameter("date_of_birth");
    String birth_place = request.getParameter("birth_place");
    String blood_group = request.getParameter("blood_group");
    String religion = request.getParameter("religion");
    String present_address = request.getParameter("present_address");
    String permanent_address = request.getParameter("permanent_address");
    
    String birth_year= date_of_birth.substring(0,4);
    
    String tempNationalID=birth_year+birth_place;
    
    Citizen citizen= new Citizen();
    int nationalID=citizen.maxNationalID(tempNationalID)+1;
    
    
   /* Login login = new Login();
    boolean decision = login.loginCheck(email, pass);
     */   
    %>
    <div class="row show-grid">
              <div class="col-lg-8" style="padding-left: 8%;padding-top: 2%;">
                  <%
       /*           if(!decision){
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
                  }*/
                  %>
                    
              </div>
              <div class="col-lg-4" style="padding-top: 4%;padding-right: 2%;">
                  
              </div>
    </div>
           
    
    <!-- Include Footer -->
    <jsp:include page="../include/footer.jsp" />     
  </body>
</html>


