package WebStuff;

import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.net.Socket;
import java.util.Vector;

public class ServerThread extends Thread {
		private Socket s;
		private Server sr;
		Lecture currLecture;
		private ObjectOutputStream oos;
		private ObjectInputStream ois;
		private Vector<Lecture> lectures = new Vector<Lecture>();
		
		public ServerThread (Socket s, Server sr) {
			try{
				this.s = s;
				this.sr = sr;
				oos = new ObjectOutputStream(s.getOutputStream());
				ois = new ObjectInputStream(s.getInputStream());
				this.lectures = sr.getLectures();
				this.start();
			}catch (IOException ioe) {
				System.out.println("ioe in ServerThread constructor: " + ioe.getMessage());
			}
		}
		
		public void sendMessage(Message mes)
		{
			try {
				oos.writeObject(mes);
				oos.flush();
			} catch (IOException ioe) {
				System.out.println("ioe: " + ioe.getMessage());
			}
		}
		
		private void createLecture(String lectureName) {
			Vector<ServerThread> students = new Vector<ServerThread>();
			students.add(this);
			currLecture = new Lecture(lectureName, students);
			//add to gamelist
			lectures.add(currLecture);
			//update server
			sr.setLectures(lectures);
			
		}
		
		public void run() {
			try {
				while(true)
				{
					Message msg = (Message)ois.readObject();
					
					
				}
			} catch (IOException ioe){
				System.out.println("ioe in ServerThread.run(): " + ioe.getMessage());
			} catch (ClassNotFoundException cnfe) {
				System.out.println("cnfe: " + cnfe.getMessage());
			}
		}
	}
