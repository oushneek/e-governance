<%-- 
    Document   : criminal
    Created on : Nov 30, 2014, 1:27:21 PM
    Author     : Ratul
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

        <form id="criminalForm" method="post" accept-charset="utf-8" class="form-horizontal">       
            <fieldset>
                <legend>Add New Criminal Data</legend>
                 <div id="Error" class='alert alert-danger' role='alert'>Something Wrong !! Please Check the Data and Try Again</div>
                <div id="Done" class='alert alert-success' role='alert'>Data has been Successfully Saved</div>

                <div class="form-group">
                    <label for="national_id" class="col-lg-2 control-label">National ID*</label>
                    <div class="col-lg-10">
                        <input type="text" class="form-control" id="national_id" name="national_id"  value="" placeholder="Type citizen's National ID No" required>
                    </div>
                </div>

                <div class="form-group">
                    <label for="date" class="col-lg-2 control-label">Date*</label>
                    <div class="col-lg-10">
                        <input type="date" class="form-control" id="date" name="date"  value="" placeholder="Type your Email ID" required>
                    </div>
                </div>

                <div class="form-group">
                    <label for="description" class="col-lg-2 control-label">Description*</label>
                    <div class="col-lg-10">
                        <textarea class="form-control" id="description" name="description"  value="" placeholder="Type Description" required></textarea>
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
            <div class="panel-body">
                <form action="search/criminal_search.jsp" method="GET">
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

            if (($("#national_id").val() === "") || ($("#date").val() === "")  || ($("#description").val() === "")) {
                alert("Please Fill Up Every Field");
            }
            else {
                $("#addButton").val("Adding...");
                $("#addButton").addClass("disabled");
                $.ajax({
                    type: "POST",
                    url: "form_to_db/criminal_info.jsp",
                    data: $("#criminalForm").serialize()
                }).done(function(data) {
                    if (data != "0") {
                        $("#Done").slideDown();
                        $("#Error").slideUp();
                        $("#addButton").removeClass("disabled");
                        $("#addButton").val("Add");
                        $('#criminalForm').trigger("reset");
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
