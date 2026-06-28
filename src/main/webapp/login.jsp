<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>ZioBite Login</title>

<link rel="icon" href="data:image/svg+xml,
<svg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 100 100'>
<rect width='100' height='100' fill='red'/>
<text x='50' y='75' font-size='80' text-anchor='middle' fill='white'>Z</text>
</svg>">

<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">

<style>

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:'Poppins',sans-serif;
}

body{
    min-height:100vh;
    background:#0a0a0a;
    overflow:hidden;
    color:white;
}

/* Background Glow */

body::before{
    content:"";
    position:absolute;
    width:500px;
    height:500px;
    background:#ff6600;
    border-radius:50%;
    filter:blur(180px);
    top:-180px;
    left:-180px;
    opacity:.35;
}

body::after{
    content:"";
    position:absolute;
    width:450px;
    height:450px;
    background:#ff3300;
    border-radius:50%;
    filter:blur(180px);
    bottom:-180px;
    right:-180px;
    opacity:.25;
}

.container{
    width:100%;
    height:100vh;
    display:flex;
    position:relative;
    z-index:10;
}

/* LEFT SIDE */

.left{
    width:55%;
    display:flex;
    flex-direction:column;
    justify-content:center;
    padding-left:100px;
}

.logo{
    font-size:75px;
    font-weight:800;
    color:#ff6600;
    margin-bottom:10px;
}

.tagline{
    font-size:35px;
    font-weight:600;
    margin-bottom:25px;
}

.description{
    width:75%;
    color:#cfcfcf;
    font-size:18px;
    line-height:1.8;
}

.features{
    margin-top:40px;
}

.feature{
    margin:18px 0;
    font-size:22px;
    font-weight:500;
}

/* RIGHT SIDE */

.right{
    width:45%;
    display:flex;
    justify-content:center;
    align-items:center;
}

.login-box{

    width:430px;

    padding:45px;

    background:
    rgba(255,255,255,0.08);

    backdrop-filter:blur(20px);

    border-radius:30px;

    border:
    1px solid rgba(255,255,255,0.1);

    box-shadow:
    0 0 40px rgba(255,102,0,0.25);
}

.login-title{
    text-align:center;
    font-size:35px;
    font-weight:700;
    margin-bottom:10px;
}

.login-sub{
    text-align:center;
    color:#bdbdbd;
    margin-bottom:30px;
}

.input-box{
    margin-bottom:18px;
}

.input-box input{

    width:100%;

    padding:16px;

    border:none;

    outline:none;

    border-radius:15px;

    background:#1b1b1b;

    color:white;

    font-size:15px;
}

.input-box input:focus{

    box-shadow:
    0 0 15px #ff6600;
}

.login-btn{

    width:100%;

    padding:16px;

    border:none;

    border-radius:15px;

    background:
    linear-gradient(
    45deg,
    #ff6600,
    #ff3300);

    color:white;

    font-size:18px;

    font-weight:600;

    cursor:pointer;

    transition:.3s;
}

.login-btn:hover{

    transform:translateY(-2px);

    box-shadow:
    0 0 25px rgba(255,102,0,.6);
}

.bottom-text{

    text-align:center;

    margin-top:20px;

    color:#bdbdbd;
}

.bottom-text a{

    color:#ff6600;

    text-decoration:none;

    font-weight:600;
}

.bottom-text a:hover{
    text-decoration:underline;
}

/* Floating Food Icons */

.food{

    position:absolute;

    font-size:45px;

    animation:float 5s ease-in-out infinite;
}

.food1{
    top:3%;
    left:8%;
}

.food2{
   top: 5%;
   right : 10%;
}

.food3{
    bottom:12%;
    left:25%;
}

.food4{
    bottom:8%;
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
<div class="food food4">🥤</div>

<div class="container">

    <div class="left">

        <div class="logo">
            ZioBite
        </div>

        <div class="tagline">
            Food Beyond Limits 🚀
        </div>

        <div class="description">
            Experience the future of food delivery with
            AI-powered recommendations, lightning-fast delivery,
            live order tracking and exclusive rewards designed
            just for you.
        </div>

        <div class="features">
            <div class="feature">⚡ 10 Minute Delivery</div>
            <div class="feature">🤖 AI Food Suggestions</div>
            <div class="feature">📍 Live Order Tracking</div>
            <div class="feature">🎁 Premium Rewards</div>
            <div class="feature">🔥 Smart Combo Offers</div>
        </div>

    </div>

    <div class="right">

        <div class="login-box">

            <div class="login-title">
                Welcome Back 👋
            </div>

            <div class="login-sub">
                Login to continue your food journey
            </div>

            <%-- Error Message --%>
            <%
                String error = (String)request.getAttribute("error");
                if(error != null){
            %>

                <p style="color:red;text-align:center;margin-bottom:15px;">
                    <%= error %>
                </p>

            <%
                }
            %>

            <form action="LoginServlet" method="post">

                <div class="input-box">
                    <input type="text"
                           name="username"
                           placeholder="Enter Username"
                           required>
                </div>

                <div class="input-box">
                    <input type="password"
                           name="password"
                           placeholder="Enter Password"
                           required>
                </div>

                <button class="login-btn"
                        type="submit">
                    LOGIN
                </button>

            </form>

            <div class="bottom-text">

                Don't have an account?

                <a href="register.jsp">
                    Register Here
                </a>

            </div>

        </div>

    </div>

</div>

</body>
</html>