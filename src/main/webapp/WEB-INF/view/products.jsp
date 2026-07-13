<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ include file="products-data.jspf" %>
<c:set var="selectedCategory" value="${param.category}" />
<c:set var="activePage" value="${selectedCategory == 'Brew Gear' ? 'gear' : 'shop'}" />
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Shop All Coffee &amp; Brew Gear — Ember &amp; Oak</title>
  <link rel="stylesheet" href="style.css">
</head>
<body>

<%@ include file="header.jsp" %>

<section class="section" style="padding-top:44px;">
  <div class="wrap">
    <div class="section-head" style="border-bottom:none; padding-bottom:0;">
      <div>
        <span class="eyebrow">The full catalog</span>
        <h1 style="font-size:2.4rem;">Shop</h1>
      </div>
    </div>

    <div class="filter-bar">
      <button class="filter-chip ${empty selectedCategory ? 'active' : ''}" data-category="all">All</button>
      <button class="filter-chip ${selectedCategory == 'Espresso Bar' ? 'active' : ''}" data-category="Espresso Bar">Espresso Bar</button>
      <button class="filter-chip ${selectedCategory == 'Cold Beverage' ? 'active' : ''}" data-category="Cold Beverage">Cold Beverage</button>
      <button class="filter-chip ${selectedCategory == 'Filter Coffee' ? 'active' : ''}" data-category="Filter Coffee">Filter Coffee</button>
    </div>

    <div class="product-grid">
      <c:forEach var="p" items="${productList}">
        <c:if test="${empty selectedCategory || selectedCategory == p[2]}">
          <c:set var="id" value="${p[0]}" />
          <div class="card">
            <a href="/product?id=${id}">
              <div class="card-media ${p[9]}">
                <img src="${p[10]}" alt="${p[1]}" style="width: 100%; height: 100%; object-fit: cover;">
                <c:if test="${not empty p[4]}">
                  <div class="badge">${p[3]}<br>${p[4]}</div>
                </c:if>
              </div>
            </a>
            <div class="card-body">
              <div class="origin">${p[2]}<c:if test="${not empty p[3]}"> &middot; ${p[3]}</c:if></div>
              <h3><a href="/product?id=${id}">${p[1]}</a></h3>
              <p class="desc">${p[11]}</p>
              <div class="price-row">
                <div>
                  <c:if test="${not empty p[8]}"><span class="price strike">₹${p[8]}</span></c:if>
                  <span class="price">₹${p[7]}</span>
                </div>
                <button class="add-btn" data-add-id="${id}"
                  onclick="addToCart('${id}','${p[1]}','${p[7]}','${p[9]}','${p[10]}',1)">Add to cart</button>
              </div>
            </div>
          </div>
        </c:if>
      </c:forEach>
    </div>
  </div>
</section>

<%@ include file="footer.jsp" %>

<script src="main.js"></script>
</body>
</html>
