<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ include file="products-data.jspf" %>
<c:set var="activePage" value="admin" />
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Admin — Ember &amp; Oak</title>
  <link rel="stylesheet" href="style.css">
</head>
<body>

<%@ include file="header.jsp" %>
<h1 style="text-align: center;">Admin Panel</h1>

 ${message}

<h3 style="text-align: center;">Add Product</h3>
<form action ="/saveCoffee" method ="post" style="width: 400px; margin: 20px auto; background-color: #4B0082; padding: 20px; border: 1px solid #ccc; border-radius: 8px;">

    <label for="name" style="color: white;">Product Name:</label><br>
    <input type="text" id="name" name="name" placeholder="Enter product name"
           style="width: 100%; padding: 8px; margin: 8px 0 15px;"><br>

    <label for="price" style="color: white;">Price:</label><br>
    <input type="number" id="price" name="price" placeholder="Enter price"
           style="width: 100%; padding: 8px; margin: 8px 0 15px;"><br>

    <label for="description" style="color: white;">Description:</label><br>
    <textarea id="description" name="description" rows="4"
              placeholder="Enter product description"
              style="width: 100%; padding: 8px; margin: 8px 0 15px;"></textarea><br>

    <button type="submit"
            style="width: 100%; padding: 10px; background-color: #28a745; color: white; border: none; border-radius: 5px; cursor: pointer;">
        Add Product
    </button>

</form>

<%@ include file="footer.jsp" %>
</body>
</html>
