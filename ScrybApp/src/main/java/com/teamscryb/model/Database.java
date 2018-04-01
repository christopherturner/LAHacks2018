package com.teamscryb.model;

import java.util.ArrayList;

public class Database {
	private static Database instance;
	private ArrayList<Lecture> lectures;

	public Database() {
		lectures = new ArrayList<Lecture>();
	}

	public static Database getInstance() {
		if (instance == null) {
			instance = new Database();
		}
		return instance;
	}

	public Lecture getLecture(String name) {
		for (Lecture l: lectures) {
			if (name == l.getName()) {
				return l;
			}
		}
		return new Lecture();
	}
	
	public ArrayList<Lecture> getLectures() {
		return lectures;
	}
	
	public void addLecture(Lecture L) {
		lectures.add(L);
	}
	
	public void setLectures(ArrayList<Lecture> lectures) {
		this.lectures = lectures;
	}
}
