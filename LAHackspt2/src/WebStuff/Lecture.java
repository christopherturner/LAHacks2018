package WebStuff;

import java.util.Vector;

public class Lecture {
	String name = null;
	Vector<ServerThread> students = new Vector<ServerThread>();
	
	public Lecture (String name, Vector<ServerThread> students)
	{
		this.name = name;
		this.students = students;
	}
	
	
	public void broadcast(Message msg, ServerThread st) {
		for (int i=0; i< students.size();i++) {
			students.get(i).sendMessage(msg);
		}
	}
}
