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
<style>

	img {
  		object-fit: cover;
  		width:70px;
  		height:70px;
	}
	
/* 	.btn-round { */
/* 		border-radius: 50% */
/* 	} */
</style>
</head>

<body>
	<%-- side Bar (side bar請記得include進來) --%>
	<%@include file="jspf/sidebar.jspf"%>

	<%-- main--%>
	<main id="right-panel" class="right-panel">
		<div class="breadcrumbs">
			<div class="breadcrumbs-inner">
<!-- 				<div class="row m-0"> -->
<!-- 					<div class="col-sm-4"> -->
						<div class="page-header float-left">
							<div class="page-title">
								<h1>評論管理</h1>
							</div>
						</div>
<!-- 					</div> -->
<!-- 				</div> -->
			</div>
		</div>

		<div class="content">
			<div class="row">
				<div class="col-sm-12">
					<div class="card">
						<div class="card-header py-3">
							<strong class="card-title">評論列表</strong>
						</div>
						<div class="card-body">
							<div class="float-end mb-3">
								
								<form name="form" action="comment" method="POST">
									
										<button type="submit" name="action" value="new" class="btn btn-sm btn-warning rounded-pill">新增評論</button>
										<button type="submit" name="action" value="new" class="btn btn-sm btn-warning rounded-pill">一鍵新增</button>
								
								</form>
							</div>
							<table class="table  table-hover">
								<thead>
									<tr>
										<th>#</th>
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
											<td><%=comment.getItemTb()%><%=comment.getItemId()%></td>
											<td><%=comment.getUserId()%></td>
											<td><%=comment.getComDate()%></td>
											<td><%=comment.getRate()%></td>
											<td><%=comment.getContent()%></td>
											<td>
												<% if (comment.getImage1() != null) { %>
													<img src="data:image/jpg;base64,<%=comment.getImage1()%>" class="rounded"/>
												<% } %>
												<% if (comment.getImage2() != null) { %>
													<img src="data:image/jpg;base64,<%=comment.getImage2()%>" class="rounded"/>
												<% } %>
												<% if (comment.getImage3() != null) { %>
													<img src="data:image/jpg;base64,<%=comment.getImage3()%>" class="rounded"/>
												<% } %>
<%-- 												<% if (comment.getImageStrs().size() >= 1) { %> --%>
<%-- 													<img src="data:image/jpg;base64,<%=comment.getImageStrs().get(0)%>" class="rounded"/> --%>
<%-- 												<% } %> --%>
<%-- 												<% if (comment.getImageStrs().size() >= 2) { %> --%>
<%-- 													<img src="data:image/jpg;base64,<%=comment.getImageStrs().get(1)%>" class="rounded"/> --%>
<%-- 												<% } %> --%>
<%-- 												<% if (comment.getImageStrs().size() >= 3) { %> --%>
<%-- 													<img src="data:image/jpg;base64,<%=comment.getImageStrs().get(2)%>" class="rounded"/> --%>
<%-- 												<% } %> --%>
											</td>
											<td><button type="submit" name="action" value="edit" class="btn btn-outline-warning btn-sm rounded-circle">
													<i class="bi bi-pencil-square"></i>
												</button>
												<button type="submit" name="action" value="delete" class="btn btn-outline-info btn-sm rounded-circle">
													<i class="bi bi-trash3"></i>
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
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>

</body>

</html>