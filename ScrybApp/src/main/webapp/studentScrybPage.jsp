<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.teamscryb.model.*" 
		 import="com.teamscryb.translation.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
	if ((session.getId() == null) || (session.getAttribute("database") == null)){
		session.setAttribute("database", Database.getInstance());
	}
	Database database = (Database) session.getAttribute("database");
	String lectureName = (String) session.getAttribute("lectureId");
	Lecture l = database.getLecture(lectureName);
	int sessionTextIndex = 0; 
%>
	<head>
		<meta charset="UTF-8">
		<link href="https://fonts.googleapis.com/css?family=Raleway" rel="stylesheet">
		<link rel="stylesheet" type="text/css" href="CSS/studentScrybPage.css" />
		
		<!-----CSS----->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
		<link rel="stylesheet" href="CSS/index.css">

		<!-----Scripts----->
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
		
		<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
		
		<script src="javascript/studentScrybPage.js"></script>
		<title>Scryb Home</title>
	</head>

	<body class = "light" id = "body">
		<div class="row">
			<div class="col">
				<img id="logo" src="IMG/Logo_Light.png">
			</div>
		</div>

		<div class="row">
			<div class="col">
				<div class="form-group text-center">
					<label for="comment">Original transcript</label><br>
					<label for="comment">Language: English</label>
					<textarea readonly class="form-control" id="orignal-textbox">
					<%
					for (Text t: l.getTranscript()) { %>
						<%=t.getText()%>
						<% sessionTextIndex++; %>
					<% } %> 
					</textarea>
				</div>
			</div>
			<div class="col">
				<div class="form-group text-center">
					<label for="comment">Translated transcript</label><br>
					<div class="radio">
						<form id="radioForm">
							<label><input type="radio" name="optradio" checked="checked" value="sp"> Spanish</label>
							<label><input type="radio" name="optradio" value="de"> German</label>
							<label><input type="radio" name="optradio" value="ch"> Mandarin</label>
						</form>
					</div>
					<textarea class="form-control" id="translated-textbox">
					<%
					for (Text t: l.getTranscript()) { 
						String text = t.getText();
						String translatedText = CloudTranslate.translateText(text, "fr", "en");
					%>
						<%=translatedText%>
					<% } %> 
					</textarea>
				</div>
			</div>
		</div>
		<form id="hiddenForm">
			<input type="hidden" id="sessionTextIndex" value=<%=sessionTextIndex%>>
			<input type="hidden" id="lectureName" value=<%=l.getName()%>>
		</form>
	</body>
	<script type="text/javascript">
	
	function getText(){
		var req = new XMLHttpRequest();
		req.open("GET", "GetText?lectureName=" + document.getElementById("lectureName").value
				+ "textIndex=" + document.getElementById("sessionTextIndex").value
				+ "tLang=" + document.radioForm.optradio.value;
				, false);
		req.send();
		if(req.responseText.trim().length > 0){
			data = req.responseText.trim();
			
			document.getElementById("orignal-textbox").innerHTML = data;
			document.getElementById("translated-textbox").innerHTML = data;
			setTimeout(getText(), 1000);
		}
		setTimeout(getText(), 1000);
	}
	getText();
	
	
	
	
	
	
	</script>
</html>