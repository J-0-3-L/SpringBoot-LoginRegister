<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" %> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %> <%@ taglib prefix="form"
uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Registration Page</title>
    <link rel="stylesheet" href="css/inicio.css" />
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
      <h2>REGISTER</h2>
      <p>
        <form:errors path="user.*" />
      </p>
      <form:form method="POST" action="/register" modelAttribute="user">
          <div class="form-group">
            <form:label path="email">Email:</form:label>
            <form:input type="email" path="email" class="form-control" />
          </div>
          <div class="form-group">
            <form:label path="password">Password:</form:label>
            <form:password path="password" class="form-control" />
          </div>
          <div class="form-group">
            <form:label path="passwordConfirmation" >Password Confirmation:</form:label>
            <form:password path="passwordConfirmation" class="form-control" />
          </div>
          <button type="submit" class="btn btn-primary">REGISTRARSE</button>
      </form:form>
    </div>
  </body>
</html>
