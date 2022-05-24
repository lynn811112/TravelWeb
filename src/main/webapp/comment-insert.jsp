<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="model.Employee"%>
<%@page import="model.Hotel"%>
<%@page import="java.util.List"%>

<!doctype html>
<html class="no-js" lang="">

<head>
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
	.image{
    position:relative;
    overflow:hidden;
    padding-bottom:100%;
	}
	.image img{
	    position:absolute;
	}
	
/* 	.btn-sm { */
/* 		width: 15px; */
/* 		height: 15px */
/* 	} */
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
								<h1>評論管理 / 新增評論</h1>
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

                            <form name="form" action="comment" method="POST" class="form-horizontal needs-validation" enctype="multipart/form-data" novalidate>
                                <!-- 選擇類別 -->
                                <div class="mb-4 row">
                                    <label for="tb-select" class="col-sm-3 col-form-label">項目類別</label>
                                    <div class="col-sm-9">
                                        <select class="form-select" name="itemTb" id="tb-select" required>
                                            <option value="ticket">行程</option>
                                            <option value="restaurant">餐廳</option>
                                            <option value="hotel">住宿</option>
                                            <option value="carRental">租車</option>
                                        </select>
									    <div class="invalid-feedback">
									    	請輸入商品項目類別
									    </div>
                                    </div>

                                </div>
                                
                                <!-- 輸入商品編號 -->
                                <div class="mb-4 row">
                                    <label for="item-id" class="col-sm-3 col-form-label">商品編號</label>
                                    <div class="col-sm-9">
                                      	<input type="number" class="form-control" name="itemId" id="item-id" onchange="onlyNum()" required >
                                      	<div class="invalid-feedback">
											請輸入商品編號
									  	</div>

                                    </div>

                                </div>
		
                                <!-- 會員ID -->
                                <div class="mb-4 row">
                                    <label for="item-id" class="col-sm-3 col-form-label">會員帳號</label>
                                    <div class="col-sm-9">
                                      	<input type="text" class="form-control" name="userId" id="user-id" value="" required>
                                    	<div class="invalid-feedback">
											請輸入會員帳號
										</div>
                                    </div>
                                </div>

                                <!-- 給予評分 -->
                                <div class="mb-4 row">
                                    <label for="customRange" class="col-sm-3 col-form-label">給予評分</label>
			                        <div class="col-sm-9">
				                        <fieldset class="starability-basic">
					                        <input type="radio" id="no-rate" class="input-no-rate" name="rating" value="0" checked/>
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
                                <div class="mb-4 row">
                                	<div class="col-sm-3">
                                    	<label for="content-text" class="col-form-label">評論內容</label>
                                    	<div id="content-length" class="text-black-50 small">(0/200)</div>
                                	</div>
                                    <div class="col-sm-9">
                                        <textarea class="form-control" name="content" id="content-text" cols="30" rows="5"></textarea>
                                        <div id="invalid-con-length" class="mt-1 small text-danger"></div>
                                      </div>
                                </div>
                                
                                <div class=" row justify-content-end">
                                	<div class="col-sm-3">
									  	<label for="formFileMultiple" class="col-form-label">上傳照片</label>
									  	<div id="files-length" class="text-black-50 small">(0/3)</div>
                                	</div>
								  	<div class="col-sm-9">
								  		<input class="form-control" type="file" name="images" id="formFileMultiple" multiple onchange="previewMultiple(event)">
										<div id="invalid-length" class="mt-1 small text-danger"></div>
									</div>
								</div>
								<div class="row justify-content-end">
									<div class="col-sm-9">
										<div class="row" id="formFile">
											
										</div>
									</div>
								</div>
                                <!-- 送出 -->
                                <!-- action=insert對應到controller的doGet -->

                                <div class="row">
	                                <div class="d-grid gap-2 col-6">
	                                	<a class="btn btn-outline-warning rounded-pill mt-5 mb-4" href="comment">取消新增</a>
