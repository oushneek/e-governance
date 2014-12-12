<%-- 
    Document   : detailed_search
    Created on : Dec 11, 2014, 1:13:03 PM
    Author     : Tazbeea Tazakka
--%>
<%@page import="database.detailed_search.GetAccessType"%>
<%@page import="database.education.SearchEducationInfo"%>
<%@page import="database.bank.SearchBankInfo"%>
<%@page import="database.criminal.SearchCriminalInfo"%>
<%@page import="database.medical.SearchMedicalInfo"%>
<%@page import="database.job.SearchJobInfo"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="database.*"%>
<!DOCTYPE html>
<%
    //Secure the Page from UnAuthorised Access
    if (session.getAttribute("organization_id") == null) {
        response.setHeader("Refresh", "0;url=../index.jsp");
    }
%>
<!-- Search Result Handle -->
<%
    String national_id = request.getParameter("national_id");
    String type_id = session.getAttribute("type_id").toString();

    ArrayList<String> accessSearchResult = new ArrayList<String>();
    GetAccessType access = new GetAccessType();
    accessSearchResult = access.get(type_id);

    ArrayList<String> educationInfo = new ArrayList<String>();
    ArrayList<String> bankInfo = new ArrayList<String>();
    ArrayList<String> criminalInfo = new ArrayList<String>();
    ArrayList<String> medicalInfo = new ArrayList<String>();
    ArrayList<String> jobInfo = new ArrayList<String>();

    educationInfo.clear();
    bankInfo.clear();
    criminalInfo.clear();
    medicalInfo.clear();
    jobInfo.clear();

    SearchEducationInfo education = new SearchEducationInfo();
    SearchBankInfo bank = new SearchBankInfo();
    SearchCriminalInfo criminal = new SearchCriminalInfo();
    SearchJobInfo job = new SearchJobInfo();
    SearchMedicalInfo medical = new SearchMedicalInfo();

    for (int i = 0; i < accessSearchResult.size(); i++) {
        if (accessSearchResult.get(i).equals("1")) {
            educationInfo = education.search(national_id);
        } else if (accessSearchResult.get(i).equals("2")) {
            bankInfo = bank.search(national_id);
        } else if (accessSearchResult.get(i).equals("3")) {
            criminalInfo = criminal.search(national_id);
        } else if (accessSearchResult.get(i).equals("4")) {
            medicalInfo = medical.search(national_id);
        } else if (accessSearchResult.get(i).equals("5")) {
            jobInfo = job.search(national_id);
        }
    }

%>


<!-- Include Header -->
<jsp:include page="header.jsp" />

