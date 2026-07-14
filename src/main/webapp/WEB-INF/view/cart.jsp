<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="activePage" value="cart" />
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Your Cart — Ember &amp; Oak</title>
  <link rel="stylesheet" href="style.css">
</head>
<body>

<%@ include file="header.jsp" %>

<div class="wrap">
  <div class="section-head" style="padding-top:44px; border-bottom:none;">
    <div>
      <span class="eyebrow">Step 1 of 2</span>
      <h1 style="font-size:2.2rem;">Your cart</h1>
    </div>
  </div>

  <div class="cart-layout">
    <div>
      <div id="cartLines"></div>
      <div id="emptyCart" class="empty-state" style="display:none;">
        <div class="glyph">&#9711;</div>
        <h3>Your cart is empty</h3>
        <p>Looks like you haven't added any lots yet.</p>
        <a href="/products" class="btn btn-primary">Browse the shop</a>
      </div>
    </div>

    <div class="summary-box" id="cartSummary">
      <h3>Order summary</h3>
      <div class="summary-row">
        <span>Subtotal</span>
        <span id="sumSubtotal">₹0.00</span>
      </div>
      <div class="summary-row">
        <span>Shipping</span>
        <span id="sumShipping">₹0.00</span>
      </div>
      <div class="summary-row total">
        <span>Total</span>
        <span id="sumTotal">₹0.00</span>
      </div>
      <p style="font-size:0.8rem; margin-top:10px;">Free shipping on orders over ₹50.</p>
      <a href="/checkout" class="btn btn-primary btn-block" style="margin-top:16px;">Proceed to checkout</a>
    </div>
  </div>
</div>

<%@ include file="footer.jsp" %>

<script src="main.js"></script>
</body>
</html>
