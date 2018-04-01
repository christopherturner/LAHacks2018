package model;

import java.util.ArrayList;

public class Database {
	private Database instance;
	private ArrayList<Lecture> lectures;

	private Database() {
		lectures = new ArrayList<Lecture>();
	}

	public Database getInstance() {
		if (instance == null) {
			instance = new Database();
		}
		return instance;
	}

	public Lecture getLecture(int index) {
		return lectures.get(index);
	}
}