<body>
    <!-- Include Menu -->
    <jsp:include page="menu.jsp" />       

    <div class="row show-grid">
        <div class="col-lg-12" style="padding-left: 8%;padding-top: 2%;padding-right:6%">
            <%                if ((educationInfo.isEmpty()) && (bankInfo.isEmpty()) && (criminalInfo.isEmpty()) && (medicalInfo.isEmpty()) && (jobInfo.isEmpty())) {
                    out.print("<div class='alert alert-danger'>No Record Found with this National ID</a></div>");
                } else {
                    out.print("<div class='alert alert-success'>Result Found</a></div>");
                }
            %>
            <div class="panel panel-default">
                <div class="panel-heading">New Search</div>
                <div class="panel-body">
                    <form action="detailed_search.jsp" method="GET">
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
            <%  if ((educationInfo.isEmpty()) && (bankInfo.isEmpty()) && (criminalInfo.isEmpty()) && (medicalInfo.isEmpty()) && (jobInfo.isEmpty())) {

                } else {
                    out.print("<h3 align=center><b>Details Search Result for National ID: " + national_id + "</b></h3>");
                }
            %>
            <%
                //Education Info
                if (educationInfo.size() > 0) {
                    out.println("<legend>Educational Information</legend>");
                    out.println("<table class='table table-hover'>");
                    out.println("<thead>");
                    out.println("<tr>");
                    out.println("<th>National ID</th>");
                    out.println("<th>Citizen Name</th>");
                    out.println("<th>Education ID</th>");
                    out.println("<th>Exam Name</th>");
                    out.println("<th>Year</th>");
                    out.println("<th>Board</th>");
                    out.println("<th>CGPA</th>");
                    out.println("<th>Institute Name</th>");

                    out.println("</tr>");

                    out.println("</thead>");
                    out.println("<tbody>");

                    for (int i = 0; i < educationInfo.size(); i++) {
                        out.print("<tr class='active'>");
                        out.print("<td>" + educationInfo.get(i) + "</td>");
                        i++;
                        out.print("<td>" + educationInfo.get(i) + "</td>");
                        i++;
                        out.print("<td>" + educationInfo.get(i) + "</td>");
                        i++;
                        out.print("<td>" + educationInfo.get(i) + "</td>");
                        i++;
                        out.print("<td>" + educationInfo.get(i) + "</td>");
                        i++;
                        out.print("<td>" + educationInfo.get(i) + "</td>");
                        i++;
                        out.print("<td>" + educationInfo.get(i) + "</td>");
                        i++;
                        out.print("<td>" + educationInfo.get(i) + "</td>");
                        i++;
                        out.print("</tr>");
                    }

                    out.println("</tbody></table>");
                }

                //Bank Info
                if (bankInfo.size() > 0) {
                    out.println("<legend>Banking Information</legend>");
                    out.println("<table class='table table-hover'>");
                    out.println("<thead>");
                    out.println("<tr>");
                    out.println("<th>National ID</th>");
                    out.println("<th>Citizen Name</th>");
                    out.println("<th>Banking ID</th>");
                    out.println("<th>Bank Name</th>");
                    out.println("</tr>");

                    out.println("</thead>");
                    out.println("<tbody>");

                    for (int i = 0; i < bankInfo.size(); i++) {
                        out.print("<tr class='active'>");
                        out.print("<td>" + bankInfo.get(i) + "</td>");
                        i++;
                        out.print("<td>" + bankInfo.get(i) + "</td>");
                        i++;
                        out.print("<td>" + bankInfo.get(i) + "</td>");
                        i++;
                        out.print("<td>" + bankInfo.get(i) + "</td>");
                        i++;
                        out.print("</tr>");
                    }

                    out.println("</tbody></table>");
                }

                //Criminal Info
                if (criminalInfo.size() > 0) {
                    out.println("<legend>Criminal Information</legend>");
                    out.println("<table class='table table-hover'>");
                    out.println("<thead>");
                    out.println("<tr>");
                    out.println("<th>National ID</th>");
                    out.println("<th>Citizen Name</th>");
                    out.println("<th>Criminal ID</th>");
                    out.println("<th>Date</th>");
                    out.println("<th>Description</th>");
                    out.println("<th>Police Station</th>");
                    out.println("</tr>");

                    out.println("</thead>");
                    out.println("<tbody>");

                    for (int i = 0; i < criminalInfo.size(); i++) {
                        out.print("<tr class='active'>");
                        out.print("<td>" + criminalInfo.get(i) + "</td>");
                        i++;
                        out.print("<td>" + criminalInfo.get(i) + "</td>");
                        i++;
                        out.print("<td>" + criminalInfo.get(i) + "</td>");
                        i++;
                        out.print("<td>" + criminalInfo.get(i) + "</td>");
                        i++;
                        out.print("<td>" + criminalInfo.get(i) + "</td>");
                        i++;
                        out.print("<td>" + criminalInfo.get(i) + "</td>");
                        i++;
                        out.print("</tr>");
                    }

                    out.println("</tbody></table>");
                }

                //Medical Info
                if (medicalInfo.size() > 0) {
                    out.println("<legend>Medical Information</legend>");
                    out.println("<table class='table table-hover'>");
                    out.println("<thead>");
                    out.println("<tr>");
                    out.println("<th>National ID</th>");
                    out.println("<th>Citizen Name</th>");
                    out.println("<th>Medical ID</th>");
                    out.println("<th>Medical Name</th>");
                    out.println("<th>Date</th>");
                    out.println("<th>Description</th>");
                    out.println("</tr>");

                    out.println("</thead>");
                    out.println("<tbody>");

                    for (int i = 0; i < medicalInfo.size(); i++) {
                        out.print("<tr class='active'>");
                        out.print("<td>" + medicalInfo.get(i) + "</td>");
                        i++;
                        out.print("<td>" + medicalInfo.get(i) + "</td>");
                        i++;
                        out.print("<td>" + medicalInfo.get(i) + "</td>");
                        i++;
                        out.print("<td>" + medicalInfo.get(i) + "</td>");
                        i++;
                        out.print("<td>" + medicalInfo.get(i) + "</td>");
                        i++;
                        out.print("<td>" + medicalInfo.get(i) + "</td>");
                        i++;
                        out.print("</tr>");
                    }

                    out.println("</tbody></table>");
                }

                //Job Info
                if (jobInfo.size() > 0) {
                    out.println("<legend>Job Information</legend>");
                    out.println("<table class='table table-hover'>");
                    out.println("<thead>");
                    out.println("<tr>");
                    out.println("<th>National ID</th>");
                    out.println("<th>Citizen Name</th>");
                    out.println("<th>Job ID</th>");
                    out.println("<th>Job Provider Name</th>");
                    out.println("<th>Joining Date</th>");
                    out.println("<th>Leaving Date</th>");
                    out.println("<th>Post</th>");
                    out.println("</tr>");

                    out.println("</thead>");
                    out.println("<tbody>");

                    for (int i = 0; i < jobInfo.size(); i++) {
                        out.print("<tr class='active'>");
                        out.print("<td>" + jobInfo.get(i) + "</td>");
                        i++;
                        out.print("<td>" + jobInfo.get(i) + "</td>");
                        i++;
                        out.print("<td>" + jobInfo.get(i) + "</td>");
                        i++;
                        out.print("<td>" + jobInfo.get(i) + "</td>");
                        i++;
                        out.print("<td>" + jobInfo.get(i) + "</td>");
                        i++;
                        out.print("<td>" + jobInfo.get(i) + "</td>");
                        i++;
                        out.print("<td>" + jobInfo.get(i) + "</td>");
                        i++;
                        out.print("</tr>");
                    }

                    out.println("</tbody></table>");
                }


            %>

        </div>

    </div>


    <!-- Include Footer -->
    <jsp:include page="footer.jsp" /> 

