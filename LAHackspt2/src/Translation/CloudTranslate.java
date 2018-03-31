package Translation;

//Imports the Google Cloud client library
import com.google.cloud.translate.Translate;
import com.google.cloud.translate.Translate.TranslateOption;
import com.google.cloud.translate.TranslateOptions;
import com.google.cloud.translate.Translation;

public class CloudTranslate {
		


	public static String translatePlz(String toTranslate,String inputCode, String outputCode) {
		 // Instantiates a client
		 Translate translate = TranslateOptions.getDefaultInstance().getService();

		 // Translates some text into Russian
		 Translation translation =
		     translate.translate(
		         toTranslate,
		         TranslateOption.sourceLanguage(inputCode),
		         TranslateOption.targetLanguage(outputCode));

		 
		 //System.out.printf("Text: %s%n", text);
		 //System.out.printf("Translation: %s%n", translation.getTranslatedText());
		 return translation.getTranslatedText();
	}
		
	
	
	public static void main(String... args) throws Exception {
			 System.out.println(translatePlz("Guten tag","de","en"));
		}
	
}