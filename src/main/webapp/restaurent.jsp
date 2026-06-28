<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>  
<%@ page import="com.ziobite.model.Cart" %>
<%@ page import="com.ziobite.model.CartItem" %>
<%@ page import="com.ziobite.model.User" %>
<%@ page import = "java.util.List , com.ziobite.model.Restaurant" %>



<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>ZioBite | Order Food Online</title>

<link rel="icon" href="data:image/svg+xml,
<svg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 100 100'>
<rect width='100' height='100' fill='red'/>
<text x='50' y='75' font-size='80' text-anchor='middle' fill='white'>Z</text>
</svg>">

<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
<style>

/* ─── RESET & BASE ─────────────────────────── */
*, *::before, *::after { margin:0; padding:0; box-sizing:border-box; }
html { scroll-behavior:smooth; }
body {
  font-family: 'Poppins', sans-serif;
  background: #F4F4F4;
  color: #1C1C1C;
  -webkit-font-smoothing: antialiased;
}
a { text-decoration: none; color: inherit; }
img { display: block; width: 100%; object-fit: cover; }

/* ─── VARIABLES ───────────────────────────── */
:root {
  --red:   #E8324A;
  --red2:  #C9253C;
  --orange:#FF7B2C;
  --yellow:#FFC107;
  --bg:    #F4F4F4;
  --white: #FFFFFF;
  --text:  #1C1C1C;
  --mid:   #555;
  --muted: #999;
  --border:#E8E8E8;
  --card-shadow: 0 2px 12px rgba(0,0,0,.09);
  --hover-shadow: 0 8px 28px rgba(0,0,0,.14);
  --radius: 16px;
  --radius-sm: 10px;
}

/* ─── NAVBAR ──────────────────────────────── */
.navbar {
  background: #fff;
  border-bottom: 1px solid var(--border);
  position: sticky;
  top: 0;
  z-index: 500;
  box-shadow: 0 2px 10px rgba(0,0,0,.06);
}
.nav-inner {
  max-width: 1200px;
  margin: 0 auto;
  padding: 0 24px;
  height: 68px;
  display: flex;
  align-items: center;
  gap: 20px;
}

/* Logo */
.logo {
  font-size: 1.65rem;
  font-weight: 800;
  color: var(--red);
  letter-spacing: -1.2px;
  white-space: nowrap;
  cursor: pointer;
}
.logo em {
  color: var(--text);
  font-style: normal;
  font-weight: 400;
}

/* Location */
.location {
  display: flex;
  align-items: center;
  gap: 6px;
  cursor: pointer;
  padding: 6px 12px;
  border-radius: 8px;
  border: 1.5px solid var(--border);
  transition: border-color .2s;
  white-space: nowrap;
}
.location:hover { border-color: var(--red); }
.location .pin { color: var(--red); font-size: .9rem; }
.loc-city { font-size: .82rem; font-weight: 700; color: var(--text); }
.loc-label { font-size: .65rem; color: var(--muted); display:block; line-height:1; }
.location .chev { color: var(--muted); font-size: .6rem; margin-left:2px; }

/* Search */
.nav-search {
  flex: 1;
  max-width: 480px;
  display: flex;
  align-items: center;
  gap: 10px;
  background: var(--bg);
  border: 1.5px solid var(--border);
  border-radius: 10px;
  padding: 9px 14px;
  transition: border-color .2s, box-shadow .2s;
}
.nav-search:focus-within {
  border-color: var(--red);
  box-shadow: 0 0 0 3px rgba(232,50,74,.1);
  background: #fff;
}
.nav-search i { color: var(--muted); font-size: .9rem; flex-shrink:0; }
.nav-search input {
  flex:1; border:none; outline:none; background:transparent;
  font-family: 'Poppins',sans-serif; font-size:.88rem; color:var(--text);
}
.nav-search input::placeholder { color: var(--muted); }

