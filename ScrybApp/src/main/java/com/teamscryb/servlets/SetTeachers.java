package com.teamscryb.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.teamscryb.model.Database;

/**
 * Servlet implementation class SetTeachers
 */
@WebServlet("/SetTeachers")
public class SetTeachers extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(true);
		if(this.getServletConfig().getServletContext().getAttribute("database") == null) {
			Database d = new Database();
			this.getServletConfig().getServletContext().setAttribute("database", (Database)d);
		}		
	}
}
