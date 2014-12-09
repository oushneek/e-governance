<%-- 
    Document   : criminal_info
    Created on : Dec 2, 2014, 12:47:02 AM
    Author     : Ratul
--%>

<%@page import="database.criminal.AddCriminalInfo"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="application/json; charset=UTF-8"%>
<%@ page import="database.*" %>

<%

    ArrayList<String> criminal = new ArrayList<String>();
    criminal.clear();

    criminal.add(request.getParameter("national_id"));
    criminal.add(session.getAttribute("organization_id").toString());
    criminal.add(request.getParameter("date"));
    criminal.add(request.getParameter("description"));

    AddCriminalInfo newCriminal = new AddCriminalInfo();
    boolean decision = newCriminal.insert(criminal);

    if (!decision) {
        out.print("0");
    } else {
        out.print("1");
    }
%>
