<!-- import -->
<%@page  import="java.util.ArrayList"%>
<%@ page import="main.java.projectpack.AcceptedInfo" %>
<% ArrayList infoRec = (ArrayList)request.getAttribute("infoRec"); %>

<!-- session start -->
<% String password = (String)session.getAttribute("password"); %>
<% String email = (String)session.getAttribute("email"); %>
<%  if(null==password) {%>
<%    response.sendRedirect("login.jsp");%>
<% } %>
<!-- session done -->

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home</title>
    <!-- css -->
    <link rel="stylesheet" href="CSS/jobs.css">

</head>
<body>
    <div class="nav">
        <div class="navbar">
            <div class="logo">
                <i class="fa-solid fa-truck-front"></i>
                <h1 class="logo">Freight-<span>Transportation</span></h1>
            </div>
            <div class="links">
                <a class="log" href="jobslist">Jobs</a>
                <a class="log" href="message">Notification</a>
                <a class="log" href="myaccount">Account</a>
            </div>
        </div>
    </div>


    <!-- loop over ApplyInfo -->
    <% for(int i=infoRec.size()-1; i >= 0; i--){ %>
            <% AcceptedInfo accepted = (AcceptedInfo)infoRec.get(i);%>
            <% if(email.equals(accepted.getEmail())) {%>
                <div class="post">
                    <div class="id">
                        <h3>Message</h3>
                    </div>
                    <div class="head">
                        <p><%= accepted.getFullname()%></p>
                    </div>
                    <div class="details">
                        <p>Job ID: <%= accepted.getJobID()%></p>
                        <p>Job Owner Email: <%= accepted.getJobOwner()%></p>
                        <p><%= accepted.getMessage()%></p>
                        <h4>Phone Number: <span><%= accepted.getPhone()%></span> </h4>
                        <form action="delete_message" method="get">
                            <a>
                                <input type="hidden" value="<%= accepted.getJobID()%>" name="jobID">
                                <button type="submit" class="del">Delete</button>
                            </a>
                        </form>
                    </div>          
                </div>
            <%}%>
    <%}%>
</body>
</html>