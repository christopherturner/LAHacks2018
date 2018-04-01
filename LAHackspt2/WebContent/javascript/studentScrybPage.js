
var size = 0;
function getText(var pos) {
	"use strict";
	
	
}
function getTranslatedText(var pos) {
	"use strict";
	
	
}

function checkSize() {
	"use strict";
	return Packages.Translation.Transcript.getSize();
}

function monitorTranscript() {
	"use strict";
	var sessionSize = checkSize();
	var orginalBox = document.getElementById("orignal-textbox");
	var translatedBox = document.getElementById("translated-text-textbox");
	
	
	if (sessionSize === 0) {
		// No text posted by instructor yet
		
	}
	else if (size === sessionSize) {
		// No new text to update
		
	}
	else if (size < sessionSize) {
		// Get new text and add to boxes
		for (var i = size; i <= sessionSize; i++) { 
			orginalBox += getText(i);
			translatedBox += getTranslatedText(i);
		}
	} else {
		// Current session greater then so possible error somewhere 
		// Maybe reset to 0 and reload text areas??
		
	}
	
	
	setTimeout(1000, monitorTranscript);
}

