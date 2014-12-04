<%-- 
    Document   : admin_login
    Created on : Nov 14, 2014, 4:45:38 PM
    Author     : Ratul
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<style>
    #loginDone,#loginError{
        display:none;
    }    
</style>
 <div class="row show-grid">
              <div class="col-lg-8" style="padding-left: 8%;padding-top: 2%;">

                    <form id="loginForm"  accept-charset="utf-8" class="form-horizontal">       
                        <fieldset>
                            <legend>Login</legend>
                    
                     <div id="loginError" class='alert alert-danger' role='alert'>Invalid Email/Password, Please Try Again</div>
                     <div id="loginDone" class='alert alert-success' role='alert'>Login Successfull, Redirecting to your Panel</div>
                    <div class="form-group">
                                <label for="email" class="col-lg-2 control-label">Email*</label>
                      <div class="col-lg-10">
                          <input type="email" class="form-control" id="email" name="email"  value="" placeholder="Type your Email ID" required>
                      </div>
                    </div>

                    <div class="form-group">
                                <label for="password" class="col-lg-2 control-label">Password*</label>
                      <div class="col-lg-10">
                        <input type="password" class="form-control" id="password" name="password" value="" placeholder="Type your Password" required>
                      </div>
                    </div>



                <div class="form-group">
                  <div class="col-lg-10 col-lg-offset-2">

                    <input type="button" id="loginButton" class="btn btn-primary" value="Login">
                    
                  </div>
                </div>
              </fieldset>
            </form>
              </div>
                <div class="col-lg-4" style="padding-top: 4%;padding-right: 2%;">
                  <div class="panel panel-default">
                  <div class="panel-heading">Forget Password</div>
                    <div class="panel-body">
                          <div class="form-group">
                              <div class="input-group">
                                <span class="input-group-addon">Email</span>
                                <input type="text" class="form-control">
                                <span class="input-group-btn">
                                  <button class="btn btn-default" type="button">Button</button>
                                </span>
                              </div>
                            </div>
                    </div>
                  </div>
                </div>
 </div>


<script>
$(document).ready(function(){

    
  $( "#loginButton" ).click(function() {
      $("#loginDone").slideUp();
      $("#loginError").slideUp();
      
      if( ($("#email").val() === "") || ($("#password").val() === "")  ){
          alert("Please Fill Up Every Field");
      }
      else if (IsEmail($("#email").val())==false){
          alert("Invalid Email")
      }
      else{
         $("#loginButton").val("Processing...");
         $("#loginButton").addClass("disabled");
         $.ajax({
                    type  : "POST",
                    url : "form_to_db/login_check.jsp",
                    data  : $("#loginForm").serialize(),
                    }).done(function(data) {
                      if(data != "0"){
                          $("#loginDone").slideDown();
                          $("#loginButton").slideUp();
                          if(data == "1"){
                           window.location.replace("education.jsp");   
                          }
                          else if (data == "2"){
                           window.location.replace("bank.jsp");   
                          }
                          else if (data == "3"){
                           window.location.replace("criminal.jsp");   
                          }
                          else if (data == "4"){
                           window.location.replace("medical.jsp");   
                          }
                          else if (data == "5"){
                           window.location.replace("job.jsp");   
                          }
                          else if (data == "6"){
                           window.location.replace("add_new_citizen.jsp");   
                          }
                      }
                      else{
                          $("#loginButton").removeClass("disabled");
                          $("#loginButton").val("Login");
                          $("#loginError").slideDown();
                      }
                    }).error(function(data) {
                        console.log(data);
                    alert("Try Again to Login");
                    $("#loginButton").removeClass("disabled");
                    $("#loginButton").val("Login");
                    });
      }
    });
    function IsEmail(email) {
        var regex = /^([a-zA-Z0-9_\.\-\+])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
        if(!regex.test(email)) {
           return false;
        }else{
           return true;
        }
     }

}); 
</script>