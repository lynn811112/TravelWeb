
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="model.*"%>
<%@page import="java.util.*"%>

<!DOCTYPE html>
<html class="no-js" lang="">
<%@page import="model.*"%>
<%@page import="java.util.*"%>

<head>

<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>景點列表</title>
<meta name="description" content="dashboard">
<meta name="viewport" content="width=device-width, initial-scale=1">
<%-- style sheet (以下三個style sheet請記得link進來) --%>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/style.css">
<link rel="stylesheet"
	href="http://jqueryui.com/resources/demos/style.css">
<link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/css/select2.min.css" rel="stylesheet" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/js/select2.min.js"></script>
<!-- Select2 i18 中文翻譯 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/js/i18n/zh-TW.js"></script>

<style>

.font-family{
font-family: DFKai-sb;
}

.English-font{
font-family: Times New Roman;
}

.tableStyle {
	display: block;
 	white-space: nowrap; 
	word-wrap: break-word;
}

.table td, .table th {
    min-width: 100px;
}

. thead th,
.table-bordered thead td {
  border-bottom-width: 1px;
  width:100%;
  height:50px;
}

.textarea {
    border: none;
    background-color: transparent;
    resize: none;
    outline: none;
}

</style>
</head>
<body>
	<%-- side Bar (side bar請記得include進來) --%>
	<%@include file="jspf/sidebar.jspf"%>

	<%-- main--%>
	<main id="right-panel" class="right-panel font-family">
		<div class="breadcrumbs">
			<div class="breadcrumbs-inner">
				<div class="row m-0">
					<div class="page-header float-left">
						<div class="page-title">
							<h1>景點管理</h1>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		
		<c:if test="${view_pro != null}">
			<form action="Edit_view_pro" method="post" width="50%">
				<input type="hidden" name="prod_no"
					value="<c:out value='${view_pro.prod_no}' />" />
			</form>
		</c:if>
		<c:if test="${view_pro == null}">
			<form action="Save_view_pro" method="post" width="50%"></form>
		</c:if>

		<div class="content">
			<div class="row">
				<div class="col-md-12">
					<div class="card">
						<div class="card-header">
							<form name="form" action="insertView.jsp" method="POST">
								<input type="hidden" name="action" value="new"> 
								<input type="submit" name="action" value="new" id="" class="English-font">
							</form>
							<table class="table table-hover table-sm tableStyle table-bordered">
								<thead class="thead-dark">
									<tr>
										<th>商品編號</th>
										<th>商品名稱</th>
										<th >商品簡介</th>
										<th>營業日期</th>
										<th>營業起始時間</th>
										<th>營業結束時間</th>
										<th>電話</th>
										<th>國家</th>
										<th>城市</th>
										<th>地區</th>
										<th>地址</th>
										<th>票價</th>
										<!-- <th scope="col">圖片檔案</th> -->
										<!-- <th scope="col">圖片簡介</th> -->
									</tr>
								</thead>
								<tbody>
									<c:forEach var="view_pro" items="${list}">
										<tr>
											<td><c:out value="${view_pro.prod_no}" /></td>
											<td><c:out value="${view_pro.prod_name}" /></td>
											<td class="ellipsis">
												<textarea readonly rows="5" cols="30" class="textarea" style="white-space: normal">
													<c:out value="${view_pro.prod_Intro}" />
												</textarea>
											</td>
											<td><c:out value="${view_pro.open_week}" escapeXml="false" /></td>
											<td><c:out value="${view_pro.open_time}" /></td>
											<td><c:out value="${view_pro.end_time}" /></td>
											<td><c:out value="${view_pro.phone}" /></td>
											<td><c:out value="${view_pro.country}" /></td>
											<td><c:out value="${view_pro.city}" /></td>
											<td><c:out value="${view_pro.location}" /></td>
											<td class="ellipsis"><c:out value="${view_pro.address}" /></td>
											<td><c:out value="${view_pro.price}" /></td>
											<%-- <td><a href="Delete_view_pro?id=<c:out value='${view_pro.prod_no}'class="btn btn-outline-warning btn-sm" />">Delete</a></td> --%>
											<td><div style="float: left">
													<a href="Edit_view_pro?prod_no=<c:out value='${view_pro.prod_no}'/>">
														<i class="bi bi-pencil-square"></i>編輯
													</a>
													<br> 
													<a href="Delete_view_pro?prod_no=<c:out value='${view_pro.prod_no}'/>">
														<%--type="submit" name="action" value="Delete_view_pro" class="btn btn-outline-warning btn-sm"  --%>
														<i class="bi bi-trash3 "></i>刪除
													</a>
												</div></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</main>
	<%-- scripts --%>
	<script src="<%=request.getContextPath()%>/js/jquery-3.6.0.js"></script>
	<script src="<%=request.getContextPath()%>/js/plugins.js"></script>
	<script src="<%=request.getContextPath()%>/js/main.js"></script>
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	<script src="https://demeter.5fpro.com/tw/zipcode-selector.js"></script>

</body>