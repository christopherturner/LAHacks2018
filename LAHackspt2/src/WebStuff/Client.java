package WebStuff;

import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.net.Socket;
import java.util.Scanner;

public class Client extends Thread {
		ObjectInputStream ois = null;
		ObjectOutputStream oos = null;

		public Client (String hostname, int port) {
			Socket s = null;
			Scanner in= new Scanner (System.in);
			
			boolean connected = false;
			
			while (!connected)
			{	
				try {
					s= new Socket(hostname, port);
					System.out.println("Connected to " + hostname + ":" + port);
					ois = new ObjectInputStream(s.getInputStream());
					oos = new ObjectOutputStream(s.getOutputStream());
					connected = true;
					
				} catch (IOException ioe) {
					System.out.println("Unable to Connect!");
					System.out.println("Please enter an IP address");
					hostname = in.nextLine();
					System.out.println("Please enter a port");
					port = in.nextInt();
				}
			}	
			this.start();
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
		
		public void run() {
			Scanner in= new Scanner (System.in);
			
			while(true) {
				try {
					Message m = (Message) ois.readObject();
					
				} catch (IOException | ClassNotFoundException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		public static void main (String [] args) {
			Scanner scan= new Scanner (System.in);
			String hostname = null;
			int port;
			
			System.out.println("Please enter an IP address");
			hostname = scan.nextLine();
			System.out.println("Please enter a port");
			port = scan.nextInt();
			Client c = new Client(hostname, port);		
		}
}
