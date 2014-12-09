<%-- 
    Document   : job_info
    Created on : Dec 3, 2014, 3:18:56 PM
    Author     : Tazbeea Tazakka
--%>
<%@page import="database.job.AddJobInfo" %>
<%@page import="java.util.ArrayList"%>
<%@page contentType="application/json; charset=UTF-8"%>
<%@page import="database.*" %>

<%

    ArrayList<String> job = new ArrayList<String>();
    job.clear();

    job.add(request.getParameter("national_id"));
    job.add(session.getAttribute("organization_id").toString());
    job.add(request.getParameter("joining_date"));
    job.add(request.getParameter("leaving_date"));
    job.add(request.getParameter("post"));

    AddJobInfo jobInfo = new AddJobInfo();
    boolean decision = jobInfo.insert(job);

    if (!decision) {
        out.print("0");
    } else {
        out.print("1");
    }
%>

