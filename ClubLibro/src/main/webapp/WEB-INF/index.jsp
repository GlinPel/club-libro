<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- c:out ; c:forEach etc. --> 
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- Formato (fechas) --> 
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- form:form -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- para errores de renderizado en rutas PUT -->
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Registro / Login</title>
	<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
	<script src="/webjars/jquery/jquery.min.js"></script>
	<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container">
		<div class="row mt-5">
			<div class="col-12">
				<h1 class="text-info">Book club</h1>
				<h4>A place for friends to share thoughts on books.</h4>
			</div>
		</div>
		<div class="row mt-3">
			<div class="col-6 p-5">
				<h2>Register</h2>
				<form:form action="/register" method="post" modelAttribute="newUser" class="mt-4">
					<div class="mb-4 row">
						<div class="col-6">
							<h5><form:label path="userName">User Name:</form:label></h5>
						</div>
						<div class="col-6">
							<form:input path="userName" class="form-control"/>
						</div>
						<div class="col-12">
							<p class="text-danger"><form:errors path="userName"/></p>
						</div>
					</div>
					<div class="mb-4 row">
						<div class="col-6">
							<h5><form:label path="email">Email:</form:label></h5>
						</div>
						<div class="col-6">
							<form:input type="email" path="email" class="form-control"/>
						</div>
						<div class="col-12">
							<p class="text-danger"><form:errors path="email"/></p>
						</div>
					</div>
					<div class="mb-4 row">
						<div class="col-6">
							<h5><form:label path="password">Password:</form:label></h5>
						</div>
						<div class="col-6">
							<form:input type="password" path="password" class="form-control"/>
						</div>
						<div class="col-12">
							<p class="text-danger"><form:errors path="password"/></p>
						</div>
					</div>
					<div class="mb-4 row">
						<div class="col-6">
							<h5><form:label path="confirm">Confirm Password:</form:label></h5>
						</div>
						<div class="col-6">
							<form:input type="password" path="confirm" class="form-control"/>
						</div>
						<div class="col-12">
							<p class="text-danger"><form:errors path="confirm"/></p>
						</div>
					</div>
					<div class="d-flex flex-row-reverse">
					  <input type="submit" value="Submit" class="btn btn-primary btn-lg"/>
					</div>
				    
				</form:form>    
			</div>
			<div class="col-6 p-5">
				<h2>Log In</h2>
				<form:form action="/login" method="post" modelAttribute="newLogin" class="mt-4">
					<div class="mb-4 row">
						<div class="col-6">
							<h5><form:label path="email">Email:</form:label></h5>
						</div>
						<div class="col-6">
							<form:input path="email" class="form-control"/>
						</div>
						<div class="col-12">
							<p class="text-danger"><form:errors path="email"/></p>
						</div>
					</div>
					<div class="mb-4 row">
						<div class="col-6">
							<h5><form:label path="password">Password:</form:label></h5>
						</div>
						<div class="col-6">
							<form:input type="password" path="password" class="form-control"/>
						</div>
						<div class="col-12">
							<p class="text-danger"><form:errors path="password"/></p>
						</div>
					</div>
				    <div class="d-flex flex-row-reverse">
					  <input type="submit" value="Submit" class="btn btn-primary btn-lg"/>
					</div>
				</form:form>
			</div>
		</div>
	</div>
</body>
</html>