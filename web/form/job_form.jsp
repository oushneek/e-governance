<%-- 
    Document   : job_form
    Created on : Nov 30, 2014, 6:22:44 PM
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

        <form id="jobForm" accept-charset="utf-8" class="form-horizontal">       
            <fieldset>
                <legend>Add Job Information of Citizen</legend>
                <div id="Error" class='alert alert-danger' role='alert'>Something Wrong !! Please Check the Data and Try Again</div>
                <div id="Done" class='alert alert-success' role='alert'>Data has been Successfully Saved</div>


                <div class="form-group">
                    <label for="national_id" class="col-lg-3 control-label">National ID NO* :</label>
                    <div class="col-lg-9">
                        <input type="text" class="form-control" id="national_id" name="national_id"  value="" placeholder="Type citizen's National ID No">
                    </div>
                </div>



                <div class="form-group">
                    <label for="joining_date" class="col-lg-3 control-label">Joining Date* :</label>
                    <div class="col-lg-9">
                        <input type="date" class="form-control" id="joining_date" name="joining_date"  value="">
                    </div>
                </div>


                <div class="form-group">
                    <label for="leaving_date" class="col-lg-3 control-label">Leaving Date* :</label>
                    <div class="col-lg-9">
                        <input type="date" class="form-control" id="leaving_date" name="leaving_date"  value="">
                    </div>
                </div>

                <div class="form-group">
                    <label for="post" class="col-lg-3 control-label">Post* :</label>
                    <div class="col-lg-9">
                        <input type="text" class="form-control" id="post" name="post"  value="" placeholder="Type citizen's Post">
                    </div>
                </div>




                <div class="form-group">
                    <label for="post" class="col-lg-3 control-label"></label>
                    <div class="col-lg-9">

                        <input type="button" id="addButton" class="btn btn-primary" value="Add">
                    </div>
                </div>
            </fieldset>
        </form>
    </div>
    <div class="col-lg-4" style="padding-top: 4%;padding-right: 2%;">
        <div class="panel panel-default">
            <div class="panel-heading">Search</div>
            <div class="panel-body">
                <form action="search/job_search.jsp" method="GET">
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
        <div class="panel panel-default">
            <div class="panel-heading">Search All Category Information (Based on your Privilege )</div>
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

            if (($("#national_id").val() === "") || ($("#joining_date").val() === "") || ($("#leaving_date").val() === "") || ($("#post").val() === "")) {
                alert("Please Fill Up Every Field");
            }
            else {
                $("#addButton").val("Adding...");
                $("#addButton").addClass("disabled");
                $.ajax({
                    type: "POST",
                    url: "form_to_db/job_info.jsp",
                    data: $("#jobForm").serialize()
                }).done(function(data) {
                    if (data != "0") {
                        $("#Done").slideDown();
                        $("#Error").slideUp();
                        $("#addButton").removeClass("disabled");
                        $("#addButton").val("Add");
                        $('#jobForm').trigger("reset");
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
