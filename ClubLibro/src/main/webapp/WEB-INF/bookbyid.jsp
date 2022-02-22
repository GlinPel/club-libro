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
	<title>${ book.titulo }</title>
	<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
	<script src="/webjars/jquery/jquery.min.js"></script>
	<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container">
		<div class="row mt-5">
			<div class="col-6">
				<h1 class="text-info">${ book.titulo }</h1>
			</div>
			<div class="col-6">
				<div class="col-12 d-flex flex-row-reverse">
					<a href="/books" class="btn btn-primary">Back to the shelves</a><br>
				</div>
			</div>
		</div>
		<div class="row mt-5">
			<div class="col-6">
				<h2>
					<c:choose>
					    <c:when test="${ book.user.userName.equals(user.userName)}">You</c:when>    
					    <c:otherwise>
					    	<span class="text-danger"><c:out value="${ book.user.userName}"/></span>
					    </c:otherwise>
					</c:choose> read 
					<span class="text-info"><c:out value="${ book.titulo }" /></span> by 
					<span class="text-success"><c:out value="${ book.author }" /></span>
				</h2>
				<div class="card mt-4">
				  <div class="card-header p-4">
				  	<h4>Here are
						<c:choose>
						    <c:when test="${ book.user.userName.equals(user.userName)}">your</c:when>    
						    <c:otherwise>
						    	<c:out value="${ book.user.userName}"/>'s
						    </c:otherwise>
						</c:choose>
						thoughts
					</h4>
				  </div>
				  <div class="card-body p-4">
				    <p>${ book.thought}</p>
				  </div>
				</div>
			</div>
		</div>
		<c:if test="${ book.user.email.equals(user.email)}">
			<div class="row mt-5">
				<div class="col-12">
					<a href="/books/${ book.id }/edit" class="btn btn-primary">Edit book</a>
				</div>
			</div>
		</c:if>
	</div>
</body>
</html>