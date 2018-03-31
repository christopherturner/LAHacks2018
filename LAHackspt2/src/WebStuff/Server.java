package WebStuff;

import java.io.IOException;
import java.net.ServerSocket;
import java.net.Socket;
import java.util.Scanner;
import java.util.Vector;

public class Server {
	private Vector<ServerThread> students;	
	private Vector<String> lectures = new Vector<String>();


	public Vector<String> getLectures(){
		return lectures;
	}
	
	public void setLecture(Vector<String> lectures){
		this.lectures= lectures;
	}
	
	
	public Server(String fileName, int port) {
				
		boolean connected = false;
		ServerSocket ss = null;
		Scanner in = new Scanner(System.in);
		
		while (!connected)
		{
			try {
				ss = new ServerSocket(port);
				System.out.println("Success!");
				connected = true;
				
			}catch (IOException ioe)
			{
				//ask user again for port number
				System.out.println("Invalid Port");
				System.out.println("Please enter a valid port");
				port = in.nextInt();
				new Server(fileName, port);
			}
		}
		
		students = new Vector<ServerThread>();
		
		while (true) {
			
			try {
				System.out.println("Waiting for connection...");
				Socket s;
				s = ss.accept();
				System.out.println("Connection from " + s.getInetAddress());
				ServerThread st = new SeverThread(s, this);
				students.add(st);
								
			} catch (IOException ioe) {
				System.out.println("ioe in Server constructor: " + ioe.getMessage());

			} 
			
		}
	}
	
	public static void sendMessage(Message msg, ObjectOutputStream oos)
	{
		try {
			oos.writeObject(msg);
			oos.flush();
		}catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public void removeServerThread(ServerThread st)
	{
		serverThreads.remove(st);
	}

	public static void main (String [] args) {
		System.out.println("Please enter a valid file");
		
		Scanner in = new Scanner(System.in);
		String fileName = null;
		fileName = in.nextLine();

		System.out.println("Please enter a valid port");
		int port;
		port = in.nextInt();
		new Server(fileName, port);
	}
}
