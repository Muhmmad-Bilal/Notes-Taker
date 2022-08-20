package com.servlets;

import java.io.IOException;



import org.hibernate.Session;
import org.hibernate.Transaction;

import com.entities.Note;
import com.helper.FactoryProvider;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


/**
 * Servlet implementation class UpdateNoteServlet
 */
public class UpdateNoteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

   
    public UpdateNoteServlet() {
        // TODO Auto-generated constructor stub
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	try
	{
		String title=request.getParameter("title");
		String content=request.getParameter("content");
		int noteId=Integer.parseInt(request.getParameter("noteId").trim());
		Session s=FactoryProvider.getFactory().openSession();
		Transaction txt=s.beginTransaction();
		Note note=(Note)s.get(Note.class, noteId);
		note.setTitle(title);
		note.setContent(content);
		note.setAddDate(new java.util.Date());
		txt.commit();
		
		s.close();
		response.sendRedirect("all_notes.jsp");
		
	}catch(Exception e)
	{
		e.printStackTrace();
	}
		
	}

}