/* Nav auth */
.nav-right { display:flex; align-items:center; gap:10px; margin-left:auto; flex-shrink:0; }
.btn-login {
  padding: 9px 20px;
  border: 1.5px solid var(--red);
  border-radius: 8px;
  font-size: .84rem;
  font-weight: 700;
  color: var(--red);
  transition: all .2s;
  cursor: pointer;
}
.btn-login:hover { background: var(--red); color: #fff; }
.btn-signup {
  padding: 9px 20px;
  background: var(--red);
  border: 1.5px solid var(--red);
  border-radius: 8px;
  font-size: .84rem;
  font-weight: 700;
  color: #fff;
  transition: all .2s;
  cursor: pointer;
}
.btn-signup:hover { background: var(--red2); border-color: var(--red2); }
.cart-icon {
  position: relative;
  width: 40px; height: 40px;
  border-radius: 50%;
  background: var(--bg);
  border: 1.5px solid var(--border);
  display: flex; align-items:center; justify-content:center;
  cursor: pointer;
  font-size: 1rem;
  color: var(--text);
  transition: all .2s;
}
.cart-icon:hover { border-color: var(--red); color: var(--red); }
.cart-count {
  position: absolute; top:-4px; right:-4px;
  background: var(--red); color:#fff;
  font-size: .55rem; font-weight:700;
  width:16px; height:16px; border-radius:50%;
  display:flex; align-items:center; justify-content:center;
}

/* ─── HERO ────────────────────────────────── */
.hero {
  background: linear-gradient(120deg, #1C1C2E 0%, #2D1B3D 40%, #3D1040 100%);
  padding: 56px 24px 0;
  overflow: hidden;
  position: relative;
}
.hero-inner {
  max-width: 1200px;
  margin: 0 auto;
  display: flex;
  align-items: flex-end;
  justify-content: space-between;
  gap: 40px;
}
.hero-text { flex: 1; padding-bottom: 52px; }
.hero-tag {
  display: inline-flex;
  align-items: center;
  gap: 6px;
  background: rgba(255,255,255,.1);
  border: 1px solid rgba(255,255,255,.15);
  color: rgba(255,255,255,.85);
  font-size: .75rem;
  font-weight: 600;
  padding: 5px 12px;
  border-radius: 50px;
  margin-bottom: 18px;
  letter-spacing: .4px;
}
.hero-tag .dot { width:6px;height:6px;background:#4CAF50;border-radius:50%;animation:pulse 2s infinite; }
@keyframes pulse { 0%,100%{opacity:1}50%{opacity:.4} }
.hero-text h1 {
  font-size: 3rem; font-weight: 800;
  color: #fff; line-height: 1.1;
  letter-spacing: -1px; margin-bottom: 14px;
}
.hero-text h1 em {
  font-style:normal;
  background: linear-gradient(90deg, #FF7B2C, #FFD700);
  -webkit-background-clip:text; -webkit-text-fill-color:transparent;
}
.hero-text p { color:rgba(255,255,255,.65); font-size:.95rem; font-weight:300; margin-bottom:28px; }
.hero-search-bar {
  display: flex;
  background: #fff;
  border-radius: 12px;
  overflow: hidden;
  max-width: 480px;
  box-shadow: 0 8px 32px rgba(0,0,0,.3);
}
.hero-search-bar input {
  flex:1; padding:15px 18px;
  border:none; outline:none;
  font-family:'Poppins',sans-serif; font-size:.9rem;
  color: var(--text);
}
.hero-search-bar button {
  padding: 15px 22px;
  background: var(--red); color:#fff;
  border:none; cursor:pointer; font-size:.9rem;
  font-weight:700; font-family:'Poppins',sans-serif;
  transition:background .2s; white-space:nowrap;
}
.hero-search-bar button:hover { background:var(--red2); }
.hero-stats {
  display:flex; gap:28px; margin-top:24px;
}
.hstat .val { font-size:1.3rem; font-weight:800; color:#fff; }
.hstat .lbl { font-size:.7rem; color:rgba(255,255,255,.5); margin-top:1px; }
.hero-visual {
  flex-shrink:0; width:380px; position:relative; align-self:flex-end;
}
.hero-food-img {
  width:100%; border-radius:24px 24px 0 0;
  height:360px; object-fit:cover;
  box-shadow:0 -12px 48px rgba(0,0,0,.4);
}
.hero-badge {
  position:absolute; top:20px; right:20px;
  background:rgba(255,255,255,.12);
  backdrop-filter:blur(10px);
  border:1px solid rgba(255,255,255,.2);
  color:#fff; border-radius:12px;
  padding:10px 14px; text-align:center;
}
.hero-badge .hb-num { font-size:1.3rem; font-weight:800; }
.hero-badge .hb-txt { font-size:.65rem; opacity:.8; }

/* ─── CONTENT WRAPPER ─────────────────────── */
.content { max-width:1200px; margin:0 auto; padding:0 24px 80px; }

/* ─── SECTION HEADER ─────────────────────── */
.sec-head { display:flex; align-items:center; justify-content:space-between; margin:36px 0 18px; }
.sec-head h2 { font-size:1.25rem; font-weight:800; color:var(--text); }
.sec-head .see-all {
  font-size:.82rem; font-weight:700; color:var(--red);
  display:flex; align-items:center; gap:5px; cursor:pointer;
}
.sec-head .see-all:hover { text-decoration:underline; }

/* ─── CATEGORIES ──────────────────────────── */
.categories {
  display:flex; gap:14px;
  overflow-x:auto; padding-bottom:8px;
  scrollbar-width:none;
}
.categories::-webkit-scrollbar { display:none; }
.cat-item {
  display:flex; flex-direction:column; align-items:center; gap:8px;
  cursor:pointer; flex-shrink:0; transition:transform .2s;
}
.cat-item:hover { transform:translateY(-3px); }
.cat-img-wrap {
  width:80px; height:80px; border-radius:50%;
  overflow:hidden; border:2.5px solid transparent;
  background: linear-gradient(white,white) padding-box,
              linear-gradient(135deg,var(--red),var(--orange)) border-box;
  transition:transform .2s;
}
.cat-item.active .cat-img-wrap {
  background: linear-gradient(white,white) padding-box,
              linear-gradient(135deg,#FFD700,var(--orange)) border-box;
  box-shadow:0 4px 18px rgba(232,50,74,.25);
}
.cat-img-wrap img { width:100%; height:100%; object-fit:cover; }
.cat-name { font-size:.72rem; font-weight:700; color:var(--mid); white-space:nowrap; }
.cat-item.active .cat-name { color:var(--red); }

/* ─── OFFER BANNERS ───────────────────────── */
.offer-strip {
  display:flex; gap:16px;
  overflow-x:auto; scrollbar-width:none; padding-bottom:4px;
}
.offer-strip::-webkit-scrollbar { display:none; }
.offer-banner {
  flex-shrink:0; width:340px; height:130px;
  border-radius:var(--radius); overflow:hidden;
  position:relative; cursor:pointer;
  transition:transform .2s, box-shadow .2s;
}
.offer-banner:hover { transform:translateY(-3px); box-shadow:var(--hover-shadow); }
.offer-banner img { width:100%; height:100%; object-fit:cover; }
.offer-overlay {
  position:absolute; inset:0;
  background:linear-gradient(90deg, rgba(0,0,0,.65) 0%, rgba(0,0,0,.1) 100%);
  padding:18px 20px;
  display:flex; flex-direction:column; justify-content:center;
}
.offer-tag { font-size:.65rem; font-weight:700; color:var(--yellow); letter-spacing:.8px; text-transform:uppercase; }
.offer-title { font-size:1.1rem; font-weight:800; color:#fff; margin:3px 0; }
.offer-sub { font-size:.72rem; color:rgba(255,255,255,.75); }

/* ─── FILTER TABS ─────────────────────────── */
.filter-tabs { display:flex; gap:10px; flex-wrap:wrap; margin-bottom:6px; }
.ftab {
  padding:8px 18px;
  border-radius:50px;
  border:1.5px solid var(--border);
  background:#fff;
  font-family:'Poppins',sans-serif;
  font-size:.78rem; font-weight:600; color:var(--mid);
  cursor:pointer; transition:all .2s;
  display:flex; align-items:center; gap:6px;
}
.ftab:hover { border-color:var(--red); color:var(--red); }
.ftab.on { background:var(--red); color:#fff; border-color:var(--red); }

/* ─── RESTAURANT CARDS ───────────────────── */
.card-grid {
  display: grid;
  grid-template-columns: repeat(auto-fill, minmax(260px, 1fr));
  gap: 22px;
  margin-top: 18px;
}

/* ── THE EXACT CARD STRUCTURE YOU SPECIFIED ── */
.card {
  background: var(--white);
  border-radius: var(--radius);
  overflow: hidden;
  box-shadow: var(--card-shadow);
  cursor: pointer;
  transition: transform .22s ease, box-shadow .22s ease;
  position: relative;
}
.card:hover {
  transform: translateY(-5px);
  box-shadow: var(--hover-shadow);
}

.card img {
  width: 100%;
  height: 180px;
  object-fit: cover;
  display: block;
  transition: transform .4s ease;
}
.card:hover img { transform: scale(1.04); }

/* overflow clip for the image zoom */
.card .img-wrap { overflow:hidden; position:relative; }

.card-content {
  padding: 13px 15px 14px;
}

.top-row {
  display: flex;
  align-items: center;
  justify-content: space-between;
  margin-bottom: 3px;
}
.top-row h3 {
  font-size: .97rem;
  font-weight: 800;
  color: var(--text);
  white-space: nowrap;
  overflow: hidden;
  text-overflow: ellipsis;
  max-width: 65%;
}
.rating {
  display: flex;
  align-items: center;
  gap: 3px;
  background: #1B5E20;
  color: #fff;
  font-size: .73rem;
  font-weight: 700;
  padding: 3px 8px;
  border-radius: 6px;
  flex-shrink: 0;
}
.rating i { font-size:.6rem; }

.cuisine {
  font-size: .75rem;
  color: var(--muted);
  margin-bottom: 8px;
  white-space: nowrap;
  overflow: hidden;
  text-overflow: ellipsis;
}

/* border-top separator */
.details {
  display: flex;
  align-items: center;
  gap: 14px;
  font-size: .76rem;
  color: var(--mid);
  padding-top: 8px;
  border-top: 1px solid var(--border);
  margin-bottom: 8px;
}
.details span {
  display: flex;
  align-items: center;
  gap: 4px;
}
.details span i { color: var(--muted); font-size: .7rem; }

.offer {
  display: inline-block;
  background: #FFF8E1;
  color: #E65100;
  font-size: .72rem;
  font-weight: 700;
  padding: 4px 10px;
  border-radius: 6px;
  border-left: 3px solid #FF9800;
}

/* closed overlay */
.card .closed-overlay {
  position:absolute; inset:0;
  background:rgba(255,255,255,.7);
  display:flex; align-items:center; justify-content:center;
  font-size:.85rem; font-weight:700; color:var(--mid);
  border-radius:var(--radius);
}

/* ─── PROMO CHIP (on card image) ─────────── */
.card-chip {
  position:absolute; top:12px; left:12px; z-index:2;
  background:var(--red); color:#fff;
  font-size:.68rem; font-weight:700;
  padding:4px 10px; border-radius:6px;
  letter-spacing:.3px;
}
.card-chip.green { background:#2E7D32; }
.card-chip.blue  { background:#1565C0; }

/* ─── FOOTER ──────────────────────────────── */
footer {
  background:#1C1C2E; color:rgba(255,255,255,.65);
  text-align:center; padding:28px 24px;
  font-size:.8rem; line-height:1.8;
}
footer strong { color:#fff; font-weight:700; }

/* ─── SKELETON LOADER ─────────────────────── */
.skeleton {
  background:linear-gradient(90deg,#eee 25%,#f5f5f5 50%,#eee 75%);
  background-size:200% 100%;
  animation:skel 1.4s infinite;
  border-radius:var(--radius);
}
@keyframes skel { 0%{background-position:200%}100%{background-position:-200%} }
.skel-card { height:260px; }

/* ─── RESPONSIVE ──────────────────────────── */
@media (max-width:900px) {
  .hero-visual { display:none; }
  .hero-text h1 { font-size:2.2rem; }
  .nav-search { display:none; }
}
@media (max-width:600px) {
  .hero { padding:36px 16px 0; }
  .hero-text h1 { font-size:1.8rem; }
  .hero-text p { font-size:.85rem; }
  .content { padding:0 16px 60px; }
  .nav-inner { padding:0 16px; gap:12px; }
  .location { display:none; }
  .card-grid { grid-template-columns:1fr 1fr; gap:14px; }
  .offer-banner { width:280px; height:110px; }
}
@media (max-width:420px) {
  .card-grid { grid-template-columns:1fr; }
}
</style>
</head>
<body>

<!-- ══════════════════ NAVBAR ══════════════════ -->
<nav class="navbar">
  <div class="nav-inner">

    <div class="logo">Zio<em>Bite</em></div>

    <div class="location">
      <i class="fas fa-map-marker-alt pin"></i>
      <div>
        <span class="loc-label">Delivering to</span>
        <span class="loc-city">Anna Nagar &nbsp;<span class="chev">▾</span></span>
      </div>
    </div>

    <div class="nav-search">
      <i class="fas fa-search"></i>
      <input type="text" placeholder="Search restaurants, dishes...">
    </div>



<%
User user = (User)session.getAttribute("loggedUser");
%>

<div class="nav-right">

    <% if(user == null){ %>

        <a href="login.jsp" class="btn-login">
            Login
        </a>

        <a href="register.jsp" class="btn-signup">
            Sign Up
        </a>

    <% } else { %>

        <a href="profile.jsp" class="btn-login">
            👤 <%= user.getName() %>
        </a>

        <a href="LogoutServlet" class="btn-signup">
            Logout
        </a>

    <% } %>

    <a href="cart.jsp">

        <div class="cart-icon">

        <%
            Cart cart =
            (Cart)session.getAttribute("cart");

            int cartCount = 0;

            if(cart != null){
                cartCount = cart.getItems().size();
            }
        %>

            <i class="fas fa-shopping-bag"></i>

            <span class="cart-count">
                <%= cartCount %>
            </span>

        </div>

    </a>

</div>

  </div>
</nav>

<!-- ══════════════════ HERO ══════════════════ -->
<section class="hero">
  <div class="hero-inner">

    <div class="hero-text">
      <div class="hero-tag">
        <div class="dot"></div>
        500+ restaurants · Fast delivery
      </div>
      <h1>Hungry? We've<br>got you <em>covered.</em></h1>
      <p>Order your favourite food from top restaurants and get it delivered in minutes.</p>

      <div class="hero-search-bar">
        <input type="text" placeholder="Enter your delivery location...">
        <button><i class="fas fa-location-crosshairs"></i> &nbsp;Find Food</button>
      </div>

      <div class="hero-stats">
        <div class="hstat"><div class="val">500+</div><div class="lbl">Restaurants</div></div>
        <div class="hstat"><div class="val">30min</div><div class="lbl">Avg Delivery</div></div>
        <div class="hstat"><div class="val">50K+</div><div class="lbl">Happy Users</div></div>
      </div>
    </div>

    <div class="hero-visual">
      <img class="hero-food-img"
        src="https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?w=800&q=80"
        alt="Food">
      <div class="hero-badge">
        <div class="hb-num">⭐ 4.8</div>
        <div class="hb-txt">Top rated</div>
      </div>
    </div>

  </div>
</section>

<!-- ══════════════════ CONTENT ══════════════ -->


<div class="content">

 

  <!-- ── OFFERS ── -->
  <div class="sec-head">
    <h2>Deals for you 🔥</h2>
  </div>
  
  

  
  
  <div class="card-grid">

<%
           List<Restaurant> restaurants = (List<Restaurant>)request.getAttribute("restaurants");

      if(restaurants != null){

       for(Restaurant restaurant : restaurants){
%>
<a href="MenuServlet?restaurantId=<%= restaurant.getId() %>">
<div class="card">

    <div class="img-wrap">

        <img src="<%= restaurant.getImage() %>" 
             onerror="this.src='https://images.unsplash.com/photo-1571091718767-18b5b1457add?w=800'">

    </div>

    <div class="card-content">

        <div class="top-row">

            <h3><%= restaurant.getName() %></h3>

            <span class="rating">
                ⭐ <%= restaurant.getRating() %>
            </span>

        </div>

        <p class="cuisine">
            <%= restaurant.getCuisineType() %>
        </p>

        <div class="details">

            <span>
                📍 <%= restaurant.getAddress() %>
            </span>

            <span>
                ⏱ <%= restaurant.getDeliveryTime() %> mins
            </span>

        </div>

        <div class="offer">
            Combo Offers Available
        </div>

    </div>

</div>
</a>

<%
    }
}else{
%>

<h2>No Restaurants Found</h2>

<%
}
%>

</div>

  <!-- ── RESTAURANTS ── -->
  <div class="sec-head" style="margin-top:36px">
    <h2>Restaurants near you 🏆</h2>
    <span class="see-all">See all <i class="fas fa-chevron-right" style="font-size:.65rem"></i></span>
  </div>

  <!-- Filter tabs -->
  <div class="filter-tabs">
    <button class="ftab on" onclick="filterTab(this,'all')">All</button>
    <button class="ftab" onclick="filterTab(this,'fastest')"><i class="fas fa-bolt"></i> Fastest</button>
    <button class="ftab" onclick="filterTab(this,'rating')"><i class="fas fa-star"></i> Top Rated</button>
    <button class="ftab" onclick="filterTab(this,'offer')"><i class="fas fa-tag"></i> Offers</button>
    <button class="ftab" onclick="filterTab(this,'veg')"><i class="fas fa-leaf"></i> Pure Veg</button>
  </div>


</div>

<!-- ══════════════════ FOOTER ══════════════ -->
<footer>
  <strong>ZioBite</strong> · Fresh food, fast delivery<br>
  © 2026 ZioBite. All rights reserved.
</footer>


</body>
</html>
