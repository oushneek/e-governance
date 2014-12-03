<%-- 
    Document   : new_citizen
    Created on : Nov 30, 2014, 11:17:10 PM
    Author     : Tazbeea Tazakka
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
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
        
        ArrayList<String> citizenInfo = new ArrayList<String>();
        citizenInfo.add(request.getParameter("name_en"));
        citizenInfo.add(request.getParameter("name_bn"));
        citizenInfo.add(request.getParameter("father"));
        citizenInfo.add(request.getParameter("mother"));
        citizenInfo.add(request.getParameter("date_of_birth"));
        out.println(citizenInfo.get(4));
        citizenInfo.add(request.getParameter("birth_place"));
        citizenInfo.add(request.getParameter("blood_group"));
        citizenInfo.add(request.getParameter("religion"));
        citizenInfo.add(request.getParameter("present_address"));
        citizenInfo.add(request.getParameter("permanent_address"));
    
    String birth_year= citizenInfo.get(4).substring(0,4);
    String birth_place =null;
    if(citizenInfo.get(5).equals("Dhaka")){
        birth_place="001";
    }
    else if(citizenInfo.get(5).equals("Sylhet")){
         birth_place="002";
    }
    else if(citizenInfo.get(5).equals("Chittagong")){
         birth_place="003";
    }
    else if(citizenInfo.get(5).equals("Barisal")){
         birth_place="004";
    }
    else if(citizenInfo.get(5).equals("Rajshahi")){
         birth_place="005";
    }
    else if(citizenInfo.get(5).equals("Khulna")){
         birth_place="006";
    }
    else if(citizenInfo.get(5).equals("Teknaf")){
         birth_place="007";
    }
    else if(citizenInfo.get(5).equals("Comilla")){
         birth_place="008";
    }
    else if(citizenInfo.get(5).equals("Tangail")){
         birth_place="009";
    }
    else if(citizenInfo.get(5).equals("Kurigram")){
         birth_place="010";
    }
    
    String tempNationalID=birth_year+birth_place;
    String finalid=null;
    Citizen citizen= new Citizen();
    int nationalID=citizen.maxNationalID(tempNationalID);
    if(nationalID==0){
        tempNationalID+="001";
        finalid=tempNationalID;
    }
    else{
        nationalID+=1;
        finalid=Integer.toString(nationalID);
    }
    Calendar currentdate=Calendar.getInstance();
    SimpleDateFormat formatter=new SimpleDateFormat("yyyy-MM-dd");
    String dateNow=formatter.format(currentdate.getTime());
    
    String result=citizen.insertCitizen(finalid, citizenInfo, dateNow);
    out.print("<div class='alert alert-success' role='alert'>New Citizen added . His / Her National Id is"+finalid+"</div>");
    response.setHeader("Refresh", "5;url=../add_new_citizen.jsp"); 
    //out.print(result);
      
    %>
    <div class="row show-grid">
              <div class="col-lg-8" style="padding-left: 8%;padding-top: 2%;">
                  
                    
              </div>
              <div class="col-lg-4" style="padding-top: 4%;padding-right: 2%;">
                  
              </div>
    </div>
           
    
    <!-- Include Footer -->
    <jsp:include page="../include/footer.jsp" />     
  </body>
</html>


