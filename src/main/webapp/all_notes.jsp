<%@page import="com.justdoeit.entities.JustDoeIt"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.query.Query"%>
<%@page import="com.justdoeit.helper.FactoryProvider"%>
<%@page import="org.hibernate.Session"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>All Notes | JustDoeIt</title>
<%@include file="all_js_css.jsp"%>
</head>
<body>
	<div class="container">
		<%@include file="navbar.jsp"%>
		<br>
		<h1 class="text-uppercase">All Notes:</h1>

		<div class="row">
			<div class="col-12">
				<%
				Session allNotesSession = FactoryProvider.getSessionFactory().openSession();
				Query query = allNotesSession.createQuery("from JustDoeIt");
				List<JustDoeIt> listOfNotes = query.list();

				for (JustDoeIt note : listOfNotes) {
				%>
				<div class="card mt-3">
					<img class="card-img-top m-4 mx-auto" style="max-width:80px"  src="img/notes.png" alt="Card image cap">
					<div class="card-body px-5">
						<h5 class="card-title"><%= note.getTitle() %></h5>
						<p class="card-text">
							<%= note.getContent() %>
						</p>
						 <div class="container text-right mb-2">
                            <p><strong style="color:#860A35;">Date Added: <%= note.getDateAdded().toLocaleString() %></strong></p>
                        </div>
						<div class="container text-center mt-2">
							<a href="DeleteServlet?note_id=<%= note.getId() %>" class="btn btn-danger">Delete</a>
							<a href="edit.jsp?note_id=<%= note.getId() %>" class="btn primary-background text-white">Edit</a>
						</div>
					</div>
				</div>
				<%
				}
				
				allNotesSession.close();
				%>
			</div>
		</div>
	</div>
</body>
</html>

