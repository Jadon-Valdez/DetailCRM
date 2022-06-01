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
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="/customers.css">
<script src="/webjars/jquery/jquery.min.js"></script>
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>New Appointment</h1>
		<div class="container">
			<form:form action="/newAppt/${customer.id}" method="post" modelAttribute="appointment" enctype="multipart/form-data">
				<div class="form-group">
					<label>Date: </label>
					<form:input path="date" class="form-control" type="date"/>
					<form:errors path="date" class="text-danger" />
				</div>
				<div class="form-group">
					<label>Time: </label>
					<form:input path="time" class="form-control" type="time"/>
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
				<input type="submit" value="Submit" />
			</form:form>
		</div>
</body>
</html>