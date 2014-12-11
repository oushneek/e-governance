<%-- 
    Document   : edit_education_form
    Created on : Dec 7, 2014, 9:11:45 PM
    Author     : Tazbeea Tazakka
--%>

<%@page import="database.education.GetEducationInfo"%>
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

        <form id="educationForm" accept-charset="utf-8" class="form-horizontal">       
            <fieldset>
                <legend>Edit Education Information of Citizen</legend>
                <div id="Error" class='alert alert-danger' role='alert'>Something Wrong !! Please Check the Data and Try Again</div>
                <div id="Done" class='alert alert-success' role='alert'>Data has been Successfully Updated</div>

                <%

                    String national_id = request.getParameter("national_id");
                    String education_id = request.getParameter("education_id");

                    ArrayList<String> educationInfo = new ArrayList<String>();
                    GetEducationInfo education = new GetEducationInfo();
                    educationInfo = education.get(education_id, national_id);

                %>

                <input type="hidden" name="education_id" id="education_id" value="<%out.print(education_id);%>">

                <div class="form-group">
                    <label for="national_id" class="col-lg-3 control-label">National ID NO* :</label>
                    <div class="col-lg-9">
                        <input type="text" class="form-control" id="national_id" name="national_id"  value="<%out.print(national_id);%>" placeholder="Type citizen's National ID No">
                    </div>
                </div>

                <div class="form-group">
                    <label for="exam" class="col-lg-3 control-label">Examination* :</label>
                    <div class="col-lg-9">
                        <select class="form-control" id="exam" name="exam">
                            <option value="<%out.print(educationInfo.get(0));%>"><%out.print(educationInfo.get(0));%></option>
                            <option value="psc">P.S.C.</option>
                            <option value="jsc">J.S.C.</option>
                            <option value="ssc">S.S.C.</option>
                            <option value="hsc">H.S.C.</option>

                        </select>
                    </div>
                </div>

                <div class="form-group">
                    <label for="board" class="col-lg-3 control-label">Board* :</label>
                    <div class="col-lg-9">
                        <select class="form-control" id="board" name="board">
                            <option value="<%out.print(educationInfo.get(1));%>"><%out.print(educationInfo.get(1));%></option>
                            <option value="Dhaka">Dhaka</option>
                            <option value="Rajshahi">Rajshahi</option>
                            <option value="Comilla">Comilla</option>
                            <option value="Jessore">Jessore</option>
                            <option value="Chittagong">Chittagong</option>
                            <option value="Barisal">Barisal</option>
                            <option value="Sylhet">Sylhet</option>
                            <option value="Madrasah">Madrasah</option>
                            <option value="Technicalsc">Technical</option>
                        </select>
                    </div>
                </div>        


                <div class="form-group">
                    <label for="year" class="col-lg-3 control-label">Year* :</label>
                    <div class="col-lg-9">
                        <input type="text" class="form-control" id="year" name="year"  value="<%out.print(educationInfo.get(2));%>" placeholder="Give Passing Year">
                    </div>
                </div>

                <div class="form-group">
                    <label for="cgpa" class="col-lg-3 control-label">CGPA* :</label>
                    <div class="col-lg-9">
                        <input type="text"  class="form-control" id="cgpa" name="cgpa"  value="<%out.print(educationInfo.get(3));%>" placeholder="Type citizen's CGPA">
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
            <div class="panel-heading">Note</div>
            <form action="search/education_search.jsp" method="GET">
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
    <div class="col-lg-4" style="padding-top: 4%;padding-right: 2%;">
        <div class="panel panel-default">
            <div class="panel-heading">SEARCH ALL CATEGORY INFORMATION</div>
            <div class="panel-body">
                <form action="search/detailed_search.jsp" method="GET">
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

            if (($("#national_id").val() === "") || ($("#exam").val() === "") || ($("#board").val() === "") || ($("#year").val() === "") || ($("#cgpa").val() === "")) {
                alert("Please Fill Up Every Field");
            }
            else {
                $("#updateButton").val("Updating...");
                $("#updateButton").addClass("disabled");
                $.ajax({
                    type: "POST",
                    url: "../form_to_db/edit_education_info.jsp",
                    data: $("#educationForm").serialize()
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
