

<%@page import="java.util.ArrayList"%>
<%@page contentType="application/json; charset=UTF-8"%>
<%@ page import="database.*" %>



     

    <%
    //Get the Login Credential
    String email = request.getParameter("email");
    String pass = request.getParameter("password");
    
    Login login = new Login();
    boolean decision = login.loginCheck(email, pass);
    
    String result= new String("");
        
    %>

                  <%
                  if(!decision){
                        result = "0";
                        out.print(result);
                  }
                  else{
                      ArrayList<String> loginDetails = new ArrayList<String>();
                      loginDetails = login.loginDetails(email, pass);

                       out.print(loginDetails.get(0));
//                         response.setHeader("Refresh", "2;url=../education.jsp");
                       session.setAttribute("type_id", loginDetails.get(0));
                       session.setAttribute("organization_id", loginDetails.get(1));
                       session.setAttribute("organization_name", loginDetails.get(2));


                  }
                  %>

