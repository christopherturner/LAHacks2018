
// Imports the Google Cloud client library
import java.io.IOException;
import java.util.ArrayList;
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

	private List<String> keyTerms = new ArrayList<>();
	
	public boolean existsInList(String term) {
		for(int i = 0; i < keyTerms.size(); i++) {
			if (keyTerms.get(i).equals(term)) {
				return true;
			}
		}
		return false;
	}
	
	public List<String> getKeyTerms(){
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

//				System.out.println("Metadata: ");
				for (Map.Entry<String, String> entry : entity.getMetadataMap().entrySet()) {
//					System.out.printf("%s : %s", entry.getKey(), entry.getValue());
				}
				for (EntityMention mention : entity.getMentionsList()) {
					//IF PROPER
					if(mention.getType().getNumber() == 1)
					{	
//						System.out.printf("Begin offset: %d\n", mention.getText().getBeginOffset());
						String content = mention.getText().getContent();
						System.out.println("Content: " + content);
						System.out.println("Type: " + mention.getType());
						if(!existsInList(content)) {
							keyTerms.add(content);
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
		String text = "Now, I’m going to ask you this question. Why are you here? That is to say, why should you, we, all of us, want to study these ancient Greeks? I think it’s reasonable for people who are considering the study of a particular subject in a college course to ask why they should. What is it about? What is it about the Greeks between the years that I mentioned to you that deserves the attention of people in the twenty-first century? I think the answer is to be found, or at least one answer — the truth is there are many answers — in that they are just terribly interesting, but that’s very much of a — what’s the word I want, the opposite of objective — subjective observation by me. So I would say, a less subjective one is that I believe that it comes from their position, that is to say, the position of the Greeks are at the most significant starting point of Western Civilization, which is the culture that most powerfully shapes not only the West but most of the world today. It seems to me to be evident that whatever its other characteristics, the West has created institutions of government and law that provide unprecedented freedom for its people. It has also invented a body of natural scientific knowledge and technological achievement that together make possible a level of health and material prosperity undreamed of in earlier times, and unknown outside the West and those places that have been influenced by the West. I think the Nobel Prize laureate, V.S. Naipaul, a man born in Trinidad, of Indian parents, was right, when he spoke of the modern world as our universal civilization shaped chiefly by the West.";

		ta.getSentiment(text);
		ta.getEntity(text);
		
		System.out.println("KEY TERMS: ");
		for(int i = 0; i < ta.getKeyTerms().size(); i++) {
			System.out.println(ta.getKeyTerms().get(i));
		}
	}
}