<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>독방</title>

    <!-- CSS FILES -->        
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@500;600;700&family=Open+Sans&display=swap" rel="stylesheet">
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/bootstrap-icons.css" rel="stylesheet">
    <link href="css/templatemo-topic-listing.css" rel="stylesheet">   

    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
            background-color: #f8f9fa;
        }

        .login-container {
            background-color: #fff;
            border: 1px solid #ced4da;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 300px;
            text-align: center;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-group label {
            display: block;
            margin-bottom: 8px;
            color: #495057;
        }

        .form-group input {
            width: 100%;
            padding: 10px;
            box-sizing: border-box;
            border: 1px solid #ced4da;
            border-radius: 4px;
            margin-top: 5px;
        }

        .form-group button {
            background-color: #007bff;
            color: #fff;
            padding: 12px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        .form-group button:hover {
            background-color: #0056b3;
        }

        .form-group a {
            color: #007bff;
            text-decoration: none;
        }

        .form-group a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <main>
        <!-- nav 시작 -->
        <nav class="navbar navbar-expand-lg">
            <div class="container">
                <a class="navbar-brand" href="page_main.do"> <i class="bi-back"></i>
                    <span>독방</span>
                </a>

                <div class="d-lg-none ms-auto me-4">
                    <a href="#top" class="navbar-icon bi-person smoothscroll"></a>
                </div>

                <button class="navbar-toggler" type="button"
                    data-bs-toggle="collapse" data-bs-target="#navbarNav"
                    aria-controls="navbarNav" aria-expanded="false"
                    aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav ms-lg-5 me-lg-auto">
                        <li class="nav-item"><a class="nav-link click-scroll"
                            href="page_search.do">Browse Topics</a></li>

                        <li class="nav-item"><a class="nav-link click-scroll"
                            href="#section_3">How it works</a></li>

                        <li class="nav-item"><a class="nav-link click-scroll"
                            href="#section_4">FAQs</a></li>

                        <li class="nav-item"><a class="nav-link click-scroll"
                            href="#section_5">Contact</a></li>
                    </ul>

                    <div class="dropdown">
                        <button class="btn btn-secondary dropdown-toggle" type="button"
                            data-bs-toggle="dropdown" aria-expanded="false">
                            Menu
                        </button>

                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item" href="page_login.do">로그인</a></li>
                            <li><a class="dropdown-item" href="#">회원가입</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </nav>
        <!-- nav 종료 -->

        <div class="login-container">
            <h2 style="color: #007bff;">Login</h2>
            <form action="loginProcess.jsp" method="post">
                <div class="form-group">
                    <label for="username">Username:</label>
                    <input type="text" id="username" name="username" required>
                </div>
                <div class="form-group">
                    <label for="password">Password:</label>
                    <input type="password" id="password" name="password" required>
                </div>
                <div class="form-group">
                    <button type="submit">Login</button>
                </div>
                <div class="form-group">
                    <p>Don't have an account? <a href="#">Sign up</a></p>
                </div>
            </form>
        </div>
    </main>

    <footer class="site-footer section-padding">
        <div class="container">
            <div class="row">
            
            	<div class="col-lg-3 col-12 mb-4 pb-2">
					<a class="navbar-brand mb-2" href="page_main.do"> <i
						class="bi-back"></i> <span>독방</span>
					</a>
				</div>

				<div class="col-lg-3 col-md-4 col-6">
					<h6 class="site-footer-title mb-3">Resources</h6>

					<ul class="site-footer-links">
						<li class="site-footer-link-item"><a href="page_main.do"
							class="site-footer-link">Home</a></li>

						<li class="site-footer-link-item"><a href="#"
							class="site-footer-link">How it works</a></li>

						<li class="site-footer-link-item"><a href="#"
							class="site-footer-link">FAQs</a></li>

						<li class="site-footer-link-item"><a href="#"
							class="site-footer-link">Contact</a></li>
					</ul>
				</div>

				<div class="col-lg-3 col-md-4 col-6 mb-4 mb-lg-0">
					<h6 class="site-footer-title mb-3">Information</h6>

					<p class="text-white d-flex mb-1">
						<a href="tel: 010-1234-5678" class="site-footer-link">
							010-1234-5678 </a>
					</p>

					<p class="text-white d-flex">
						<a href="mailto:admin@dockbang.com" class="site-footer-link">
							admin@dockbang.com </a>
					</p>
				</div>

				<div class="col-lg-3 col-md-4 col-12 mt-4 mt-lg-0 ms-auto">
					<!-- <div class="dropdown">
                            <button class="btn btn-secondary dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                            English</button>

                            <ul class="dropdown-menu">
                                <li><button class="dropdown-item" type="button">Thai</button></li>

                                <li><button class="dropdown-item" type="button">Myanmar</button></li>

                                <li><button class="dropdown-item" type="button">Arabic</button></li>
                            </ul>
                        </div> -->

					<p class="copyright-text mt-lg-5 mt-4">
						Copyright © 2048 Topic Listing Center. All rights reserved. <br>
						<br>Design: <a rel="nofollow" href="https://templatemo.com"
							target="_blank">TemplateMo</a>
					</p>

				</div>

			</div>
		</div>
	</footer>

	<!-- JAVASCRIPT FILES -->
	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap.bundle.min.js"></script>
	<script src="js/jquery.sticky.js"></script>
	<script src="js/click-scroll.js"></script>
	<script src="js/custom.js"></script>
</body>
</html>