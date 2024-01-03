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

	<header class="site-header d-flex flex-column justify-content-center align-items-center">
		<div class="container">
	        <div class="row align-items-center">
	            <div class="col-lg-5 col-12">
	                <nav aria-label="breadcrumb">
	                    <ol class="breadcrumb">
	                        <li class="breadcrumb-item"><a href="/">Homepage</a></li>
	                        <li class="breadcrumb-item active" aria-current="page">나만의 집 찾기</li>
	                    </ol>
	                </nav>
	                <h2 class="text-white">나만의 집 찾기</h2>
	            </div>
	        </div>
	    </div>
	</header>

	<!-- page content -->
	<main>
		<section class="timeline-section section-padding" id="section_3">
			<div class="section-overlay"></div>
			<div class="container">
			    <div class="row">
			        <div class="col-12 text-center">
			            <h2 class="text-white mb-4">집을 찾아 봅시다</h1>
			        </div>
			
			        <div class="col-lg-10 col-12 mx-auto">
			            <div class="timeline-container">
			                <ul class="vertical-scrollable-timeline" id="vertical-scrollable-timeline">
			                    <div class="list-progress">
			                        <div class="inner"></div>
			                    </div>
			
			                    <li>
									<div class="custom-block custom-block-topics-listing bg-white shadow-lg mb-5">
		                                <div class="d-flex">
		                                    <div class="custom-block-topics-listing-info d-flex">
		                                        <div>
		                                            <h5 class="mb-2">1단계 집 선택</h5>
		                                            <div class="mb-0">
		
		                                            <h6>방종류 / 중복 선택:</h6>
		                                            <div class="form-check form-check-inline">
													  <input class="form-check-input" type="checkbox" id="inlineCheckbox1" value="AT">
													  <label class="form-check-label" for="inlineCheckbox1">아파트</label>
													</div>
													<div class="form-check form-check-inline">
													  <input class="form-check-input" type="checkbox" id="inlineCheckbox2" value="OP">
													  <label class="form-check-label" for="inlineCheckbox2">오피스텔</label>
													</div>
		                                            <div class="form-check form-check-inline">
													  <input class="form-check-input" type="checkbox" id="inlineCheckbox1" value="SH">
													  <label class="form-check-label" for="inlineCheckbox1">주택</label>
													</div>
													<div class="form-check form-check-inline">
													  <input class="form-check-input" type="checkbox" id="inlineCheckbox2" value="OR">
													  <label class="form-check-label" for="inlineCheckbox2">원룸</label>
													</div>
													
													<h6>거래 유형 / 중복 선택: </h6>
													<div class="form-check form-check-inline">
													  <input class="form-check-input" type="checkbox" id="inlineCheckbox1" value="L">
													  <label class="form-check-label" for="inlineCheckbox1">전세</label>
													</div>
													<div class="form-check form-check-inline">
													  <input class="form-check-input" type="checkbox" id="inlineCheckbox2" value="M">
													  <label class="form-check-label" for="inlineCheckbox2">월세</label>
													</div>
		                                            <div class="form-check form-check-inline">
													  <input class="form-check-input" type="checkbox" id="inlineCheckbox1" value="P">
													  <label class="form-check-label" for="inlineCheckbox1">매매</label>
													</div>
													<hr>
													
													<label class="form-label" for="customRange3">가격</label>
													<div class="range" data-mdb-range-init>
														<input type="range" class="form-range" min="0" max="10" step="0.5" id="customRange3" />
													</div>
													<!-- https://mdbootstrap.com/docs/standard/forms/range/ -->
													</div>
		
		                                            <a href="topics-detail.html" class="btn custom-btn mt-3 mt-lg-4">Learn More</a>
		                                        </div>
		
		                                    </div>
		                                </div>
		                            </div>
			                        <div class="icon-holder">
			                          <i class="bi-search"></i>
			                        </div>
			                    </li>
			                    
			                    <li>
			                        <div class="custom-block custom-block-topics-listing bg-white shadow-lg mb-5">
		                                <div class="d-flex">
		                                    <div class="custom-block-topics-listing-info d-flex">
		                                        <div>
		                                            <h5 class="mb-2">2단계 지역 검색</h5>
		
		                                             <div class="mb-0">
		                                            직장 선택  검색을 통하여 역을 선택<br>
		                                            <div class="container mt-3">
    <input type="text" class="form-control typeahead" placeholder="검색어를 입력하세요">
</div>
													<hr>
													<h6>통근방식</h6>
													<div class="form-check form-check-inline">
													  <input class="form-check-input" type="checkbox" id="inlineCheckbox1" value="work">
													  <label class="form-check-label" for="inlineCheckbox1">도보</label>
													</div>
													<div class="form-check form-check-inline">
													  <input class="form-check-input" type="checkbox" id="inlineCheckbox2" value="metro">
													  <label class="form-check-label" for="inlineCheckbox2">지하철</label>
													</div>
													<div class="form-check form-check-inline">
													  <input class="form-check-input" type="checkbox" id="inlineCheckbox3" value="car">
													  <label class="form-check-label" for="inlineCheckbox2">차량</label>
													</div>
													<hr>
													
													<label class="form-label" for="customRange4">통근시간</label>
													<div class="range" data-mdb-range-init>
														<input type="range" class="form-range" min="0" max="10" step="0.5" id="customRange3" />
													</div>
													</div>
		
		                                            <a href="topics-detail.html" class="btn custom-btn mt-3 mt-lg-4">Learn More</a>
		                                        </div>
		
		                                    </div>
		                                </div>
		                            </div>
			                        <div class="icon-holder">
			                          <i class="bi-bookmark"></i>
			                        </div>
			                    </li>
			
			                    <li>
			                        <div class="icon-holder">
			                          <i class="bi-book"></i>
			                        </div>
			                        <div class="custom-block custom-block-topics-listing bg-white shadow-lg mb-5">
		                                <div class="d-flex">
		                                    <div class="custom-block-topics-listing-info d-flex">
		                                        <div>
		                                            <h5 class="mb-2">3단계 세부 조건</h5>
		
		                                            <p class="mb-0">
		                                            음식점<br>
													영화관<br>
													보안: 경찰<br>
													</p>
		
		                                            <a href="topics-detail.html" class="btn custom-btn mt-3 mt-lg-4">Learn More</a>
		                                        </div>
		
		                                    </div>
		                                </div>
		                            </div>
			                    </li>
			                </ul>
			            </div>
			        </div>
			        <!-- <div class="col-12 text-center mt-5">
			            <p class="text-white">
			                Want to learn more?
			                <a href="#" class="btn custom-btn custom-border-btn ms-3">Check out Youtube</a>
			            </p>
			        </div> -->
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