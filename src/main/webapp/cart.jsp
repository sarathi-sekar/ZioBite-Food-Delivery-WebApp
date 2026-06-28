<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="com.ziobite.model.Cart"%>
<%@ page import="com.ziobite.model.CartItem"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ZioBite | My Cart</title>

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
    font-family:'Poppins',sans-serif;
}

body{
    background:#f5f5f5;
}

.header{
    background:white;
    padding:20px;
    text-align:center;
    box-shadow:0 2px 10px rgba(0,0,0,.1);
}

.header h1{
    color:#ff5200;
}

.container{
    width:85%;
    margin:30px auto;
}

.cart-item{
    background:white;
    border-radius:15px;
    padding:20px;
    margin-bottom:20px;
    display:flex;
    align-items:center;
    gap:20px;
    box-shadow:0 2px 10px rgba(0,0,0,.1);
}

.cart-item img{
    width:120px;
    height:120px;
    object-fit:cover;
    border-radius:12px;
}

.details{
    flex:1;
}

.details h2{
    margin-bottom:10px;
}

.price{
    color:#ff5200;
    font-size:22px;
    font-weight:bold;
}

.qty-box{
    display:flex;
    align-items:center;
    gap:12px;
    margin-top:15px;
}

.qty-btn{
    width:35px;
    height:35px;
    border:none;
    border-radius:50%;
    background:#ff5200;
    color:white;
    font-size:18px;
    cursor:pointer;
}

.qty{
    font-size:18px;
    font-weight:bold;
}

.remove-btn{
    background:red;
    color:white;
    border:none;
    padding:10px 18px;
    border-radius:8px;
    cursor:pointer;
    margin-top:15px;
}

.summary{
    background:white;
    padding:25px;
    border-radius:15px;
    box-shadow:0 2px 10px rgba(0,0,0,.1);
    margin-top:20px;
}

.summary h2{
    margin-bottom:20px;
}

.buttons{
    display:flex;
    gap:15px;
}

.add-more-btn{
    background:#1dbf73;
    color:white;
    border:none;
    padding:14px 25px;
    border-radius:10px;
    cursor:pointer;
    font-size:16px;
}

.checkout-btn{
    background:#ff5200;
    color:white;
    border:none;
    padding:14px 25px;
    border-radius:10px;
    cursor:pointer;
    font-size:16px;
}

.clear-btn{
    background:red;
    color:white;
    border:none;
    padding:14px 25px;
    border-radius:10px;
    cursor:pointer;
    font-size:16px;
}

.empty{
    text-align:center;
    margin-top:100px;
}

.empty h2{
    color:#666;
}

a{
    text-decoration:none;
}

</style>
</head>
<body>

<div class="header">
    <h1>🛒 My Cart</h1>
</div>

<div class="container">

<%
      Cart cart = (Cart)session.getAttribute("cart");

      int restaurantId = 0;

 if(cart != null && !cart.getItems().isEmpty()){

    CartItem firstItem = cart.getItems().iterator().next();

    restaurantId = firstItem.getRestaurantId();

    for(CartItem item : cart.getItems()){
%>

<%
		String error =(String)session.getAttribute("error");

		if(error != null){
%>

<div style="
background:#ffdddd;
color:red;
padding:15px;
margin:15px;
border-radius:10px;">
    <%= error %>
</div>

<%
	session.removeAttribute("error");
}
%>

<div class="cart-item">

    <img src="<%= item.getImagePath() %>">

    <div class="details">

        <h2><%= item.getItemName() %></h2>

        <p class="price">
            ₹ <%= item.getPrice() %>
        </p>

        <div class="qty-box">

            <a href="CartServlet?action=decrease&menuId=<%=item.getMenuId()%>">
                <button class="qty-btn">-</button>
            </a>

            <span class="qty">
                <%= item.getQuantity() %>
            </span>

            <a href="CartServlet?action=increase&menuId=<%=item.getMenuId()%>">
                <button class="qty-btn">+</button>
            </a>

        </div>

        <a href="CartServlet?action=remove&menuId=<%=item.getMenuId()%>">
            <button class="remove-btn">
                Remove
            </button>
        </a>

    </div>

</div>

<%
    }
%>

<div class="summary">

    <h2>
        Grand Total :
        ₹ <%= cart.getTotalPrice() %>
    </h2>

    <div class="buttons">

        <a href="MenuServlet?restaurantId=<%=restaurantId%>">
            <button class="add-more-btn">
                🍽 Add More Items
            </button>
        </a>

        <a href="checkout.jsp">
            <button class="checkout-btn">
                💳 Checkout
            </button>
        </a>
        
        <a href="CartServlet?action=clear">
        
    		<button class="clear-btn">
        		Clear Cart
    		</button>
		</a>

    </div>

</div>

<%
}
else{
%>

<div class="empty">

    <h2>Your Cart is Empty 😔</h2>

    <br><br>

    <a href="RestaurentServlet">
        <button class="checkout-btn">
            Browse Restaurants
        </button>
    </a>
    
   

</div>

<%
}
%>

</div>

</body>
</html>