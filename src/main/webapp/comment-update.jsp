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
	<title>評論列表</title>
	<meta name="description" content="dashboard">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<%-- style sheet (以下三個style sheet請記得link進來) --%>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css">
</head>

<body>
    <%-- side Bar (side bar請記得include進來) --%>
	<%@include file="jspf/sidebar.jspf"%>

    <%-- main--%>
	<main id="right-panel" class="right-panel">
		<div class="breadcrumbs">
			<div class="breadcrumbs-inner">
				<div class="row m-0">
					<div class="page-header float-left">
						<div class="page-title">
							<h1>新增評論</h1>
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
                                        <input type="range" class="form-range" name="rate"  id="customRange" value="<%=comment.getRate()%>" min="0" max="5">
                                    </div>
                                </div>

                                <!-- 體驗分享 -->
                                <div class="mb-4 row">
                                    <label for="content-text" class="col-sm-3 col-form-label">評論內容</label>
                                    <div class="col-sm-9">
                                        <textarea class="form-control" name="content" id="content-text" cols="30" rows="10"> <%=comment.getContent()%></textarea>
                                        <!-- <input type="texta" class="form-control" name="item-id" id="item-id" > -->
                                      </div>
                                </div>
                                <!-- 送出 -->
                                <!-- action=insert對應到controller的doGet -->
                                <button type="submit" name="action" value="update" class="btn btn-primary mt-4">送出</button>
                            </form>
                            
                        </div>
                    </div>
                </div>
            </div>
        </div>


    </main>

	<%-- Scripts --%>
	<script src="js/vendor/jquery-2.1.4.min.js"></script>
	<script src="js/plugins.js"></script>
	<script src="js/main.js"></script>
</body>

</html>