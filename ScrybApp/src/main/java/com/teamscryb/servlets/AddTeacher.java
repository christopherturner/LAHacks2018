package com.teamscryb.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.teamscryb.model.Database;
import com.teamscryb.model.Lecture;

/**
 * Servlet implementation class AddTeacher
 */
@WebServlet("/AddTeacher")
public class AddTeacher extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter(); 
		
		String buffer = "";
		String teacher = request.getParameter("teach");
		String lecture = request.getParameter("lecture");
		Lecture newLecture = new Lecture();
		newLecture.setTeacher(teacher);
		newLecture.setName(lecture);
		
		HttpSession session = request.getSession(false);
		Database DB = (Database) this.getServletConfig().getServletContext().getAttribute("database");
		if(DB == null)
		{
			System.out.println("HELP IT'S NULL");
			Database d = new Database();
			this.getServletConfig().getServletContext().setAttribute("database", (Database)d);
		}
		else {
			DB.addLecture(newLecture);
			this.getServletConfig().getServletContext().setAttribute("database", (Database)DB);
		}

		ArrayList<Lecture> lec = DB.getLectures();
		System.out.println("LECTURES");
		for(int i = 0; i < lec.size(); i++) {
			buffer += "NAME OF LECTURE:" + lec.get(i).getName();
			System.out.println("NAME OF LECTURE: " + lec.get(i).getName());
		}
		buffer += "HELLO?!";
		out.println(buffer);
		
	}
}
