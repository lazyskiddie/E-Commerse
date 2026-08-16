<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:set var="activePage" value="admin" />
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Admin — Ember &amp; Oak</title>
  <link rel="stylesheet" href="../style.css">
  <style>
      /* Container for all services */
      .services-container {
          display: flex;
          flex-wrap: wrap;
          gap: 24px;
          justify-content: center;
          padding: 20px;
          font-family: Arial, sans-serif;
      }

      /* Individual Card Styling */
      .service-card {
          background-color: #ffffff;
          border-radius: 10px;
          box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
          overflow: hidden;
          width: 300px;
          display: flex;
          flex-direction: column;
          transition: transform 0.2s ease, box-shadow 0.2s ease;
      }

      .service-card:hover {
          transform: translateY(-5px);
          box-shadow: 0 8px 15px rgba(0, 0, 0, 0.15);
      }

      /* Standardizing the image size */
      .service-image {
          width: 100%;
          height: 200px;
          object-fit: cover; /* Ensures images don't stretch weirdly */
          border-bottom: 1px solid #eee;
      }

      /* Padding and spacing inside the card */
      .service-content {
          padding: 20px;
          display: flex;
          flex-direction: column;
          flex-grow: 1; /* Pushes the buttons to the bottom */
      }

      .service-title {
          margin: 0 0 10px 0;
          font-size: 1.3rem;
          color: #333;
      }

      .service-desc {
          color: #666;
          font-size: 0.95rem;
          line-height: 1.5;
          margin-bottom: 15px;
          flex-grow: 1;
      }

      .service-price {
          font-size: 1.2rem;
          color: #000000;
          margin: 0 0 20px 0;
      }

      /* Button Layout */
      .service-actions {
          display: flex;
          gap: 10px;
      }

      /* Generic Button Styling */
      .btn {
          flex: 1;
          padding: 10px;
          text-align: center;
          text-decoration: none;
          border-radius: 5px;
          font-weight: bold;
          color: #fff;
          transition: background-color 0.2s ease;
      }

      /* Specific Button Colors */
      .btn-update {
          background-color: #3498db;
      }

      .btn-update:hover {
          background-color: #2980b9;
      }

      .btn-delete {
          background-color: #e74c3c;
      }

      .btn-delete:hover {
          background-color: #c0392b;
      }
  </style>
</head>
<body>

<%@ include file="../header.jsp" %>
<h1 style="text-align: center;">Admin Panel</h1>

 <h3 style="text-align: center;"> Available Coffee </h3>
 <a href ="${pageContext.request.contextPath}/admin/adminhome"> Admin Home </a>


 <div class="services-container">
     <c:forEach var="current" items="${listOfServices}">

         <div class="service-card">
             <!-- Image -->
             <img class="service-image"
                  src="/images/Services/${current.imageFileName}"
                  alt="${current.name} Image" />

             <!-- Content -->
             <div class="service-content">
                 <h4 class="service-title">${current.name}</h4>
                 <p class="service-desc">${current.description}</p>
                 <h4 class="service-price">₹${current.price}</h4>

                 <!-- Action Buttons -->
                 <div class="service-actions">
                     <a class="btn btn-update"
                        href="${pageContext.request.contextPath}/admin/updateCoffee?id=${current.id}&fileName=${current.imageFileName}">
                        Update
                     </a>

                     <a class="btn btn-delete"
                        href="${pageContext.request.contextPath}/admin/deleteCoffee?id=${current.id}&fileName=${current.imageFileName}">
                        Delete
                     </a>
                 </div>
             </div>
         </div>

     </c:forEach>
 </div>

<%@ include file="../footer.jsp" %>
</body>
</html>
