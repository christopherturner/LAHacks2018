package com.teamscryb.model;

import java.util.ArrayList;

public class Database {
	private static Database instance;
	private ArrayList<Lecture> lectures;

	private Database() {
		lectures = new ArrayList<Lecture>();
		Lecture testLecture = new Lecture();
		testLecture.addText("Hello!", "en");
		lectures.add(testLecture);
		testLecture = new Lecture();
		testLecture.addText("Bonjour!", "fr");
		lectures.add(testLecture);
	}

	public static Database getInstance() {
		if (instance == null) {
			instance = new Database();
		}
		return instance;
	}

	public Lecture getLecture(int index) {
		return lectures.get(index);
	}
	
	public ArrayList<Lecture> getLectures() {
		return lectures;
	}
}
