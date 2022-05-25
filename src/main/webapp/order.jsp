<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="model.OrderBean"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html class="no-js" lang="">

<head>

<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>後台管理</title>
<meta name="description" content="dashboard">
<meta name="viewport" content="width=device-width, initial-scale=1">
<%-- style sheet (以下三個style sheet請記得link進來) --%>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/style.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.10.3/sweetalert2.css" />
<%-- -
<%
List<OrderBean> orderbeans = (List<OrderBean>) request.getAttribute("orderBeans");
%>	-%>
	<style>

	h3{
	
	}
<%-- table {
	border-collapse: collapse;
}

table, th, td {
	border: 1px solid brown;
	width: 900px;
	} --%>
<style>
h3 {
	margin-top: 30px;
}
</style>
</head>
<body>
	<%-- side Bar (side bar請記得include進來) --%>
	<%@include file="jspf/sidebar.jspf"%>

	<%-- main--%>
	<main id="right-panel" class="right-panel">


		<div class="container">
			<div class="row">
				<div class="col-12">
					<table class="table">

						<h3 class="text-center">訂單列表</h3>
						<hr>

						<a href="OrderServletOS?name=new" class="btn btn-success">新增訂單</a>

						<br>
						<thead>
							<tr>
								<th scope="col">訂單編號</th>
								<th scope="col">訂單日期</th>
								<th scope="col">訂單類別</th>
								<th scope="col">會員編號</th>
								<th scope="col">總價</th>
								<th scope="col">折扣金額</th>
								<th scope="col">優惠券種類</th>
								<th scope="col">訂單狀態</th>
								<th scope="col">付款狀態</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="order" items="${orderBeans}">

								<tr>
									<td><c:out value="${order.orderId}" /></td>
									<td><c:out value="${order.orderDate}" /></td>
									<td><c:out value="${order.orderCategory}" /></td>
									<td><c:out value="${order.userNo}" /></td>
									<td><c:out value="${order.orderTotal}" /></td>
									<td><c:out value="${order.orderDiscount}" /></td>
									<td class="coupon"><c:out value="${order.couponId}" /></td>
									<td class="status"><c:out value="${order.orderStatus}" /></td>
									<td class="paystatus"><c:out value="${order.orderPayStatus}" /></td>
									<td><a
										href="OrderServletOS?name=edit&orderid=<c:out value='${order.orderId}' />"
										class="link-dark">Edit</a> &nbsp;&nbsp;&nbsp;&nbsp; <a
										href="OrderServletOS?name=delete&orderid=<c:out value='${order.orderId}' />"
										class="link-danger">Delete</a></td>
								</tr>
			
									

							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		<%-- 網站內容請放main裡面--%>

	</main>

	<%-- scripts --%>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.10.3/sweetalert2.js"></script>
	<script src="<%=request.getContextPath()%>/js/jquery-3.6.0.js"></script>
	<script src="<%=request.getContextPath()%>/js/plugins.js"></script>
	<script src="<%=request.getContextPath()%>/js/main.js"></script>
	<script src="js/indexJS.js"></script> 

	
	
	
</body>

</html>