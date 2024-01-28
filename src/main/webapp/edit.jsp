<%@page import="com.justdoeit.entities.JustDoeIt"%>
<%@page import="org.hibernate.Session"%>
<%@page import="com.justdoeit.helper.FactoryProvider"%>

<!-- This is another way to import in jsp  -->
<%-- 
	<%@page import="org.hibernate.*, com.justdoeit.*, com.justdoeit.helper.*" %>
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit | JustDoeIt</title>
<%@include file="all_js_css.jsp"%>
</head>
<body>
	<div class="container">
		<%@include file="navbar.jsp"%>
		<br>
		<h1>Edit</h1>
		<br>
		
		<%
			int noteId = Integer.parseInt(request.getParameter("note_id").trim());
			Session sessionFactory = FactoryProvider.getSessionFactory().openSession();

			JustDoeIt justdoeit = (JustDoeIt) sessionFactory.get(JustDoeIt.class, noteId);
		%>
		<form action="EditServlet" method="post">
			
			<input value="<%= justdoeit.getId() %>" name="noteId" type="hidden" />
		
			<div class="form-group">
				<label for="title">Title</label> 
				<input name = "title" type="text"
					class="form-control" id="title" aria-describedby="emailHelp"
					placeholder="Enter title" value="<%= justdoeit.getTitle() %>" required>
			</div>
			<div class="form-group">
				<label for="content">Note</label>
				<textarea name = "content" id="content" class="form-control" placeholder="Enter note"
					style="height: 150px;" required><%= justdoeit.getContent() %></textarea>
			</div>
			<div class="container text-center">
				<button type="submit" class="btn primary-background text-white">Save</button>
			</div>
		</form>
	</div>
</body>
</html>