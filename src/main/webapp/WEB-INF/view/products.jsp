<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:set var="activePage" value="shop" />
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Shop All Coffee — Ember &amp; Oak</title>
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

    <div class="product-grid">
      <%-- Loop through the database records! --%>
      <c:forEach var="p" items="${listOfService}">
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

<%@ include file="footer.jsp" %>
<script src="main.js"></script>
</body>
</html>