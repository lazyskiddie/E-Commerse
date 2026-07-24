<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:set var="activePage" value="home" />
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Ember &amp; Oak — Caf&eacute; &amp; Coffee Bar</title>
  <link rel="stylesheet" href="style.css">
</head>
<body>

<%@ include file="header.jsp" %>

<section class="hero">
  <div class="wrap">
    <div class="hero-copy">
      <span class="eyebrow">Brewing in Portland, since 2019</span>
      <h1>Coffee made the way you actually like it.</h1>
      <p class="lede">Every cup is pulled to order — espresso dialed in
        fresh, milk steamed to order, syrups made in-house — because
        coffee should taste like someone actually made it for you.</p>
      <div class="hero-actions">
        <a href="/products" class="btn btn-primary">Order ahead for pickup</a>
        <a href="/products" class="btn btn-outline">Browse the menu</a>
      </div>
      <div class="hero-tags">
        <span>Made to order</span>
        <span>Espresso pulled fresh</span>
        <span>Open 7 days a week</span>
      </div>
    </div>

    <div class="stamp-figure">
      <div class="lot-stamp">
        <div class="ring"></div>
        <div class="stamp-text">
          <span class="big">Est. 2019</span>
          EMBER&nbsp;&amp;&nbsp;OAK&nbsp;·&nbsp;PORTLAND<br>
          MADE&nbsp;FRESH&nbsp;DAILY
        </div>
      </div>
    </div>
  </div>
</section>

<section class="section">
  <div class="wrap">
    <div class="section-head">
      <div>
        <span class="eyebrow">Customer favorites</span>
        <h2>What's brewing today</h2>
      </div>
      <a href="/products" class="btn btn-outline">View all coffee</a>
    </div>

    <div class="menu-list" style="grid-template-columns:repeat(auto-fill, minmax(460px, 1fr)); gap:8px 48px;">
      <%-- Loop through the database records passed from the Controller --%>
      <c:forEach var="p" items="${listOfService}" begin="0" end="3">
        <div class="menu-item featured">
          <a href="/product?id=${p.id}" class="menu-item-media tone-1">
            <img src="/images/Services/${p.imageFileName}" alt="${p.name}">
          </a>
          <div class="menu-item-body">
            <div class="menu-item-head">
              <h3><a href="/product?id=${p.id}">${p.name}</a></h3>
              <span class="menu-leader"></span>
              <span class="price">₹${p.price}</span>
            </div>
            <p class="desc">${p.description}</p>
            <div class="menu-item-foot">
              <button class="add-btn" data-add-id="${p.id}"
                onclick="addToCart('${p.id}','${p.name}','${p.price}','tone-1','',1)">Add to cart</button>
            </div>
          </div>
        </div>
      </c:forEach>
    </div>
  </div>
</section>

<section class="section" style="background:var(--paper-dim);">
  <div class="wrap">
    <div class="section-head">
      <div>
        <span class="eyebrow">How it works</span>
        <h2>From order to cup</h2>
      </div>
    </div>
    <div class="product-grid" style="grid-template-columns:repeat(auto-fit, minmax(220px,1fr));">
      <div>
        <h3>Pulled to order</h3>
        <p class="desc">Every shot is pulled the moment you order — no
          batch-brewed coffee sitting around going flat.</p>
      </div>
      <div>
        <h3>Steamed fresh</h3>
        <p class="desc">Milk is steamed to order and textured just right,
          whether it's going into a latte, cappuccino, or cortado.</p>
      </div>
      <div>
        <h3>Made your way</h3>
        <p class="desc">Extra shot, oat milk, light ice — however you take
          your coffee, that's how we'll make it.</p>
      </div>
    </div>
  </div>
</section>

<section class="section visit-section">
  <div class="wrap">
    <div>
      <span class="eyebrow">Come sit with us</span>
      <h2>Visit the caf&eacute;</h2>
      <p class="lede" style="max-width:42ch;">Pull up a stool at the bar, or
        order ahead and swing by for pickup — either way, the espresso
        machine's always warm.</p>

      <table class="hours-table">
        <tr><td>Monday &ndash; Friday</td><td>7:00 AM &ndash; 6:00 PM</td></tr>
        <tr><td>Saturday</td><td>8:00 AM &ndash; 6:00 PM</td></tr>
        <tr><td>Sunday</td><td>8:00 AM &ndash; 3:00 PM</td></tr>
      </table>

      <div class="hero-actions">
        <a href="/products" class="btn btn-primary">Order ahead for pickup</a>
        <a href="#footer-about" class="btn btn-outline">Get directions</a>
      </div>
    </div>

    <div class="visit-figure">
      <div class="frame"></div>
      <div class="visit-text">
        <span class="eyebrow">118 Kiln Street</span><br>
        Portland, OR<br>Dine-in &amp; pickup
      </div>
    </div>
  </div>
</section>

<%@ include file="footer.jsp" %>

<script src="main.js"></script>
</body>
</html>