<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet" type="text/css">
<link rel="stylesheet"
	href="http://jqueryui.com/resources/demos/style.css">
<title>景點管理</title>
</head>

<style>
table.minimalistBlack {
	font-family: "Times New Roman", Times, serif;
	border: 3px solid #000000;
	width: 50%;
	text-align: left;
	border-collapse: collapse;
}

table.minimalistBlack td, table.minimalistBlack th {
	border: 1px solid #000000;
	padding: 5px 4px;
}

table.minimalistBlack tbody td {
	font-size: 12px;
}

table.minimalistBlack thead {
	background: #CFCFCF;
	background: -moz-linear-gradient(top, #dbdbdb 0%, #d3d3d3 66%, #CFCFCF 100%);
	background: -webkit-linear-gradient(top, #dbdbdb 0%, #d3d3d3 66%, #CFCFCF 100%);
	background: linear-gradient(to bottom, #dbdbdb 0%, #d3d3d3 66%, #CFCFCF 100%);
	border-bottom: 3px solid #000000;
}

table.minimalistBlack thead th {
	font-size: 13px;
	font-weight: bold;
	color: #000000;
	text-align: left;
	border-left: 2px solid #121415;
}

table.minimalistBlack thead th:first-child {
	border-left: none;
}

table.minimalistBlack tfoot td {
	font-size: 14px;
}
</style>
<body>
	<c:if test="${view_pro != null}">
      	<h1>Add Edit New Product Information</h1>
      	<form action="Edit_view_pro" method="post" width="50%">
      	<input type="hidden" name="prod_no" value="<c:out value='${view_pro.prod_no}' />" />
     </c:if>
	<c:if test="${view_pro == null}">
		<form action="Save_view_pro" method="post" width="50%">
      	<h1>Add New Product Information</h1>
     </c:if>
		<table class="minimalistBlack">
			<thead>
				<tr>
					<th>商品名稱</th>
					<th>商品簡介</th>
					<th>營業日期</th>
					<th>營業起始時間</th>
					<th>營業結束時間</th>
					<th>電話</th>
					<th>國家</th>
					<th>城市</th>
					<th>地區</th>
					<th>地址</th>
					<th>票價</th>
					<th>圖片檔案</th>
					<th>圖片簡介</th>
				</tr>
			</thead>
			<tbody class="minimalistBlack">
				<tr>
					<td><input type="text" name="prod_name" value="<c:out value='${view_pro.prod_name}' />" /></td>
					<td><input type="text" name="prod_Intro" value="<c:out value='${view_pro.prod_Intro}' />" /></td>
					<td><label><input type="checkbox" name="week1" value="<c:out value='${view_pro.open_week}'/>" checked/>星期一<br></label> 
						<label><input type="checkbox" name="week2" value="<c:out value='${view_pro.open_week}' />" checked>星期二<br></label>
						<label><input type="checkbox" name="week3" value="<c:out value='${view_pro.open_week}' />" checked>星期三<br></label> 
						<label><input type="checkbox" name="week4" value="<c:out value='${view_pro.open_week}' />" checked>星期四<br></label>
<%-- 							 <c:if test="${view_pro.isweek4 != null}"> </c:if>  --%>
						<label><input type="checkbox" name="week5" value="<c:out value='${view_pro.open_week}' />" checked>星期五<br></label> 
						<label><input type="checkbox" name="week6" value="<c:out value='${view_pro.open_week}' />" checked>星期六<br></label>
						<label><input type="checkbox" name="week7" value="<c:out value='${view_pro.open_week}' />" checked>星期日<br></label></td>
					<td><input type="time" name="open_time" value="<c:out value='${view_pro.open_time}' />"></td>
					<td><input type="time" name="end_time" value="<c:out value='${view_pro.end_time}' />"></td>
					<td><input type='text' name="phone" size="10" value="<c:out value='${view_pro.phone}' />"></td>
					<td><select name="Country"><option value="台灣">台灣</option></select></td>
					<td><select id="city" name = "City" placeholder="請選擇縣市" /></select></td>
					<td><select id="dist"  name="Location" placeholder="請選擇鄉鎮區"/></select></td>
					<td><input type="text" name="address" value="<c:out value='${view_pro.address}' />"/></td>
					<td><input type="text" name="price"  value="<c:out value='${view_pro.price}' />"/></td>
					<td><input type="file" name="image" size="50" /></td>
					<!-- 					<input type="submit" value="upload" /></td> -->
					<td><input type="text" name="image_Intro" value="<c:out value='${view_pro.image_Intro}' />"/></td>
				</tr>
			</tbody>
			</tr>
		</table>
<!-- 		<tfoot> -->
<!-- 			<tr> -->
<!-- 				<td colspan="4"> -->
<!-- 					<div class="links"> -->
<!-- 						<a href="#">&laquo;</a> <a class="active" href="#">1</a> <a -->
<!-- 							href="#">2</a> <a href="#">3</a> <a href="#">4</a> <a href="#">&raquo;</a> -->
<!-- 					</div> -->
<!-- 				</td> -->
<!-- 			</tr> -->
<!-- 		</tfoot> -->
		<input type="submit" value="保存商品資訊" name="action" />
	</form>
	</br>

<!-- 	<a href="Save_view_pro">保存商品資訊</a> -->
	<script src="<%=request.getContextPath()%>/js/jquery-3.6.0.js"></script>
	<script src="<%=request.getContextPath()%>/js/plugins.js"></script>
	<script src="<%=request.getContextPath()%>/js/main.js"></script>
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	<script src="https://demeter.5fpro.com/tw/zipcode-selector.js"></script>
	<script class="js-demeter-tw-zipcode-selector" data-city="#city"
		data-dist="#dist" /></script>
	<script>var strings = " ";
	if (string.length == 0)
	{
	alert(‘不能為空’);
	}
	</script>
	<a href="View_pro">查看商品列表</a>
</body>

</html>