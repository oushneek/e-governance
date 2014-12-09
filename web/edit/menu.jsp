<%-- 
    Document   : menu
    Created on : Nov 14, 2014, 4:43:17 PM
    Author     : Ratul
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<div class="navbar navbar-default navbar-fixed-top">
    <div class="container">
        <div class="navbar-header">
            <a href="../index.jsp" class="navbar-brand">E-Governance Web Portal</a>
            <button class="navbar-toggle" type="button" data-toggle="collapse" data-target="#navbar-main">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
        </div>
        <div class="navbar-collapse collapse" id="navbar-main">
            <ul class="nav navbar-nav">

            </ul>


            <ul class="nav navbar-nav navbar-right">
                <%
                    if (session.getAttribute("organization_id") == null) {
                        out.print("<li><a href='index.jsp'>Login</a></li>");
                        out.print("<li><a href='#'>Register</a></li>");
                    } else {
                        out.print("<li><a href='#'>" + session.getAttribute("organization_name") + "</a></li>");
                        out.print("<li><a href='../logout.jsp'>Logout</a></li>");

                    }
                %>         
            </ul>

        </div>
    </div>
</div>
