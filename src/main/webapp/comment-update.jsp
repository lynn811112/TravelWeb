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
						<h1>評論管理 / 修改評論</h1>
					</div>
				</div>
			</div>
		</div>

        <div class="content">
            <div class="row justify-content-center">
                <div class="col-lg-6 ">
                    <div class="card">
                        <div class="card-body card-block">
                        
                            <form name="form" action="comment" method="POST" class="form-horizontal" enctype="multipart/form-data">
                            	<input type="hidden" name="comId" value="<%=comment.getComId()%>">
                                <!-- 選擇類別 -->
                                <div class="mb-4 row">
                                    <label for="itemTb" class="col-sm-3 col-form-label">項目類別</label>
                                    <div class="col-sm-9">
                                    	<input type="text" class="form-control" name="itemTb" id="itemTb" readonly>
                                    </div>
                                </div>
                                
                                <!-- 輸入商品編號 -->
                                <div class="mb-4 row">
                                    <label for="itemId" class="col-sm-3 col-form-label">商品編號</label>
                                    <div class="col-sm-9">
                                    	<input type="number" class="form-control" name="itemId" id="itemId" value="<%=comment.getItemId()%>" readonly>
                                    	<div class="invalid-feedback">請輸入商品編號</div>
                                    </div>
                                </div>
                                
                                <!-- 會員ID -->
                                <div class="mb-4 row">
                                    <label for="userId" class="col-sm-3 col-form-label">會員帳號</label>
                                    <div class="col-sm-9">
                                    	<input type="text" class="form-control" name="userId" id="userId" value="<%=comment.getUserId()%>">
                                    	<div class="invalid-feedback">請輸入會員帳號</div>
                                    </div>
                                </div>

                                <!-- 給予評分 -->
                                <div class="mb-4 row">
                                    <label for="rating" class="col-sm-3 col-form-label">給予評分</label>
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
                                    <div class="col-sm-3">
                                    	<label for="content" class="col-form-label">評論內容</label>
                                    	<div id="content-length" class="text-black-50 small">(0/200)</div>
                                	</div>
                                    <div class="col-sm-9">
                                        <textarea class="form-control" name="content" id="content" cols="30" rows="5" style="resize:none"><%=comment.getContent()%></textarea>
                                        <div class="invalid-feedback">評論內容上限200字</div>
                                     </div>
                                </div>
                                <div class="mb-4 row">
                                	<div class="col-sm-3">
									  	<label for="images" class="col-form-label">上傳照片</label>
									  	<div id="images-length" class="text-black-50 small">(0/3)</div>
                                	</div>
                                	<div class="col-sm-9">
										<input class="form-control" type="file" name="images" id="images" multiple onchange="previewMultiple(event)" accept="image/*">
										<div class="invalid-feedback">最多選取3張圖片</div>
									</div>
									<div class="row justify-content-end"> 
	                                	<div class="col-sm-9">
		                                 	<div class="row">        
		                                 	

        										<label for="imagesFromDB"></label>
												<% 	
												int sum = 0;
												if (comment.getImage1() != null) { 
													sum += 1;
												%>
													<div class="col-4">
														<input type="checkbox" name="imagesFromDB" value="image1" id="">刪除
														<img src="data:image/jpg;base64,<%=comment.getImage1()%>" class="rounded"/>
													</div>
												<% } %>
												<% 
												if (comment.getImage2() != null) { 
													sum += 1;
												%>
													<div class="col-4">
														<input type="checkbox" name="imagesFromDB" value="image2" id="">刪除
														<img src="data:image/jpg;base64,<%=comment.getImage2()%>" class="rounded"/>
													</div>
												<% } %>
												<% 
												if (comment.getImage3() != null) { 
													sum += 1;
												%>
													<div class="col-4">
														<input type="checkbox" name="imagesFromDB" value="image3" id="">刪除
														<img src="data:image/jpg;base64,<%=comment.getImage3()%>" class="rounded"/>
													</div>
												<% } %>
											</div>
										</div>
									</div>
									<div class="row justify-content-end mt-5">
										<div class="col-sm-9">
											<div class="row" id="formFile">
											</div>
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
	                                	<button type="submit" name="action" value="update" class="btn btn-warning rounded-pill my-5" id="btn-update">送出</button>
	                            	</div>
								</div>
                            </form>
                        </div>
                    </div>
                </div>
           
           		<div class="col-lg-6"> 
           			<div class="card">
           				<div class="card-body">
           					<h4 class="card-title">商品資訊</h4>
          					<div id="info">
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
	<script>
	
		const itemTb = document.getElementById("itemTb");
		switch ('<%=comment.getItemTb()%>') {
			case 'ticket':
				itemTb.value = '行程'
				break
			case 'restaurant':
				itemTb.value = '餐廳'
				break
			case 'hotel':
				itemTb.value = '住宿'
				break
			case 'carRental':
				itemTb.value = '租車'
				break
			default:
				itemTb.value = '此項目已被移除';
		};
		
		// 立即顯示所選照片
		function previewMultiple(event) {
		    var images = document.getElementById("images");
		    var number = images.files.length;
		    document.getElementById("formFile").innerHTML = ""
		    for (i = 0; i < number; i++) {
		        var urls = URL.createObjectURL(event.target.files[i]);
		        document.getElementById("formFile").innerHTML += 
		        	'<div class="col-4"> <img src="' + urls + '" class="rounded"/> </div>';
		    }
		}
		
		// 設定原資料評分
		let arr = document.querySelectorAll('input[name="rating"]')
		for (let i = 0; i <= arr.length ; i ++ ){
			if (<%=comment.getRating()%> == arr[i]?.value) {
				arr[i].checked = true;
			}
		}
		
		jQuery(document).ready(function($){
	        $(function() {

	        	loadInfo();
	        	
	        	let contentMax = 200;
	        	let imagesMax = 3;

	        	let contentLength = $("#content").val().length;
			    $("#content-length").text('('+contentLength+'/'+contentMax+')');
				
				let imagesLength = <%=sum%>;
				$('#images-length').text('('+imagesLength+'/'+ imagesMax +')')

				
				// 確認表單內容
				$('#btn-update').click(function (e) {
					let isUserIdVaild = $('#userId').val() !== '';
					let isContentVaild = $("#content").val().length <= contentMax;
					let isImagesVaild = imagesLength <= imagesMax;
					
					if ( !isUserIdVaild || !isUserIdVaild || !isImagesVaild ) {
						e.preventDefault();					
						isUserIdVaild ? hideInvalidText($('#userId')) : showInvalidText($('#userId'));
						isContentVaild ? hideInvalidText($('#content')) : showInvalidText($('#content'));
						isImagesVaild ? hideInvalidText($('#images')) : showInvalidText($('#images'));
						$("form").addClass('validated');
					} else {
						$('#btn-update').submit();
					}
				});
				
				function showInvalidText(selector) {
					selector.removeClass('is-valid').addClass('is-invalid');
					selector.siblings('.invalid-feedback').css('display', 'block')
				}
				
				function hideInvalidText(selector) {
					selector.removeClass('is-invalid').addClass('is-valid');
					selector.siblings('.invalid-feedback').css('display', 'none')
				}
				
				// 顯示評論字數
				$("#content").keyup(function(){
					let contentLength = $("#content").val().length;
				    $("#content-length").text('('+contentLength+'/'+contentMax+')');
				    if (contentLength > contentMax) {
				    	$('#content-length').removeClass('text-black-50').addClass('text-danger')
				    } else {
					    $('#content-length').removeClass('text-danger').addClass('text-black-50')
				    }
				    if ($("form").hasClass('validated')) {
				    	contentLength > contentMax ? showInvalidText($('#content')) : hideInvalidText($('#content'))				    	
				    }
				});
				
				$('input[name="imagesFromDB"]').on('change', function() {
					imagesLength = <%=sum%> - $('input[name="imagesFromDB"]:checked').length + $("#images")[0].files.length;
					console.log($('input[name="imagesFromDB"]:checked').length)
					$('#images-length').text('('+imagesLength+'/'+ imagesMax +')')
				    if (imagesLength > imagesMax) {
				        $('#images-length').removeClass('text-black-50').addClass('text-danger')
				    } else {
				        $('#images-length').removeClass('text-danger').addClass('text-black-50')
				    }
					if ($("form").hasClass('validated')) {
						imagesLength > imagesMax ? showInvalidText($('#images')) : hideInvalidText($('#images'))				    	
				    } 
				});
				
				// 顯示上傳照片數量
				$("#images").on("change", function() {
					imagesLength = <%=sum%> - $('input[name="imagesFromDB"]:checked').length;
					imagesLength += $("#images")[0].files.length;
					$('#images-length').text('('+imagesLength+'/'+ imagesMax +')')
				    if (imagesLength > imagesMax) {
				        $('#images-length').removeClass('text-black-50').addClass('text-danger')
				    } else {
				        $('#images-length').removeClass('text-danger').addClass('text-black-50')
				    }
					if ($("form").hasClass('validated')) {
						imagesLength > imagesMax ? showInvalidText($('#images')) : hideInvalidText($('#images'))				    	
				    } 
				});	   
				
				
	        	
	        	function loadInfo() {
					$.ajax({
	                    type: 'GET',
	                    url: 'findItem',
	                    dataType: 'json',
	                    data: {
	                    	"select": "tickets"
	                    },
	                    success: function (data) {
	                    	popUpInfo("<%=comment.getItemTb()%>", <%=comment.getItemId()%>)
	                    },
	                    
	                    error: function () {
	                        console.log('error')
	                    }
	                })
				}
				
				
				function popUpInfo(item, id) {
				    $.ajax({
				        type: 'POST',
				        url: 'findItem',
				        dataType: 'json',
				        data: {
				            "itemTb": item,
				            "itemId": id
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
				            $('#info').html('<div class="text-dark text-start">' + itemInfo + '</div>')
				        },
				        error: function () {
				            console.log('error')
				        }
				    })
				}
	        	
	        })
		})
	
	</script>

</body>

</html>