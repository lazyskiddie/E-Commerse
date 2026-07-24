<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%-- Expects an "activePage" request-scoped variable set by the including page,
     e.g. <c:set var="activePage" value="shop" /> before this include. --%>

<div class="hours-strip">
  <div class="wrap">
    <span>Open today <strong>7:00 AM&nbsp;&ndash;&nbsp;6:00 PM</strong></span>
    <span class="dot">&middot;</span>
    <span>118 Kiln Street, Portland</span>
    <span class="dot">&middot;</span>
    <span>Order ahead for pickup</span>
  </div>
</div>

<header class="site-header">
  <div class="wrap">
    <a href="/index" class="logo">
      <span class="mark"></span>
      Ember &amp; Oak
    </a>

    <nav class="main-nav">
      <a href="/index" class="${activePage == 'home' ? 'active' : ''}">Home</a>
      <a href="/products" class="${activePage == 'shop' ? 'active' : ''}">Menu</a>
      <a href="/products?category=Brew+Gear" class="${activePage == 'gear' ? 'active' : ''}">Brew Gear</a>
      <a href="#footer-about" class="${activePage == 'about' ? 'active' : ''}">Visit</a>
    </nav>

    <div class="header-actions">
      <a href="login.jsp" class="icon-btn">Account</a>
      <a href="cart" class="icon-btn">Cart<span class="cart-count" id="cartCount">0</span></a>
      <a href="/checkout" class="icon-btn pickup-btn">Order Ahead</a>
    </div>
  </div>
</header>
