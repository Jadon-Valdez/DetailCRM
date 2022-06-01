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
<link rel="stylesheet" href="/dashboard.css">
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
	<div class="welcome">
		<div>
			<h1>Welcome ${name}</h1>
		</div>
		<div class="info">
			<p>You have scheduled ${appointments.size()} appointments</p>
		</div>
		<div>
			<p class="info">Your net sales this week are $1569</p>
		</div>
	</div>
	<div>
		<h3>Appointments Today</h3>
	</div>
	<div class="appointments">
		<c:forEach items="${appointments}" var="appointment">
			<c:if test="${date == appointment.date}">
				<table class="table">
					<thead class="thead-dark">
						<tr>
							<th>Time</th>
							<th>Customer</th>
							<th>Car</th>
							<th>Service</th>
							<th>Price</th>
							<th>Actions</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>${appointment.time}</td>
							<td><a href="/customer/${appointment.customer.id}">
									${appointment.customer.getFirstname()}
									${appointment.customer.getLastname()} </a></td>
							<td>${appointment.customer.getMake()}
								${appointment.customer.getModel()}</td>
							<td>${appointment.service}</td>
							<td>$${appointment.price}</td>
							<td>
								<form action="/appointment/${appointment.id}/edit">
									<button class="btn btn-primary">
										<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil" viewBox="0 0 16 16">
  											<path d="M12.146.146a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1 0 .708l-10 10a.5.5 0 0 1-.168.11l-5 2a.5.5 0 0 1-.65-.65l2-5a.5.5 0 0 1 .11-.168l10-10zM11.207 2.5 13.5 4.793 14.793 3.5 12.5 1.207 11.207 2.5zm1.586 3L10.5 3.207 4 9.707V10h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.293l6.5-6.5zm-9.761 5.175-.106.106-1.528 3.821 3.821-1.528.106-.106A.5.5 0 0 1 5 12.5V12h-.5a.5.5 0 0 1-.5-.5V11h-.5a.5.5 0 0 1-.468-.325z"/>
										</svg>
									</button>
								</form>
							</td>
						</tr>
					</tbody>
				</table>
			</c:if>
		</c:forEach>
	</div>
</body>
</html>