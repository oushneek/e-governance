<%-- 
    Document   : bank_search
    Created on : Dec 2, 2014, 1:22:18 AM
    Author     : Ratul
--%>

<%@page import="database.bank.SearchBankInfo"%>
<%@page import="java.util.ArrayList"%>
<%@page import="database.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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

    SearchBankInfo bank = new SearchBankInfo();

    ArrayList<String> bankSearchResult = new ArrayList<String>();

    bankSearchResult = bank.search(national_id);

%>






<!-- Include Header -->
<jsp:include page="header.jsp" />

<body>
    <!-- Include Menu -->
    <jsp:include page="menu.jsp" />       

    <div class="row show-grid">
        <div class="col-lg-12" style="padding-left: 8%;padding-top: 2%;padding-right:6%">
            <%                if (bankSearchResult.isEmpty()) {
                    out.print("<div class='alert alert-danger'>No Record Found with this National ID</a></div>");
                } else {
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
            <legend>Bank Search Result</legend>
            <table class="table table-hover">
                <thead>
                    <tr>
                        <th>National ID</th>
                        <th>Citizen Name</th>
                        <th>Banking ID</th>
                        <th>Bank Name</th>
                        <th>Edit</th>
                        <th>Delete</th>
                    </tr>

                </thead>
                <tbody>
                    <%
                        if (bankSearchResult.size() > 0) {
                            for (int i = 0; i < bankSearchResult.size(); i++) {
                                out.print("<tr class='active'>");
                                out.print("<td>" + bankSearchResult.get(i) + "</td>");
                                i++;
                                out.print("<td>" + bankSearchResult.get(i) + "</td>");
                                i++;
                                out.print("<td>" + bankSearchResult.get(i) + "</td>");
                                String banking_id = bankSearchResult.get(i);
                                i++;
                                out.print("<td>" + bankSearchResult.get(i) + "</td>");
                                i++;
                                if (bankSearchResult.get(i).equals(session.getAttribute("organization_id"))) {
                                    out.print("<td><a href='../edit/bank_edit.jsp?national_id=" + national_id + "&banking_id=" + banking_id + "'><button class='btn btn-primary btn-sm'>Edit</button></a></td>");
                                    out.print("<td><a href='../delete/bank_delete.jsp?national_id=" + national_id + "&banking_id=" + banking_id + "'><button class='btn btn-danger btn-sm'>Delete</button></a></td>");

                                } else {
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

