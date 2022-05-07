<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="model.*"%>
<%@page import="java.util.*"%>

<!doctype html>
<html class="no-js" lang="">

<head>

	<%
	List<Comment> comments = (List<Comment>) request.getAttribute("comments");
	%>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
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
										<form action="./CommentServlet">
											<input type="submit" name="action" value="query" id="">評論列表
											<input type="submit" name="action" value="insert" id="">新增評論
										</form>
									</div>
								</div>
							</div>
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