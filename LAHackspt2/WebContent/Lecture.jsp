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
        
        <section class="section-divider">
				<h2>Convert From</h2>
				<br> <br> <select id="convert-from">
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
				</select> <br> <br>
				<textarea id="textarea-from"></textarea>
				<br>
				<button id="btn-convert-text" style="font-size: 16px;">Convert
					Your Text Input</button>
				<br>
				<button id="btn-convert-voice" style="font-size: 16px;">Speak
					& Convert Your Voice</button>
			</section>

			<section class="section-divider">
				<h2>Convert Into</h2>
				<br> <br> <select id="convert-into">
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
				</select> <br> <br>
				<textarea id="textarea-to" disabled
					style="background: #f9f9f9 !important; border: 1px solid #f7f1f1; cursor: not-allowed;"
					title="Output! ReadOnly!"></textarea>


	</body>
	<script src="js/Translator.js">
</script>
<script>

	var translator = new Translator();

	function getOption(language) {
		var option = document.createElement('option');
		option.value = language.language;
		if (language.name) {
			option.innerHTML = language.name + ' (' + language.language + ')'
		} else {
			option.innerHTML = language.language;
		}
		if (language.language == 'en') {
			option.selected = true;
		}
		return option;
	}
	var convertFrom = document.getElementById('convert-from');
	var convertInto = document.getElementById('convert-into');
	translator
			.getListOfLanguages(function(languages) {
				if (!(languages instanceof Array))
					return;
				convertFrom.innerHTML = '';
				convertInto.innerHTML = '';
				languages.forEach(function(language) {
					var option = getOption(language);
					convertFrom.appendChild(option);
					var option2 = getOption(language);
					convertInto.appendChild(option2);
				});
				localStorageGetItem();
				var blockquote = document.getElementById('blockquote');
				blockquote.style.display = 'block';
				blockquote.innerHTML = 'You can translate your voice & texts among <strong class="highlight">'
						+ languages.length + '</strong> languages.';
			});

	var textareaFrom = document.getElementById('textarea-from');
	var textareaTo = document.getElementById('textarea-to');

	function getLanguages() {
		var from = document.getElementById('convert-from').value.split(' (')[0];
		var to = document.getElementById('convert-into').value.split(' (')[0];

		return {
			from : from,
			to : to
		};
	}

	document.getElementById('btn-convert-voice').onclick = function() {
		this.disabled = true;
		this.innerHTML = 'Start Speaking!';
		var languages = getLanguages();

		translator.voiceToText(function(text) {
			textareaFrom.value = text;

			document.getElementById('btn-convert-text').onclick(true);
		}, languages.from);
	};

	document.getElementById('btn-convert-text').onclick = function(speakAsWell) {
		var languages = getLanguages();

		textareaTo.value = 'Converting into >> '
				+ document.getElementById('convert-into').value;

		translator
				.translateLanguage(
						textareaFrom.value,
						{
							from : languages.from,
							to : languages.to,
							callback : function(translatedText) {
								textareaTo.value = translatedText;
								console.log("Text: " + translatedText);
								localStorage.setItem('textarea-to',
										textareaTo.value);

								if (speakAsWell !== true)
									return;
								if (document.getElementById('robot-voice').checked) {
									translator
											.speakTextUsingRobot(
													translatedText,
													{
														workerPath : 'https://cdn.webrtc-experiment.com/Robot-Speaker.js',
														onWorkerFileDownloadStart : function() {
															console
																	.log('Downloading worker file. It is about 2MB in size.');
														},
														onWorkerFileDownloadEnd : function() {
															console
																	.log('Worker file is downloaded.');
														}
													});
								} else {
									translator
											.speakTextUsingGoogleSpeaker({
												textToSpeak : translatedText,
												targetLanguage : languages.to,
												// please use your own API key; if possible
												api_key : 'AIzaSyDxjqfMtMuDoGQQ6fB-UWFVzC_jqa9TytU'
											});
								}
							}
						});
	};

	document.getElementById('convert-from').onchange = function() {
		localStorage.setItem('convert-from', this.value);
	};

	document.getElementById('convert-into').onchange = function() {
		localStorage.setItem('convert-into', this.value);
	};

	textareaFrom.onchange = function() {
		localStorage.setItem('textarea-from', this.value);
	};

	textareaTo.onchange = function() {
		localStorage.setItem('textarea-to', this.value);
	};

	document.getElementById('robot-voice').onchange = function() {
		localStorage.setItem('robot-checked', this.checked + '');
	};

	function localStorageGetItem() {
		if (localStorage.getItem('convert-from')) {
			document.getElementById('convert-from').value = localStorage
					.getItem('convert-from');
		}

		if (localStorage.getItem('convert-into')) {
			document.getElementById('convert-into').value = localStorage
					.getItem('convert-into');
		}
		if (localStorage.getItem('textarea-from')) {
			textareaFrom.value = localStorage.getItem('textarea-from');
		}

		if (localStorage.getItem('textarea-to')) {
			textareaTo.value = localStorage.getItem('textarea-to');
		}

		if (localStorage.getItem('robot-checked')) {
			document.getElementById('robot-voice').checked = localStorage
					.getItem('robot-checked') === 'true';
		}
	}
	localStorageGetItem();
</script>
</html>