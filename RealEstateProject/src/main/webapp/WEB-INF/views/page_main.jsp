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
	<link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@500;600;700&family=Open+Sans&display=swap" rel="stylesheet">
	<link href="css/bootstrap.min.css" rel="stylesheet">
	<link href="css/bootstrap-icons.css" rel="stylesheet">
	<link href="css/templatemo-topic-listing.css" rel="stylesheet">   
</head>

<body>
	<!-- header page include -->
	<%@ include file="page_nav.jsp" %>
	<main>
		<section
			class="hero-section d-flex justify-content-center align-items-center"
			id="section_1">
			<div class="container">
				<div class="row">
					<div class="col-lg-8 col-12 mx-auto">
						<!-- 제목 -->
						<h1 class="text-white text-center">독방</h1>
						<!-- 부제목 -->
						<h6 class="text-center">원하는 부동산을 더 쉽게 찾으세요</h6>
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


		<section class="featured-section">
			<div class="container">
				<div class="row justify-content-center">

					<!-- 설문조사 col-lg-8 이부분이 가로 -->
					<!--  -->
					<!-- <div class="col-lg-4 col-12 mb-4 mb-lg-0"> -->
					<div class="col-lg-8 col-12 mb-4 mb-lg-0">
						<div class="custom-block bg-white shadow-lg">
							<a href="page_survey.do">
								<div class="d-flex">
									<div>
										<h5 class="mb-2">나만의 집 찾기</h5>
										<p class="mb-0">간단한 설문을 통해 원하는 지역과 집을 편하게 찾으세요.</p>
									</div>									<!-- 숫자 뱃지 -->
									<!-- <span class="badge bg-design rounded-pill ms-auto">14</span> -->
								</div> <img src="images/topics/undraw_Remote_design_team_re_urdx.png"
								class="custom-block-image img-fluid" alt="">
							</a>
						</div>
					</div>
				</div>
			</div>
		</section>


	</main>	
	<!-- footer page include -->
	<%@ include file="page_footer.jsp" %>

	<!-- JAVASCRIPT FILES -->
	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap.bundle.min.js"></script>
	<script src="js/jquery.sticky.js"></script>
	<script src="js/click-scroll.js"></script>
	<script src="js/custom.js"></script>
</body>
</html>