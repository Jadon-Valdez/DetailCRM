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
<link rel="stylesheet" href="/oneCustomer.css">
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
	<div class="top">
		<div class="customerInfo">
			<h1 class="name">${customer.firstname} ${customer.lastname}</h1>
			<p>${customer.phone}</p>
			<p>${customer.make} ${customer.model}</p>
			<p>${customer.address}</p>
			<a href="/customer/${customer.id}/edit">Edit</a>
		</div>
		<div class="appointmentForm">
			<form:form action="/new/appointment/${customer.id}" method="post"
				modelAttribute="newAppointment" enctype="multipart/form-data">
				<div class="form-group">
					<p class="schedule">Schedule ${customer.firstname} an
						appointment</p>
				</div>
				<div class="form-group">
					<label>Date: </label>
					<form:input path="date" class="form-control" type="date" />
					<form:errors path="date" class="text-danger" />
				</div>
				<div class="form-group">
					<label>Time: </label>
					<form:input path="time" class="form-control" type="time" />
					<form:errors path="time" class="text-danger" />
				</div>
				<div class="form-group">
					<label>Service: </label>
					<form:input path="service" class="form-control" />
					<form:errors path="service" class="text-danger" />
				</div>
				<div class="form-group">
					<label>Price: </label>
					<form:input path="price" class="form-control" type="number" />
					<form:errors path="price" class="text-danger" />
				</div>
				<input class="submit" type="submit" value="Submit" />
			</form:form>
		</div>
	</div>
	<div class="upcoming">
		<p class="text">Appointments</p>
	</div>
	<table class="table">
		<thead class="thead-dark">
			<tr>
				<th>Date</th>
				<th>Time</th>
				<th>Service</th>
				<th>Price</th>
				<th>Actions</th>
			</tr>
		</thead>
		<c:forEach items="${getAppointment}" var="appointment">
			<tbody>
				<tr>
					<td><fmt:formatDate value="${appointment.date}"
							pattern="E MMMM dd yyyy" /></td>
					<td>${appointment.time}</td>
					<td>${appointment.service}</td>
					<td>$${appointment.price}</td>
					<td>
						<div class="buttons">
							<form action="/appointment/${appointment.id}/edit">
								<button class="btn btn-primary">
									<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil" viewBox="0 0 16 16">
  										<path d="M12.146.146a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1 0 .708l-10 10a.5.5 0 0 1-.168.11l-5 2a.5.5 0 0 1-.65-.65l2-5a.5.5 0 0 1 .11-.168l10-10zM11.207 2.5 13.5 4.793 14.793 3.5 12.5 1.207 11.207 2.5zm1.586 3L10.5 3.207 4 9.707V10h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.293l6.5-6.5zm-9.761 5.175-.106.106-1.528 3.821 3.821-1.528.106-.106A.5.5 0 0 1 5 12.5V12h-.5a.5.5 0 0 1-.5-.5V11h-.5a.5.5 0 0 1-.468-.325z"/>
									</svg>
								</button>
							</form>
							<form action="/appointment/${appointment.id}/delete" method="post">
								<input type="hidden" name="_method" value="delete" style="">
								<button class="btn btn-danger" id="delete">
									<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash" viewBox="0 0 16 16">
  										<path d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6z"/>
  										<path fill-rule="evenodd" d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1zM4.118 4 4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118zM2.5 3V2h11v1h-11z"/>
									</svg>
								</button>
							</form>
						</div>
					</td>
				</tr>
			</tbody>
		</c:forEach>
	</table>
</body>
</html>