package WebStuff;

import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.net.Socket;

public class ServerThread extends Thread {
		private Socket s;
		private Server sr;
		private ObjectOutputStream oos;
		private ObjectInputStream ois;
		
		public ServerThread (Socket s, Server sr) {
			try{
				this.s = s;
				this.sr = sr;
				oos = new ObjectOutputStream(s.getOutputStream());
				ois = new ObjectInputStream(s.getInputStream());
				games = sr.getGames();
				brawlers = sr.getBrawler();
				this.start();
			}catch (IOException ioe) {
				System.out.println("ioe in ServerThread constructor: " + ioe.getMessage());
			}
		}
		
		public void updateData(Game currGame) {
			int index = findIndex(currGame.getName());
			games.set(index, currGame);
			sr.setGames(games);
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
			Vector<ServerThread> lectures = new Vector<ServerThread>();
			lectures.add(this);
			currLecture = new Game(gameName, players);
			//currently 1 player in it
			currGame.setNum(1);
			//add to gamelist
			games.add(currGame);
			//update server
			sr.setGames(games);
			
		}
		
		public void run() {
			try {
				while(true)
				{
					Message msg = (Message)ois.readObject();
					
					
				}
			} catch (IOException ioe){
				System.out.println("ioe in ServerThread.run(): " + ioe.getMessage());
				sr.removeServerThread(this);
			} catch (ClassNotFoundException cnfe) {
				System.out.println("cnfe: " + cnfe.getMessage());
			}
		}
	}
