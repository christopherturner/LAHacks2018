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
		<option>en (English)</option>
					<option>ar (العربية)</option>
					<option>de (Deutsch)</option>
					<option>fr (Français)</option>
					<option>hi (हिंदी)</option>
					<option>pt (Português)</option>
					<option>ru (Русский)</option>
					<option>es (Español)</option>
					<option>tr (Türk)</option>
					<option>nl (Nederlands)</option>
					<option>it (Italiano)</option>
					<option>pl (Polski)</option>
					<option>ro (Român)</option>
					<option>sv (Svensk)</option>
					<option>vi (Việt)</option>
					<option>th (ภาษาไทย)</option>
					<option>zh-CN (中文简体)</option>
					<option>zh-TW (中國傳統)</option>
					<option>ko (한국의)</option>
					<option>ja (日本人)</option>
					<option>el (ελληνικά)</option>
					<option>ts (தமிழ்)</option>
					<option>hy (հայերեն)</option>
					<option>bs (Bosanski)</option>
					<option>ca (Català)</option>
					<option>hr (Hrvatski)</option>
					<option>dq (Dansk)</option>
					<option>eo (Esperanto)</option>
					<option>fi (Suomalainen)</option>
					<option>ht (Haian kreyòl)</option>
					<option>hu (Magyar)</option>
					<option>is (Icelandic)</option>
					<option>id (Indonesia)</option>
					<option>la (Latinum)</option>
					<option>lv (Latvijas)</option>
					<option>mk (Македонски)</option>
					<option>no (Norsk)</option>
					<option>sr (Српски)</option>
					<option>sk (Slovenský)</option>
					<option>sw (Kiswahili)</option>
					<option>cy (Cymraeg)</option>
		</select>
		<button id="btn-convert-text" class="btn btn-primary">Start</button>
		<button id="btn-stop-text" class="btn btn-primary">Stop</button>
		
		</div>
        <br>
      	<br>
      	
        <textarea id="textarea-from"></textarea>
        <br>
        <br>


	</body>
</html>