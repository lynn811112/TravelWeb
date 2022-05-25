<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/style-comment.css">
<link href="https://cdn.jsdelivr.net/npm/@sweetalert2/theme-bootstrap-4/bootstrap-4.css" rel="stylesheet">
<!-- <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.12.0/css/jquery.dataTables.css"> -->
<style>
	.comId {
		text-decoration: underline;
	}
</style>
</head>

<body>
	<%-- side Bar (side bar請記得include進來) --%>
	<%@include file="jspf/sidebar.jspf"%>

	<%-- main--%>
	<main id="right-panel" class="right-panel">
		<div class="breadcrumbs">
			<div class="breadcrumbs-inner">
				<div class="page-header float-left">
					<div class="page-title">
						<h1>評論管理</h1>
					</div>
				</div>
			</div>
		</div>

		<div class="content">
			<div class="row">
				<div class="col-sm-12">
					<div class="card">
						<%-- card header --%>
						<div
							class="card-header d-flex justify-content-between align-baseline">
							<strong class="card-title align-middle py-2 m-0">評論列表</strong>
							<form name="form" action="comment" method="POST">
								<button type="submit" name="action" value="new"
									class="btn btn-sm btn-warning rounded-pill mx-2 mt-1">
									新增評論</button>
							</form>
						</div>
						<%-- card body : table --%>
						<div class="card-body">
							<table id="table_id" class="display table table-hover"
								style="width: 100%">
								<colgroup>
									<col span="1" style="width: 4%;">
									<col span="1" style="width: 12%;">
									<col span="1" style="width: 10%;">
									<col span="1" style="width: 10%;">
									<col span="1" style="width: 5%;">
									<col span="1" style="width: 27%;">
									<col span="1" style="width: 24%;">
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
									<%-- every row data is an individual form --%>
									<%
									List<Comment> comments = (List<Comment>) request.getAttribute("comments");
									for (Comment comment : comments) {
									%>
									<form name="form" action="comment" method="POST" id="form<%=comment.getComId()%>">
										<tr>
											<input type="hidden" name="comId" value="<%=comment.getComId()%>">
											<input type="hidden" name="itemTb" value="<%=comment.getItemTb()%>">
											<input type="hidden" name="itemId" value="<%=comment.getItemId()%>">
											<th scope="row" class="text-center"><%=comment.getComId()%></th>
											<th>
												<a class="comId" role="button" id="anchor<%=comment.getComId()%>">
											 		<%=comment.getItemTb()%>_<%=comment.getItemId()%>
												</a>
											</th>
											<td><%=comment.getUserId()%></td>
											<td><%=comment.getComDate()%></td>
											<td style="text-align: center;"><%=comment.getRating()%><i class="bi bi-star-fill text-warning"></i></td>
											<td><%=comment.getContent()%></td>
											<td>
												<%if (comment.getImage1() != null) { %> 
													<img src="data:image/jpg;base64,<%=comment.getImage1()%>" class="rounded" /> 
												<% } %> 
												<% if (comment.getImage2() != null) { %> 
													<img src="data:image/jpg;base64,<%=comment.getImage2()%>" class="rounded" /> 
												<% } %> 
												<% if (comment.getImage3() != null) { %> 
													<img src="data:image/jpg;base64,<%=comment.getImage3()%>" class="rounded" /> 
												<% } %>
											</td>
											<td style="padding-right: 0px">
												<button type="submit" name="action" value="edit" class="edit btn btn-outline-warning btn-sm rounded-circle">
													<i class="bi bi-pencil-square"></i>
												</button>
												<button type="button" class="delete btn btn-outline-info btn-sm rounded-circle ">
													<i class="bi bi-trash3"></i>
												</button>
												<button type="submit" name="action" value="delete" class="d-none">
													<i class="bi bi-trash3"></i>
												</button>
											</td>
										</tr>
										<%-- item info in collapse --%>
<%-- 										<tr class="collapse" id="collapseExample<%=comment.getComId()%>"> --%>
<!-- 											<td></td> -->
<!-- 											<td colspan="6"> -->
<%-- 												<div id="itemInfo<%=comment.getComId()%>">這邊顯示該商品資訊</div> --%>
<!-- 											</td> -->
<!-- 											<td></td> -->
<!-- 										</tr> -->

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

	<script src="<%=request.getContextPath()%>/js/jquery-3.6.0.js"></script>
	<script src="<%=request.getContextPath()%>/js/plugins.js"></script>
	<script src="<%=request.getContextPath()%>/js/main.js"></script>
	<script src="<%=request.getContextPath()%>/js/data.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- 	<script src="https://cdn.datatables.net/1.12.0/js/jquery.dataTables.js"></script> -->
	<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>

	<script>
		
		// 確認刪除提示
		const deleteButtons = document.querySelectorAll(".delete");
		deleteButtons.forEach(function (deleteButton) {
			deleteButton.addEventListener("click",function(e){
	 			e.preventDefault(); // 取消原始動作
	 			Swal.fire({
	 				title: '確定刪除?',
	 				text: "確認刪除後將不可復原",
	 				imageUrl: 'css/images/remote.svg',
	 				imageWidth: 155,
	 				imageHeight: 107,
	 				showCancelButton: true,
	 				confirmButtonColor: '#FF8D29',
	 				cancelButtonColor: '#FFCD38',
	 				confirmButtonText: '確認',
	 				cancelButtonText: '取消',
	 				reverseButtons: true
	 			}).then((result) => {
	 				if (result.isConfirmed) {
	 					e.target.parentNode.nextElementSibling.click();
	 				}
	 			})
			})

		})
		

		jQuery(document).ready(function($){
			$(function () {
				// 呈現該評論所屬商品之資訊
				<% for (Comment comment : comments) { %>
					$('#anchor<%=comment.getComId()%>').on('click', function findItem() {
						$.ajax({
							type: 'POST',
							url: 'findItem',
							dataType: 'json',
							data: {
								"itemTb": "<%=comment.getItemTb()%>",
								"itemId": <%=comment.getItemId()%>
							},
							success: function (response) {
								let str = JSON.stringify(response)
								let parsed = JSON.parse(str);
								let itemInfo = "商品資訊"
								if (String(parsed.tableName) == "住宿") {
									itemInfo = "商品項目：" + parsed.tableName +
										"<br>商品編號：" + parsed.itemId +
										"<br>商品名稱：" + parsed.itemName +
										"<br>商品價格：NT$" + parsed.price +
										"<br>賣家：　　" + parsed.owner +
										"<br>電話：　　" + parsed.phone;
								} else if (String(parsed.tableName) == "行程") {
									itemInfo = "商品項目：" + parsed.tableName +
										"<br>商品編號：" + parsed.itemId +
										"<br>商品名稱：" + parsed.itemName +
										"<br>商品價格：NT$" + parsed.price +
										"<br>電話：　　" + parsed.phone +
										"<br>地址：　　" + parsed.city + parsed.district + parsed.address +
										"<br>商品介紹：<br>" + parsed.info;
								}
								Swal.fire({
									html: '<div class="text-dark text-start small">' + itemInfo + '</div>',
									confirmButtonColor: '#FF8D29',
								})
							},
							error: function () {
								console.log('error')
							}
						})
		            })
				<% } %>
	        })
		})


	</script>

</body>

</html>