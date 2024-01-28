<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Notes | JustDoeIt</title>
<%@include file="all_js_css.jsp"%>
</head>
<body>
	<div class="container">
		<%@include file="navbar.jsp"%>
		<br>
		<h1>Add Notes</h1>
		<br>

		<!-- This form is used to add Notes -->
		<form action="SaveNoteServlet" method="post">
			<div class="form-group">
				<label for="title">Title</label> 
				<input name = "title" type="text"
					class="form-control" id="title" aria-describedby="emailHelp"
					placeholder="Enter title" required>
			</div>
			<div class="form-group">
				<label for="content">Note</label>
				<textarea name = "content" id="content" class="form-control" placeholder="Enter note"
					style="height: 150px;" required></textarea>
			</div>
			<div class="container text-center">
				<button type="submit" class="btn primary-background text-white">Add</button>
			</div>
		</form>
	</div>
</body>
</html>