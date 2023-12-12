<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<title>독방</title>

<!-- CSS FILES -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Montserrat:wght@500;600;700&family=Open+Sans&display=swap"
	rel="stylesheet">
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/bootstrap-icons.css" rel="stylesheet">
<link href="css/templatemo-topic-listing.css" rel="stylesheet">
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
							href="page_main.do">Home</a></li>

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
							data-bs-toggle="dropdown" aria-expanded="false"></button>

						<ul class="dropdown-menu">
							<li><button class="dropdown-item" type="button">로그인</button></li>

							<li><button class="dropdown-item" type="button">회원가입</button></li>
						</ul>
					</div>


				</div>
			</div>
		</nav>
		<!-- nav 종료 -->


		<section
			class="hero-section justify-content-center align-items-center">
			<div class="container">
				<div class="row">
					<div class="mx-auto">

						<form method="get" class="custom-form mt-4 pt-2 mb-lg-0 mb-5"
							role="search" action="page_search.do">
							<div class="input-group input-group-lg">
								<span class="input-group-text bi-search" id="basic-addon1">

								</span> <input name="keyword" type="search" class="form-control"
									id="keyword" placeholder="수원시, 장안구, 정자동 등 주소 입력"
									aria-label="Search">

								<button type="submit" class="form-control">Search</button>
							</div>
						</form>
					</div>
				</div>
			</div>
	
		</section>
		
		<div class="row">
			<section class="section" id="section-3" >
				<div id="map" style="width: 100%; height: 300px; margin: auto"></div>
				<code id="snippet" class="snippet"></code>
			</section>
		</div>
		<!-- 각자 발급받은 Client ID 값 넣기 -->
		<script type="text/javascript"
			src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=0xkngoqc6q"></script>
		<script id="code">
			var mapDiv = document.getElementById('map');
			var map = new naver.maps.Map(mapDiv);
		</script>
		
	

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
	<script src="js/custom.js"></script>

</body>
</html>