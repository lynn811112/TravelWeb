<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@page import="model.*"%>
<%@page import="java.util.*"%>

<!doctype html>
<html class="no-js" lang="">


<head>

	<% List<Comment> comments = (List<Comment>) request.getAttribute("comments"); %>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>評論列表</title>
    <meta name="description" content="Ela Admin - HTML5 Admin Template">
    <meta name="viewport" content="width=device-width, initial-scale=1">



    <link rel="stylesheet" href="assets/css/normalize.css">
    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/font-awesome.min.css">
    <link rel="stylesheet" href="assets/css/themify-icons.css">
    <link rel="stylesheet" href="assets/css/pe-icon-7-filled.css">
    <link rel="stylesheet" href="assets/css/flag-icon.min.css">
    <link rel="stylesheet" href="assets/css/cs-skin-elastic.css">
    <link rel="stylesheet" href="assets/css/style.css">
        <link rel="stylesheet" href="assets/css/lib/datatable/dataTables.bootstrap.min.css">

    <script src="https://code.jquery.com/jquery-1.10.2.js"></script>

    <!-- <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,600,700,800' rel='stylesheet' type='text/css'> -->

    <!-- <script type="text/javascript" src="https://cdn.jsdelivr.net/html5shiv/3.7.3/html5shiv.min.js"></script> -->

</head>

<body>
    <header id="header" class="header">
        <div class="top-right ">
            <a id="menuToggle" class="menutoggle"><i class="fa-lg bi bi-list"></i></a>
        </div>
    </header>
    <!-- Left Panel -->
    <aside id="left-panel" class="left-panel">
        <nav class="navbar navbar-expand-sm navbar-default">
            <div id="main-menu" class="main-menu collapse navbar-collapse">
                <ul class="nav navbar-nav">
                    <li id="title" class="menu-title" >Travel Web</li>
                    <li class="menu-title">項目管理</li>
                    <li><a href="#"><i class="menu-icon fa bi bi-person-fill"></i>會員管理</a></li>
                    <li><a href="#"><i class="menu-icon fa bi bi-file-earmark-text-fill"></i>訂單管理</a></li>
                    <li><a href="#"><i class="menu-icon fa bi bi-briefcase-fill"></i>行程管理</a></li>
                    <li><a href="#"><i class="menu-icon fa bi bi-house-door-fill"></i>住宿管理</a></li>
                    <li><a href="#"><i class="menu-icon fa bi-signpost-2-fill"></i>租車管理</a></li>
                    <li><a href="comment.jsp"><i class="menu-icon fa bi bi-chat-dots-fill"></i>評論管理</a></li>
                    <li class="menu-title">管理員項目</li>
                    <li><a href="#"><i class="menu-icon fa bi bi-bar-chart-fill"></i>銷售數據</a></li>
                    <li><a href="#"> <i class="menu-icon fa bi bi-gear-wide-connected"></i>Uipath</a></li>
                </ul>
            </div><!-- /.navbar-collapse -->
        </nav>
    </aside>


    <!-- Right Panel -->

    <div id="right-panel" class="right-panel">

        <div class="breadcrumbs">
            <div class="breadcrumbs-inner">
                <div class="row m-0">
                    <div class="col-sm-4">
                        <div class="page-header float-left">
                            <div class="page-title">
                                <h1>後台管理</h1>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-8">
                        <div class="page-header float-right">
                            <div class="page-title">
                                <ol class="breadcrumb text-right">
                                    <li><a href="#">後台管理</a></li>
                                    <li><a href="#">評論管理</a></li>
                                    <li class="active">檢視評論</li>
                                </ol>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="content">
            <div class="animated fadeIn">
                <div class="row">
                    <div class="col-md-12">
                        <div class="card">
                            <div class="card-header">
                                <strong class="card-title">評論列表</strong>
                                <div class="float-right">
                                    <div class="page-title">
                                        <div class="float-right">
                                            <form action="./CommentServlet">
                                                <input type="submit" name="action" value="query" id="">
                                                <input type="submit" name="action" value="insert" id="">
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="card-body">
                                <table id="bootstrap-data-table" class="table table-striped table-bordered">
                                    <thead>
                                        <tr>
                                            <th>評論ID</th>
                                            <th>項目類別</th>
                                            <th>項目ID</th>
                                            <th>使用者ID</th>
                                            <th>評論日期</th>
                                            <th>評分</th>
                                            <th>評論內容</th>
                                            <th>管理</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <% for (Comment comment : comments) {%>
                                            <tr>
                                                <td><%=comment.getComId()%></td>
                                                <td><%=comment.getItemTb()%></td>
                                                <td><%=comment.getItemId()%></td>
                                                <td><%=comment.getUserId()%></td>
                                                <td><%=comment.getComDate()%></td>
                                                <td><%=comment.getRate()%></td>
                                                <td><%=comment.getContent()%></td>
                                                <td><a href="/comment-list.jsp>"><i class="fa fa-pencil"></i></a>
                                                    <a href="/comment-list.html>">Delete</a></td>
                                            </tr>
                                        <%} %>

                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>


                </div>
            </div><!-- .animated -->
        </div><!-- .content -->


    </div><!-- /#right-panel -->

    <!-- Right Panel -->

    <!-- Scripts -->
    <script src="assets/js/vendor/jquery-2.1.4.min.js"></script>
    <script src="assets/js/popper.min.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>
    <script src="assets/js/jquery.matchHeight.min.js"></script>
    <script src="assets/js/main.js"></script>
    
        <script src="assets/js/lib/data-table/datatables.min.js"></script>
    <script src="assets/js/lib/data-table/dataTables.bootstrap.min.js"></script>
    <script src="assets/js/lib/data-table/dataTables.buttons.min.js"></script>
    <script src="assets/js/lib/data-table/buttons.bootstrap.min.js"></script>
    <script src="assets/js/lib/data-table/jszip.min.js"></script>
    <script src="assets/js/lib/data-table/vfs_fonts.js"></script>
    <script src="assets/js/lib/data-table/buttons.html5.min.js"></script>
    <script src="assets/js/lib/data-table/buttons.print.min.js"></script>
    <script src="assets/js/lib/data-table/buttons.colVis.min.js"></script>
    <script src="assets/js/init/datatables-init.js"></script>


</body>

</html>