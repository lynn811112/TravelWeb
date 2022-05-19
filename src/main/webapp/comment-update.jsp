<%@page import="model.Comment"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!doctype html>
<html class="no-js" lang="">

<head>
<%
Comment comment = (Comment)request.getAttribute("comment");
%>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>評論列表</title>
	<%-- style sheet (以下三個style sheet請記得link進來) --%>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css">
	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/stars.css">
	<style>
		img { 
			object-fit: cover;
			width: 100%;
			height:100%;
		} 
		
/* 		.img-square { */
/* 		width: 47%; */
/* 		} */
	</style>
</head>

<body>
    <%-- side Bar (side bar請記得include進來) --%>
	<%@include file="jspf/sidebar.jspf"%>

    <%-- main--%>
	<main id="right-panel" class="right-panel">
		<div class="breadcrumbs">
			<div class="breadcrumbs-inner">
				<div class="row m-0">
					<div class="col-sm-4">
						<div class="page-header float-left">
							<div class="page-title">
								<h1>評論管理 / 修改評論</h1>
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

                            <form name="form" action="comment" method="POST" class="form-horizontal">
                            	<input type="hidden" name="comId" value="<%=comment.getComId()%>">
                                <!-- 選擇類別 -->
                                <div class="mb-4 row">
                                    <label for="tb-select" class="col-sm-3 col-form-label">項目類別</label>
                                    <div class="col-sm-9">
                                        <select class="form-select" name="itemTb" id="tb-select" >
                                            <option value="ticket">景點票券</option>
                                            <option value="restaurant">餐廳</option>
                                            <option value="hotel">住宿</option>
                                            <option value="carRental">租車</option>
                                        </select>
                                    </div>
                                </div>
                                
                                <!-- 輸入商品編號 -->
                                <div class="mb-4 row">
                                    <label for="item-id" class="col-sm-3 col-form-label">商品編號</label>
                                    <div class="col-sm-9">
                                      <input type="text" class="form-control" name="itemId" id="item-id" value="<%=comment.getItemId()%>">
                                    </div>
                                </div>
                                
                                <!-- 會員ID -->
                                <div class="mb-4 row">
                                    <label for="item-id" class="col-sm-3 col-form-label">會員編號</label>
                                    <div class="col-sm-9">
                                      <input type="text" class="form-control" name="userId" id="item-id" value="<%=comment.getUserId()%>">
                                    </div>
                                </div>

                                <!-- 給予評分 -->
                                <div class="mb-4 row">
                                    <label for="customRange" class="col-sm-3 col-form-label">給予評分</label>
                                    <div class="col-sm-9">
				                        <fieldset class="starability-basic">
					                        <input type="radio" id="no-rate" class="rating input-no-rate" name="rating" value="0" checked/>
				                            <input type="radio" id="first-rate1" name="rating" value="1" />
				                            <label for="first-rate1" title="Terrible">1 star</label>
				                            <input type="radio" id="first-rate2" name="rating" value="2" />
				                            <label for="first-rate2" title="Not good">2 stars</label>
				                            <input type="radio" id="first-rate3" name="rating" value="3" />
				                            <label for="first-rate3" title="Average">3 stars</label>
				                            <input type="radio" id="first-rate4" name="rating" value="4" />
				                            <label for="first-rate4" title="Very good">4 stars</label>
				                            <input type="radio" id="first-rate5" name="rating" value="5" />
				                            <label for="first-rate5" title="Amazing">5 stars</label>
				                        </fieldset>
                    				</div>
                                </div>

                                <!-- 體驗分享 -->
                                <div class="mb-5 row">
                                    <label for="content-text" class="col-sm-3 col-form-label">評論內容</label>
                                    <div class="col-sm-9">
                                        <textarea class="form-control" name="content" id="content-text" cols="30" rows="5"> <%=comment.getContent()%></textarea>
                                        <!-- <input type="texta" class="form-control" name="item-id" id="item-id" > -->
                                      </div>
                                </div>
                                <div class="mb-4 row">
                                	<label for="images" class="col-sm-3 col-form-label">上傳照片</label>
                                	<div class="col-sm-9">
	                                 	<div class="row">
											<% if (comment.getImage1() != null) { %>
												<div class="col-4">
													<img src="data:image/jpg;base64,<%=comment.getImage1()%>" class="rounded"/>
												</div>
											<% } %>
											<% if (comment.getImage2() != null) { %>
												<div class="col-4">
													<img src="data:image/jpg;base64,<%=comment.getImage2()%>" class="rounded"/>
												</div>
											<% } %>
											<% if (comment.getImage3() != null) { %>
												<div class="col-4">
													<img src="data:image/jpg;base64,<%=comment.getImage3()%>" class="rounded"/>
												</div>
											<% } %>
										</div>
									</div>
                                </div>
                                
                                <!-- 送出 -->
                                <!-- action=update對應到controller的doGet -->
                                <div class="row">
	                                <div class="d-grid gap-2 col-6">
	                                	<button type="submit" name="action" value="query" class="btn btn-outline-warning rounded-pill my-5">取消修改</button>
	                            	</div>
	                                <div class="d-grid gap-2 col-6">
	                                	<button type="submit" name="action" value="update" class="btn btn-warning rounded-pill my-5">送出</button>
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
	<script src="js/jquery-3.6.0.js"></script>
	<script src="js/plugins.js"></script>
	<script src="js/main.js"></script>
	<script>
		function previewMultiple(event) {
		    var images = document.getElementById("formFileMultiple");
		    var number = images.files.length;
		    for (i = 0; i < number; i++) {
		        var urls = URL.createObjectURL(event.target.files[i]);
		        document.getElementById("formFile").innerHTML += '<div class="col-4"> <img src="' + urls + '" class="rounded"/> </div>';
		    }
		}
		
		let arr = document.querySelectorAll('input[name="rating"]')
		for (let i = 0; i <= arr.length ; i ++ ){
			if (<%=comment.getRating()%> == arr[i]?.value) {
				arr[i].checked = true;
			}
		}

		const itemTb = document.getElementById("tb-select");
		console.log('<%=comment.getItemTb()%>')
		itemTb.value = '<%=comment.getItemTb()%>';
	
	</script>

</body>

</html>