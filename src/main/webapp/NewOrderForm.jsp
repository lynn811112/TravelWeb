<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<style>
h2 {
	margin-bottom: 20px;
}
</style>
</head>
<body>
	<%-- side Bar (side bar請記得include進來) --%>
	<%@include file="jspf/sidebar.jspf"%>

	<%-- main--%>
	<main id="right-panel" class="right-panel">



		<%-- 網站內容請放main裡面--%>

		<div class="container col-md-10 mt-5">
			<div class="card">
				<div class="card-body">
					<c:if test="${order != null}">
						<form action="OrderServletOS?name=update" method="post">
					</c:if>
					<c:if test="${order == null}">
						<form action="OrderServletOS?name=insert" method="post">
					</c:if>

					<caption>
						<h2>
							<c:if test="${order != null}">
                                    編輯訂單
                                </c:if>
							<c:if test="${order == null}">
                                    新增訂單
                                </c:if>
						</h2>
					</caption>

					<c:if test="${order != null}">
						<input type="hidden" name="orderId"
							value="<c:out value='${order.orderId}' />" />
					</c:if>

					<div class="mb-4 row">
						<fieldset class="form-group col-md-4">
							<label>訂單類別:</label><select class="form-select"
								name="orderCategory">
								<option value="訂房">訂房</option>
								<option value="訂票">訂票</option>
							</select>
						</fieldset>
						<fieldset class="form-group col-md-4">
							<label>會員編號:</label> <input type="text"
								value="<c:out value='${order.orderId}' />" class="form-control"
								name="userNo">
						</fieldset>
					</div>
					<div class="mb-4 row">
						<fieldset class="form-group col-md-4">
							<label>總價:</label> <input type="text"
								value="<c:out value='${order.orderTotal}'/>"
								class="form-control" name="orderTotal">
						</fieldset>
						<fieldset class="form-group col-md-4">
							<label>折扣金額:</label> <input type="text"
								value="<c:out value='${order.orderDiscount}'/>"
								class="form-control" name="orderDiscount">
						</fieldset>
						<fieldset class="form-group col-md-4">
							<label>折扣類別:</label><select class="form-select" name="couponId">
								<option value="1">滿千送百</option>
								<option value="2">打九折</option>
							</select>
						</fieldset>
					</div>
					<div class="mb-2 row">

						<fieldset class="form-group col-md-4">
							<label>訂單狀態:</label><select class="form-select"
								name="orderStatus">
								<option value="1">成功</option>
								<option value="2">不成立</option>
							</select>
						</fieldset>

						<fieldset class="form-group col-md-4">
							<label>付款狀態:</label><select class="form-select"
								name="orderPayStatus">
								<option value="1">尚未付款</option>
								<option value="2">已付款</option>
							</select>
						</fieldset>

					</div>
					<div class="row" style="text-align: center">
						<fieldset class="form-group mt-4">
							<a href="OrderServletOS"> <input type="button" value="回上一頁"
								class="btn btn-secondary" />
							</a>
							<button type="submit" class="btn btn-primary">送出</button>
						</fieldset>
					</div>


					</form>
				</div>
			</div>
		</div>
	</main>

	<%-- scripts --%>

</body>

</html>