<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.ziobite.model.User" %>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Profile</title>

<link rel="icon" href="data:image/svg+xml,
<svg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 100 100'>
<rect width='100' height='100' fill='red'/>
<text x='50' y='75' font-size='80' text-anchor='middle' fill='white'>Z</text>
</svg>">

<style>

body{
    font-family:Poppins,sans-serif;
    background:#f5f5f5;
}

.profile-box{
    width:500px;
    margin:50px auto;
    background:white;
    padding:30px;
    border-radius:15px;
    box-shadow:0 0 10px rgba(0,0,0,0.2);
}

h1{
    text-align:center;
    color:#ff5200;
}

.row{
    margin:15px 0;
}

label{
    font-weight:bold;
}

.value{
    color:#555;
}

.actions{
    margin-top:30px;
    display:flex;
    flex-direction:column;
    gap:15px;
}

.action-card{

    display:flex;

    align-items:center;

    gap:15px;

    padding:18px;

    text-decoration:none;

    background:linear-gradient(135deg,#ff5200,#ff7b00);

    color:white;

    border-radius:15px;

    font-size:18px;

    font-weight:600;

    transition:.3s;
}

.action-card:hover{

    transform:translateY(-3px);

    box-shadow:0 10px 20px rgba(255,82,0,.3);
}

.icon{
    font-size:24px;
}

.logout{
    background:linear-gradient(135deg,#dc3545,#ff4d5a);
}

</style>

</head>
<body>

<div class="profile-box">

    <h1>👤 My Profile</h1>
    
    <% User user = (User)session.getAttribute("loggedUser");

		if(user == null){
		    response.sendRedirect("login.jsp");
		    return;
		}
%>

    <div class="row">
        <label>Name:</label>
        <div class="value"><%= user.getName() %></div>
    </div>

    <div class="row">
        <label>Email:</label>
        <div class="value"><%= user.getEmail() %></div>
    </div>

    <div class="row">
        <label>Phone:</label>
        <div class="value"><%= user.getPhone() %></div>
    </div>

    <div class="row">
        <label>Address:</label>
        <div class="value"><%= user.getAddress() %></div>
    </div>

    <div class="row">
        <label>Role:</label>
        <div class="value"><%= user.getRole() %></div>
    </div>
    
 <div class="actions">

    <a href="MyOrdersServlet" class="action-card">
        <span class="icon">📦</span>
        <span>My Orders</span>
    </a>

    <a href="RestaurentServlet" class="action-card">
        <span class="icon">🏠</span>
        <span>Home</span>
    </a>

    
</div>

   
</div>

</body>
</html>