<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
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
		
        <br>
      	<br>
      	
        <textarea id="textarea-from"></textarea>
        <br>
        <br>


	</body>
</html>