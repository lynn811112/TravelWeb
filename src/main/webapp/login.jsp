<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>DashBoard Login</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-image: url('css/images/food.webp');
            background-repeat: repeat;
        }

        #main-img {
            /* display: block;
            margin: auto; */
            width: 100%;
        }

        .height {
            height: 100vh;
        }
        
        #login-status {
        	font-size: 8px;
/*         	padding: 0 8px; */
/*         	margin: 0; */
        }
    </style>
</head>

<body>

    <div class="container height ">
        <div class="row justify-content-center align-items-center" style="min-height: 100vh">
            <div class="col-md-4  ">
                <img id="main-img" class="mt-3" src="css/images/undraw_traveling_re_weve.svg" alt="">
            </div>
            <div class="col-md-5 m-4">
                <div class="card px-5">
                    <div class="card-body">
                        <h3 id="title" class="menu-title text-center fw-bold mt-5 mb-4" style="color: orange;">
                            Travel Web 後台管理系統
                        </h3>
                        <p class="fs-6" id="login-status" style="color:red;font-size: 10px">&ensp;</p>
                        <form class="row g-3 needs-validation" name="form" action="login" method="POST" novalidate>
                            <!-- Email input -->
                            <div class="col-12 mb-4 position-relative">
                                <input type="email" name="email" class="form-control" id="email" placeholder="Email address"
                                    required>
                                <div class="position-absolute valid-feedback">Email格式正確!</div>
                                <div class="position-absolute invalid-feedback">請輸入正確的Email格式</div>
                            </div>
							<!-- password input	-->
                            <div class="col-12 mb-5 position-relative">
                                <input type="password" name="password" class="form-control" id="password" placeholder="Password" required>
                                <div class="position-absolute valid-feedback">密碼格式正確!</div>
                                <div class="position-absolute invalid-feedback">請輸入密碼</div>
                            </div>

                            <!-- 2 column grid layout for inline styling -->
                            <div class="row mb-4">
                                <div class="col d-flex justify-content-center">
                                    <!-- Checkbox -->
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" value="" id="form2Example31" />
                                        <label class="form-check-label" for="form2Example31">記住我</label>
                                    </div>
                                </div>
                                <!-- Simple link -->
                                <div class="col d-flex justify-content-center">
                                    <a href="#!" class="link-secondary" style="text-decoration: none;">忘記密碼?</a>
                                </div>
                            </div>
                            <div class="col-12 d-grid gap-2 mb-4">
                                <button class="btn btn-warning rounded-pill" id="submit" type="submit">登入系統</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>


    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
    <script>
    	// 確認輸入資料格式
        (function () {
            'use strict'
            // Fetch all the forms we want to apply custom Bootstrap validation styles to
            var forms = document.querySelectorAll('.needs-validation')
            // Loop over them and prevent submission
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
               
		// 若Controller回傳isLoggedIn為false，給client提示
	    <% 
		Boolean isLoggedIn = (Boolean) request.getAttribute("isLoggedIn"); 
		%>
			try {
		        if (<%=isLoggedIn%> == false) {
		        	document.getElementById("login-status").textContent = '帳號不存在或密碼輸入錯誤';
		        }
			} catch {
				
			}

		// 當client開始輸入，清除提示錯誤字樣
		document.querySelector('#email').addEventListener('focus', function () {
			document.getElementById("login-status").textContent = '　';
		})

    </script>
</body>

</html>