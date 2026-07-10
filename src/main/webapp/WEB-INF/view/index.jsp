<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.Date" %>
<%@ include file="header.jsp" %>

<h2>Featured Products</h2>

<div class="product-grid">

    <div class="product-card">
        <img src="https://via.placeholder.com/250x200?text=Laptop" alt="Gaming Laptop">
        <h3 class="product-title">Pro Gaming Laptop</h3>
        <p class="price">₹1,29900.00</p>
        <button class="add-to-cart-btn">Add to Cart</button>
    </div>

    <div class="product-card">
        <img src="https://via.placeholder.com/250x200?text=Headphones" alt="Wireless Headphones">
        <h3 class="product-title">Noise Cancelling Headphones</h3>
        <p class="price">₹11999.99</p>
        <button class="add-to-cart-btn">Add to Cart</button>
    </div>

    <div class="product-card">
        <img src="https://via.placeholder.com/250x200?text=Smartwatch" alt="Smartwatch">
        <h3 class="product-title">Fitness Smartwatch</h3>
        <p class="price">₹9490.50</p>
        <button class="add-to-cart-btn">Add to Cart</button>
    </div>

    <div class="product-card">
        <img src="https://via.placeholder.com/250x200?text=Mechanical+Keyboard" alt="Keyboard">
        <h3 class="product-title">Mechanical Keyboard</h3>
        <p class="price">₹899.99</p>
        <button class="add-to-cart-btn">Add to Cart</button>
    </div>

</div>

<%@ include file="footer.jsp" %>