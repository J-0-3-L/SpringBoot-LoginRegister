<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Project Manager</title>
    <link rel="stylesheet" href="css/inicio.css">
    <link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
    />
</head>
<body>
  <nav class="navbar navbar-expand-lg navbar-light bg-light">
    <a class="navbar-brand" href="<c:url value='/' />">Inicio</a>
  </nav>
      <div class="cus-container">
        <h2>LOG IN</h2>
        <p>
          <c:out value="${error}" />
        </p>
        <form method="post" action="/login">
          <div class="form-group">
            <label for="email">Email</label>
            <input type="text"class="form-control" id="email" name="email" placeholder="Ingresa tu email">
          </div>
          <div class="form-group">
            <label for="password">Password:</label>
            <input type="password"class="form-control" id="password" name="password" placeholder="Ingresa tu contraseña">
          </div>
          <button type="submit" class="btn btn-primary">Login</button>
        </form>
      </div>
    </div>
</body>
</html>