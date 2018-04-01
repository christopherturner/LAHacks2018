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
			parser = new DOMParser();
			xmlDoc = parser.parseFromString(data,"text/xml");

			document.getElementById("orignal-textbox").innerHTML += 
				xmlDoc.getElementsByTagName("oText")[0].childNodes[0].nodeValue;
			document.getElementById("translated-textbox").innerHTML += 
				xmlDoc.getElementsByTagName("tText")[0].childNodes[0].nodeValue;
		}
		setTimeout(getText(), 1000);
	}
	getText();

	
	</script>
		<div id = "textAnalysis"></div>
	
-	<script type="text/javascript">
-	function getInfo(){
-		var xhttp = new XMLHttpRequest();
-		//there is also "POST"
-		var text = "The Impact of Viking Raids For these reasons, Viking became a word of terror for the people of Northern Europe, and many historians tend to treat Vikings as mere disruptions to civilization. Yet it was in this disruptive role that the Vikings had, perhaps, their most profound impact on Western civilization. The Vikings essentially turned the tide in Europe from centralized imperialism to decentralized feudalism. Viking raids began stepping up around the end of the 8th century, just as Charlemagne was trying to unite Europe into the Carolingian Empire. This centralized empire was not suitable to deal with the amphibious raids of the Vikings. Try as he might, Charlemagne could not possibly hope to defend thousands of miles of coastline from Viking invasions. Moreover, since the shallow Viking longships could travel upriver, not even the inland empire was safe, as the Vikings proved quite clearly a century later by laying siege to Paris in 885. Charlemagne's empire was so short-lived because it could not provide the most basic services an empire is supposed to provide its subjects: peace and protection. As Charlemagne's empire fell apart, Europeans needed to find a new way to protect themselves against these Viking raiders, something local and small enough to be responsive but powerful enough to protect the people and their property.";
-
-		xhttp.open("GET", "GetAnalysis?text=" + text, false); //synchronous call
-		xhttp.send();
-		//responseText is what the servlet sends back
-		if(xhttp.responseText.trim().length > 0){
-			data = xhttp.responseText.trim();
-		}
-		
-		document.getElementById("textAnalysis").innerHTML = data;
-	}
-	
-	getInfo()</script>

</html>