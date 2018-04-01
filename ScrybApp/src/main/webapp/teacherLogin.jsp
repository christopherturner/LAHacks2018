<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.teamscryb.model.*" %>
<%@page import="java.util.*, java.io.*"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
	if ((session.getId() == null) || (session.getAttribute("database") == null)){
		session.setAttribute("database", Database.getInstance());
	}
	Database database = (Database) session.getAttribute("database");
	//get lecture list from database
	ArrayList<Lecture> lectures = database.getLectures();
	
	//make sure user input is valid
	String lecturer = (String)request.getParameter("profName");
	String lectureName = (String)request.getParameter("lectureName");
	//make sure page ran
	String instructor = (String)session.getAttribute("profName");
	String lecture = (String) session.getAttribute("lectureName");
	if(instructor != "" && instructor != null){
		request.setAttribute("profName", instructor);
	}
	if(lecture!="" && lecture != null){
		request.setAttribute("lectureName", lecture);
	}
	
	String next = "/teacherLogin.jsp";
	boolean valid = false;
	if (lecturer !=null && lecturer !="" && lectureName !=null && lectureName !=""){
		valid = true;
		next = "/Lecture.jsp";
		session.setAttribute("profName", lecturer);
		session.setAttribute("lectureName", lectureName);
	}
	
	if (valid){
		//update database
		Lecture newLecture = new Lecture();
		newLecture.setLecturer(lecturer);
		newLecture.setName(lectureName);
		lectures.add(newLecture);
		//redirect to nextPage
		RequestDispatcher dispatch = getServletContext().getRequestDispatcher(next);
		try {
			dispatch.forward(request,response);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
%>

	<head>
		<meta charset="UTF-8">
		<link href="https://fonts.googleapis.com/css?family=Raleway" rel="stylesheet">
		<link rel="stylesheet" type="text/css" href="CSS/teacherLogin.css" />
		
		<!-----CSS----->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
		<link rel="stylesheet" href="cover.css">

		<!-----Scripts----->
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
		<script src="javascript/studentLogin.js"></script>
		<title>Scryb Home</title>

	</head>

	<body class = "light" id = "body">
		<div class="row">
			<div class="col">
				<img id="logo" src="IMG/Logo_Light.png">
			</div>
		</div>
			<form class="form-signin" action= "teacherLogin.jsp">
					<h2 class="form-signin-heading"></h2>
					 <div class="form-group">	
					 	<label for="profName">Professor's Name</label>
    					<input type="profName" name = "profName"class="form-control" id="profID" aria-describedby="profHelp" placeholder="Enter Your Name" required>				 
    					<label for="lectureName">Lecture Title</label>
    					<input type="lectureName" name = "lectureName"class="form-control" id="lectureID" aria-describedby="lectureHelp" placeholder="Enter Lecture Title" required>
 					 	<br> 		
 					 	 <button type="submit" name = "submit" class="btn btn-primary" value = "run">Start</button>
 					 		 	 					 	
 					 </div>
				</form>
				
	</body>
</html>