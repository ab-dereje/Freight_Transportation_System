<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page  import="java.util.ArrayList"%>
<%@ page import="main.java.projectpack.model.Info" %>
<% ArrayList infoRec = (ArrayList)request.getAttribute("infoRec"); %>

<!-- session start -->
<% String password = (String)session.getAttribute("password"); %>
<% String email = (String) session.getAttribute("email"); %>

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
    <title>My account</title>
    <link rel="stylesheet" href="CSS/account.css">
    <!-- cdn -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css"/>
</head>
<body>
    <div class="navbar">
        <div class="logo">
            <!-- <i class="fa-solid fa-truck-front"></i> -->
            <h1 class="logo">Freight-<span>Transportation</span></h1>
        </div>
        <div>
            <a class="log" href="jobs">Jobs</a>
            <a class="log" href="postjob">Post</a>
            <a class="log" href="notification">Notification</a>
            <a class="log" href="myaccount">Account</a>
        </div>
    </div>
    <% for(int i=0; i<infoRec.size(); i++){ %>
        <% Info info = (Info)infoRec.get(i);%>
        <!-- filter account by email and session email -->
        <% if(email.equals(info.getEmail())) {%>
        <div class="container">
            <div class="head">
                <i class="fa-regular fa-user"></i><h1>My Account</h1>
            </div>
                <div class="info">
                    <label for="">Full Name: <%= info.getFullname() %>  </label>
                    <label for="">Username: <%= info.getUsername() %></label>
                    <label for="">Email: <%= info.getEmail() %></label>
                    <label for="">ID number: <%= info.getPhone() %></label>
                    <label for="">Region: <%= info.getRegion() %></label>
                    <label for="">Town: <%= info.getTown() %></label>
                    <label for="">Kebele: <%= info.getKebele() %></label>
                    <label for="">House Number: <%= info.getHauseNumber() %></label>
                    
                    <form action="logout" method="get">
                        <button type="submit">Logout</button>
                    </form>
                </div>
        </div>
        <% } %> 
    <% } %> 
</body>
</html>