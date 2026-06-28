<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.List,com.ziobite.model.Menu" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ZioBite | Restaurant Menu</title>

<link rel="icon" href="data:image/svg+xml,
<svg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 100 100'>
<rect width='100' height='100' fill='red'/>
<text x='50' y='75' font-size='80' text-anchor='middle' fill='white'>Z</text>
</svg>">

<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">

<style>

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
}

body{
    font-family:'Poppins',sans-serif;
    background:#f8f8f8;
}

.header{
    background:white;
    padding:25px;
    text-align:center;
    box-shadow:0 2px 10px rgba(0,0,0,0.08);
    margin-bottom:30px;
}

.header h1{
    color:#222;
    font-size:40px;
}

.container{
    width:90%;
    margin:auto;
    display:grid;
    grid-template-columns:repeat(auto-fill,minmax(280px,1fr));
    gap:25px;
    padding-bottom:40px;
}

.card{
    background:white;
    border-radius:16px;
    overflow:hidden;
    box-shadow:0 4px 15px rgba(0,0,0,0.12);
    transition:0.3s;
}

.card:hover{
    transform:translateY(-6px);
}

.card img{
    width:100%;
    height:190px;
    object-fit:cover;
    display:block;
}

.content{
    padding:18px;
}

.content h2{
    font-size:24px;
    color:#222;
    margin-bottom:8px;
}

.content p{
    color:#666;
    font-size:14px;
    line-height:1.5;
    min-height:45px;
}

.price{
    color:#ff5200;
    font-size:26px;
    font-weight:700;
    margin-top:15px;
}

.btn{
    margin-top:15px;
    width:100%;
    padding:12px;
    border:none;
    border-radius:10px;
    background:#ff5200;
    color:white;
    font-size:16px;
    font-weight:600;
    cursor:pointer;
    transition:0.3s;
}

.btn:hover{
    background:#e64900;
}

@media(max-width:768px){

    .header h1{
        font-size:28px;
    }

    .container{
        width:95%;
        grid-template-columns:1fr;
    }
}

</style>

</head>
<body>

<div class="header">
    <h1>🍕 Restaurant Menu</h1>
</div>

<div class="container">

<%
List<Menu> menus = (List<Menu>)request.getAttribute("menus");

if(menus != null && !menus.isEmpty()){

    for(Menu menu : menus){
%>

<div class="card">

    <img src="<%= menu.getImagePath() %>"
         alt="<%= menu.getItemName() %>"
         onerror="this.src='https://images.unsplash.com/photo-1504674900247-0877df9cc836?w=800';">

    <div class="content">

        <h2><%= menu.getItemName() %></h2>

        <p><%= menu.getDescription() %></p>

        <div class="price">
            ₹ <%= menu.getPrice() %>
        </div>

      <a href="CartServlet?action=add&menuId=<%=menu.getMenuId()%>">
    <button class="btn">Add To Cart</button>
</a>
	   </a>

    </div>

</div>

<%
    }
}
else{
%>

<h2 style="text-align:center;grid-column:1/-1;">
    No Menu Items Available
</h2>

<%
}
%>

</div>

</body>
</html>