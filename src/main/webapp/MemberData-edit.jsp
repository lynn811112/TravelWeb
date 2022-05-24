<%@page import="model.*"%>
<%@page import="java.util.*"%>
<%@page import="model.JdbcData"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!doctype html>
<html class="no-js" lang="">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.0.0/jquery.min.js"></script>
<script src="https://demeter.5fpro.com/tw/zipcode-selector.js"></script>
<head>

	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>會員列表</title>
	<meta name="description" content="dashboard">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<%-- style sheet (以下三個style sheet請記得link進來) --%>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css">

	<style>
		img { 
			object-fit: cover;
			width: 100%;
			height:100%;
		} 
		h1{
		text-align: center;
		font-weight: bolder;
		}
/* 		.img-square { */
/* 		width: 47%; */
/* 		} */
	</style>
</head>

<body>
<%JdbcData updateData = (JdbcData)request.getAttribute("updateData");%>
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
								<h1>會員資料管理</h1>
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
					<div class="card-header py-3">
							<strong class="card-title">編輯會員資料</strong>
						</div>
						<div class="card-body card-block">

							<form action="member" method="post">
     							
								<!-- 選擇類別 -->
								<input type="hidden" name="user_no" value=<%=updateData.getUser_no() %>>

								<p class="sty">
									<label for="1" class="t1">中文名：</label>
									<input type="text" name="ch_name" placeholder="中文名" autofocus size="10" id="1" required="required" value=<%=updateData.getCh_name()%>>  
								</p>

								<p class="sty">
									<label for="2" class="t1">英文名：</label>
									<input type="text" name="en_name" placeholder="Name" size="10" id="2" value=<%=updateData.getEn_name()%>>
								</p>

								<p class="sty">
									<label class="t1" for="3">E-mail：</label> <input type="email" name="email" id="3" size="25" value=<%=updateData.getEmail()%>>
								</p>


								<p class="sty">
									<label class="t1">性別：</label> 
									<label> <input type="radio" name="gender" value="男" ${updateData.gender=='男'?'checked':''}>男</label> 
									<label> <input type="radio" name="gender" value="女" ${updateData.gender=='女'?'checked':''}>女</label>
								</p>

								<p class="sty">
									<label class="t1">生日：</label> 
									<input type="date" name="birthday" value=<%=updateData.getBirthday() %>>
								</p>

								<p class="sty">
									<label for="password" class="t1">密碼：</label>
									<input type="password" name="password" maxlength="20" size="30" id="password" required="required" value=<%=updateData.getPassword()%>>
									<a>
        							<label class="checkbox">
        							<input type="checkbox" id="myCheck" onclick="myFunction()"><i></i>顯示密碼</label>
    								</a>
								</p>
								
								<p class="sty">
									<label for="3" class="t1">電話：</label>
									<input type="text" name="phone" maxlength="10" id="3" value=<%=updateData.getPhone()%>>
								</p>

								<p>
  								<label class="t1">地址：</label> 
									<input type="text" class="js-demeter-tw-zipcode-selector" data-city="#city" data-dist="#location" placeholder="郵遞區號" 
									size="6" id="yoyo" name="yoyo"/> 
									<select id="city" name="city" placeholder="請選擇縣市" onchange="addressChange()"></select> 
									<select id="location" name="location" placeholder="請選擇鄉鎮區" onchange="addressChange()"></select>
								</p>
								
								<p class="sty">
								<input type="text" name="address" id="address" size="40" value=<%=updateData.getAddress() %>>
								</p>

                                
                                <!-- 送出 -->
                                <!-- action=update對應到controller的doGet -->
                                <div class="row">
	                                <div class="d-grid gap-2 col-4">
	                                	<button type="submit" name="action" value="cancel" class="btn btn-outline-warning rounded-pill my-5" style="width:150px">取消修改</button>
	                            	</div>
	                                <div class="d-grid gap-2 col-4">
	                                	<button type="submit" name="action" value="update" class="btn btn-warning rounded-pill my-5" style="width:150px">確認修改</button>
	                            	</div>
	                                <div class="d-grid gap-2 col-4">
	                                	<button type="submit" name="action" value="delete" class="btn btn-warning rounded-pill my-5" onclick="javascript:return del();" style="width:150px"><i class="bi bi-trash3"></i></button>
	                            	</div>
								</div>
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
	function del() {
		var msg = "確定要刪除這筆會員資料嗎？";
		if (confirm(msg)==true){
		return true;
		}else{
		return false;
		}
	}
	</script>
	<script>
	function myFunction() {
		  // Get the checkbox
		  var checkBox = document.getElementById("myCheck");

		  // If the checkbox is checked, translate type 'password' to 'text'
		  if (checkBox.checked == true){
			  $("#password").prop("type", 'text');
		  } else {
			  $("#password").prop("type", 'password');
		  }
		}
	</script>
	<script type='text/javascript' class="js-demeter-tw-zipcode-selector" data-city="#city" data-dist="#location" /></script>
	<script type="text/javascript">
	function addressChange() {
        var city = document.getElementById('city').value;
        var location = document.getElementById('location').value;
        document.getElementById('address').value = city + location;
    }
	</script>
	
	
	
</body>

</html>