<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ include file="../products-data.jspf" %>
<c:set var="activePage" value="admin" />
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Admin — Ember &amp; Oak</title>
  <link rel="stylesheet" href="../style.css">
</head>
<body>

<%@ include file="../header.jsp" %>
<h1 style="text-align: center;">Admin Panel</h1>

 <h3> Available Coffee </h3>

 <c:forEach var="current" items="${listOfServices}">
     <img style="width: 300px; height:auto;"
          src="/images/Services/${current.imageFileName}" />
     <h4> ${current.name} </h4>
     <p> ${current.description} </p>
     <h4> ${current.price} </h4>
  </c:forEach>

<%@ include file="../footer.jsp" %>
</body>
</html>
