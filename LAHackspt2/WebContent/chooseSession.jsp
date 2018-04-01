<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%
	
%>

<html>

<head>

	<script>
		function toggle(){				
			if(document.getElementById("body").classList.contains("light")){
				document.getElementById("body").classList.add('dark');
				document.getElementById("body").classList.remove('light');
				document.getElementById("logo").src= "IMG/Logo_Dark.png";
				document.getElementById("lightDark").innerText= "Light Mode";
	
			}
			else{
				document.getElementById("body").classList.add('light');
				document.getElementById("body").classList.remove('dark');		
				document.getElementById("logo").src= "IMG/Logo_Light.png";
				document.getElementById("lightDark").innerText= "Dark Mode";
	
			}
		}
	</script>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<link rel="stylesheet" type="text/css" href="CSS/chooseSession.css">
	
	<title>Session List</title>
</head>
<body class = "light" id = "body">

	<button id="lightDark" onclick="toggle()" class="button">Dark Mode</button><br>
	<img id = "logo" src = "IMG/Logo_Light.png">
	
	<form name="loginform" method = "GET" action = "session.jsp" >
	</form>
</body>
</html>