package com.justdoeit.servlets;

import java.io.IOException;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.justdoeit.entities.JustDoeIt;
import com.justdoeit.helper.FactoryProvider;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class DeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public DeleteServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			int noteId = Integer.parseInt(request.getParameter("note_id").trim());
			
			Session sessionFactory = FactoryProvider.getSessionFactory().openSession();
			Transaction transaction = sessionFactory.beginTransaction();
			
			JustDoeIt justdoeit= (JustDoeIt) sessionFactory.get(JustDoeIt.class, noteId);
			sessionFactory.delete(justdoeit);
			
			transaction.commit();
			sessionFactory.close();
			
			response.sendRedirect("all_notes.jsp");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
