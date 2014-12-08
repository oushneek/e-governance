

<%@page import="database.login.LoginDetails"%>
<%@page import="database.login.LoginCheck"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="application/json; charset=UTF-8"%>
<%@ page import="database.*" %>





<%
//Get the Login Credential
String email = request.getParameter("email");
String pass = request.getParameter("password");
    
//Login login = new Login();
//boolean decision = login.loginCheck(email, pass);

LoginCheck loginCheck = new LoginCheck();
boolean decision = loginCheck.check(email, pass);

    
String result= new String("");
        
%>

<%
if(!decision){
      result = "0";
      out.print(result);
}
else{
    ArrayList<String> loginDetails = new ArrayList<String>();
    LoginDetails loginDetailsObject = new LoginDetails();
    loginDetails = loginDetailsObject.get(email, pass);

     out.print(loginDetails.get(0));
     
     session.setAttribute("type_id", loginDetails.get(0));
     session.setAttribute("organization_id", loginDetails.get(1));
     session.setAttribute("organization_name", loginDetails.get(2));


}
%>

