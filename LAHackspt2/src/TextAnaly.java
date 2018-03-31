
// Imports the Google Cloud client library
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import java.util.Map;

import com.google.cloud.language.v1.AnalyzeEntitiesRequest;
import com.google.cloud.language.v1.AnalyzeEntitiesResponse;
import com.google.cloud.language.v1.Document;
import com.google.cloud.language.v1.Document.Type;
import com.google.cloud.language.v1.EncodingType;
import com.google.cloud.language.v1.Entity;
import com.google.cloud.language.v1.EntityMention;
import com.google.cloud.language.v1.LanguageServiceClient;
import com.google.cloud.language.v1.Sentiment;

public class TextAnaly {

	private List<KeyNotes> keyTerms = new ArrayList<>();
	
	public boolean existsInList(String term) {
		for(int i = 0; i < keyTerms.size(); i++) {
			if (keyTerms.get(i).getTerm().equals(term)) {
				return true;
			}
		}
		return false;
	}
	
	public List<KeyNotes> getKeyTerms(){
		return keyTerms;
	}
	
	public void getSentiment(String text) {
		try (LanguageServiceClient language = LanguageServiceClient.create()) {

			// The text to analyze
			Document doc = Document.newBuilder().setContent(text).setType(Type.PLAIN_TEXT).build();

			// Detects the sentiment of the text
			Sentiment sentiment = language.analyzeSentiment(doc).getDocumentSentiment();
			// Detects the entity of the text

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

	public void getEntity(String text) {
		// Instantiate the Language client
		// com.google.cloud.language.v1.LanguageServiceClient
		// Instantiate the Language client
		// com.google.cloud.language.v1.LanguageServiceClient
		try (LanguageServiceClient language = LanguageServiceClient.create()) {
			Document doc = Document.newBuilder().setContent(text).setType(Type.PLAIN_TEXT).build();
			AnalyzeEntitiesRequest request = AnalyzeEntitiesRequest.newBuilder().setDocument(doc)
					.setEncodingType(EncodingType.UTF16).build();

			AnalyzeEntitiesResponse response = language.analyzeEntities(request);

			// Print the response
			for (Entity entity : response.getEntitiesList()) {
				// System.out.printf("\nEntity: %s", entity.getName());
				// System.out.printf("\nSalience: %.3f\n", entity.getSalience());

				for (EntityMention mention : entity.getMentionsList()) {
					//IF PROPER
					if(mention.getType().getNumber() == 1)
					{	
						String content = mention.getText().getContent();
						System.out.println("Content: " + content);
						System.out.println("Type: " + mention.getType());
						if(!existsInList(content)) {
							KeyNotes kn = new KeyNotes(content, entity.getSalience());
							keyTerms.add(kn);
						}
					}
				}
			}
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
		String text = "The Impact of Viking Raids For these reasons, Viking became a word of terror for the people of Northern Europe, and many historians tend to treat Vikings as mere disruptions to civilization. Yet it was in this disruptive role that the Vikings had, perhaps, their most profound impact on Western civilization. The Vikings essentially turned the tide in Europe from centralized imperialism to decentralized feudalism. Viking raids began stepping up around the end of the 8th century, just as Charlemagne was trying to unite Europe into the Carolingian Empire. This centralized empire was not suitable to deal with the amphibious raids of the Vikings. Try as he might, Charlemagne could not possibly hope to defend thousands of miles of coastline from Viking invasions. Moreover, since the shallow Viking longships could travel upriver, not even the inland empire was safe, as the Vikings proved quite clearly a century later by laying siege to Paris in 885. Charlemagne's empire was so short-lived because it could not provide the most basic services an empire is supposed to provide its subjects: peace and protection. As Charlemagne's empire fell apart, Europeans needed to find a new way to protect themselves against these Viking raiders, something local and small enough to be responsive but powerful enough to protect the people and their property.";
		ta.getSentiment(text);
		ta.getEntity(text);
		
		Collections.sort(ta.getKeyTerms(), new sortSalience());
		
		System.out.println("KEY TERMS: ");
		for(int i = 0; i < ta.getKeyTerms().size(); i++) {
			System.out.println(ta.getKeyTerms().get(i).getTerm() + " " + ta.getKeyTerms().get(i).getSalience());
		}
	}
}

class sortSalience implements Comparator<KeyNotes>
{
	public int compare(KeyNotes a, KeyNotes b)
    {
		if (a.getSalience() > b.getSalience()) {
			return -1;
		}
		return 1;
    }
}