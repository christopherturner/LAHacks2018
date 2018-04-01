<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.teamscryb.model.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
		<link href="https://fonts.googleapis.com/css?family=Raleway" rel="stylesheet">
		<link rel="stylesheet" type="text/css" href="CSS/index.css" />
		
		<!-----CSS----->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
		

		<!-----Scripts----->
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
		
		
		<title>Scryb Home</title>
</head>
<body class="light" id="body">
		<div class="row">
			<div class="col">
				<img id="logo" src="IMG/Logo_Light.png">
			</div>
		</div>

		<div class="row">
			<div class="col text-center">
				<a class="role-button" href="./teacherLogin.jsp">
					<button type="button" class="btn btn-primary btn-lg" id="teacher">Teacher</button>
				</a>
			</div>
			<div class="col text-center">
				<a class="role-button" href="./studentLogin.jsp">
					<button type="button" class="btn btn-primary btn-lg" id="student">Student</button>
				</a>
			</div>
		</div>
	</body>
</html>