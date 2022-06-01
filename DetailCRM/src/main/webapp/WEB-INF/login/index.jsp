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
<link
	href="https://fonts.googleapis.com/css2?family=Hind:wght@300&family=Red+Hat+Mono:wght@300&display=swap"
	rel="stylesheet">
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
<link rel="stylesheet" href="/index.css">
<script src="/webjars/jquery/jquery.min.js"></script>

<title>Welcome to CRM</title>
</head>
<body style="background-color: #C4C4C4">
	<div class="header">
		<h1 class="welcome">Welcome to DetailCRM</h1>
		<img class="headerPhoto"
			src="https://cdn2.howtostartanllc.com/images/business-ideas/business-idea-images/Car-Detailing-Business.jpg" />
	</div>
	<div class="">
		<div class="info">
			<div>
				<p>Easily manage and track all of your customers</p>
			</div>
			<div>
				<p>Get insights about how your business is doing</p>
			</div>
			<div>
				<p>Engage and connect with customers</p>
			</div>
		</div>
		<div style="padding-left: 150px; padding-right: 150px;"
			class="registerBox">
			<form:form action="/register" method="post" modelAttribute="newUser">
				<h3>Register</h3>
				<div class="form-group mt-4">
					<label>Username</label>
					<form:input path="userName" class="form-control"
						style="border-top: 0px; border-left: 0px; border-right: 0px;" />
					<form:errors path="userName" class="text-danger" />
				</div>
				<div class="form-group mt-3">
					<label>Email</label>
					<form:input path="email" class="form-control"
						style="border-top: 0px; border-left: 0px; border-right: 0px;" />
					<form:errors path="email" class="text-danger" />
				</div>
				<div class="form-group mt-3">
					<label>Password</label>
					<form:password path="password" class="form-control"
						style="border-top: 0px; border-left: 0px; border-right: 0px;" />
					<form:errors path="password" class="text-danger" />
				</div>
				<div class="form-group mt-3">
					<label>Confirm Password</label>
					<form:password path="confirm" class="form-control"
						style="border-top: 0px; border-left: 0px; border-right: 0px;" />
					<form:errors path="confirm" class="text-danger" />
				</div>
				<button class="btn btn-primary">
					Register
					<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
						fill="currentColor" class="bi bi-box-arrow-in-right"
						viewBox="0 0 16 16">
  						<path fill-rule="evenodd"
							d="M6 3.5a.5.5 0 0 1 .5-.5h8a.5.5 0 0 1 .5.5v9a.5.5 0 0 1-.5.5h-8a.5.5 0 0 1-.5-.5v-2a.5.5 0 0 0-1 0v2A1.5 1.5 0 0 0 6.5 14h8a1.5 1.5 0 0 0 1.5-1.5v-9A1.5 1.5 0 0 0 14.5 2h-8A1.5 1.5 0 0 0 5 3.5v2a.5.5 0 0 0 1 0v-2z" />
 						<path fill-rule="evenodd"
							d="M11.854 8.354a.5.5 0 0 0 0-.708l-3-3a.5.5 0 1 0-.708.708L10.293 7.5H1.5a.5.5 0 0 0 0 1h8.793l-2.147 2.146a.5.5 0 0 0 .708.708l3-3z" />
					</svg>
				</button>
			</form:form>
			<form:form action="/login" method="post" modelAttribute="newLogin">
				<h3>Login</h3>
				<div class="form-group mt-4">
					<label>Email</label>
					<form:input path="email" class="form-control"
						style="border-top: 0px; border-left: 0px; border-right: 0px;" />
					<form:errors path="email" class="text-danger" />
				</div>
				<div class="form-group mt-4">
					<label>Password</label>
					<form:password path="password" class="form-control"
						style="border-top: 0px; border-left: 0px; border-right: 0px;" />
					<form:errors path="password" class="text-danger" />
				</div>
				<button class="btn btn-success">
					Login
					<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
						fill="currentColor" class="bi bi-box-arrow-in-right"
						viewBox="0 0 16 16">
  						<path fill-rule="evenodd"
							d="M6 3.5a.5.5 0 0 1 .5-.5h8a.5.5 0 0 1 .5.5v9a.5.5 0 0 1-.5.5h-8a.5.5 0 0 1-.5-.5v-2a.5.5 0 0 0-1 0v2A1.5 1.5 0 0 0 6.5 14h8a1.5 1.5 0 0 0 1.5-1.5v-9A1.5 1.5 0 0 0 14.5 2h-8A1.5 1.5 0 0 0 5 3.5v2a.5.5 0 0 0 1 0v-2z" />
 						 <path fill-rule="evenodd"
							d="M11.854 8.354a.5.5 0 0 0 0-.708l-3-3a.5.5 0 1 0-.708.708L10.293 7.5H1.5a.5.5 0 0 0 0 1h8.793l-2.147 2.146a.5.5 0 0 0 .708.708l3-3z" />
					</svg>
				</button>
			</form:form>
		</div>
		<div class="view">
			<div class="plans">
				<div class="planChild">
					<div class="planTitle">
						<p>Basic</p>
					</div>
					<div>
						<div class="pricing">
							<p style="color: #071227; margin: 0px 0px 0px 0px;">Price</p>
							<p style="color: green; font-size: 20pt;">$0</p>
						</div>
						<div style="color: #071227; margin-left: 20px;">
							<p>100 Customers
								<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="green" class="bi bi-check-lg" viewBox="0 0 16 16">
  									<path d="M12.736 3.97a.733.733 0 0 1 1.047 0c.286.289.29.756.01 1.05L7.88 12.01a.733.733 0 0 1-1.065.02L3.217 8.384a.757.757 0 0 1 0-1.06.733.733 0 0 1 1.047 0l3.052 3.093 5.4-6.425a.247.247 0 0 1 .02-.022Z"/>
								</svg>
							</p>
							<p>Appointment Booking
								<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="green" class="bi bi-check-lg" viewBox="0 0 16 16">
  									<path d="M12.736 3.97a.733.733 0 0 1 1.047 0c.286.289.29.756.01 1.05L7.88 12.01a.733.733 0 0 1-1.065.02L3.217 8.384a.757.757 0 0 1 0-1.06.733.733 0 0 1 1.047 0l3.052 3.093 5.4-6.425a.247.247 0 0 1 .02-.022Z"/>
								</svg>
							</p>
							<p>Customer Tracking
								<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="green" class="bi bi-check-lg" viewBox="0 0 16 16">
  									<path d="M12.736 3.97a.733.733 0 0 1 1.047 0c.286.289.29.756.01 1.05L7.88 12.01a.733.733 0 0 1-1.065.02L3.217 8.384a.757.757 0 0 1 0-1.06.733.733 0 0 1 1.047 0l3.052 3.093 5.4-6.425a.247.247 0 0 1 .02-.022Z"/>
								</svg>
							</p>
						</div>
					</div>
				</div>
				<div class="planChild">
					<div class="planTitle">
						<p>Advanced</p>
					</div>
					<div>
						<div>
							<p style="color: #071227; margin: 0px 0px 0px 0px;">Price</p>
							<p style="color: green; font-size: 20pt;">$19</p>
						</div>
						<div style="color: #071227; margin-left: 20px;">
							<p>Appointment Management
								<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="green" class="bi bi-check-lg" viewBox="0 0 16 16">
  									<path d="M12.736 3.97a.733.733 0 0 1 1.047 0c.286.289.29.756.01 1.05L7.88 12.01a.733.733 0 0 1-1.065.02L3.217 8.384a.757.757 0 0 1 0-1.06.733.733 0 0 1 1.047 0l3.052 3.093 5.4-6.425a.247.247 0 0 1 .02-.022Z"/>
								</svg>
							</p>
							<p>Earnings Insight
								<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="green" class="bi bi-check-lg" viewBox="0 0 16 16">
  									<path d="M12.736 3.97a.733.733 0 0 1 1.047 0c.286.289.29.756.01 1.05L7.88 12.01a.733.733 0 0 1-1.065.02L3.217 8.384a.757.757 0 0 1 0-1.06.733.733 0 0 1 1.047 0l3.052 3.093 5.4-6.425a.247.247 0 0 1 .02-.022Z"/>
								</svg>
							</p>
							<p>Customer Editing
								<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="green" class="bi bi-check-lg" viewBox="0 0 16 16">
  									<path d="M12.736 3.97a.733.733 0 0 1 1.047 0c.286.289.29.756.01 1.05L7.88 12.01a.733.733 0 0 1-1.065.02L3.217 8.384a.757.757 0 0 1 0-1.06.733.733 0 0 1 1.047 0l3.052 3.093 5.4-6.425a.247.247 0 0 1 .02-.022Z"/>
								</svg>
							</p>
						</div>
					</div>
				</div>
				<div class="planChild">
					<div class="planTitle">
						<p>Professional</p>
					</div>
					<div>
					<div class="pricing">
						<p style="color: #071227; margin: 0px 0px 0px 0px;">Price</p>
						<p style="color: green; font-size: 20pt;">$29</p>
					</div>
					<div style="color: #071227; margin-left: 20px;">
						<p>Customer Billing
							<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="green" class="bi bi-check-lg" viewBox="0 0 16 16">
  								<path d="M12.736 3.97a.733.733 0 0 1 1.047 0c.286.289.29.756.01 1.05L7.88 12.01a.733.733 0 0 1-1.065.02L3.217 8.384a.757.757 0 0 1 0-1.06.733.733 0 0 1 1.047 0l3.052 3.093 5.4-6.425a.247.247 0 0 1 .02-.022Z"/>
							</svg>
						</p>
						<p>Invoices
							<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="green" class="bi bi-check-lg" viewBox="0 0 16 16">
  								<path d="M12.736 3.97a.733.733 0 0 1 1.047 0c.286.289.29.756.01 1.05L7.88 12.01a.733.733 0 0 1-1.065.02L3.217 8.384a.757.757 0 0 1 0-1.06.733.733 0 0 1 1.047 0l3.052 3.093 5.4-6.425a.247.247 0 0 1 .02-.022Z"/>
							</svg>
						</p>
						<p>24/7 Support
							<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="green" class="bi bi-check-lg" viewBox="0 0 16 16">
  								<path d="M12.736 3.97a.733.733 0 0 1 1.047 0c.286.289.29.756.01 1.05L7.88 12.01a.733.733 0 0 1-1.065.02L3.217 8.384a.757.757 0 0 1 0-1.06.733.733 0 0 1 1.047 0l3.052 3.093 5.4-6.425a.247.247 0 0 1 .02-.022Z"/>
							</svg>
						</p>
					</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>