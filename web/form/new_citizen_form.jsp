<%-- 
    Document   : add_new_citizen
    Created on : Nov 25, 2014, 10:19:36 AM
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

        <form id="citizenForm"  accept-charset="utf-8" class="form-horizontal">       
            <fieldset>
                <legend>Add new Citizen</legend>
                <div id="Error" class='alert alert-danger' role='alert'>Something Wrong !! Please Check the Data and Try Again</div>
                <div id="Done" class='alert alert-success' role='alert'>Data has been Successfully Saved</div>

                <div class="form-group">
                    <label for="name_en" class="col-lg-3 control-label">Name(English)* :</label>
                    <div class="col-lg-9">
                        <input type="text" class="form-control" id="name_en" name="name_en"  value="" placeholder="Type citizen's name in ENGLISH">
                    </div>
                </div>

                <div class="form-group">
                    <label for="name_bn" class="col-lg-3 control-label">Name(বাংলা)* :</label>
                    <div class="col-lg-9">
                        <input type="text" class="form-control" id="name_bn" name="name_bn"  value="" placeholder="Type citizen's name in Bangla">
                    </div>
                </div>


                <div class="form-group">
                    <label for="father" class="col-lg-3 control-label">Father's Name* :</label>
                    <div class="col-lg-9">
                        <input type="text" class="form-control" id="father" name="father"  value="" placeholder="Type citizen's father's name in ENGLISH">
                    </div>
                </div>

                <div class="form-group">
                    <label for="mother" class="col-lg-3 control-label">Mother's Name* :</label>
                    <div class="col-lg-9">
                        <input type="text" class="form-control" id="mother" name="mother"  value="" placeholder="Type citizen's mother's name in ENGLISH">
                    </div>
                </div>

                <div class="form-group">
                    <label for="date_of_birth" class="col-lg-3 control-label">Date Of Birth* :</label>
                    <div class="col-lg-9">
                        <input type="date" class="form-control" id="date_of_birth" name="date_of_birth"  value="">
                    </div>
                </div>


                <div class="form-group">
                    <label for="birth_place" class="col-lg-3 control-label">Birth Place* :</label>
                    <div class="col-lg-9">
                        <select class="form-control" id="birth_place" name="birth_place">
                            <option value="">Select</option>
                            <option value="Dhaka">Dhaka</option>
                            <option value="Sylhet">Sylhet</option>
                            <option value="Chittagong">Chittagong</option>
                            <option value="Barisal">Barisal</option>
                            <option value="Rajshahi">Rajshahi</option>
                            <option value="Khulna">Khulna</option>
                            <option value="Teknaf">Teknaf</option>
                            <option value="Comilla">Comilla</option>
                            <option value="Tangail">Tangail</option>
                            <option value="Kurigram">Kurigram</option>
                        </select>
                    </div>
                </div>


                <div class="form-group">
                    <label for="blood_group" class="col-lg-3 control-label">Blood Group* :</label>
                    <div class="col-lg-9">
                        <select class="form-control" id="blood_group" name="blood_group">
                            <option value="">Select</option>
                            <option value="A+">A+</option>
                            <option value="B+">B+</option>
                            <option value="AB+">AB+</option>
                            <option value="O+">O+</option>
                            <option value="A-">A-</option>
                            <option value="B-">B-</option>
                            <option value="AB-">AB-</option>
                            <option value="O-">O-</option>
                        </select>
                    </div>
                </div>


                <div class="form-group">
                    <label for="religion" class="col-lg-3 control-label">Religion* :</label>
                    <div class="col-lg-9">
                        <select class="form-control" id="religion" name="religion">
                            <option value="">Select</option>
                            <option value="Islam">Islam</option>
                            <option value="Hindu">Hindu</option>
                            <option value="Cristian">Cristian</option>
                            <option value="Boudha">Boudha</option>
                            <option value="Others">Others</option>
                        </select>
                    </div>
                </div>

                <div class="form-group">
                    <label for="present_address" class="col-lg-3 control-label">Present Address* :</label>
                    <div class="col-lg-9">
                        <textarea class="form-control" rows="3" id="present_address" name="present_address"  placeholder="Type citizen's Present Address in ENGLISH"></textarea>
                    </div>
                </div>



                <div class="form-group">
                    <label for="permanent_address" class="col-lg-3 control-label">Permanent Address* :</label>
                    <div class="col-lg-9">
                        <textarea class="form-control" rows="3" id="permanent_address" name="permanent_address"  placeholder="Type citizen's Permanent Address in ENGLISH"></textarea>
                    </div>
                </div>



                <div class="form-group">
                    <label class="col-lg-3"></label>
                    <div class="col-lg-9">
                        <input type="button" id="addButton" class="btn btn-primary btn-medium" value="Add">
                    </div>
                </div>
            </fieldset>
        </form>
    </div>
        <div class="col-lg-4" style="padding-top: 4%;padding-right: 2%;">
        <div class="panel panel-default">
            <div class="panel-heading">Search All Category Information</div>
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

            if (($("#name_en").val() === "") || ($("#name_bn").val() === "") || ($("#father").val() === "") || ($("#mother").val() === "") || ($("#date_of_birth").val() === "") || ($("#birth_place").val() === "") || ($("#blood_group").val() === "") || ($("#religion").val() === "") || ($("#present_address").val() === "") || ($("#permanent_address").val() === "")) {
                alert("Please Fill Up Every Field");
            }
            else {
                $("#addButton").val("Adding...");
                $("#addButton").addClass("disabled");
                $.ajax({
                    type: "POST",
                    url: "form_to_db/new_citizen.jsp",
                    data: $("#citizenForm").serialize()
                }).done(function(data) {
                    if (data != "0") {
                        $("#Done").slideDown();
                        $("#Error").slideUp();
                        $("#addButton").removeClass("disabled");
                        $("#addButton").val("Add");
                        $('#citizenForm').trigger("reset");
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