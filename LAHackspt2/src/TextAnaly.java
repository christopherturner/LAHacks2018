
// Imports the Google Cloud client library
import java.io.IOException;

import com.google.cloud.language.v1.Document;
import com.google.cloud.language.v1.Document.Type;
import com.google.cloud.language.v1.LanguageServiceClient;
import com.google.cloud.language.v1.Sentiment;

public class TextAnaly {

	public void getSentiment(String text) {
		try (LanguageServiceClient language = LanguageServiceClient.create()) {

			// The text to analyze
			Document doc = Document.newBuilder().setContent(text).setType(Type.PLAIN_TEXT).build();

			// Detects the sentiment of the text
			Sentiment sentiment = language.analyzeSentiment(doc).getDocumentSentiment();

			System.out.printf("Text: %s%n", text);
			System.out.printf("Sentiment: %s, %s%n", sentiment.getScore(), sentiment.getMagnitude());
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public static void main(String... args) throws Exception {
		// Instantiates a client
		TextAnaly ta = new TextAnaly();
		String text = "Hello, world!";
		
		ta.getSentiment(text);
	}
}