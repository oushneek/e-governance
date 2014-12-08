<%-- 
    Document   : edit_criminal_form
    Created on : Dec 6, 2014, 9:28:33 PM
    Author     : Tazbeea Tazakka
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="database.Criminal"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div class="row show-grid">
    <div class="col-lg-8" style="padding-left: 8%;padding-top: 2%;">

        <form action="../form_to_db/edit_criminal_info.jsp" method="post" accept-charset="utf-8" class="form-horizontal">       
            <fieldset>
                <legend>Edit Criminal Data</legend>

                <%
                                
                    String national_id=request.getParameter("national_id");
                    String criminal_id=request.getParameter("criminal_id");
                                
                    ArrayList<String> criminalInfo=new ArrayList<String>();
                    Criminal criminal=new Criminal();
                    criminalInfo=criminal.getCriminalInfo(criminal_id, national_id);
                               
                %>

                <input type="hidden" name="criminal_id" id="criminal_id" value="<%out.print(criminal_id) ;%>">

                <div class="form-group">
                    <label for="national_id" class="col-lg-2 control-label">National ID*</label>
                    <div class="col-lg-10">
                        <input type="text" class="form-control" id="national_id" name="national_id"  value="<%out.print(national_id) ;%>">
                    </div>
                </div>

                <div class="form-group">
                    <label for="date" class="col-lg-2 control-label">Date *</label>
                    <div class="col-lg-10">
                        <input type="date" class="form-control" id="date" name="date"  value="<%out.print(criminalInfo.get(0)) ;%>">
                    </div>
                </div>

                <div class="form-group">
                    <label for="description" class="col-lg-2 control-label">Description*</label>
                    <div class="col-lg-10">
                        <textarea class="form-control" id="description" name="description" ><%out.print(criminalInfo.get(1)) ;%></textarea>
                    </div>
                </div>



                <div class="form-group">
                    <div class="col-lg-10 col-lg-offset-2">

                        <button type="submit" class="btn btn-primary">Save</button>
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
