package model;

import java.util.ArrayList;

import Translation.CloudTranslate;

public class Lecture {
	private ArrayList<Text> transcript;
	private int size;

	public Text getText(int pos) {
		return transcript.get(pos);
	}

	public String getTranslatedText(int pos, String lang) {
		return CloudTranslate.translateText(transcript.get(pos).getText(), transcript.get(pos).getLanguage(), lang);
	}

	public void addText(String text, String lang) {
		Text tt = new Text(text, lang);
		transcript.add(tt);
		size++;
	}

	public int getSize() {
		return this.size;
	}
}
