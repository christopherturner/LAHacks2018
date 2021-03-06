<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.teamscryb.model.*" %>
<%@page import="java.util.*, java.io.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
	if ((session.getId() == null) || (session.getAttribute("database") == null)){
		session.setAttribute("database", Database.getInstance());
	}
	Database database = (Database) session.getAttribute("database");
	//get lecture list from database
	ArrayList<Lecture> lectures = database.getLectures();
	for(int i = 0; i < database.getLectures().size(); i++){
		System.out.println("WOAT: "+ i + database.getLectures().get(i).getName());
	}
	request.setAttribute("classes", lectures);

	//set lectureId into session attribute
	
%>
	<head>
		<meta charset="UTF-8">
		<link href="https://fonts.googleapis.com/css?family=Raleway" rel="stylesheet">
		<link rel="stylesheet" type="text/css" href="CSS/studentLogin.css" />
		<link rel="stylesheet" type="text/css" href="CSS/index.css" />
		
		<!-----CSS----->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

		<!-----Scripts----->
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
		<script src="javascript/studentLogin.js"></script>
		<title>Scryb Home</title>
		<script>
		
		function goToScrybPage(){
			localStorage.setItem("lectureName", document.SCRYBFORM.lecName.value);
			console.log("NAME OF LECTURE: " + document.SCRYBFORM.lecName.value)
			return true;
		}
		
		</script>

	</head>

	<body class = "light" id = "body">
		<div class="row">
			<div class="col">
				<img id="logo" src="IMG/Logo_Light.png">
			</div>
		</div>

		<div class="row">
			<div class="col text-center">
				<form class="form-signin">
					<h2 class="form-signin-heading">Please select session</h2>
					<div class="list-group" id="list">						
						<table>
						    <c:forEach items="${classes}" var="lec">
						        <tr>
						        <form id = "SCRYBFORM" name = "SCRYBFORM" method = "GET" action = "studentScrybPage.jsp" onSubmit = "return goToScrybPage();">
						            <input type = "submit" class="list-group-item list-group-item-action" value = "${lec.name}">
						            <input type="hidden" name="lecName" value="${lec.name}">
						        </form>
						        </tr>
						    </c:forEach>
						</table>

					</div>
					<br>
					<button class="btn btn-lg btn-primary" type="submit">Sign in</button>
				</form>
			</div>
        </div>
    <script>

    </script>
	</body>
</html>