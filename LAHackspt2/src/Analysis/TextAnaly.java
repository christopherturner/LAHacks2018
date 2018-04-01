package Analysis;

// Imports the Google Cloud client library
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import java.util.Map;

import com.google.cloud.language.v1.AnalyzeEntitiesRequest;
import com.google.cloud.language.v1.AnalyzeEntitiesResponse;
import com.google.cloud.language.v1.AnalyzeSyntaxRequest;
import com.google.cloud.language.v1.AnalyzeSyntaxResponse;
import com.google.cloud.language.v1.ClassificationCategory;
import com.google.cloud.language.v1.ClassifyTextRequest;
import com.google.cloud.language.v1.ClassifyTextResponse;
import com.google.cloud.language.v1.Document;
import com.google.cloud.language.v1.Document.Type;
import com.google.cloud.language.v1.EncodingType;
import com.google.cloud.language.v1.Entity;
import com.google.cloud.language.v1.EntityMention;
import com.google.cloud.language.v1.LanguageServiceClient;
import com.google.cloud.language.v1.Sentiment;
import com.google.cloud.language.v1.Token;

public class TextAnaly {

	private KeyNotes KeyNotes = new KeyNotes();

	public KeyNotes getKeyNotes() {
		return KeyNotes;
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

	public void getSyntax(String text) {
		// Instantiate the Language client
		// com.google.cloud.language.v1.LanguageServiceClient
		try (LanguageServiceClient language = LanguageServiceClient.create()) {
			Document doc = Document.newBuilder().setContent(text).setType(Type.PLAIN_TEXT).build();
			AnalyzeSyntaxRequest request = AnalyzeSyntaxRequest.newBuilder().setDocument(doc)
					.setEncodingType(EncodingType.UTF16).build();
			// analyze the syntax in the given text
			AnalyzeSyntaxResponse response = language.analyzeSyntax(request);
			// print the response
			for (Token token : response.getTokensList()) {
				System.out.printf("\tText: %s\n", token.getText().getContent());
				System.out.printf("\tBeginOffset: %d\n", token.getText().getBeginOffset());
				System.out.printf("Lemma: %s\n", token.getLemma());
				System.out.printf("PartOfSpeechTag: %s\n", token.getPartOfSpeech().getTag());
				System.out.printf("\tAspect: %s\n", token.getPartOfSpeech().getAspect());
				System.out.printf("\tCase: %s\n", token.getPartOfSpeech().getCase());
				System.out.printf("\tForm: %s\n", token.getPartOfSpeech().getForm());
				System.out.printf("\tGender: %s\n", token.getPartOfSpeech().getGender());
				System.out.printf("\tMood: %s\n", token.getPartOfSpeech().getMood());
				System.out.printf("\tNumber: %s\n", token.getPartOfSpeech().getNumber());
				System.out.printf("\tPerson: %s\n", token.getPartOfSpeech().getPerson());
				System.out.printf("\tProper: %s\n", token.getPartOfSpeech().getProper());
				System.out.printf("\tReciprocity: %s\n", token.getPartOfSpeech().getReciprocity());
				System.out.printf("\tTense: %s\n", token.getPartOfSpeech().getTense());
				System.out.printf("\tVoice: %s\n", token.getPartOfSpeech().getVoice());
				System.out.println("DependencyEdge");
				System.out.printf("\tHeadTokenIndex: %d\n", token.getDependencyEdge().getHeadTokenIndex());
				System.out.printf("\tLabel: %s\n\n", token.getDependencyEdge().getLabel());
			}
			// return response.getTokensList();
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
					// IF PROPER
					if (mention.getType().getNumber() == 1) {
						String content = mention.getText().getContent();
						System.out.println("Content: " + content);
						System.out.println("Type: " + mention.getType());

						if (!KeyNotes.existsInList(content)) {
							KNote kn = new KNote(content, entity.getSalience());
							KeyNotes.addKNote(kn);
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

	public void classifyText(String text) {
		// Instantiate the Language client
		// com.google.cloud.language.v1.LanguageServiceClient
		try (LanguageServiceClient language = LanguageServiceClient.create()) {
			// set content to the text string
			Document doc = Document.newBuilder().setContent(text).setType(Type.PLAIN_TEXT).build();
			ClassifyTextRequest request = ClassifyTextRequest.newBuilder().setDocument(doc).build();
			// detect categories in the given text
			ClassifyTextResponse response = language.classifyText(request);

			for (ClassificationCategory category : response.getCategoriesList()) {
				System.out.printf("Category name : %s, Confidence : %.3f\n", category.getName(),
						category.getConfidence());
				KeyNotes.setClassification(category.getName());

			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public String getStringTerms() {
		return KeyNotes.getStringTerms();
	}
	
	public static void main(String... args) throws Exception {
		// Instantiates a client
		TextAnaly ta = new TextAnaly();
		String text = "The Impact of Viking Raids For these reasons, Viking became a word of terror for the people of Northern Europe, and many historians tend to treat Vikings as mere disruptions to civilization. Yet it was in this disruptive role that the Vikings had, perhaps, their most profound impact on Western civilization. The Vikings essentially turned the tide in Europe from centralized imperialism to decentralized feudalism. Viking raids began stepping up around the end of the 8th century, just as Charlemagne was trying to unite Europe into the Carolingian Empire. This centralized empire was not suitable to deal with the amphibious raids of the Vikings. Try as he might, Charlemagne could not possibly hope to defend thousands of miles of coastline from Viking invasions. Moreover, since the shallow Viking longships could travel upriver, not even the inland empire was safe, as the Vikings proved quite clearly a century later by laying siege to Paris in 885. Charlemagne's empire was so short-lived because it could not provide the most basic services an empire is supposed to provide its subjects: peace and protection. As Charlemagne's empire fell apart, Europeans needed to find a new way to protect themselves against these Viking raiders, something local and small enough to be responsive but powerful enough to protect the people and their property.";
		ta.getSentiment(text);
		ta.getEntity(text);
		ta.getSyntax(text);
		ta.classifyText(text);
		
		System.out.println("Classification: " + ta.getKeyNotes().getClassification());
		ta.getKeyNotes().print();

	}
}
