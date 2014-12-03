<%-- 
    Document   : job_search
    Created on : Dec 3, 2014, 3:35:12 PM
    Author     : Tazbeea Tazakka
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="database.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<!-- Search Result Handle -->
<%
String national_id = request.getParameter("national_id");

Job job = new Job();

ArrayList<String> jobSearchResult = new ArrayList<String>();

jobSearchResult = job.searchJobInfo(national_id);

%>






    <!-- Include Header -->
    <jsp:include page="header.jsp" />
 
    <body>
    <!-- Include Menu -->
    <jsp:include page="menu.jsp" />       
    
  <div class="row show-grid">
  <div class="col-lg-12" style="padding-left: 8%;padding-top: 2%;padding-right:6%">
      <%
      if(jobSearchResult.isEmpty()){
          out.print("<div class='alert alert-danger'>No Record Found with this National ID</a></div>");
      }
      else{
           out.print("<div class='alert alert-success'>Result Found</a></div>");
      }
      %>
                <div class="panel panel-default">
                  <div class="panel-heading">New Search</div>
                    <div class="panel-body">
                        <form action="bank_search.jsp" method="GET">
                          <div class="form-group">
                              <div class="input-group">
                                <span class="input-group-addon">National ID</span>
                                <input type="text" class="form-control" name="national_id" id="national_id" value="<% out.print(national_id); %>" required="">
                                <span class="input-group-btn">
                                  <button class="btn btn-default" type="submit">Search</button>
                                </span>
                              </div>
                          </div>
                         </form>
                    </div>
                  </div>
    <legend>Job Search Result</legend>
  <table class="table table-hover">
        <thead>
          <tr>
            <th>National ID</th>
            <th>Citizen Name</th>
            <th>Job ID</th>
            <th>Organization Name</th>
            <th>Joining Date</th>
            <th>Leaving Date</th>
            <th>Post</th>
            <th>Edit</th>
            <th>Delete</th>
          </tr>
      
        </thead>
        <tbody>
          <%
            if(jobSearchResult.size()>0){
                for(int i=0;i<jobSearchResult.size();i++){
                out.print("<tr class='active'>");
                out.print("<td>"+jobSearchResult.get(i)+"</td>");
                i++;
                out.print("<td>"+jobSearchResult.get(i)+"</td>");
                i++;
                out.print("<td>"+jobSearchResult.get(i)+"</td>");
                i++;
                out.print("<td>"+jobSearchResult.get(i)+"</td>");
                i++;
                out.print("<td>"+jobSearchResult.get(i)+"</td>");
                i++;
                out.print("<td>"+jobSearchResult.get(i)+"</td>");
                i++;
                out.print("<td>"+jobSearchResult.get(i)+"</td>");
                i++;
                if(jobSearchResult.get(i).equals(session.getAttribute("organization_id"))){
                    out.print("<td><button class='btn btn-primary btn-sm'>Edit</button></td>");
                }
                else{
                    out.print("<td><button class='btn btn-primary btn-sm' disabled>Edit</button></td>");
                }
                out.print("<td><button class='btn btn-danger btn-sm'>Delete</button></td>");
                out.print("</tr>");
                }
            }
          %>

        </tbody>
      </table>


  </div>
  
</div>
           
    
    <!-- Include Footer -->
    <jsp:include page="footer.jsp" /> 

