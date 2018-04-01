<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="model.*" 
		 import="Translation.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
	if ((session.getId() == null) || (session.getAttribute("database") == null)){
		session.setAttribute("database", Database.getInstance());
	}
	Database database = (Database) session.getAttribute("database");
	String lectureID = (String) session.getAttribute("lectureId");
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
					Lecture l = database.getLecture(1);
					for (Text t: l.getTranscript()) { %>
						<%=t.getText()%>
					<% } %> 
					</textarea>
				</div>
			</div>
			<div class="col">
				<div class="form-group text-center">
					<label for="comment">Translated transcript</label><br>
					<div class="radio">
						<label><input type="radio" name="optradio"> German</label>
						<label><input type="radio" name="optradio"> Mandarin</label>
						<label><input type="radio" name="optradio"> Spanish</label>
					</div>
					<textarea class="form-control" id="translated-text-textbox">
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
	</body>
	<script type="text/javascript">
	
	function getXmlHttpRequestObject() {
		 if (window.XMLHttpRequest) {
			 return new XMLHttpRequest();
		 } else if (window.ActiveXObject) {
			 return new ActiveXObject("Microsoft.XMLHTTP");
		 } else {
			 alert("Your Browser does not support AJAX!\nIt's about time to upgrade don't you think?");
		 }
	 }
	 
	 
	//XmlHttpRequest object
	 var req = getXmlHttpRequestObject(); 
	
	 function getRequest(resource) {
		 	
			// handle the case where a querystring is not detected
			var char = "&";
		 	if(resource.indexOf("?", 0) == -1) {
				char = "?";
			}
				
			 if (req.readyState == 4 || req.readyState == 0) {
				 req.open("GET", resource + char + 'ms=' + new Date().getTime(), true);
				 req.onreadystatechange = handleResponse();
				 req.send(null);
				 return false;
			 }
		 }
	 
	 function handleResponse() {
		 if (req.readyState == 4) 
		 {
			parseState(req.responseXML);
		 }
	} 

	function parseState(xDoc){
		if(xDoc == null)
			return
			
		//Reference the <div> tag with the ID "text"; <div id="text">XML</div>	
		
		var target = document.getElementById("text");
		
		
		//Get the value of the xml node named <text> and place the value in <div id="text">here</div>
		target.innerHTML += xDoc.getElementsByTagName("text")[0].childNodes[0].nodeValue;
	}

	setInterval(getRequest('GetText'), 1000);
	//ogText = document.getElementById("orignal-textbox");
	//transText = document.getElementById("translated-text-textbox");
	
	
	
	</script>
</html>