<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ include file="products-data.jspf" %>
<c:set var="activePage" value="shop" />

<%-- Find the product matching ?id=, default to the first if missing/unknown --%>
<c:set var="found" value="false" />
<c:forEach var="p" items="${productList}">
  <c:if test="${p[0] == param.id}">
    <c:set var="current" value="${p}" />
    <c:set var="found" value="true" />
  </c:if>
</c:forEach>
<c:if test="${found == 'false'}">
  <c:set var="current" value="${productList[0]}" />
</c:if>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>${current[1]} — Ember &amp; Oak</title>
  <link rel="stylesheet" href="style.css">
</head>
<body>

<%@ include file="header.jsp" %>

<div class="wrap">
  <div class="pdp">
    <div class="pdp-media ${current[9]}">
      <img src="${current[10]}" alt="${current[1]}" style="width: 100%; height: 100%; object-fit: cover;">
    </div>

    <div class="pdp-info">
      <c:if test="${not empty current[3]}"><div class="origin">${current[2]} &middot; ${current[3]}</div></c:if>
      <c:if test="${empty current[3]}"><div class="origin">${current[2]}</div></c:if>
      <h1 style="font-size:2.2rem;">${current[1]}</h1>
      <p>${current[11]}</p>

      <div class="pdp-price">
        <c:if test="${not empty current[8]}"><span class="price strike">₹${current[8]}</span></c:if>
        ₹${current[7]}
      </div>

      <div class="qty-row">
        <div class="qty-stepper">
          <button type="button" id="pdpQtyMinus" aria-label="Decrease quantity">&minus;</button>
          <input type="text" id="pdpQty" value="1" readonly aria-label="Quantity">
          <button type="button" id="pdpQtyPlus" aria-label="Increase quantity">+</button>
        </div>
        <button class="btn btn-primary" data-add-id="${current[0]}"
          onclick="addToCart('${current[0]}','${current[1]}','${current[7]}','${current[9]}','${current[10]}', parseInt(document.getElementById('pdpQty').value,10))">
          Add to cart
        </button>
      </div>

      <table class="spec-table">
        <c:if test="${not empty current[3]}">
          <tr><td>Origin</td><td>${current[3]}</td></tr>
        </c:if>
        <c:if test="${not empty current[4]}">
          <tr><td>Roast date</td><td>${current[4]}</td></tr>
        </c:if>
        <c:if test="${not empty current[5]}">
          <tr><td>Process</td><td>${current[5]}</td></tr>
        </c:if>
        <c:if test="${not empty current[6]}">
          <tr><td>Weight</td><td>${current[6]}g</td></tr>
        </c:if>
        <tr><td>Category</td><td>${current[2]}</td></tr>
      </table>
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
      <c:forEach var="p" items="${productList}" begin="0" end="2">
        <c:if test="${p[0] != current[0]}">
          <div class="card">
            <a href="/product?id=${p[0]}">
              <div class="card-media ${p[9]}">
              <img src="${p[10]}" alt="${p[1]}" style="width: 100%; height: 100%; object-fit: cover;">
            </a>
            <div class="card-body">
              <h3><a href="/product?id=${p[0]}">${p[1]}</a></h3>
              <div class="price-row">
                <span class="price">₹${p[7]}</span>
                <button class="add-btn" data-add-id="${p[0]}"
                  onclick="addToCart('${p[0]}','${p[1]}','${p[7]}','${p[9]}','${p[10]}',1)">Add to cart</button>
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
