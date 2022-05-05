<!doctype html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang=""> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8" lang=""> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9" lang=""> <![endif]-->
<!--[if gt IE 8]><!-->
<html class="no-js" lang="">
<!--<![endif]-->

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Ela Admin - HTML5 Admin Template</title>
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

    <script src="https://code.jquery.com/jquery-1.10.2.js"></script>

    <!-- <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,600,700,800' rel='stylesheet' type='text/css'> -->

    <!-- <script type="text/javascript" src="https://cdn.jsdelivr.net/html5shiv/3.7.3/html5shiv.min.js"></script> -->

</head>

<body>
    <!-- Left-Navbar -->
    <aside id="left-panel" class="left-panel">
        <div id="navbar"></div>
        <script>
            $(function () {
                $("#navbar").load("partials/navbar.html");
            });
        </script>
    </aside>
    <!-- /#Left-Navbar -->


    <!-- Right Panel -->

    <div id="right-panel" class="right-panel">

        <!-- Header-->
        <div id="header"></div>
        <script>
            $(function () {
                $("#header").load("partials/header.html");
            });
        </script>
        <!-- Header-->

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
                                    <li class="active">新增評論</li>
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
                    <div class="col-lg-6">
                        <div class="card">
                            <div class="card-header">
                                <strong>新增評論</strong>
                            </div>
                            <div class="card-body card-block">
                                <form action="#" method="post" enctype="multipart/form-data" class="form-horizontal">
                                    <div class="row form-group">
                                        <div class="col col-md-3">
                                            <label for="select" class=" form-control-label">項目類別</label>
                                        </div>
                                        <div class="col-12 col-md-9">
                                            <select name="select" id="select" class="form-control">
                                                <option value="0">景點票券</option>
                                                <option value="1">餐廳</option>
                                                <option value="2">住宿</option>
                                                <option value="3">租車</option>
                                            </select>
                                        </div>

                                    </div>

                                    <div class="row form-group">
                                        <div class="col col-md-3">
                                            <label for="object-id" class="form-control-label">商品編號</label>
                                        </div>
                                        <div class="col-12 col-md-9">
                                            <input type="text" id="object-id" name="object-id" placeholder="ex: 0004"
                                                class="form-control">
                                            <!-- <small class="form-text text-muted">This is a help text</small> -->
                                        </div>
                                    </div>
                                    <div class="row form-group">
                                        <div class="col col-md-3">
                                            <label for="rate" class="form-control-label">給予評分</label>
                                            <!-- <label for="customRange2" class="form-label">Example range</label> -->
                                        </div>
                                        <div class="col-12 col-md-9">
                                            <input type="range" class="custom-range" id="rate" name="rate" min="0"
                                                max="5">
                                        </div>
                                    </div>
                                    <div class="row form-group">
                                        <div class="col col-md-3"><label for="textarea-input"
                                                class=" form-control-label">評論內容</label></div>
                                        <div class="col-12 col-md-9"><textarea name="textarea-input" id="textarea-input"
                                                rows="9" placeholder="請寫下您的旅遊體驗..." class="form-control"></textarea>
                                        </div>
                                    </div>


                                    <div class="row form-group">
                                        <div class="col col-md-3"><label class=" form-control-label">Radios</label>
                                        </div>
                                        <div class="col col-md-9">
                                            <div class="form-check">
                                                <div class="radio">
                                                    <label for="radio1" class="form-check-label ">
                                                        <input type="radio" id="radio1" name="radios" value="option1"
                                                            class="form-check-input">Option 1
                                                    </label>
                                                </div>
                                                <div class="radio">
                                                    <label for="radio2" class="form-check-label ">
                                                        <input type="radio" id="radio2" name="radios" value="option2"
                                                            class="form-check-input">Option 2
                                                    </label>
                                                </div>
                                                <div class="radio">
                                                    <label for="radio3" class="form-check-label ">
                                                        <input type="radio" id="radio3" name="radios" value="option3"
                                                            class="form-check-input">Option 3
                                                    </label>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row form-group">
                                        <div class="col col-md-3"><label class=" form-control-label">Inline
                                                Radios</label></div>
                                        <div class="col col-md-9">
                                            <div class="form-check-inline form-check">
                                                <label for="inline-radio1" class="form-check-label ">
                                                    <input type="radio" id="inline-radio1" name="inline-radios"
                                                        value="option1" class="form-check-input">One
                                                </label>
                                                <label for="inline-radio2" class="form-check-label ">
                                                    <input type="radio" id="inline-radio2" name="inline-radios"
                                                        value="option2" class="form-check-input">Two
                                                </label>
                                                <label for="inline-radio3" class="form-check-label ">
                                                    <input type="radio" id="inline-radio3" name="inline-radios"
                                                        value="option3" class="form-check-input">Three
                                                </label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row form-group">
                                        <div class="col col-md-3"><label class=" form-control-label">Checkboxes</label>
                                        </div>
                                        <div class="col col-md-9">
                                            <div class="form-check">
                                                <div class="checkbox">
                                                    <label for="checkbox1" class="form-check-label ">
                                                        <input type="checkbox" id="checkbox1" name="checkbox1"
                                                            value="option1" class="form-check-input">Option 1
                                                    </label>
                                                </div>
                                                <div class="checkbox">
                                                    <label for="checkbox2" class="form-check-label ">
                                                        <input type="checkbox" id="checkbox2" name="checkbox2"
                                                            value="option2" class="form-check-input"> Option 2
                                                    </label>
                                                </div>
                                                <div class="checkbox">
                                                    <label for="checkbox3" class="form-check-label ">
                                                        <input type="checkbox" id="checkbox3" name="checkbox3"
                                                            value="option3" class="form-check-input"> Option 3
                                                    </label>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row form-group">
                                        <div class="col col-md-3"><label class=" form-control-label">Inline
                                                Checkboxes</label></div>
                                        <div class="col col-md-9">
                                            <div class="form-check-inline form-check">
                                                <label for="inline-checkbox1" class="form-check-label ">
                                                    <input type="checkbox" id="inline-checkbox1" name="inline-checkbox1"
                                                        value="option1" class="form-check-input">One
                                                </label>
                                                <label for="inline-checkbox2" class="form-check-label ">
                                                    <input type="checkbox" id="inline-checkbox2" name="inline-checkbox2"
                                                        value="option2" class="form-check-input">Two
                                                </label>
                                                <label for="inline-checkbox3" class="form-check-label ">
                                                    <input type="checkbox" id="inline-checkbox3" name="inline-checkbox3"
                                                        value="option3" class="form-check-input">Three
                                                </label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row form-group">
                                        <div class="col col-md-3"><label for="file-input"
                                                class=" form-control-label">File input</label></div>
                                        <div class="col-12 col-md-9"><input type="file" id="file-input"
                                                name="file-input" class="form-control-file"></div>
                                    </div>
                                    <div class="row form-group">
                                        <div class="col col-md-3"><label for="file-multiple-input"
                                                class=" form-control-label">Multiple File input</label></div>
                                        <div class="col-12 col-md-9"><input type="file" id="file-multiple-input"
                                                name="file-multiple-input" multiple="" class="form-control-file">
                                        </div>
                                    </div>
                                </form>
                            </div>
                            <div class="card-footer">
                                <button type="submit" class="btn btn-primary btn-sm">
                                    <i class="fa fa-dot-circle-o"></i> Submit
                                </button>
                                <button type="reset" class="btn btn-danger btn-sm">
                                    <i class="fa fa-ban"></i> Reset
                                </button>
                            </div>
                        </div>

                    </div>


                </div>


            </div><!-- .animated -->
        </div><!-- .content -->

        <div class="clearfix"></div>
        <div id="footer"></div>
        <script>
            $(function () {
                $("#footer").load("partials/footer.html");
            });
        </script>


    </div><!-- /#right-panel -->

    <!-- Right Panel -->

    <!-- Scripts -->
    <script src="assets/js/vendor/jquery-2.1.4.min.js"></script>
    <script src="assets/js/popper.min.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>
    <script src="assets/js/jquery.matchHeight.min.js"></script>
    <script src="assets/js/main.js"></script>


</body>

</html>