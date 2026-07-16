<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:set var="activePage" value="shop" />

<%-- Find the product matching the ID in the URL --%>
<c:set var="found" value="false" />
<c:forEach var="p" items="${listOfService}">
  <c:if test="${p.id == param.id}">
    <c:set var="current" value="${p}" />
    <c:set var="found" value="true" />
  </c:if>
</c:forEach>
<c:if test="${found == 'false'}">
  <c:set var="current" value="${listOfService[0]}" />
</c:if>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>${current.name} — Ember &amp; Oak</title>
  <link rel="stylesheet" href="style.css">
</head>
<body>

<%@ include file="header.jsp" %>

<div class="wrap">
  <div class="pdp">
    <div class="pdp-media tone-1">
      <img src="/images/Services/${current.imageFileName}" alt="${current.name}" style="width: 100%; height: 100%; object-fit: cover;">
    </div>

    <div class="pdp-info">
      <h1 style="font-size:2.2rem;">${current.name}</h1>
      <p>${current.description}</p>

      <div class="pdp-price">
        ₹${current.price}
      </div>

      <div class="qty-row">
        <div class="qty-stepper">
          <button type="button" id="pdpQtyMinus" aria-label="Decrease quantity">&minus;</button>
          <input type="text" id="pdpQty" value="1" readonly aria-label="Quantity">
          <button type="button" id="pdpQtyPlus" aria-label="Increase quantity">+</button>
        </div>
        <button class="btn btn-primary" data-add-id="${current.id}"
          onclick="addToCart('${current.id}','${current.name}','${current.price}','tone-1','', parseInt(document.getElementById('pdpQty').value,10))">
          Add to cart
        </button>
      </div>
    </div>
  </div>

  <section class="section" style="padding-top:0;">
    <div class="section-head">
      <div>
        <span class="eyebrow">You might also like</span>
        <h2 style="font-size:1.6rem;">More from the shelf</h2>
      </div>
      <a href="/products" class="btn btn-outline">View all</a>
    </div>
    <div class="product-grid">
      <c:forEach var="p" items="${listOfService}" begin="0" end="2">
        <c:if test="${p.id != current.id}">
          <div class="card">
            <a href="/product?id=${p.id}">
              <div class="card-media tone-1">
                <img src="/images/Services/${p.imageFileName}" alt="${p.name}" style="width: 100%; height: 100%; object-fit: cover;">
              </div>
            </a>
            <div class="card-body">
              <h3><a href="/product?id=${p.id}">${p.name}</a></h3>
              <div class="price-row">
                <span class="price">₹${p.price}</span>
                <button class="add-btn" data-add-id="${p.id}"
                  onclick="addToCart('${p.id}','${p.name}','${p.price}','tone-1','',1)">Add to cart</button>
              </div>
            </div>
          </div>
        </c:if>
      </c:forEach>
    </div>
  </section>
</div>

<%@ include file="footer.jsp" %>
<script src="main.js"></script>
</body>
</html>