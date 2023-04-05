<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Login</title>
    <link rel="stylesheet" href="CSS/admin.css">

    <!-- cdn for login, phone,mail and location icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css" integrity="sha512-MV7K8+y+gLIBoVD59lQIYicR65iaqukzvf/nwasF0nqhPay5w/9lJmVM2hMDcnK1OnMGCdVK+iQrJ7lzPJQd1w==" crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body>
    <input type="hidden" id="status" value="<%= request.getAttribute("status")%>">
    <div class="container">
        <div class="loginBox">
            <form action="admin_login" method="post">
                <i class="fa-solid fa-robot"></i>
                <h1>admin</h1>
                <input type="text" placeholder="username" name="user" required>
                <input type="password" placeholder="password" name="pass" required>
                <div class="sec">
                <div class="rem">
                    <input type="checkbox"><span>Remember me</span>
                </div> <a href="#">Home</a></div>
                <h4 id="loginFailed"></h4>
            <button type="submit">Login</button>
            </form>
        </div>
    </div>
    <script type="text/javascript">
        let status = document.getElementById("status").value;
    	let test = document.getElementById("loginFailed")
    	if(status === "failed"){
    		//console.log("Login Failed");
    		test.innerHTML = "Login Failed";
    	}
        
    </script>
</body>
</html>