<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:set var="activePage" value="home" />
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Ember &amp; Oak — Small-lot coffee, honestly sourced</title>
  <link rel="stylesheet" href="style.css">
</head>
<body>

<%@ include file="header.jsp" %>

<section class="hero">
  <div class="wrap">
    <div class="hero-copy">
      <span class="eyebrow">Roasted in Portland, since 2019</span>
      <h1>Coffee you can trace back to the farm.</h1>
      <p class="lede">Every bag carries the lot number, the process, and the
        roast date stamped on the label — because knowing where a coffee
        came from changes how it tastes.</p>
      <div class="hero-actions">
        <a href="/products" class="btn btn-primary">Shop the current lots</a>
        <a href="/products" class="btn btn-outline">Browse brew gear</a>
      </div>
      <div class="hero-tags">
        <span>Direct trade</span>
        <span>Roasted weekly</span>
        <span>Shipped within 48hrs of roast</span>
      </div>
    </div>

    <div class="stamp-figure">
      <div class="lot-stamp">
        <div class="ring"></div>
        <div class="stamp-text">
          <span class="big">No. 214</span>
          LOT&nbsp;·&nbsp;HUILA&nbsp;COLOMBIA<br>
          ROASTED&nbsp;06.18.26
        </div>
      </div>
    </div>
  </div>
</section>

<section class="section">
  <div class="wrap">
    <div class="section-head">
      <div>
        <span class="eyebrow">This week's lots</span>
        <h2>Fresh off the roaster</h2>
      </div>
      <a href="/products" class="btn btn-outline">View all coffee</a>
    </div>

    <div class="product-grid">
      <%-- Loop through the database records passed from the Controller --%>
      <c:forEach var="p" items="${listOfService}" begin="0" end="3">
        <div class="card">
          <a href="/product?id=${p.id}">
            <div class="card-media tone-1">
              <img src="/images/Services/${p.imageFileName}" alt="${p.name}" style="width: 100%; height: 100%; object-fit: cover;">
            </div>
          </a>
          <div class="card-body">
            <h3><a href="/product?id=${p.id}">${p.name}</a></h3>
            <p class="desc">${p.description}</p>
            <div class="price-row">
              <div>
                <span class="price">₹${p.price}</span>
              </div>
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
        <h2>From cherry to cup</h2>
      </div>
    </div>
    <div class="product-grid" style="grid-template-columns:repeat(auto-fit, minmax(220px,1fr));">
      <div>
        <h3>Sourced direct</h3>
        <p class="desc">We buy each lot directly from the farm or a small
          collective, at a price set before the harvest — not the commodity
          rate.</p>
      </div>
      <div>
        <h3>Roasted in small batches</h3>
        <p class="desc">12kg drum, roasted twice a week. Every bag lists the
          exact roast date so you know how fresh it is.</p>
      </div>
      <div>
        <h3>Shipped fast</h3>
        <p class="desc">Bags go out within 48 hours of roasting, sealed with
          a one-way valve to lock in the aroma.</p>
      </div>
    </div>
  </div>
</section>

<%@ include file="footer.jsp" %>

<script src="main.js"></script>
</body>
</html>