<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.ziobite.model.Cart"%>
<%@ page import="com.ziobite.model.CartItem"%>
<%@ page import="java.util.*"%>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ZioBite Checkout</title>

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
background:#f4f4f4;
}

.header{
background:#ff5200;
padding:20px 50px;
color:white;
box-shadow:0 2px 10px rgba(0,0,0,.2);
}

.logo{
font-size:32px;
font-weight:700;
}

.sub{
font-size:14px;
opacity:.9;
}

.container{
max-width:1300px;
margin:30px auto;
display:flex;
gap:30px;
padding:0 20px;
}

.left{
flex:2;
}

.right{
flex:1;
}

.card{
background:white;
padding:25px;
border-radius:15px;
box-shadow:0 2px 12px rgba(0,0,0,.1);
margin-bottom:25px;
}

.card h2{
color:#ff5200;
margin-bottom:20px;
}

label{
display:block;
margin-top:15px;
margin-bottom:8px;
font-weight:600;
}

input,
textarea,
select{
width:100%;
padding:14px;
border:1px solid #ddd;
border-radius:10px;
font-size:15px;
}

input:focus,
textarea:focus,
select:focus{
outline:none;
border-color:#ff5200;
}

.summary-item{
display:flex;
justify-content:space-between;
padding:10px 0;
border-bottom:1px solid #eee;
}

.price-row{
display:flex;
justify-content:space-between;
margin:12px 0;
font-size:15px;
}

.total{
font-size:22px;
font-weight:bold;
color:#ff5200;
}

.place-btn{
width:100%;
padding:16px;
border:none;
border-radius:12px;
background:linear-gradient(45deg,#ff5200,#ff7b00);
color:white;
font-size:18px;
font-weight:700;
cursor:pointer;
margin-top:20px;
}

.place-btn:hover{
transform:translateY(-2px);
}

.secure{
background:#e8fff1;
padding:12px;
border-radius:10px;
color:#28a745;
font-weight:600;
margin-top:15px;
text-align:center;
}

</style>

</head>

<body>

<div class="header">

<div class="logo">
🍔 ZioBite
</div>

<div class="sub">
Secure Checkout • Fast Delivery • Safe Payment
</div>

</div>

<div class="container">

<div class="left">

<form action="OrderServlet" method="post">

<div class="card">

<h2>📍 Delivery Details</h2>

<label>Full Name</label>
<input type="text"
       name="name"
       placeholder="Enter Full Name"
       required>

<label>Phone Number</label>
<input type="text"
       name="phone"
       placeholder="Enter Mobile Number"
       required>

<label>Delivery Address</label>
<textarea
name="address"
rows="5"
placeholder="Enter Complete Delivery Address"
required></textarea>

</div>

<div class="card">

<h2>💳 Payment Method</h2>

<select name="paymentMethod">

    <option value="COD">Cash On Delivery</option>

    <option value="UPI">UPI Payment</option>

    <option value="CARD">Credit / Debit Card</option>

</select>

<div class="secure">
🔒 100% Secure Payment
</div>

</div>



   

    <button type="submit"
            class="place-btn">
        Place Order
    </button>



</form>

</div>

<div class="right">

<div class="card">

<h2>🛒 Order Summary</h2>

<%
Cart cart = (Cart)session.getAttribute("cart");

if(cart == null){
    response.sendRedirect("cart.jsp");
    return;
}

double subTotal = cart.getTotalPrice();
double deliveryFee = 30;
double platformFee = 10;
double gst = subTotal * 0.05;
double grandTotal = subTotal + deliveryFee + platformFee + gst;
%>

<%
for(CartItem item : cart.getItems()){
%>

<div class="summary-item">

<div>
<%= item.getItemName() %>
<br>

Qty : <%= item.getQuantity() %>
</div>

<div>
₹ <%= item.getTotalPrice() %>
</div>

</div>

<%
}
%>

<br>

<div class="price-row">
<span>Food Total</span>
<span>₹ <%= String.format("%.2f",subTotal) %></span>
</div>

<div class="price-row">
<span>Delivery Fee</span>
<span>₹ <%= deliveryFee %></span>
</div>

<div class="price-row">
<span>Platform Fee</span>
<span>₹ <%= platformFee %></span>
</div>

<div class="price-row">
<span>GST (5%)</span>
<span>₹ <%= String.format("%.2f",gst) %></span>
</div>

<hr style="margin:15px 0;">

<div class="price-row total">

<span>Grand Total</span>

<span>
₹ <%= String.format("%.2f",grandTotal) %>
</span>

</div>

</div>

</div>

</div>

</body>
</html></html>