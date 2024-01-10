<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
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
	
	<!-- header page -->
	<header class="site-header d-flex flex-column justify-content-center align-items-center">
		<div class="container">
	        <div class="row align-items-center">
	            <div class="col-lg-5 col-12">
	                <nav aria-label="breadcrumb">
	                    <ol class="breadcrumb">
	                        <li class="breadcrumb-item"><a href="page_boardList.do">공지 게시판</a></li>
	                        <li class="breadcrumb-item active" aria-current="page">글보기</li>
	                    </ol>
	                </nav>
	                <h2 class="text-white">글보기</h2>
	            </div>
	        </div>
		</div>
	</header>
	
	<!-- page content -->
	<main>
	<section id="c1" class="section-padding">
	    <div class="container">
	    
	    	<!-- 매물 자체 정보 -->
	        <div class="row justify-content-center">
				<div class="col-lg-12 col-12 text-center">
		        	<h3 class="mb-4">매물 상세 정보</h3>
		        </div>
	            <div class="col-lg-8 col-12 text-center mt-3">
					<div class="custom-block bg-white shadow-lg">
						<div class="col-lg-12 col-12 text-start">
							<!-- <div class="">
								<h3>매물 이름</h3>
							</div> -->
							<div class="mt-3">
								<h6 class="m-0"><b>매물 이름</b><!-- ( 192.168.0.1 | kong@ver.lae | 127.000 37.000 ) --></h6>
								<!-- <div class="m-0">2019.12.05. 10:56 | 89,994 읽음</div> -->
							</div>
							<hr>

							<div class="row justify-content-center">
								<div class="col-lg-11 col-12 text-center">
									<img alt="thief with gun" src="../../../images/colleagues-working-cozy-office-medium-shot.jpg">
				        		</div>
								<div class="col-lg-11 col-12 text-start">
									
									<h6>매물 정보</h6>
									<div>거래 유형 : 전세/월세/매매 중 1</div>
									<!-- 전세일 때: 보증금 출력 -->
									<!-- 월세일 때: 보증금, 월세 출력-->
									<!-- 매매일 때: 매매가 출려 -->
									<div>보증금: ?</div>
									<div>융자금: ?</div>
									<div>관리비: ?</div>
									<div>공인중개사: ?</div>
									<div>소재지: ?</div>
									<div>관리비: ?</div>
									<hr>
									
									<!-- 없으면 null로 표시 됨 -->
									<h6>매물 상세 정보</h6>
									<div>주택구분: ?</div>
									<div>전용면적: ?</div>
									<div>건축물용도: ?</div>
									<div>사용승인일: ?</div>
									<div>해당층/총층: ?/?</div>
									<div>방수/욕실수: ?/?</div>
									<div>총주차대수: ?</div>
									<hr>
									
									<!-- 옵션 항목이 있을 경우 출력 -->
									<h6>옵션</h6>
									<hr>
									<!-- 관리비 항목이 있을 경우 출력 -->
									<h6>관리비 포함 항목</h6>
				        		</div>
			        		</div>
			        		
			        	</div>
					</div>
	            </div>
	        </div>
	        
	        <!-- 매물 주변 편의시설 정보 -->
	        <div class="row justify-content-center">
		        <div class="col-lg-8 col-12 text-center mt-3">
					<div class="custom-block bg-white shadow-lg">
					
					<div class="row justify-content-center">

								<div class="col-lg-11 col-12 text-start">
									<h6>매물 주변 편의시설 정보</h6>
									<div>편의점: ?</div>
									<div>음식점: ?</div>
									<div>카페: ?</div>
									<div>영화관: ?</div>
									<div>경찰서: ?</div>
				        		</div>
			        		</div>
					
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
