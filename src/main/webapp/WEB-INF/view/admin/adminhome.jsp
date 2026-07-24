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

 <a href ="${pageContext.request.contextPath}/admin/addService"> Add Coffee </a>
 <a href ="${pageContext.request.contextPath}/admin/readService"> Read Service </a>

<%@ include file="../footer.jsp" %>
</body>
</html>
