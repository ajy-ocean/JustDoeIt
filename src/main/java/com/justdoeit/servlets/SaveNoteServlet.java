package com.justdoeit.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.justdoeit.entities.JustDoeIt;
import com.justdoeit.helper.FactoryProvider;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class SaveNoteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public SaveNoteServlet() {
		super();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			// Fetching Notes Title & Content from the FORM
			String title = request.getParameter("title");
			String content = request.getParameter("content");

			JustDoeIt justDoeIt = new JustDoeIt(title, content, new Date());

			// Saving into database using Hibernate
			Session session = FactoryProvider.getSessionFactory().openSession();
			Transaction transaction = session.beginTransaction();
			session.save(justDoeIt);

			transaction.commit();
			session.close();

			response.setContentType("text/html");
			PrintWriter out = response.getWriter();
			out.println("<h1 style='text-align:center'>Your Note Saved Successfully</h1>");
			out.println("<h1 style='text-align:center'><a href='all_notes.jsp'>View All Notes</a></h1>");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}