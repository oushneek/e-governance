<%-- 
    Document   : edit_bank
    Created on : Dec 6, 2014, 8:29:16 PM
    Author     : Tazbeea Tazakka
--%>

<%@page import="database.Bank"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<style>
    #Error,#Done{
        display:none;
    }    
</style>
<div class="row show-grid">
    <div class="col-lg-8" style="padding-left: 8%;padding-top: 2%;">

        <form id="bankForm" accept-charset="utf-8" class="form-horizontal">       
            <fieldset>
                <legend>Edit Bank Data</legend>
                <div id="Error" class='alert alert-danger' role='alert'>Something Wrong !! Please Check the Data and Try Again</div>
                <div id="Done" class='alert alert-success' role='alert'>Data has been Successfully Saved</div>


                <%

                    String national_id = request.getParameter("national_id");
                    String banking_id = request.getParameter("banking_id");
                    //out.print(banking_id);
                %>

                <input type="hidden" name="banking_id" id="banking_id" value="<%out.print(banking_id);%>">
                <div class="form-group">
                    <label for="national_id" class="col-lg-2 control-label">National ID*</label>
                    <div class="col-lg-10">
                        <input type="text" class="form-control" id="national_id" name="national_id"  value="<% out.print(national_id);%>" placeholder="">
                    </div>
                </div>



                <div class="form-group">
                    <div class="col-lg-10 col-lg-offset-2">

                        <input type="button" id="updateButton" class="btn btn-primary" value="Update">
                    </div>
                </div>
            </fieldset>
        </form>
    </div>
    <div class="col-lg-4" style="padding-top: 4%;padding-right: 2%;">
        <div class="panel panel-default">
            <div class="panel-heading">Search</div>
            <div class="panel-body">
                <form action="search/bank_search.jsp" method="GET">
                    <div class="form-group">
                        <div class="input-group">
                            <span class="input-group-addon">National ID</span>
                            <input type="text" class="form-control" name="national_id" id="national_id" required="">
                            <span class="input-group-btn">
                                <button class="btn btn-default" type="submit">Search</button>
                            </span>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<script>
    $(document).ready(function() {
        $("#updateButton").click(function() {
            $("#Error").slideUp();
            $("#Done").slideUp();

            if (($("#national_id").val() === "")) {
                alert("Please Fill Up Every Field");
            }
            else {
                $("#updateButton").val("Updating...");
                $("#updateButton").addClass("disabled");
                $.ajax({
                    type: "POST",
                    url: "../form_to_db/edit_bank_info.jsp",
                    data: $("#bankForm").serialize()
                }).done(function(data) {
                    if (data != "0") {
                        $("#Done").slideDown();
                        $("#Error").slideUp();
                        $("#updateButton").removeClass("disabled");
                        $("#updateButton").val("Update");
                        $('#bankForm').trigger("reset");
                    }
                    else {
                        $("#updateButton").removeClass("disabled");
                        $("#updateButton").val("Update");
                        $("#Error").slideDown();
                    }
                }).error(function(data) {
                    console.log(data);
                    alert("Try Again to Update");
                    $("#updateButton").removeClass("disabled");
                    $("#updateButton").val("Update");
                    $("#Error").slideDown();
                });
            }
        });
    });
</script>
