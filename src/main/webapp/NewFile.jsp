<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="model.*"%>
<%@page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<%
List<Comment> comments = (List<Comment>) request.getAttribute("comments");
%>
</head>
<body>
	<div align="center">
		<h1>Hello</h1>
		<div class="card-body">
			<table id="bootstrap-data-table"
				class="table table-striped table-bordered">
				<thead>
					<tr>
						<th>評論ID</th>
						<th>項目類別</th>
						<th>項目ID</th>
						<th>使用者ID</th>
						<th>評論日期</th>
						<th>評分</th>
						<th>評論內容</th>
						<th>管理</th>
					</tr>
				</thead>
				<tbody>
					<%
					for (Comment comment : comments) {
					%>
					<tr>
						<td><%=comment.getComId()%></td>
						<td><%=comment.getItemTb()%></td>
						<td><%=comment.getItemId()%></td>
						<td><%=comment.getUserId()%></td>
						<td><%=comment.getComDate()%></td>
						<td><%=comment.getRate()%></td>
						<td><%=comment.getContent()%></td>
						<td><a href="/>">Edit</a> <a href="/>">Delete</a></td>
					</tr>
					<%
					}
					%>
					<tr>
						<td>Tiger Nixon</td>
						<td>System Architect</td>
						<td>Edinburgh</td>
						<td>$320,800</td>
					</tr>

				</tbody>
			</table>
		</div>
		<!-- <img src="data:image/jpg;base64,${book.base64Image}" width="240" height="300"/> -->
	</div>
</body>
</html>