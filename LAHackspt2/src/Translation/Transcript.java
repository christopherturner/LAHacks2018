package Translation;

import java.util.ArrayList;
import Translation.CloudTranslate;
import Translation.TranslationText;

public class Transcript {

	private ArrayList<TranslationText> transcript;
	private int size;
	
	public TranslationText getText(int pos) {
		return transcript.get(pos);
	}
	public String getTranslatedText(int pos, String lang) {
		return CloudTranslate.translateText(transcript.get(pos).getText(),
				transcript.get(pos).getLanguage(), lang);
	}
	public void addText(String text, String lang) {
		TranslationText tt = new TranslationText(text,lang);
		transcript.add(tt);
		size++;
	}
	public int getSize() {
		return this.size;
	}

}
