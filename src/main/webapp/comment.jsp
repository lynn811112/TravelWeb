<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="model.*"%>
<%@page import="java.util.*"%>

<!doctype html>
<html class="no-js" lang="">

<head>
<%
List<Comment> comments = (List<Comment>)request.getAttribute("comments");
%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>評論列表</title>
<meta name="description" content="dashboard">
<meta name="viewport" content="width=device-width, initial-scale=1">
<%-- style sheet (以下三個style sheet請記得link進來) --%>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css">
</head>

<body>
	<%-- side Bar (side bar請記得include進來) --%>
	<%@include file="jspf/sidebar.jspf"%>


	<%-- main--%>
<%-- 	<jsp:useBean id="commentDAO" class="dao.CommentDAO" /> --%>
<%-- 	<jsp:useBean id="comment" class="model.Comment" /> --%>
<%-- 	<jsp:setProperty name="comment" property="*" /> --%>

	<main id="right-panel" class="right-panel">
		<div class="breadcrumbs">
			<div class="breadcrumbs-inner">
				<div class="row m-0">
					<div class="page-header float-left">
						<div class="page-title">
							<h1>評論管理</h1>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="content">
			<div class="row">
				<div class="col-md-12">
					<div class="card">
						<div class="card-header">
							<strong class="card-title">評論列表</strong>
							<div class="float-right">
								<div class="page-title">
									<div class="float-right">
										<form name="form" action="comment" method="POST">
											<!-- <form name="AddForm" action="CommentServlet" method="POST">  -->
												<input type="hidden" name="action" value="new"> 
												<input type="submit" name="action" value="new" id="">
										</form>
									</div>
								</div>
							</div>
						</div>
						<div class="card-body">
							<table class="table  table-hover">
								<thead>
									<tr>
										<th>評論ID</th>
										<th>項目類別</th>
										<th>項目ID</th>
										<th>使用者ID</th>
										<th>評論日期</th>
										<th>評分</th>
										<th>評論內容</th>
										<th>照片</th>
										<th>管理</th>
									</tr>
								</thead>
								<tbody>
									<%
									for (Comment comment : comments) {
									%>
									<form name="form" action="comment" method="POST">
										<tr>
											<input type="hidden" name="comId" value="<%=comment.getComId()%>">
											<th scope="row"><%=comment.getComId()%></th>
											<td><%=comment.getItemTb()%></td>
											<td><%=comment.getItemId()%></td>
											<td><%=comment.getUserId()%></td>
											<td><%=comment.getComDate()%></td>
											<td><%=comment.getRate()%></td>
											<td><%=comment.getContent()%></td>
											<td><button type="submit" name="action" value="edit" class="btn btn-outline-warning btn-sm">
													<i class="bi bi-pencil-square"></i>編輯
												</button>
												<button type="submit" name="action" value="delete" class="btn btn-outline-warning btn-sm">
													<i class="bi bi-trash3"></i>刪除
												</button>
											</td>
										</tr>
									</form>
									<%
									}
									%>
								</tbody>
							</table>

						</div>
					</div>
				</div>
			</div>
		</div>
	</main>

	<%-- Scripts --%>
	<script src="js/vendor/jquery-2.1.4.min.js"></script>
	<script src="js/plugins.js"></script>
	<script src="js/main.js"></script>


</body>

</html>