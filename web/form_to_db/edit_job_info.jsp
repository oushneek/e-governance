<%-- 
    Document   : edit_job_info
    Created on : Dec 8, 2014, 3:29:00 AM
    Author     : Ratul
--%>
<%@page import="database.job.EditJobInfo" %>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="database.*" %>

<!DOCTYPE html>
<html lang="en">

    <!-- Include Header -->
    <jsp:include page="../include/header.jsp" />

    <body>
        <!-- Include Menu -->
        <jsp:include page="../include/menu.jsp" />       

        <%
        String organization_id=session.getAttribute("organization_id").toString();
        ArrayList<String> jobInfo= new ArrayList<String>();
        
        jobInfo.add(request.getParameter("job_id"));
        jobInfo.add(request.getParameter("national_id"));
        jobInfo.add(request.getParameter("joining_date"));
        jobInfo.add(request.getParameter("leaving_date"));
        jobInfo.add(request.getParameter("post"));
    
        for(int i=0;i<jobInfo.size();i++){
            out.println(jobInfo.get(i));
        }
   
        EditJobInfo job=new EditJobInfo();
        String result=job.edit(jobInfo);
        out.print(result);
        
        %>
        <div class="row show-grid">
            <div class="col-lg-8" style="padding-left: 8%;padding-top: 2%;">
                <%
                %>

            </div>
            <div class="col-lg-4" style="padding-top: 4%;padding-right: 2%;">

            </div>
        </div>


        <!-- Include Footer -->
        <jsp:include page="../include/footer.jsp" />     
    </body>
</html>



