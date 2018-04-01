package servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Translation.CloudTranslate;
import model.Database;

/**
 * Servlet implementation class GetText
 */
@WebServlet("/GetText")
public class GetText extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetText() {
        super();
        // TODO Auto-generated constructor stub
        
        
        
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
    	Database database = Database.getInstance();
    	
		int lectureIndex = Integer.parseInt(request.getParameter("lecture-index"));
		int textIndex = Integer.parseInt(request.getParameter("text-index"));
		
		PrintWriter out = response.getWriter();
		out.append("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
		out.append("<o-text>");
		out.append(database.getLecture(lectureIndex).getText(textIndex).getText());
		out.append("</o-text>");
		
		
		String originalLanguage = request.getParameter("o-lang");
		String translateLanguage = request.getParameter("t-lang");
		
		out.append("<t-text>");
		out.write(CloudTranslate.translateText(database.getLecture(lectureIndex).getText(textIndex).getText(),
				originalLanguage, translateLanguage));
		out.append("</t-text>");
		
		
	}
}
