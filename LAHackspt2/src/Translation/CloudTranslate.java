package Translation;

//Imports the Google Cloud client library
import com.google.cloud.translate.Translate;
import com.google.cloud.translate.Translate.TranslateOption;
import com.google.cloud.translate.TranslateOptions;
import com.google.cloud.translate.Translation;

public class CloudTranslate {

	
	public static String translateText(String text, String inputCode, String outputCode) {
		 // Instantiates a client
		 Translate translate = TranslateOptions.getDefaultInstance().getService();

		 // Translates some text into Russian
		 Translation translation =
		     translate.translate(
		         text,
		         TranslateOption.sourceLanguage(inputCode),
		         TranslateOption.targetLanguage(outputCode));

		 return translation.getTranslatedText();
	}
		
	
	
	public static void main(String... args) throws Exception {
			 System.out.println(translateText("Guten tag","de","en"));
		}
	
}