<!-- 	                                	<a >取消新增</button> -->
	                            	</div>
	                                <div class="d-grid gap-2 col-6">
	                                	<button type="submit" name="action" value="insert" class="btn btn-warning rounded-pill mt-5 mb-4">送出</button>
	                            	</div>
								</div>
                            </form>
                            
                        </div>
                    </div>
                </div>
                
                <div class="col-lg-6 ">
                    <div class="card">
                        <div class="card-body">
                        	<div class="d-flex justify-content-center">
	                        	<button type="submit" name="select" id="btn-ticket" value="ticket" class="btn btn-outline-dark mb-3 mx-1">行程列表</button>
	                        	<button type="submit" name="select" id="btn-resaturant" value="resaturant" class="btn btn-outline-dark mb-3 mx-1">餐廳列表</button>
	                        	<button type="submit" name="select" id="btn-hotel" value="hotel" class="btn btn-outline-dark mb-3 mx-1">住宿列表</button>
	                        	<button type="submit" name="select" id="btn-carRental" value="carRental" class="btn btn-outline-dark mb-3 mx-1">租車列表</button>
							</div>
                        	<table id="table_id" class="display table table-hover">
								<thead>
									<tr class="text-center">

										<th>項目</th>
										<th>編號</th>
										<th>名稱</th>
										<th>內容</th>
									</tr>
								</thead>
								<tbody id="rows">
									<tr>
										<td style="text-align: center;" colspan="4">點選上方選項以載入項目列表</td>
									</tr>
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
	<script>
		// 以帳號(Email)去掉@後文字作為預設留言者Id
		<%
		Employee employee = (Employee) session.getAttribute("login");
		%>
		let userEmail = "<%=employee.getEmail()%>";
		userId = userEmail.substring(0, userEmail.indexOf('@'))
		document.getElementById("user-id").value = userId;
		
	
		// 只能是數字
		function onlyNum() {
			if(!((event.keyCode>=48&&event.keyCode<=57)||(event.keyCode>=96&&event.keyCode<=105)))
			//考慮小鍵盤上的數字鍵
			event.returnvalue=false;
			document.getElementById("item-number-only").innerHTML = '商品編號只能是數字'
		}		
		
		// 立即顯示所選照片
		function previewMultiple(event) {
		    var images = document.getElementById("formFileMultiple");
		    var number = images.files.length;
		    document.getElementById("formFile").innerHTML = ""
		    for (i = 0; i < number; i++) {
		        var urls = URL.createObjectURL(event.target.files[i]);
		        document.getElementById("formFile").innerHTML += 
		        	'<div class="col-4"> <img src="' + urls + '" class="rounded"/> </div>';
		    }
		}
		
		// 確認not null項目是否有填寫
		(function () {
		  'use strict'
		  var forms = document.querySelectorAll('.needs-validation')
		  Array.prototype.slice.call(forms)
		    .forEach(function (form) {
		      form.addEventListener('submit', function (event) {
		        if (!form.checkValidity()) {
		          event.preventDefault()
		          event.stopPropagation()
		        }
		        form.classList.add('was-validated')

		      }, false)
		    })
		})()

		//  if (!checkEmail(form.email.value)){
		// 		alert("Email 資料有誤，表單將不送出！");
		// 		return(false);	
		// 	}
		// 	alert("資料正確無誤，立刻送出表單！");
		// 	form.submit();
		// 	return(true);
		
		jQuery(document).ready(function($){
	        $(function() {
	        	
				// 限制上傳照片數量
				$("#formFileMultiple").on("change", function() {
					let filesLength = document.getElementById("formFileMultiple").files.length;
					console.log(filesLength)
					$('#files-length').text('('+filesLength+'/3)')
				    if ($("#formFileMultiple")[0].files.length > 3) {
				        $('#invalid-length').text('最多選取3張圖片')
				        $('#files-length').removeClass('text-black-50').addClass('text-danger')
				    } else {
				        $("#imageUploadForm").submit();
				        $('#invalid-length').text('')
				        $('#files-length').removeClass('text-danger').addClass('text-black-50')
				    }
				});
				
				// 限制評論字數
				$("#content-text").keyup(function(){
					let contentLength = $("#content-text").val().length;
				    $("#content-length").text('('+contentLength+'/200)');
				    if (contentLength > 200) {
				    	$('#invalid-con-length').text('評論內容上限200字')
				    	$('#content-length').removeClass('text-black-50').addClass('text-danger')
				    } else {
				    	$('#invalid-con-length').text('')
					    $('#content-length').removeClass('text-danger').addClass('text-black-50')
				    }
				});

				
				// 顯示"行程"資訊
				$('#btn-ticket').on('click', function() {
					$.ajax({
	                    type: 'GET',
	                    url: 'findItem',
	                    dataType: 'json',
	                    data: {
	                    	"select": "tickets"
	                    },
	                    success: function (data) {
	                    	$("tbody").html('');
	                    	$.each(data, function (i) {
	                    		let str = "<tr><td style='text-align: center'>行程</td>"+
	                    				  "<td style='text-align: center'>"+data[i].prod_no+"</td>"+
	                    			  	  "<td>"+data[i].prod_name+"</td>"+
		                    			  "<td class='info' style='text-align:center'><i class='bi bi-info-square'></i></td></tr>";
	                    		$("tbody").append(str)
	                    	})
	        	        	$("td").on('click', function() {
	        		        	let row = $(this).closest("tr");        
	        		        	let item = $(row).find('td').eq(0).html();
	        		        	let id = $(row).find('td').eq(1).html();
	        		        	let name = $(row).find('td').eq(2).html();
	        		            $("#item-id").val(id);
	        		            if (item == "住宿") 
	        		            	$("#tb-select").val("hotel")
	        		            else if (item == "行程")
	        		            	$("#tb-select").val("ticket")
	        		        });
        		            $('.info').on('click', function() {
	        		        	let row = $(this).closest("tr");        
	        		        	let item = $(row).find('td').eq(0).html();
	        		        	let id = $(row).find('td').eq(1).html();
        		            	popUpInfo(item, id);
        		            });
	                    },
	                    
	                    error: function () {
	                        console.log('error')
	                    }
	                })
				})
				
				
				// 顯示"住宿"資訊
				$('#btn-hotel').on('click', function() {
					$.ajax({
	                    type: 'GET',
	                    url: 'findItem',
	                    dataType: 'json',
	                    data: {
	                    	"select": "hotels"
	                    },
	                    success: function (data) {
	                    	$("tbody").html('');
	                    	let str = "";
	                    	$.each(data, function (i) {
	                    		str += "<tr><td style='text-align:center'>住宿</td>"+
	                    				  "<td style='text-align:center'>"+data[i].id+"</td>"+
	                    			  	  "<td >"+data[i].hotel_name+"</td>"+
		                    			  "<td class='info' style='text-align:center'><i class='bi bi-info-square'></i></td></tr>";
	                    	})
                    		$("tbody").html(str);
	        	        	$("td").on('click', function() {
	        		        	let row = $(this).closest("tr");        
	        		        	let item = $(row).find('td').eq(0).html();
	        		        	let id = $(row).find('td').eq(1).html();
	        		        	let name = $(row).find('td').eq(2).html();
	        		            $("#item-id").val(id);
	        		            if (item == "住宿") 
	        		            	$("#tb-select").val("hotel")
	        		            else if (item == "行程")
	        		            	$("#tb-select").val("ticket")
	        		        });
        		            $('.info').on('click', function() {
	        		        	let row = $(this).closest("tr");        
	        		        	let item = $(row).find('td').eq(0).html();
	        		        	let id = $(row).find('td').eq(1).html();
        		            	popUpInfo(item, id);
        		            });
	                    },
	                    
	                    error: function () {
	                        console.log('error')
	                    }
	                })
				})
	        	
				
				
	        	$("td").on('click', function() {
					showInfo()
		        });
				
				function showInfo() {
    		        let row = $(this).closest("tr");        
    		        let item = $(row).find('td').eq(0).html();
    		        let id = $(row).find('td').eq(1).html();
    		        let name = $(row).find('td').eq(2).html();
		        	inputValues(item, id);
		        	popUpInfo(item, id);
				}
				
				function inputValues(item, id) {
		            if (item == "住宿") 
		            	$("#tb-select").val("hotel")
		            else if (item == "行程")
		            	$("#tb-select").val("ticket")
			        $("#item-id").val(id);
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
				            Swal.fire({
				                html: '<div class="text-dark text-start small">' + itemInfo + '</div>',
				                confirmButtonColor: '#FF8D29',
				            })
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