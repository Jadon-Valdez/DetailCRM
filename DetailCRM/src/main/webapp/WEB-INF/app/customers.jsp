<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page isErrorPage="true"%>
<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">
<head>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Hind:wght@500&family=Red+Hat+Mono:wght@300&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
<link rel="stylesheet" href="/customers.css">
<script src="/webjars/jquery/jquery.min.js"></script>
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body style="background-color: #C4C4C4">
	<nav class="navbar navbar-expand-lg fixed-top"
		style="background-color: #071227;">
		<a href="/home" id="detail" class="navbar-brand font-weight-bold"
			style="color: white;">DetailCRM</a>
		<div id="navItems" class="collapse navbar-collapse">
			<ul class="navbar-nav">
				<li class="nav-item"><a href="/customers" class="nav-link">Customers</a></li>
				<li class="nav-item"><a href="/customer/new" class="nav-link">New
						Customer</a></li>
				<li class="nav-item"><a href="/logout" class="nav-link">Logout</a>
				</li>
			</ul>
		</div>
	</nav>
	<h1>All Customers</h1>
	<div class="container" id="search">
		<form th:action="@{/customers}" style="margin-right: 200px;"
			>
			<div class="input-group mb-1">
				<input type="text" name="keyword" id="keyword" size="50"
					th:value="${keyword}" placeholder="Work in progress"
					class="form-control" required /> &nbsp;
				<div class="input-group-append">
					<button class="btn btn-outline-secondary" type="button">
						<a href="/customers">Clear</a>
					</button>
				</div>
			</div>
		</form>
	</div>
	<div class="customerBox">
		<c:forEach items="${customers}" var="customer">
			<div class="customers">
				<div class="item">
					<p>${customer.firstname} ${customer.lastname}</p>
				</div>
				<div class="button">
					<form action="/customer/${customer.id}">
						<input type="submit" value="View/Edit/Schedule"
							class="btn btn-primary">
					</form>
				</div>
			</div>
		</c:forEach>
	</div>
</body>
</html>