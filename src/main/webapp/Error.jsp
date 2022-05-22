<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="true" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
	"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Error</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
    	center {
    		width:50%;
    		margin: auto;
    	}
    	img {
     		width: 500px; 
    	}
    </style>
</head>
<body>
	<center >
		<img src="css/images/undraw_server_down_s-4-lk.svg" alt="something wrong" class="my-5">
		<h1 class="my-3">發生錯誤了!</h1>
		<% if (exception != null) { %>
		
			<h6 class="my-4"><%=exception.getMessage()%></h6>
		<% } %>

		<a class="my-4" href="#" onClick="history.back()">回到上一頁</a>
	</center>	
</body>
</html>