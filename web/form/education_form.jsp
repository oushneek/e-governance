<%-- 
    Document   : education_form
    Created on : Nov 30, 2014, 5:22:22 PM
    Author     : Tazbeea Tazakka
--%>

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
                <legend>Add Education Information of Citizen</legend>

                <div id="Error" class='alert alert-danger' role='alert'>Something Wrong !! Please Check the Data and Try Again</div>
                <div id="Done" class='alert alert-success' role='alert'>Data has been Successfully Saved</div>

                <div class="form-group">
                    <label for="national_id" class="col-lg-3 control-label">National ID NO* :</label>
                    <div class="col-lg-9">
                        <input type="text" class="form-control" id="national_id" name="national_id"  value="" placeholder="Type citizen's National ID No">
                    </div>
                </div>

                <div class="form-group">
                    <label for="exam" class="col-lg-3 control-label">Examination* :</label>
                    <div class="col-lg-9">
                        <select class="form-control" id="exam" name="exam">
                            <option value="">Select</option>
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
                            <option value="">Select</option>
                            <option value="dhaka">Dhaka</option>
                            <option value="rajshahi">Rajshahi</option>
                            <option value="comilla">Comilla</option>
                            <option value="jessore">Jessore</option>
                            <option value="chittagong">Chittagong</option>
                            <option value="barisal">Barisal</option>
                            <option value="sylhet">Sylhet</option>
                            <option value="madrasah">Madrasah</option>
                            <option value="technicalsc">Technical</option>
                        </select>
                    </div>
                </div>        


                <div class="form-group">
                    <label for="year" class="col-lg-3 control-label">Year* :</label>
                    <div class="col-lg-9">
                        <input type="text" class="form-control" id="year" name="year"  value="" placeholder="Give Passing Year">
                    </div>
                </div>

                <div class="form-group">
                    <label for="cgpa" class="col-lg-3 control-label">CGPA* :</label>
                    <div class="col-lg-9">
                        <input type="text"  class="form-control" id="cgpa" name="cgpa"  value="" placeholder="Type citizen's CGPA">
                    </div>
                </div>




                <div class="form-group">
                    <div class="col-lg-10 col-lg-offset-2">

                        <input type="button" id="addButton" class="btn btn-primary" value="Add">
                    </div>
                </div>
            </fieldset>
        </form>
    </div>
    <div class="col-lg-4" style="padding-top: 4%;padding-right: 2%;">
        <div class="panel panel-default">
            <div class="panel-heading">Search</div>
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
        $("#addButton").click(function() {
            $("#Error").slideUp();
            $("#Done").slideUp();

            if (($("#national_id").val() === "") || ($("#exam").val() === "") || ($("#board").val() === "") || ($("#year").val() === "") || ($("#cgpa").val() === "")) {
                alert("Please Fill Up Every Field");
            }
            else {
                $("#addButton").val("Adding...");
                $("#addButton").addClass("disabled");
                $.ajax({
                    type: "POST",
                    url: "form_to_db/education_info.jsp",
                    data: $("#educationForm").serialize()
                }).done(function(data) {
                    if (data != "0") {
                        $("#Done").slideDown();
                        $("#Error").slideUp();
                        $("#addButton").removeClass("disabled");
                        $("#addButton").val("Add");
                        $('#educationForm').trigger("reset");
                    }
                    else {
                        $("#addButton").removeClass("disabled");
                        $("#addButton").val("Add");
                        $("#Error").slideDown();
                    }
                }).error(function(data) {
                    console.log(data);
                    alert("Try Again to Add");
                    $("#addButton").removeClass("disabled");
                    $("#addButton").val("Add");
                    $("#Error").slideDown();
                });
            }
        });
    });
</script>
