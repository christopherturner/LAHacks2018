package com.teamscryb.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.teamscryb.analysis.KNote;
import com.teamscryb.analysis.TextAnaly;

/**
 * Servlet implementation class GetText
 */
@WebServlet("/GetAnalysis")
public class GetAnalysis extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		TextAnaly ta = new TextAnaly();
		String text = request.getParameter("text");
//		String text = "The Impact of Viking Raids For these reasons, Viking became a word of terror for the people of Northern Europe, and many historians tend to treat Vikings as mere disruptions to civilization. Yet it was in this disruptive role that the Vikings had, perhaps, their most profound impact on Western civilization. The Vikings essentially turned the tide in Europe from centralized imperialism to decentralized feudalism. Viking raids began stepping up around the end of the 8th century, just as Charlemagne was trying to unite Europe into the Carolingian Empire. This centralized empire was not suitable to deal with the amphibious raids of the Vikings. Try as he might, Charlemagne could not possibly hope to defend thousands of miles of coastline from Viking invasions. Moreover, since the shallow Viking longships could travel upriver, not even the inland empire was safe, as the Vikings proved quite clearly a century later by laying siege to Paris in 885. Charlemagne's empire was so short-lived because it could not provide the most basic services an empire is supposed to provide its subjects: peace and protection. As Charlemagne's empire fell apart, Europeans needed to find a new way to protect themselves against these Viking raiders, something local and small enough to be responsive but powerful enough to protect the people and their property.";
		ta.getSentiment(text);
		ta.getEntity(text);
		ta.getSyntax(text);
		ta.classifyText(text);
		
		System.out.println("Classification: " + ta.getKeyNotes().getClassification());
		ta.getKeyNotes().print();
		
		//PrintWriter out sends data to the front
		PrintWriter out = response.getWriter(); //send client-side code back to browser
		
		//send classification
		out.println("<div id = \"keyterms\" class = \"center\">");
		out.println("<span class = \"title\">Terms from this lecture</span><br>");
		out.println("Class category: <span class = \"italic\">" + ta.getKeyNotes().getClassification()+"<br>");
		
		out.println("<br>");
		
		List<KNote> LKN = ta.getKeyTerms();
		
		for(int i = 0; i < LKN.size(); i++) {
			out.println(LKN.get(i).getTerm());
			out.println("<br>");
		}
		out.println("<div>");
		out.flush();
		out.close();
	}
}
