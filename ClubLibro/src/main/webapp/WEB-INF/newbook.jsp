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
	<title>New book</title>
	<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
	<script src="/webjars/jquery/jquery.min.js"></script>
	<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container">
		<div class="row mt-5">
			<div class="col-6">
				<h1>Add a book to your shelf!</h1>
			</div>
			<div class="col-6">
				<div class="col-12 d-flex flex-row-reverse">
					<a href="/books" class="btn btn-primary">Back to the shelves</a><br>
				</div>
			</div>
		</div>
		<div class="row mt-3">
			<div class="col-6 p-5">
				<h2>Register</h2>
				<form:form action="/books/create" method="post" modelAttribute="newBook" class="mt-4">
					<div class="mb-4 row">
						<div class="col-6">
							<h5><form:label path="titulo">Title:</form:label></h5>
						</div>
						<div class="col-6">
							<form:input path="titulo" class="form-control"/>
						</div>
						<div class="col-12">
							<p class="text-danger"><form:errors path="titulo"/></p>
						</div>
					</div>
					<div class="mb-4 row">
						<div class="col-6">
							<h5><form:label path="author">Author:</form:label></h5>
						</div>
						<div class="col-6">
							<form:input path="author" class="form-control"/>
						</div>
						<div class="col-12">
							<p class="text-danger"><form:errors path="author"/></p>
						</div>
					</div>
					<div class="mb-4 row">
						<div class="col-6">
							<h5><form:label path="thought">My thoughts:</form:label></h5>
						</div>
						<div class="col-6">
							<form:textarea path="thought" class="form-control"/>
						</div>
						<div class="col-12">
							<p class="text-danger"><form:errors path="thought"/></p>
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