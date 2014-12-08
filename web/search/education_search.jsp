<%-- 
    Document   : education_search
    Created on : Dec 3, 2014, 4:12:51 AM
    Author     : Ratul
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="database.*"%>
<!DOCTYPE html>
<!-- Search Result Handle -->
<%
String national_id = request.getParameter("national_id");

Education education = new Education();

ArrayList<String> educationSearchResult = new ArrayList<String>();

educationSearchResult = education.searchEducationInfo(national_id);

%>






<!-- Include Header -->
<jsp:include page="header.jsp" />

<body>
    <!-- Include Menu -->
    <jsp:include page="menu.jsp" />       

    <div class="row show-grid">
        <div class="col-lg-12" style="padding-left: 8%;padding-top: 2%;padding-right:6%">
            <%
            if(educationSearchResult.isEmpty()){
                out.print("<div class='alert alert-danger'>No Record Found with this National ID</a></div>");
            }
            else{
                 out.print("<div class='alert alert-success'>Result Found</a></div>");
            }
            %>
            <div class="panel panel-default">
                <div class="panel-heading">New Search</div>
                <div class="panel-body">
                    <form action="education_search.jsp" method="GET">
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
            <legend>Education Search Result</legend>
            <table class="table table-hover">
                <thead>
                    <tr>
                        <th>National ID</th>
                        <th>Citizen Name</th>
                        <th>Education ID</th>
                        <th>Exam Name</th>
                        <th>Year</th>
                        <th>Board</th>
                        <th>CGPA</th>
                        <th>Institute Name</th>
                        <th>Edit</th>
                        <th>Delete</th>
                    </tr>

                </thead>
                <tbody>
                    <%
                      if(educationSearchResult.size()>0){
                          for(int i=0;i<educationSearchResult.size();i++){
                          out.print("<tr class='active'>");
                          out.print("<td>"+educationSearchResult.get(i)+"</td>");
                          i++;
                          out.print("<td>"+educationSearchResult.get(i)+"</td>");
                          i++;
                          out.print("<td>"+educationSearchResult.get(i)+"</td>");
                          String education_id = educationSearchResult.get(i);
                          i++;
                          out.print("<td>"+educationSearchResult.get(i)+"</td>");
                          i++;
                          out.print("<td>"+educationSearchResult.get(i)+"</td>");
                          i++;
                          out.print("<td>"+educationSearchResult.get(i)+"</td>");
                          i++;
                          out.print("<td>"+educationSearchResult.get(i)+"</td>");
                          i++;
                          out.print("<td>"+educationSearchResult.get(i)+"</td>");
                          i++;
                          if(educationSearchResult.get(i).equals(session.getAttribute("organization_id"))){
                              out.print("<td><a href='../edit/education_edit.jsp?national_id="+national_id+"&education_id="+education_id+"'><button class='btn btn-primary btn-sm'>Edit</button></a></td>");
                              out.print("<td><a href='../delete/education_delete.jsp?national_id="+national_id+"&education_id="+education_id+"'><button class='btn btn-danger btn-sm'>Delete</button></a></td>");
                          }
                          else{
                              out.print("<td><button class='btn btn-primary btn-sm' disabled>Edit</button></td>");
                              out.print("<td><button class='btn btn-danger btn-sm' disabled>Delete</button></td>");
                          }
                
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



