<%-- 
    Document   : criminal
    Created on : Nov 30, 2014, 1:27:21 PM
    Author     : Ratul
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
 <div class="row show-grid">
              <div class="col-lg-8" style="padding-left: 8%;padding-top: 2%;">

                    <form action="login_check.jsp" method="post" accept-charset="utf-8" class="form-horizontal">       
                        <fieldset>
                            <legend>Add New Criminal Data</legend>

                    <div class="form-group">
                                <label for="email" class="col-lg-2 control-label">National ID*</label>
                      <div class="col-lg-10">
                          <input type="email" class="form-control" id="email" name="email"  value="" placeholder="Type your Email ID" required>
                      </div>
                    </div>
                            
                    <div class="form-group">
                                <label for="email" class="col-lg-2 control-label">Date*</label>
                      <div class="col-lg-10">
                          <input type="date" class="form-control" id="date" name="date"  value="" placeholder="Type your Email ID" required>
                      </div>
                    </div>
                    
                    <div class="form-group">
                                <label for="email" class="col-lg-2 control-label">Description*</label>
                      <div class="col-lg-10">
                          <textarea class="form-control" id="description" name="description"  value="" placeholder="Type Description" required></textarea>
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
                  <div class="panel-heading">Search</div>
                    <div class="panel-body">
                          <div class="form-group">
                              <div class="input-group">
                                <span class="input-group-addon">National ID</span>
                                <input type="text" class="form-control">
                                <span class="input-group-btn">
                                  <button class="btn btn-default" type="button">Search</button>
                                </span>
                              </div>
                            </div>
                    </div>
                  </div>
                </div>
 </div>
