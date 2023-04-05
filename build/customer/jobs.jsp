<!-- import -->
<%@page  import="java.util.ArrayList"%>
<%@ page import="main.java.projectpack.model.Jobs" %>

<!-- jobs Record -->
<% ArrayList jobsRec = (ArrayList)request.getAttribute("jobRec"); %>

<!-- session start -->
<% String password = (String)session.getAttribute("password"); %>
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
                <a class="log" href="jobs">Jobs</a>
                <a class="log" href="postjob">Post</a>
                <a class="log" href="notification">Notification</a>
                <a class="log" href="myaccount">Account</a>
            </div>
        </div>
    </div>

    <!-- jobType not added -->

    
    <% for(int i=jobsRec.size()-1; i >= 0; i--){ %> <!-- reverse -->
        <% Jobs job = (Jobs)jobsRec.get(i);%> <!-- object create -->
        <div class="post">
            <div class="id">
                <h3>JOB ID: <%= job.getId()%></h3>
            </div>
            <div class="head">
                <h1><%= job.getTitle()%></h1>
            </div>
            <div class="details">
                <h2>Truck type: <%= job.getTruckType()%></h2>
                <p><%= job.getDescription()%></p>
                <h4>Job Owner: <%= job.getJobOwner()%></h4>
                <div class="bp">
                    <h4>Price: <span><%= job.getPrice()%></span> </h4>
                    <a href="apply">
                        <button>Apply</button>
                    </a>
                </div>
            </div>          
        </div>
    <%}%>
</body>
</html>