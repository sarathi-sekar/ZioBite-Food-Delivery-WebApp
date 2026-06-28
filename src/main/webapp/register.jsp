<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ZioBite Register</title>

<link rel="icon" href="data:image/svg+xml,
<svg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 100 100'>
<rect width='100' height='100' fill='red'/>
<text x='50' y='75' font-size='80' text-anchor='middle' fill='white'>Z</text>
</svg>">


<style>
		
		*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:Arial, sans-serif;
}

body{
    height:100vh;
    display:flex;
    justify-content:center;
    align-items:center;
    background:#0f0f0f;
    overflow:hidden;
}

/* BACKGROUND EFFECTS */

body::before{
    content:"";
    position:absolute;
    width:450px;
    height:450px;
    background:orange;
    border-radius:50%;
    filter:blur(200px);
    top:-150px;
    left:-100px;
    opacity:0.4;
}

body::after{
    content:"";
    position:absolute;
    width:400px;
    height:400px;
    background:red;
    border-radius:50%;
    filter:blur(200px);
    bottom:-150px;
    right:-100px;
    opacity:0.3;
}

/* REGISTER BOX */

.container{
    position:relative;
    width:430px;
    padding:40px;
    border-radius:25px;
    background:rgba(255,255,255,0.08);
    backdrop-filter:blur(20px);
    border:1px solid rgba(255,255,255,0.1);
    box-shadow:0 0 35px rgba(255,140,0,0.4);
    z-index:1;
}

/* LOGO */

.logo{
    text-align:center;
    color:orange;
    font-size:38px;
    font-weight:bold;
    margin-bottom:10px;
}

.tagline{
    text-align:center;
    color:#ccc;
    margin-bottom:30px;
    font-size:14px;
}

/* INPUT BOX */

.input-box{
    margin-bottom:18px;
}

.input-box input,
.input-box select{

    width:100%;
    padding:15px;
    border:none;
    outline:none;
    border-radius:12px;
    background:#1e1e1e;
    color:white;
    font-size:15px;
    transition:0.3s;
}

.input-box input:focus,
.input-box select:focus{

    border:1px solid orange;
    box-shadow:0 0 15px orange;
}

/* BUTTON */

.register-btn{

    width:100%;
    padding:15px;
    border:none;
    border-radius:12px;
    background:linear-gradient(45deg,#ff6600,#ff3300);
    color:white;
    font-size:18px;
    font-weight:bold;
    cursor:pointer;
    transition:0.3s;
}

.register-btn:hover{

    transform:scale(1.03);
    box-shadow:0 0 20px orange;
}

/* LOGIN LINK */

.bottom-text{

    text-align:center;
    color:#bbb;
    margin-top:20px;
    font-size:14px;
}

.bottom-text a{

    color:orange;
    text-decoration:none;
    font-weight:bold;
}

.bottom-text a:hover{

    text-decoration:underline;
}

/* FLOATING ICONS */

.food{
    position:absolute;
    font-size:30px;
    animation:float 6s infinite ease-in-out;
    opacity:0.7;
}

.food1{
    top:8%;
    left:12%;
}

.food2{
    top:18%;
    right:10%;
}

.food3{
    bottom:15%;
    left:18%;
}

.food4{
    bottom:10%;
    right:15%;
}

@keyframes float{

    0%{
        transform:translateY(0px);
    }

    50%{
        transform:translateY(-20px);
    }

    100%{
        transform:translateY(0px);
    }
}

</style>

</head>

<body>
			
	<div class="food food1">🍔</div>
	<div class="food food2">🍕</div>
	<div class="food food3">🍟</div>
	<div class="food food4">🌮</div>

<div class="container">

    <div class="logo">ZioBite</div>

    <div class="tagline">
        Create Your Food Account 🚀
    </div>

    <form action="Registerservlet" method="post">

        <!-- Username -->

        <div class="input-box">
            <input type="text"
                   name="username"
                   placeholder="Enter Username"
                   minlength="3"
                   maxlength="20"
                   required>
        </div>

        <!-- Email -->

        <div class="input-box">
            <input type="email"
                   name="email"
                   placeholder="Enter Email Address"
                   required>
        </div>

        <!-- Phone Number -->

        <div class="input-box">
            <input type="tel"
                   name="phone"
                   placeholder="Enter Mobile Number"
                   pattern="[0-9]{10}"
                   required>
        </div>

        <!-- Address -->

        <div class="input-box">
            <input type="text"
                   name="address"
                   placeholder="Enter Address"
                   required>
        </div>

        <!-- Password -->

        <div class="input-box">
            <input type="password"
                   name="password"
                   placeholder="Enter Password"
                   minlength="6"
                   required>
        </div>

        <!-- Confirm Password -->

        <div class="input-box">
            <input type="password"
                   name="confirmPassword"
                   placeholder="Confirm Password"
                   minlength="6"
                   required>
        </div>

        <!-- Role -->

        <div class="input-box">

            <select name="role" required>

                <option value=""
                        selected
                        disabled>
                    Select Role
                </option>

                <option value="USER">
                    User
                </option>

                <option value="ADMIN">
                    Admin
                </option>

                <option value="DELIVERY">
                    Delivery Partner
                </option>

            </select>

        </div>

        <!-- Register Button -->

        <button 
        		class="register-btn"
                type="submit">

            REGISTER NOW 🚀

        </button>

    </form>

    <div class="bottom-text">

        Already have an account?

        <a href="login.jsp">
            Login Here
        </a>

    </div>

</div>


</body>
</html>