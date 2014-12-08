<%-- 
    Document   : add_new_citizen
    Created on : Nov 25, 2014, 10:19:36 AM
    Author     : Tazbeea Tazakka
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div class="row show-grid">
    <div class="col-lg-8" style="padding-left: 8%;padding-top: 2%;">

        <form action="form_to_db/new_citizen.jsp" method="post" accept-charset="utf-8" class="form-horizontal">       
            <fieldset>
                <legend>Add new Citizen</legend>

                <!--   <div class="form-group">
                               <label for="name_en" class="col-lg-3 control-label">National ID NO* :</label>
                     <div class="col-lg-9">
                       <input type="text" class="form-control" id="name_en" name="name_en"  value="" placeholder="kivabe korte hobe jani na">
                     </div>
                   </div>-->

                <div class="form-group">
                    <label for="name_en" class="col-lg-3 control-label">Name(English)* :</label>
                    <div class="col-lg-9">
                        <input type="text" class="form-control" id="name_en" name="name_en"  value="" placeholder="Type citizen's name in ENGLISH">
                    </div>
                </div>

                <div class="form-group">
                    <label for="name_bn" class="col-lg-3 control-label">Name(Bangla)* :</label>
                    <div class="col-lg-9">
                        <input type="text" class="form-control" id="name_bn" name="name_bn"  value="" placeholder="Type citizen's name in Bangla">
                    </div>
                </div>


                <div class="form-group">
                    <label for="father" class="col-lg-3 control-label">Father's Name :</label>
                    <div class="col-lg-9">
                        <input type="text" class="form-control" id="father" name="father"  value="" placeholder="Type citizen's father's name in ENGLISH">
                    </div>
                </div>

                <div class="form-group">
                    <label for="mother" class="col-lg-3 control-label">Mother's Name :</label>
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
                        <!--<input type="text" class="form-control" id="name_en" name="name_en"  value="" placeholder="Type citizens name in ENGLISH">-->
                    </div>
                </div>


                <div class="form-group">
                    <label for="blood_group" class="col-lg-3 control-label">Blood Group* :</label>
                    <div class="col-lg-9">
                        <input type="text" class="form-control" id="blood_group" name="blood_group"  value="" placeholder="Type citizen's Blood Group in ENGLISH">
                    </div>
                </div>


                <div class="form-group">
                    <label for="religion" class="col-lg-3 control-label">Religion :</label>
                    <div class="col-lg-9">
                        <input type="text" class="form-control" id="religion" name="religion" value="" placeholder="Type citizen's Religion in ENGLISH">
                    </div>
                </div>

                <div class="form-group">
                    <label for="present_address" class="col-lg-3 control-label">Present Address* :</label>
                    <div class="col-lg-9">
                        <textarea class="form-control" rows="3" id="present_address" name="present_address"  placeholder="Type citizen's Present Address in ENGLISH"></textarea>
                        <!--  <input type="text" class="form-control" id="present_address" name="present_address" value="" placeholder="Type citizen's Present Address in ENGLISH">-->
                    </div>
                </div>



                <div class="form-group">
                    <label for="permanent_address" class="col-lg-3 control-label">Permanent Address :</label>
                    <div class="col-lg-9">
                        <textarea class="form-control" rows="3" id="permanent_address" name="permanent_address"  placeholder="Type citizen's Permanent Address in ENGLISH"></textarea>
                        <!--     <input type="text" class="form-control" id="permanent_address" name="permanent_address" value="" placeholder="Type citizen's Permanent Address in ENGLISH">-->
                    </div>
                </div>



                <div class="form-group">
                    <div class="col-lg-10 col-lg-offset-2">

                        <button type="submit" class="btn btn-primary">Add</button>
                    </div>
                </div>
            </fieldset>
        </form>
    </div>
    <div class="col-lg-4" style="padding-top: 4%;padding-right: 2%;">
        <div class="panel panel-default">
            <div class="panel-heading">Note</div>
            <div class="panel-body">
                <div >
                    <div >
                        <span >*****</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
