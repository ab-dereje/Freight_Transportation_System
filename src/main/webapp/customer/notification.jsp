<!-- import -->
<%@page  import="java.util.ArrayList"%>
<%@ page import="main.java.projectpack.model.ApplyInfo" %>
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
                <a class="log" href="jobs" class="nav-link">Jobs</a>
                <a class="log" href="postjob" class="nav-link">Post</a>
                <a class="log" href="notification" class="nav-link">Notification</a>
                <a class="log" href="myaccount" class="nav-link">Account</a>
            </div>
        </div>
    </div>


    <!-- loop over ApplyInfo -->
    <% for(int i=infoRec.size()-1; i >= 0; i--){ %>
            <% ApplyInfo apply = (ApplyInfo)infoRec.get(i);%>
            <% if(email.equals(apply.getJobOwner())) {%>
                <div class="post">
                    <div class="id">
                        <h3>JOB ID: <%= apply.getJobID()%></h3>
                    </div>
                    <div class="head">
                        <p><%= apply.getFullname()%></p>
                    </div>
                    <div class="details">
                        <p>Email Address: <%= apply.getEmail()%></p>
                        <p><%= apply.getMessage()%></p>
                        <h4>Phone Number: <span><%= apply.getPhone()%></span> </h4>
                        
                        <div class="bp">
                            <!-- simple form -->
                            <form action="accept" method="get">
                                <a>
                                    <button type="submit">Accept</button>
                                </a>
                            </form>
                            <form action="decline" method="get">
                                <a>
                                    <input type="hidden" value="<%=apply.getJobID()%>" name="jobID">
                                    <button type="submit" class="del">Decline</button>
                                </a>
                            </form>

                        </div>
                    </div>          
                </div>
            <%}%>
    <%}%>
</body>
</html>