<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page  import="java.util.ArrayList"%>
<%@ page import="main.java.projectpack.model.Info" %>
<% ArrayList infoRec = (ArrayList)request.getAttribute("infoRec"); %>

<!-- session start -->
<% String password = (String)session.getAttribute("password"); %>
<%  if(null==password) {%>
<%    response.sendRedirect("adminLogin.jsp");%>
<% } %>
<!-- session done -->

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Customers</title>
    <link rel="stylesheet" href="CSS/ctInfo.css">
</head>
<body>
    <!-- navbar -->
    <div class="navbar">
        <div class="logo">
            <!-- <i class="fa-solid fa-truck-front"></i> -->
            <h1 class="logo">Admin-<span>Panel</span></h1>
        </div>
        <div>
            <a class="log" href="admin_home">Home</a>
            <a class="log" href="jobslist_admin">PostedJobs</a>
            <a class="log" href="all_message">AcceptedJobs</a>
            <a class="log" href="customers_info">Customers</a>
            <a class="log" href="truckers_info">Truckers</a>
            <a class="log" href="logout">Logout</a>
        </div>
    </div>
    <div class="admin-contents">
        <div class="fields-container main">
            <p class="title">Full Name</p>
            <p class="title">Username</p>
            <p class="title">Email</p>
            <p class="title">ID Number</p>
            <p class="title">Region</p>
            <p class="title">Town</p>
            <p class="title">Kebele</p>
            <p class="title">House Number</p>
        </div>
        <% for(int i=0; i<2; i++){ %>
            <% Info info = (Info)infoRec.get(i);%>
                <div class="fields-container sections">
                    <div class="fields">
                        <p><%= info.getFullname() %></p>
                    </div>
                    <div class="fields">
                        <p><%= info.getUsername() %></p>
                    </div>
                    <div class="fields">
                        <p><%= info.getEmail() %></p>
                    </div>
                    <div class="fields">
                        <p><%= info.getPhone() %></p>
                    </div>
                    <div class="fields">
                        <p><%= info.getRegion() %></p>
                    </div>
                    <div class="fields">
                        <p><%= info.getTown() %></p>
                    </div>
                    <div class="fields">
                        <p><%= info.getKebele() %></p>
                    </div>
                    <div class="fields">
                        <p><%= info.getHauseNumber() %></p>
                    </div>
                    <form action="delete_customer">
                        <input type="hidden" value="<%= info.getEmail() %>" name="targetEmail">
                        <button type="submit">Delete</button>
                    </form>
                </div>
        <% } %> 
        <!-- section 2 -->  
        <!-- view more -->
        
        <div class="view-mores hidden">
            <% for(int i=2; i<infoRec.size(); i++){ %>
                <% Info info = (Info)infoRec.get(i);%>
                <div class="fields-container sections">
                    <div class="fields">
                        <p><%= info.getFullname() %></p>
                    </div>
                    <div class="fields">
                        <p><%= info.getUsername() %></p>
                    </div>
                    <div class="fields">
                        <p><%= info.getEmail() %></p>
                    </div>
                    <div class="fields">
                        <p><%= info.getPhone() %></p>
                    </div>
                    <div class="fields">
                        <p><%= info.getRegion() %></p>
                    </div>
                    <div class="fields">
                        <p><%= info.getTown() %></p>
                    </div>
                    <div class="fields">
                        <p><%= info.getKebele() %></p>
                    </div>
                    <div class="fields">
                        <p><%= info.getHauseNumber() %></p>
                    </div>
                    <form action="delete_customer">
                        <input type="hidden" value="<%= info.getEmail() %>" name="targetEmail">
                        <button type="submit">Delete Customer</button>
                    </form>
                </div>
            <% } %> 
        </div>
        <div class="btn">
            <button class="view-more">View More</button>
        </div>       
    </div>

    <!-- JavaScript -->
    <script>
        const viewMore = document.querySelector('.view-more')
        const viewMores = document.querySelector('.view-mores')
        let opened = true

        viewMore.addEventListener('click', () => {
            if(opened) {
                viewMores.classList.remove('hidden')
                viewMore.innerHTML = "View Less"
            }else{
                viewMores.classList.add('hidden')
                viewMore.innerHTML = "View More"

            }
            opened = !opened
        })
    </script>
    
</body>
</html>