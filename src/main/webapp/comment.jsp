<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="model.*"%>
<%@page import="java.util.*"%>

<!doctype html>
<html class="no-js" lang="">

<head>

<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>評論列表</title>
<%-- style sheet (以下三個style sheet請記得link進來) --%>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/style.css">
<!-- <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.12.0/css/jquery.dataTables.css"> -->
<style>
	img {
  		object-fit: cover;
  		width:70px;
  		height:70px;
	}	
	
 	table a { 
 		color: black; 
 		font-weight: bold; 
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
							<table id="table_id" class="display table table-hover" style="width: 100%">
							    <colgroup>
							       <col span="1" style="width: 4%;">
							       <col span="1" style="width: 15%;">
							       <col span="1" style="width: 10%;">
							       <col span="1" style="width: 10%;">
							       <col span="1" style="width: 5%; ">
							       <col span="1" style="width: 25%;">
							       <col span="1" style="width: 23%;">
							       <col span="1" style="width: 8%;">
							    </colgroup>
								<thead>
									<tr class="text-center">
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
									List<Comment> comments = (List<Comment>)request.getAttribute("comments");
									for (Comment comment : comments) {
									%>
									<form name="form" action="comment" method="POST">
										<tr>
											<input type="hidden" name="comId" value="<%=comment.getComId()%>">
											<th scope="row" class="text-center"><%=comment.getComId()%></th>
											<th>
											  <a class="" data-bs-toggle="collapse" href="#collapseExample<%=comment.getComId()%>" role="button" aria-expanded="false" aria-controls="collapseExample">
											    <%=comment.getItemTb()%>_<%=comment.getItemId()%> <i class="bi bi-chevron-down"></i>
											  </a>
											</th>
											<td><%=comment.getUserId()%></td>
											<td><%=comment.getComDate()%></td>
											<td  style="text-align: center;"><%=comment.getRating()%><i class="bi bi-star-fill text-warning"></i></td>
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

											</td>
											<td><button type="submit" name="action" value="edit" class="btn btn-outline-warning btn-sm rounded-circle">
													<i class="bi bi-pencil-square"></i>
												</button>
												<button type="submit" name="action" value="delete" class="btn btn-outline-info btn-sm rounded-circle">
													<i class="bi bi-trash3"></i>
												</button>
											</td>
										</tr>
<!-- 										<div class="collapse" id="collapseExample"> -->
										<tr class="collapse" id="collapseExample<%=comment.getComId()%>">
											<td></td>
											<td colspan="6">
												<p>
													Some placeholder content for the collapse component. This panel is hidden by default but revealed when the user activates the relevant trigger.
												</p>
											</td>
											<td></td>
										</tr>
<!-- 										</div> -->
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

    <script src="js/jquery-3.6.0.js"></script>
	<script src="js/plugins.js"></script>
	<script src="js/main.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- 	<script src="https://cdn.datatables.net/1.12.0/js/jquery.dataTables.js"></script> -->

</body>

</html>