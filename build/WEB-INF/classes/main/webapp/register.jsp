<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign up</title>
    <link rel="stylesheet" href="CSS/register.css">

    <!-- cdn for login, phone,mail and location icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css" integrity="sha512-MV7K8+y+gLIBoVD59lQIYicR65iaqukzvf/nwasF0nqhPay5w/9lJmVM2hMDcnK1OnMGCdVK+iQrJ7lzPJQd1w==" crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body>
    <div class="container">
        <form action="register" method="post">
            <i class="fa-regular fa-user"></i>
            <h1>Sign up</h1>
            <input type="text" placeholder="Full Name" name="fullname" required>
            <input type="text" placeholder="username" name="username" required>
            <input type="password" placeholder="password" name="password" required>
            <input type="email" placeholder="Email" name="email" required>
            <input type="number" placeholder="Phone Number" name="phone" required>
            <select class="catagories" name="region" required>
                <option value="">Region</option>
                <option value="Afar">Afar</option>
                <option value="am">Amhara</option>
                <option value="bg">Benishangul-Gumuz</option>
                <option value="har">Harari</option>
                <option value="or">Oromia</option>
                <option value="som">Somalia</option>
                <option value="snnp">Southern Nations, Nationalities Peoples</option>
                <option value="tg">Tigray</option>
                <option value="aa">Addis Ababa</option>
                <option value="dd">Dire Dawa</option>
            </select>
            <input type="text" placeholder="Town" name="town" required>
            <input type="text" placeholder="Kebele" name="kebele" required>
            <input type="text" placeholder="house number" name="house" required>
            <select class="catagories" name="userType" id="userType"required>
                <option value="">User Type</option>
                <option value="Customer">Customer</option>
                <option value="Trucker">Trucker</option>
            </select>
            <!-- registration failed -->
            <p id="regFailed"></p>
            <button type="submit">Register</button>
        </form>
    </div>

    <!-- Footer -->
    <div class="footer">
        <div class="about details">
            <h2>About</h2>
            <h4>Egele Egele's company</h4>
            <h4>something something..</h4>
        </div>
        <div class="quicklinks details">
            <h2>Quick Links</h2>
            <ul>
                <li><a href="#">Freight transportation</a></li>
                <li><a href="signin">Login</a></li>
            </ul>
        </div>
        <div class="contact details">
            <h2>Contact</h2>
            <div class="subdetails">
                <i class="fa-solid fa-phone"></i><h4>+251 (0000) (000)</h4>
            </div>
            <div class="subdetails">
                <i class="fa-solid fa-envelope"></i><h4>egele@gmail.com</h4>
            </div>
            <div class="subdetails">
                <i class="fa-solid fa-location-dot"></i><h4>Adama Ethiopia</h4>
            </div>

        </div>
    </div>

    <!-- javascript -->
    <input type="hidden" id="status" value="<%= request.getAttribute("status")%>">
    
    <script type="text/javascript">
    	let status = document.getElementById("status").value;
    	let regFailed = document.getElementById("regFailed")
    	if(status === "failed"){
    		regFailed.innerHTML = "Registration Failed, Email already exist!";
    	}
        if(status === "success"){
    		regFailed.innerHTML = "Account created successfully";
        }
    </script>
</body>
</html>