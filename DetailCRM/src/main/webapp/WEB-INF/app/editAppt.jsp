<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page isErrorPage="true"%>
<!DOCTYPE html>
<html>
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
<link rel="stylesheet" href="/editAppt.css">
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
	<div id="title" class="container">
		<h1>Edit ${appointment.customer.firstname}'s Appointment</h1>
	</div>
	<div id="form" class="container">
		<form:form action="/appointment/${appointment.id}" method="post"
			modelAttribute="appointment">
			<input type="hidden" name="_method" value="put">
			<div class="form-group">
				<label>Date :</label>
				<form:input path="date" class="form-control" type="date" />
				<form:errors path="date" class="text-danger" />
			</div>
			<div class="form-group">
				<label>Time :</label>
				<form:input path="time" class="form-control" type="time" />
				<form:errors path="time" class="text-danger" />
			</div>
			<div class="form-group">
				<label>Service :</label>
				<form:input path="service" class="form-control" />
				<form:errors path="service" class="text-danger" />
			</div>
			<div class="form-group">
				<label>Price :</label>
				<form:input path="price" class="form-control" />
				<form:errors path="price" class="text-danger" />
			</div>
			<div class="form-group" id="hide">
				<label>Customer :</label>
				<form:input path="customer" class="form-control"/>
				<form:errors path="customer" class="text-danger" />
			</div>
			<input type="submit" value="Submit" class="btn btn-primary"/>
		</form:form>
	</div>
</body>
</html>