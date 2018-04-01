package com.teamscryb.model;

import java.util.ArrayList;

import com.teamscryb.translation.*;

public class Lecture {
	private ArrayList<Text> transcript;
	private String teacher;
	private String name;
	private int size;
	
	public Lecture() {
		transcript = new ArrayList<Text>();
	}

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
	
	public ArrayList<Text> getTranscript() {
		return transcript;
	}
	
	public String getTeacher() {
		return teacher;
	}
	
	public void setTeacher(String teacher) {
		this.teacher = teacher;
	}
	
	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
	}
}
