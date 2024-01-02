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
	<!-- nav page include -->
	<%@ include file="../page_nav.jsp" %>
	
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
	        <div class="row justify-content-center">
				<div class="col-lg-12 col-12 text-center">
		        	<h3 class="mb-4">글보기입니다 만지시면 안되요</h3>
		        </div>
	            <div class="col-lg-12 col-12 text-center mt-3">
					<div class="custom-block bg-white shadow-lg">
						<div class="col-lg-12 col-12 text-start">
							<div class="">
								<h3>[독방] 나만의 집찾기를 소개할게요</h3>
							</div>
							
							<div class="mt-3">
								<h6 class="m-0"><b>총강</b>( 192.168.0.1 | kong@ver.lae | 127.000 37.000 )</h6>
								<div class="m-0">2019.12.05. 10:56 | 89,994 읽음</div>
							</div>
							
							<hr>
							
							<div class="col-lg-12 col-12 text-center">
								<img alt="thief with gun" src="../../../images/colleagues-working-cozy-office-medium-shot.jpg">
			        		</div>
							<div class="col-lg-12 col-12 text-start">
								<div>안녕하세요 총강이에요</div>
								<div>오늘은 독방의 나만의 집찾기 서비스에 대해서 알아볼 거에요</div>
								<div>나만의 집 찾기 서비스란 조건에 따른 지역과 집을 추천해주는 서비스에요</div>
								<div>잘 이용해서 좋은집을 찾아보자구요</div>
			        		</div>
			        		
			        		<hr>
			        		
			        		<div class="d-flex justify-content-between mt-3">
								<a href="page_boardList.do" class="btn custom-btn custom-border-btn col-3">목록</a>
		                    	<div class="btn-group col-5" role="group" >
								  	<button type="button" class="btn custom-btn custom-border-btn">수정</button>
								  	<button type="button" class="btn custom-btn custom-border-btn">삭제</button>
			                        <a href="page_boardWrite.do" class="btn custom-btn">쓰기</a>
		                    	</div>
							</div>
			        		
			        	</div>
					</div>
	            </div>
	        </div>
	        <div class="row justify-content-center">
	            <div class="col-lg-12 col-12 text-center mt-3">
					<div class="custom-block bg-white shadow-lg">
						<div class="col-lg-12 col-12 text-start">
			        		<div class="d-flex justify-content-between mt-3">
								<div class="col-lg-9 col-9 text-start">
									글쓴이 비밀번호<br>
									내용<br>
				        		</div>
			                    <input type="submit" class="btn custom-btn col-3" value="작성하기"></input>
							</div>
			        		
			        	</div>
					</div>
	            </div>
	        </div>
	    </div>
	</section>
	</main>	

	<!-- footer page include -->
	<%@ include file="../page_footer.jsp" %>
	
	<!-- JAVASCRIPT FILES -->
	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap.bundle.min.js"></script>
	<script src="js/jquery.sticky.js"></script>
	<script src="js/click-scroll.js"></script>
	<script src="js/custom.js"></script>
</body>
</html>