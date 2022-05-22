<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="model.*"%>
<%@page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset="UTF-8">

<title>會員資料</title>
<meta name="description" content="dashboard">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/style.css">
	
<style>
	img {
  		object-fit: cover;
  		width:70px;
  		height:70px;
	}
	h1{
	text-align: center
	}
	
/* 	.btn-round { */
/* 		border-radius: 50% */
/* 	} */
</style>

</head>
<body>
<%
List<JdbcData> memberDatas = (List<JdbcData>)request.getAttribute("memberDatas");
%>
<%@include file="jspf/sidebar.jspf"%>
	<main id="right-panel" class="right-panel">
		<div class="breadcrumbs">
			<div class="breadcrumbs-inner">
				<div class="row m-0">
					<div class="col-sm-4">
						<div class="page-header float-left">
							<div class="page-title">
								<h1>會員資料管理</h1>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="float-end mb-3">
		<div class="content">
			<div class="row justify-content-center">
				<div class="col-sm-12">
					<div class="card">
						<div class="card-header py-3">
							<strong class="card-title">會員列表</strong>
						</div>
					<div class="card-body">
			<div class="float-end mb-3">

				<form name="form" action="member" method="POST">

					<button type="submit" name="action" value="new"
						class="btn btn-sm btn-warning rounded-pill">新增會員資料</button>
					
					<button type="submit" name="action" value="query"
						class="btn btn-sm btn-warning rounded-pill">查詢</button>
					
				</form>
			</div>
			<table class="table  table-hover">
								<thead>
									<tr>
										<th>會員編號</th>
										<th>E-mail</th>
										<th>中文姓名</th>
										<th>英文姓名</th>
										<th>密碼</th>
										<th>性別</th>
										<th>生日</th>
										<th>電話</th>
										<th>縣市</th>
										<th>地區</th>
										<th>完整地址</th>
										<th>管理</th>
									</tr>
								</thead>
								<tbody>
									<%
									for (JdbcData memData: memberDatas) {
									%>
									<form name="form" action="member" method="POST">
										<tr>
											<input type="hidden" name="user_no" value="<%=memData.getUser_no()%>">
											<td><%=memData.getUser_no()%></td>
											<td><%=memData.getEmail()%></td>
											<td><%=memData.getCh_name()%></td>
											<td><%=memData.getEn_name()%></td>
											<td><%=memData.getPassword()%></td>
											<td><%=memData.getGender()%></td>
											<td><%=memData.getBirthday()%></td>
											<td><%=memData.getPhone()%></td>
											<td><%=memData.getCity()%></td>
											<td><%=memData.getLocation()%></td>
											<td><%=memData.getAddress()%></td>
											
											<td><button type="submit" name="action" value="edit" class="btn btn-outline-warning btn-sm rounded-circle"
													onclick="href='./MemberServlet?UpdateNo=<%=memData.getUser_no()%>'">
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
	</div>

	</main>
	
	<%-- Scripts --%>

	<script src="<%=request.getContextPath()%>/js/jquery-3.6.0.js"></script>
	<script src="<%=request.getContextPath()%>/js/plugins.js"></script>
	<script src="<%=request.getContextPath()%>/js/main.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>