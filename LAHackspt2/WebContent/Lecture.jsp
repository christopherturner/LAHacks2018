<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="model.*" %>
<%@page import="java.util.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
	if ((session.getId() == null) || (session.getAttribute("database") == null)){
		session.setAttribute("database", Database.getInstance());
	}
	Database database = (Database) session.getAttribute("database");
	//get lecture list from database
	ArrayList<Lecture> lectures = database.getLectures();
	String title = " " + (String) session.getAttribute("lectureName");
	String name = " " + (String) session.getAttribute("profName");
%>
<head>
		<meta charset="UTF-8">
		<link href="https://fonts.googleapis.com/css?family=Raleway" rel="stylesheet">
		<link rel="stylesheet" type="text/css" href="CSS/lecture.css" />
		<!-----CSS----->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
		<link rel="stylesheet" href="cover.css">

		<!-----Scripts----->
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
		<script src="cover.js"></script>
		<title>Lecture</title>

	</head>

	<body class = "light" id = "body">
		<div class="row">
			<div class="col">
				<img id="logo" src="IMG/Logo_Light.png">
			</div>
		</div>
		<div id = "subtitle">
		<label id="prof">Professor:  <%=name%></label> <br>
		<label id="title">Lecture Name:  <%=title%></label>		
		<br>
		<label id="lang">Specify the Language: </label>
		
		<select id="convert-from">
		<option value="en">English (en)</option>
		<option value="zh">Chinese (Simplified) (zh)</option>
		<option value="zh-TW">Chinese (Traditional) (zh-TW)</option>
		<option value="fr">French (fr)</option>
		<option value="ja">Japanese (ja)</option>
		<option value="ko">Korean (ko)</option>
		<option value="de">German (de)</option>
		<option value="it">Italian (it)</option>
		<option value="es">Spanish (es)</option>
		</select>
		<button id="btn-convert-text" class="btn btn-primary">Start</button>
		</div>
        <br>
      	<br>
      	
        <textarea id="textarea-from"></textarea>
        <br>
        <br>


	</body>
</html>