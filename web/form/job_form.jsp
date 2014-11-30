<%-- 
    Document   : job_form
    Created on : Nov 30, 2014, 6:22:44 PM
    Author     : Tazbeea Tazakka
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div class="row show-grid">
              <div class="col-lg-8" style="padding-left: 8%;padding-top: 2%;">

                    <form action="" method="post" accept-charset="utf-8" class="form-horizontal">       
                        <fieldset>
                            <legend>Add Job Information of Citizen</legend>
                            
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
