<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="activePage" value="checkout" />
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Checkout — Ember &amp; Oak</title>
  <link rel="stylesheet" href="style.css">
</head>
<body>

<%@ include file="header.jsp" %>

<div class="wrap">
  <div class="section-head" style="padding-top:44px; border-bottom:none;">
    <div>
      <span class="eyebrow step-label">Step 2 of 2</span>
      <h1 style="font-size:2.2rem;">Checkout</h1>
    </div>
  </div>

  <div class="checkout-layout">
    <form id="checkoutForm">
      <div class="auth-card" style="margin-bottom:24px;">
        <h3>Shipping address</h3>
        <div class="field-row">
          <div class="field">
            <label for="ckFirstName">First name</label>
            <input type="text" id="ckFirstName" required>
          </div>
          <div class="field">
            <label for="ckLastName">Last name</label>
            <input type="text" id="ckLastName" required>
          </div>
        </div>
        <div class="field">
          <label for="ckAddress">Street address</label>
          <input type="text" id="ckAddress" placeholder="118 Kiln Street" required>
        </div>
        <div class="field-row">
          <div class="field">
            <label for="ckCity">City</label>
            <input type="text" id="ckCity" required>
          </div>
          <div class="field">
            <label for="ckZip">ZIP / postal code</label>
            <input type="text" id="ckZip" required>
          </div>
        </div>
      </div>

      <div class="auth-card">
        <h3>Payment</h3>
        <p style="font-size:0.85rem;">Demo form only — no real payment is processed and no card data leaves this page.</p>
        <div class="field">
          <label for="ckCard">Card number</label>
          <input type="text" id="ckCard" placeholder="4242 4242 4242 4242" required>
        </div>
        <div class="field-row">
          <div class="field">
            <label for="ckExpiry">Expiry</label>
            <input type="text" id="ckExpiry" placeholder="MM / YY" required>
          </div>
          <div class="field">
            <label for="ckCvc">CVC</label>
            <input type="text" id="ckCvc" placeholder="123" required>
          </div>
        </div>
      </div>

      <button type="submit" class="btn btn-primary btn-block" style="margin-top:24px;">Place order</button>
    </form>

    <div class="summary-box">
      <h3>Order summary</h3>
      <div id="checkoutLines"></div>
      <div class="summary-row total">
        <span>Total</span>
        <span id="checkoutTotal">₹0.00</span>
      </div>
    </div>
  </div>

  <div id="orderConfirmation" class="empty-state" style="display:none;">
    <div class="glyph">&#9679;</div>
    <span class="eyebrow">Order placed</span>
    <h2>Thanks — it's roasting soon.</h2>
    <p>This is a frontend demo, so no order was actually sent anywhere, but
      in a live store you'd get a confirmation email with tracking here.</p>
    <a href="/products" class="btn btn-primary">Continue shopping</a>
  </div>
</div>

<%@ include file="footer.jsp" %>

<script src="main.js"></script>
</body>
</html>
