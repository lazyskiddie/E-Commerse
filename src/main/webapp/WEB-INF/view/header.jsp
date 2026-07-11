<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%-- Expects an "activePage" request-scoped variable set by the including page,
     e.g. <c:set var="activePage" value="shop" /> before this include. --%>
<header class="site-header">
  <div class="wrap">
    <a href="index.jsp" class="logo">
      <span class="mark"></span>
      Ember &amp; Oak
    </a>

    <nav class="main-nav">
      <a href="index.jsp" class="${activePage == 'home' ? 'active' : ''}">Home</a>
      <a href="products.jsp" class="${activePage == 'shop' ? 'active' : ''}">Shop</a>
      <a href="products.jsp?category=Brew+Gear" class="${activePage == 'gear' ? 'active' : ''}">Brew Gear</a>
      <a href="#footer-about" class="${activePage == 'about' ? 'active' : ''}">About</a>
    </nav>

    <div class="header-actions">
      <a href="login.jsp" class="icon-btn">Account</a>
      <a href="cart.jsp" class="icon-btn">Cart<span class="cart-count" id="cartCount">0</span></a>
    </div>
  </div>
</header>
