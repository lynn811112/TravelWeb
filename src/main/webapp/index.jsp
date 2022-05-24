<%@page import="model.Employee"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="model.Comment"%>

<!DOCTYPE html>
<html class="no-js" lang="">

<head>

<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>後台管理</title>
<%-- style sheet (以下三個style sheet請記得link進來) --%>
<link rel="stylesheet"	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css">
<link rel="stylesheet"	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
<link rel="stylesheet" type="text/css"	href="<%=request.getContextPath()%>/css/style.css">

</head>
<body>
	<%-- side Bar (side bar請記得include進來) --%>
	<%@include file="jspf/sidebar.jspf"%>

	<%-- main--%>
	<main id="right-panel" class="right-panel">

		<%-- 網站內容請放main裡面--%>
		<div class="container">
			<div class="row mx-2" style="margin-top: 30px;">
				<div class="col-sm-9 ">
					<div class="card">
						<div class="card-body">
							<div class="row">
								<div class="col-5 mt-5">
									<h2 class="card-title ms-3" id="sumCount"></h2>
									<h4 class="card-title ms-3 fw-bold">總資料筆數</h4>
								</div>
								<div class="col-7">
									<div class="row mt-2">
										<div class="col">
											<%
											int memberCount = (int) request.getAttribute("memberCount");
											%>
											<h3 id="memberCount" class="card-title"></h3>
											<h4 class="card-title fw-bold text-info">會員總數</h4>
										</div>
										<div class="col">
											<%
											int orderCount = (int) request.getAttribute("orderCount");
											%>
											<h3 id="orderCount" class="card-title"></h3>
											<h4 class="card-title fw-bold text-info">訂單總數</h4>
										</div>
										<div class="col">
											<%
											int commentCount = (int) request.getAttribute("commentCount");
											%>
											<h3 id="commentCount" class="card-title"></h3>
											<h4 class="card-title fw-bold text-info">評論總數</h4>
										</div>
									</div>
									<div class="row mt-4">
										<div class="col ">
											<%
											int productCount = (int) request.getAttribute("productCount");
											%>
											<h3 id="productCount" class="card-title "></h3>
											<h4 class="card-title fw-bold text-warning">行程總數</h4>
										</div>
										<div class="col">
											<%
											int hotelCount = (int) request.getAttribute("hotelCount");
											%>
											<h3 id="hotelCount" class="card-title"></h3>
											<h4 class="card-title fw-bold text-warning">住宿總數</h4>
										</div>
										<div class="col">
											<h3 class="card-title"></h3>
											<h4 class="card-title fw-bold text-warning">租車總數</h4>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- 歡迎回來字樣 -->
				<div class="col-sm-3 ">
					<div class="card" style="height: 213px">
						<div class="card-body mt-2 text-right">
							<h3 id="greeting"></h3>
						</div>
					</div>
				</div>
			</div>
			
			
			<div class="row  mx-2">
				<div class="col">
					<div class="card">
						<div class="card-body">
							<canvas id="myChart"></canvas>
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
	<script src="<%=request.getContextPath()%>/js/countUp.umd.js"></script>

	<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.7.1/chart.min.js" integrity="sha512-QSkVNOCYLtj73J4hbmVoOV6KVZuMluZlioC+trLpewV8qMjsWqlIQvkn1KGX2StWvPMdWGBqim1xlC8krl1EKQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
	
	<script>
	
	
		const options = {
				duration: 1.5,
			};
		
		let sum = <%=memberCount%>+<%=hotelCount%> + <%=commentCount%>+<%=productCount%>;
		const sumConUp = new countUp.CountUp("sumCount", sum, options)
		sumConUp.start();
					
		const commentConUp = new countUp.CountUp("commentCount", <%=commentCount%>, options)
		commentConUp.start();
		
		const hotelConUp = new countUp.CountUp("hotelCount", <%=hotelCount%>, options)
		hotelConUp.start();
		
		const memberConUp = new countUp.CountUp("memberCount", <%=memberCount%>, options)
		memberConUp.start();

		const productConUp = new countUp.CountUp("productCount", <%=productCount%>, options)
		productConUp.start();
		
		const orderConUp = new countUp.CountUp("orderCount", <%=orderCount%>, options)
		orderConUp.start();
		
		<%Employee employee = (Employee)session.getAttribute("login"); %>
		let userEmail = "<%=employee.getEmail()%>";
		userId = userEmail.substring(0, userEmail.indexOf('@'))
		console.log(userId )
		document.getElementById("greeting").textContent = "歡迎回來，" + userId;
			
	</script>
	
	
	<script>
		const ctx = document.getElementById('myChart').getContext('2d');
		const myChart = new Chart(ctx, {
		    type: 'bar',
		    data: {
		        labels: ['會員總數', '訂單總數', '評論總數', '行程總數', '住宿總數', '租車總數'],
		        datasets: [{
		            label: '資料總數統計長條圖',
		            data: [<%=memberCount%>, <%=orderCount%>, <%=commentCount%>, <%=productCount%>, <%=hotelCount%>, 3],
		            backgroundColor: [
		                'rgba(255, 99, 132, 0.2)',
		                'rgba(54, 162, 235, 0.2)',
		                'rgba(255, 206, 86, 0.2)',
		                'rgba(75, 192, 192, 0.2)',
		                'rgba(153, 102, 255, 0.2)',
		                'rgba(255, 159, 64, 0.2)'
		            ],
		            borderColor: [
		                'rgba(255, 99, 132, 1)',
		                'rgba(54, 162, 235, 1)',
		                'rgba(255, 206, 86, 1)',
		                'rgba(75, 192, 192, 1)',
		                'rgba(153, 102, 255, 1)',
		                'rgba(255, 159, 64, 1)'
		            ],
		            borderWidth: 1
		        }]
		    },
		    options: {
		        scales: {
		            y: {
		                beginAtZero: true
		            }
		        }
		    }
		});
	</script>

</body>

</html>