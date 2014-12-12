<%-- 
    Document   : edit_medical_form
    Created on : Dec 8, 2014, 2:50:53 AM
    Author     : Ratul
--%>

<%@page import="database.medical.GetMedicalInfo"%>
<%@page import="database.*"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<style>
    #Error,#Done{
        display:none;
    }    
</style>
<div class="row show-grid">
    <div class="col-lg-8" style="padding-left: 8%;padding-top: 2%;">

        <form id="medicalForm" accept-charset="utf-8" class="form-horizontal">       
            <fieldset>
                <legend>Edit Medical Information of Citizen</legend>
                <div id="Error" class='alert alert-danger' role='alert'>Something Wrong !! Please Check the Data and Try Again</div>
                <div id="Done" class='alert alert-success' role='alert'>Data has been Successfully Updated</div>

                <%

                    String national_id = request.getParameter("national_id");
                    String medical_id = request.getParameter("medical_id");

                    ArrayList<String> medicalInfo = new ArrayList<String>();
                    GetMedicalInfo medical = new GetMedicalInfo();
                    medicalInfo = medical.get(medical_id, national_id);

                %>

                <input type="hidden" name="medical_id" id="medical_id" value="<%out.print(medical_id);%>">

                <div class="form-group">
                    <label for="national_id" class="col-lg-3 control-label">National ID NO* :</label>
                    <div class="col-lg-9">
                        <input type="text" class="form-control" id="national_id" name="national_id"  value="<%out.print(national_id);%>" placeholder="Type citizen's National ID No">
                    </div>
                </div>

                <div class="form-group">
                    <label for="date" class="col-lg-3 control-label">Date* :</label>
                    <div class="col-lg-9">
                        <input type="date" class="form-control" id="date" name="date"  value="<%out.print(medicalInfo.get(0));%>">
                    </div>
                </div>

                <div class="form-group">
                    <label for="description" class="col-lg-3 control-label">Description* :</label>
                    <div class="col-lg-9">
                        <textarea class="form-control" rows="3" id="description" name="description"  placeholder="Type medical information"><%out.print(medicalInfo.get(1));%></textarea>
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
            <form action="../search/education_search.jsp" method="GET">
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
        <div class="panel panel-default">
            <div class="panel-heading">Search All Category Information (Based on your Privilege )</div>
            <div class="panel-body">
                <form action="../search/detailed_search.jsp" method="GET">
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

            if (($("#national_id").val() === "") || ($("#date").val() === "") || ($("#description").val() === "")) {
                alert("Please Fill Up Every Field");
            }
            else {
                $("#updateButton").val("Updating...");
                $("#updateButton").addClass("disabled");
                $.ajax({
                    type: "POST",
                    url: "../form_to_db/edit_medical_info.jsp",
                    data: $("#medicalForm").serialize()
                }).done(function(data) {
                    if (data != "0") {
                        $("#Done").slideDown();
                        $("#Error").slideUp();
                        $("#updateButton").removeClass("disabled");
                        $("#updateButton").val("Update");

                    }
                    else {
                        $("#updateButton").removeClass("disabled");
                        $("#updateButton").val("Update");
                        $("#Error").slideDown();
                    }
                }).error(function(data) {
                    console.log(data);
                    $("#updateButton").removeClass("disabled");
                    $("#updateButton").val("Update");
                    $("#Error").slideDown();
                });
            }
        });
    });
</script>

