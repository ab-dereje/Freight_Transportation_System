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
    <title>Admin Panel</title>
    <link rel="stylesheet" href="CSS/adminpanel.css">
</head>
<body>
    <!-- nav bar -->
    <div class="navbar">
        <div class="logo">
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
    <h1>Admin <span>Panel</span></h1>
    <p>Lorem, ipsum dolor sit amet consectetur adipisicing elit. Ab ipsam pariatur cumque iusto velit adipisci harum reiciendis, officia dignissimos ipsa cupiditate rerum maiores sapiente impedit expedita! Perspiciatis voluptate non autem!</p>
    <div class="container">
            <div class="row1">
                <a href="jobslist_admin">
                    <div class="box">
                        Posted Jobs
                    </div>
                </a>
                <a href="all_message">
                    <div class="box">
                        Accepted Jobs
                    </div>
                </a>
            </div>
            <div class="row2">
                <a href="customers_info">
                    <div class="box">
                        Customers List
                    </div>
                </a>
                <a href="truckers_info">
                    <div class="box">
                        Truckers List
                    </div>
                </a>
            </div>
    </div>
</body>
</html>