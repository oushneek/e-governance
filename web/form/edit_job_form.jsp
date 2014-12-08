<%-- 
    Document   : edit_job_form
    Created on : Dec 8, 2014, 3:18:11 AM
    Author     : Ratul
--%>

<%@page import="database.job.GetJobInfo"%>
<%@page import="database.*"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div class="row show-grid">
    <div class="col-lg-8" style="padding-left: 8%;padding-top: 2%;">

        <form action="../form_to_db/edit_job_info.jsp" method="post" accept-charset="utf-8" class="form-horizontal">       
            <fieldset>
                <legend>Edit Job Information of Citizen</legend>
                <%
                                
                    String national_id=request.getParameter("national_id");
                    String job_id=request.getParameter("job_id");
                                
                    ArrayList<String> jobInfo=new ArrayList<String>();
                    GetJobInfo job=new GetJobInfo();
                    jobInfo=job.get(job_id, national_id);
                               
                %>

                <input type="hidden" name="job_id" id="job_id" value="<%out.print(job_id) ;%>">

                <div class="form-group">
                    <label for="national_id" class="col-lg-3 control-label">National ID NO* :</label>
                    <div class="col-lg-9">
                        <input type="text" class="form-control" id="national_id" name="national_id"  value="<%out.print(national_id) ;%>" placeholder="Type citizen's National ID No" >
                    </div>
                </div>



                <div class="form-group">
                    <label for="joining_date" class="col-lg-3 control-label">Joining Date* :</label>
                    <div class="col-lg-9">
                        <input type="date" class="form-control" id="joining_date" name="joining_date"  value="<%out.print(jobInfo.get(0)) ;%>">
                    </div>
                </div>


                <div class="form-group">
                    <label for="leaving_date" class="col-lg-3 control-label">Leaving Date* :</label>
                    <div class="col-lg-9">
                        <input type="date" class="form-control" id="leaving_date" name="leaving_date"  value="<%out.print(jobInfo.get(1)) ;%>">
                    </div>
                </div>

                <div class="form-group">
                    <label for="post" class="col-lg-3 control-label">Post* :</label>
                    <div class="col-lg-9">
                        <input type="text" class="form-control" id="post" name="post"  value="<%out.print(jobInfo.get(2)) ;%>" placeholder="Type citizen's Post">
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
    </div>
</div>

