<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.Date" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Welcome to My JSP Application</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card shadow">
                    <div class="card-header bg-primary text-white text-center">
                        <h1>Welcome to My JSP Page</h1>
                    </div>
                    <div class="card-body text-center">
                        <p class="lead">This is a standard template for your <code>index.jsp</code> file.</p>

                        <hr>

                        <div class="alert alert-info" role="alert">
                            <h4 class="alert-heading">Server Time Info</h4>
                            <p class="mb-0">
                                Current Server Time: <strong><%= new Date() %></strong>
                            </p>
                        </div>

                        <p class="text-muted small">
                            Context Path: <code>${pageContext.request.contextPath}</code>
                        </p>

                        <div class="mt-4">
                            <a href="#" class="btn btn-primary">Learn More</a>
                            <a href="#" class="btn btn-outline-secondary">Contact Us</a>
                        </div>
                    </div>
                    <div class="card-footer text-muted text-center py-3">
                        &copy; <%= new java.util.GregorianCalendar().get(java.util.Calendar.YEAR) %> My Web Application
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>