package com.teamscryb.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.teamscryb.translation.*;
import com.teamscryb.model.*;

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
    	String buffer = "";
		String lectureName = request.getParameter("lectureName");
		int textIndex = Integer.parseInt(request.getParameter("textIndex"));
		
		
		if (textIndex >= database.getLecture(lectureName).getSize()) return;
		
		PrintWriter out = response.getWriter();
		buffer += "<?xml version=\"1.0\" encoding=\"UTF-8\"?>";
		buffer += "<oText>";
		buffer += (database.getLecture(lectureName).getText(textIndex).getText());
		buffer += "</oText>";
		
		
		String originalLanguage = request.getParameter("oLang");
		String translateLanguage = request.getParameter("tLang");
		
		buffer += "<tText>";
		buffer += (CloudTranslate.translateText(database.getLecture(lectureName).getText(textIndex).getText(),
				originalLanguage, translateLanguage));
		buffer += "</tText>";
		
		out.println(buffer);
		
		
	}
}
