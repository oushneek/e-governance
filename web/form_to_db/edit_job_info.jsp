<%-- 
    Document   : edit_job_info
    Created on : Dec 8, 2014, 3:29:00 AM
    Author     : Ratul
--%>
<%@page import="database.job.EditJobInfo" %>
<%@page import="java.util.ArrayList"%>
<%@page contentType="application/json; charset=UTF-8"%>
<%@page import="database.*" %>

<%
    String organization_id = session.getAttribute("organization_id").toString();
    ArrayList<String> jobInfo = new ArrayList<String>();

    jobInfo.add(request.getParameter("job_id"));
    jobInfo.add(request.getParameter("national_id"));
    jobInfo.add(request.getParameter("joining_date"));
    jobInfo.add(request.getParameter("leaving_date"));
    jobInfo.add(request.getParameter("post"));

    EditJobInfo job = new EditJobInfo();
    boolean decision = job.edit(jobInfo);

    if (!decision) {
        out.print("0");
    } else {
        out.print("1");
    }

%>

