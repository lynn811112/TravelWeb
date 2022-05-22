
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<!doctype html>
<html class="no-js" lang="">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.0.0/jquery.min.js"></script>
<script src="https://demeter.5fpro.com/tw/zipcode-selector.js"></script>
<script src="http://lib.sinaapp.com/js/jquery/1.12.4/jquery-1.12.4.min.js"></script>
<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>會員資料</title>
<meta name="description" content="dashboard">
<meta name="viewport" content="width=device-width, initial-scale=1">
<%-- style sheet (以下三個style sheet請記得link進來) --%>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css">
<style>
.image {
	position: relative;
	overflow: hidden;
	padding-bottom: 100%;
}

.image img {
	position: absolute;
}
ul li .invisible {
  background-image: src="data:image/png;base64,iVBORw0K";
  height: .5rem;
  top: .7rem;
}
ul li .visible {
  background-image: src="data:image/png;base64,iVBORw0KG";
  height: .8rem;
  top: .55rem;
}
</style>

</head>

<body>

	<%-- side Bar --%>
	<%@include file="jspf/sidebar.jspf"%>

	<%-- main--%>
	<main id="right-panel" class="right-panel">
		<div class="breadcrumbs">
			<div class="breadcrumbs-inner">
				<div class="row m-0">
					<div class="col-sm-4">
						<div class="page-header float-left">
							<div class="page-title">
								<h1>新增會員資料</h1>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="content">
		
			<div class="row justify-content-center">
				<div class="col-lg-6 ">
					<div class="card">
						<div class="card-body card-block">

							<form action="member" method="post">
     							<input type="hidden" name="action" value="insert">
								<!-- 選擇類別 -->
								

								<p class="sty">
									<label for="1" class="t1">中文名：</label>
									<input type="text" name="ch_name" placeholder="中文名" autofocus size="10" id="1" required="required">
								</p>

								<p class="sty">
									<label for="2" class="t1">英文名：</label>
									<input type="text" name="en_name" placeholder="Name" size="10" id="2">
								</p>

								<p class="sty">
									<label class="t1" for="3">E-mail：</label> <input type="email" name="email" id="3">
								</p>


								<p class="sty">
									<label class="t1">性別：</label> 
									<label> <input type="radio" name="gender" value="男">男</label> 
									<label> <input type="radio" name="gender" value="女">女</label>
								</p>

								<p class="sty">
									<label class="t1">生日：</label> 
									<input type="date" name="birthday">
								</p>

								<p class="sty">
									<label for="4" class="t1">密碼：</label>
									<input type="password" name="password" id="password" maxlength="20" required="required">
									
    								<a class="news-letter" href="#">
        							<label class="checkbox">
        							<input type="checkbox" οnclick="checkit(this.checked)"><i></i>顯示密碼</label>
    								</a>
								</p>
								
								<p class="sty">
									<label for="3" class="t1">電話：</label>
									<input type="text" name="phone" maxlength="10" id="3">
								</p>

								<p>
								<label class="t1">地址：</label> 
									<input class="js-demeter-tw-zipcode-selector" data-city="#city" data-dist="#location" placeholder="郵遞區號" size="6" /> 
									<select id="city" name="city" placeholder="請選擇縣市" ></select> 
									<select id="location" name="location" placeholder="請選擇鄉鎮區"></select>
								</p>
								
								<p class="sty">
								<input type="text" name="address" value="<%=request.getAttribute("city")%>" size="40" >
								</p>

<!-- 								<div class="mb- row justify-content-end">

									<label for="formFileMultiple" class="col-sm-3 col-form-label">上傳照片</label>
									<div class="col-sm-9">
										<input class="form-control" type="file" name="images"
											id="formFileMultiple" multiple
											onchange="previewMultiple(event)"> <label
											for="images" class="form-label custom-file-label"></label>
									</div>
								</div>
								<div class="row justify-content-end">
									<div class="col-sm-9">
										<div class="row" id="formFile"></div>
									</div>
								</div>   -->
								<!-- 送出 -->
								<!-- action=insert對應到controller的doGet -->
								<button type="submit" name="action" value="invert"
									class="btn btn-warning rounded-pill my-5" style="width:200px">確定新增</button>
								
							</form>

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

	<script>
		function previewMultiple(event) {
			var images = document.getElementById("formFileMultiple");
			var number = images.files.length;
			for (i = 0; i < number; i++) {
				var urls = URL.createObjectURL(event.target.files[i]);
				document.getElementById("formFile").innerHTML += '<div class="col-4"> <img src="' + urls + '" class="rounded"/> </div>';
			}
		}
	</script>

	<script>
	function checkit(isChecked) {
	    if (isChecked) {
	        $("#password").prop("type", 'text');
	    } else {
	        $("#password").prop("type", 'password');
	    }
	}
	</script>
</body>

</html>