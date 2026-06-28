<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*,com.ziobite.model.Order"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Orders</title>

<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">

<link rel="icon" href="data:image/svg+xml,
<svg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 100 100'>
<rect width='100' height='100' fill='red'/>
<text x='50' y='75' font-size='80' text-anchor='middle' fill='white'>Z</text>
</svg>">


<style>

body{
    margin:0;
    font-family:'Poppins', sans-serif;
    background:#f4f6f9;
}

/* Header */
.header{
    background:linear-gradient(135deg,#ff4d4d,#ff7a18);
    padding:20px;
    text-align:center;
    color:white;
    font-size:24px;
    font-weight:600;
    letter-spacing:1px;
}

/* Container */
.container{
    width:90%;
    margin:30px auto;
}

/* Card */
.card{
    display:flex;
    background:white;
    border-radius:16px;
    overflow:hidden;
    margin-bottom:20px;
    box-shadow:0 6px 18px rgba(0,0,0,0.08);
    transition:0.3s;
}

.card:hover{
    transform:translateY(-5px);
    box-shadow:0 10px 25px rgba(0,0,0,0.15);
}



/* Content */
.content{
    padding:15px 20px;
    flex:1;
}

.title{
    font-size:18px;
    font-weight:600;
    margin-bottom:5px;
}

.small{
    color:#666;
    font-size:13px;
    margin:3px 0;
}

.items{
    margin-top:8px;
    font-size:13px;
    color:#444;
}

/* Fees box */
.fees{
    margin-top:10px;
    display:flex;
    gap:15px;
    font-size:13px;
}

.fees span{
    background:#f1f1f1;
    padding:5px 10px;
    border-radius:8px;
}

/* Price */
.price{
    margin-top:10px;
    font-size:18px;
    font-weight:600;
    color:#ff4d4d;
}

/* Status */
.status{
    margin-top:5px;
    font-weight:600;
    color:green;
}

.empty{
    text-align:center;
    margin-top:50px;
    color:#777;
}

.food-item{
display:flex;
align-items:center;
gap:15px;
margin:15px 0;
padding:10px;
background:#fafafa;
border-radius:10px;
}

.food-img{
width:90px;
height:90px;
border-radius:12px;
object-fit:cover;
}

.food-details{
flex:1;
}

.food-details h4{
margin:0;
font-size:18px;
}

.food-details p{
margin:5px 0;
color:#666;
}

</style>

</head>

<body>

<div class="header">
    🍽️ My Order History
</div>

<div class="container">

<%
List<Order> orders = (List<Order>)request.getAttribute("orders");

if(orders != null && !orders.isEmpty()){
	
	 int count = 1;

    for(Order order : orders){
%>

<div class="card">

 

    <!-- Content -->
 <div class="content">

   <div class="title">
    Order #<%=count++%>
</div>

    <div class="small">
        📅 <%=order.getOrderDate()%>
    </div>

    <div class="small">
        💳 <%=order.getPaymentMethod()%>
    </div>

    <div class="small">
        🚚 Delivery Fee : ₹<%=order.getDeliveryFee()%>
    </div>

    <div class="small">
        💰 Platform Fee : ₹<%=order.getPlatformFee()%>
    </div>

    <hr>

    <% for(com.ziobite.model.OrderItem item : order.getItems()){ %>

    <div class="food-item">

        <img src="<%=item.getImagePath()%>" class="food-img">

        <div class="food-details">

            <h4><%=item.getItemName()%></h4>

            <p>Quantity : <%=item.getQuantity()%></p>

            <p>₹ <%=item.getItemTotal()%></p>

        </div>

    </div>

    <% } %>

    <hr>

    <div class="price">
        Grand Total : ₹<%=String.format("%.2f",order.getTotalAmount())%>
    </div>

    <div class="status">
        <%=order.getStatus()%>
    </div>

</div>

</div>

<%
    }

} else {
%>

<div class="empty">
    😢 No orders found
</div>

<%
}
%>

</div>

</body>
</html>