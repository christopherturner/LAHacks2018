package com.teamscryb.analysis;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

public class KeyNotes {
	private List<KNote> keyTerms = new ArrayList<>();
	String classification;
	
	public KeyNotes() {

	}
	public void setClassification(String c) {
		classification = c;
	}
	public void addKNote(KNote kn) {
		keyTerms.add(kn);
	}
	public List<KNote> getKeyTerms() {
		return keyTerms;
	}
	public String getClassification() {
		return classification;
	}
	public boolean existsInList(String term) {
		for(int i = 0; i < keyTerms.size(); i++) {
			if (keyTerms.get(i).getTerm().equals(term)) {
				return true;
			}
		}
		return false;
	}
	public void sort() {
		Collections.sort(keyTerms, new sortSalience());
	}
	public void print() {
		for(int i = 0; i < keyTerms.size(); i++) {
			System.out.println(keyTerms.get(i).getTerm() + " " + keyTerms.get(i).getSalience());
		}
	}
	public String getStringTerms() {
		Collections.sort(keyTerms, new sortSalience());
		String allTerms = "";
		for(int i = 0; i < keyTerms.size(); i++) {
			allTerms += keyTerms.get(i).getTerm() + "\n";
		}
		return allTerms;
	}
}

class sortSalience implements Comparator<KNote>
{
	@Override
	public int compare(KNote a, KNote b)
    {
		if (a.getSalience() > b.getSalience()) {
			return -1;
		}
		return 1;
    }
}
