<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
    <title>Post</title>
    <link rel="stylesheet" href="CSS/post.css">

    <!-- cdn for login, phone,mail and location icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css"/>
</head>
<body>
    <div class="navbar">
        <div class="logo">
            <!-- <i class="fa-solid fa-truck-front"></i> -->
            <h1 class="logo">Freight-<span>Transportation</span></h1>
        </div>
        <div>
            <a class="log" href="jobs" class="nav-link">Jobs</a>
            <a class="log" href="#" class="nav-link">Post</a>
            <a class="log" href="notification" class="nav-link">Notification</a>
            <a class="log" href="myaccount" class="nav-link">Account</a>
        </div>
    </div>
    <div class="box">
        <h1><span>Post</span>job</h1>
        <form action="postjob" method="post">
            <div class="custom">
                <i class="fa-solid fa-file-signature"></i>
                <input type="text" placeholder="job title" name="jobTitle" required>
            </div> 
            <div class="custom">
                <i class="fa-solid fa-puzzle-piece"></i>
                <input type="email" placeholder="your email" name="jobOwner" required>
            </div>
            <div class="custom">
                <i class="fa-solid fa-hand-holding-dollar"></i>
                <input type="text" placeholder="price" name="price" required>
            </div>
            <div class="custom">
                <i class="fa-solid fa-truck-fast"></i>
                <select id="" name="truckType" required>
                    <option value="" >truck type </option>
                    <option value="small" >small</option>
                    <option value="medium" >medium</option>
                    <option value="big" >big</option>
                </select>
            </div>
            <textarea placeholder="Job description" name="description" required></textarea>
            <button type="submit">post <i class="fa-solid fa-upload"></i></button>
        </form>
    </div>
</body>
</html>