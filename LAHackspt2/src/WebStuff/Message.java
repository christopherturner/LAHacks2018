package WebStuff;

public class Message {
	private static final long serialVersionUID = 1L;
	private String lectureName;
	private String type = "";
	private String response = "";

	
	Message(String gameName, String type)
	{
		this.type = type;
	}
	
	
	public String getType() {
		return type;
	}
	
	public void setType(String type) {
		this.type = type;
	}
	
}
