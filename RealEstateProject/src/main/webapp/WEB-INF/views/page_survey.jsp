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
	<link href="css/jquery-ui.min.css" rel="stylesheet">
	
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
			            <h2 class="text-white mb-4">집을 찾아 봅시다</h2>
			        </div>
			
			        <div class="col-lg-10 col-12 mx-auto">
			            <div class="timeline-container">
			                <ul class="vertical-scrollable-timeline" id="vertical-scrollable-timeline">
			                    <div class="list-progress">
			                        <div class="inner"></div>
			                    </div>
			                    
								<!-- 1단계 집 조건 -->
			                    <li>
									<div class="custom-block custom-block-topics-listing bg-white shadow-lg mb-5">
										<div class="custom-block-topics-listing-info d-flex">
											<div class="mb-0">
											
												<h5 class="mb-2">1단계 집 선택</h5>
												
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
												<hr>
												
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
												
												<h6>가격 설정</h6>
												<div id="price-slider"></div>
												<p>
												  <label for="price">매매가:</label>
												  <label id="price"></label>
												</p>
												<hr>
	                                            <!-- <a href="topics-detail.html" class="btn custom-btn mt-3 mt-lg-4">Learn More</a> -->
	                                            
		                                    </div>
		                                </div>
		                            </div>
		                            
			                        <div class="icon-holder">
			                          <i class="bi-search"></i>
			                        </div>
			                        
			                    </li>
			                    
			                    <!-- 2단계 지역 조건 -->
			                    <li>
			                        <div class="custom-block custom-block-topics-listing bg-white shadow-lg mb-5">
		                            	<div class="custom-block-topics-listing-info d-flex">
											<div class="mb-0">
												
	                                            <h5 class="mb-2">2단계 지역 검색</h5>
	                                            
												<h6>직장 검색(지하철역 검색)</h6>
	                                            <!-- <div class="container mt-3">
	  													<input type="text" class="form-control typeahead" placeholder="검색어를 입력하세요">
												</div> -->
												<div>
													<input id="autocomplete" title="type &quot;a&quot;">
												</div>
												<hr>
												
												<h6>통근방식</h6>
												<div class="form-check form-check-inline">
												  <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio1" value="option1">
												  <label class="form-check-label" for="inlineRadio1">도보</label>
												</div>
												<div class="form-check form-check-inline">
												  <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio2" value="option2">
												  <label class="form-check-label" for="inlineRadio2">지하철</label>
												</div>
												<div class="form-check form-check-inline">
												  <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio3" value="option3" disabled>
												  <label class="form-check-label" for="inlineRadio3">자차</label>
												</div>
												<hr>
												
												<h6>원하는 통근 시간을 입력하세요</h6>
												<div id="commute-slider"></div>
												<p>
												  <label for="commute">통근 시간:</label>
												  <label id="commute"></label>
												</p>
														
		                                    </div>
										</div>
		                            </div>
		                            
			                        <div class="icon-holder">
			                          <i class="bi-bookmark"></i>
			                        </div>
			                    </li>
			                    
								<!-- 상세 조건 -->
			                    <li>
			                        
			                        <div class="custom-block custom-block-topics-listing bg-white shadow-lg mb-5">
		                                <div class="custom-block-topics-listing-info d-flex">
		                                	<div class="mb-0">
		                                    
	                                            <h5 class="mb-2">3단계 세부 조건</h5>
	
	                                            <p class="mb-0">
	                                            음식점<br>
												영화관<br>
												보안: 경찰<br>
												</p>
		                                        
		                                    </div>
		                                </div>
		                            </div>
		                            
			                        <div class="icon-holder">
			                          <i class="bi-book"></i>
			                        </div>
		                            
			                    </li>
			                    <!-- 리스트 종료 -->
			                    
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
	<!-- 	<script src="js/jquery.min.js"></script> -->
	<script src="js/jquery.js"></script>
	<script src="js/bootstrap.bundle.min.js"></script>
	<script src="js/jquery.sticky.js"></script>
	<script src="js/click-scroll.js"></script>
	<script src="js/custom.js"></script>
	<script src="js/jquery-ui.min.js"></script>
	<script>
	
    // pageSize 테스트용 코드
	/* let maxLender = 20;
	for( let i = 0; i < 100; i+=5 ) {
		console.log( i + " : " + (i % 20 != 0 ? Math.floor(i/maxLender) + 1 : Math.floor(i/maxLender)) + " vs " + Math.ceil(i/maxLender) );
	
	} */
	var availableTags = [
	 "가락시장  ",
	 "강남    ",
	 "강남구청  ",
	 "강동    ",
	 "강동구청  ",
	 "강일    ", 
	 "개롱    ", 
	 "개포동   ",
	 "거여    ", 
	 "경찰병원  ",
	 "고덕    ", 
	 "고속터미널 ", 
	 "교대    ", 
	 "구룡    ", 
	 "구반포   ",
	 "굽은다리  ",
	 "길동    ", 
	 "남부터미널 ", 
	 "내방    ", 
	 "논현    ", 
	 "대모산입구 ", 
	 "대청    ", 
	 "대치    ", 
	 "도곡", 
	 "둔촌동",
	 "둔촌오륜",
	 "마천", 
	 "매봉", 
	 "명일", 
	 "몽촌토성",
	 "문정", 
	 "반포", 
	 "방배", 
	 "방이", 
	 "복정", 
	 "봉은사",
	 "사평", 
	 "삼성", 
	 "삼성중앙",
	 "삼전", 
	 "상일동",
	 "서초", 
	 "석촌", 
	 "석촌고분",
	 "선릉", 
	 "선정릉",
	 "송파", 
	 "송파나루",
	 "수서", 
	 "신논현",
	 "신반포",
	 "신사",
	 "암사",
	 "압구정",
	 "압구정로데오",
	 "양재", 
	 "양재시민의숲",
	 "언주",
	 "역삼",
	 "오금",
	 "올림픽공원",
	 "일원",
	 "잠실",
	 "잠실나루",
	 "잠실새내",
	 "잠원",
	 "장지",
	 "종합운동장", 
	 "중앙보훈병원",
	 "천호",
	 "청계산입구", 
	 "청담",
	 "학동",
	 "학여울",
	 "한성백제",
	 "한티"
	];
	
	$( "#autocomplete" ).autocomplete({
		delay: 0,
		source: availableTags
	});
	
	$( "#slider" ).slider({
		range: true,
		values: [ 17, 67 ]
	});
	// 매물가 price-slider
	$( function() {
	    $( "#price-slider" ).slider({
	      range: true,
	      min: 0,
	      max: 500,
	      step: 10,
	      values: [ 0, 500 ],
	      slide: function( event, ui ) {
	        $( "#price" ).text( ui.values[ 0 ] + " 만원 - " + ui.values[ 1 ] + " 만원");
	      }
	    });
	    $( "#price" ).text( $( "#price-slider" ).slider( "values", 0 ) +
	      " 만원 - " + $( "#price-slider" ).slider( "values", 1 ) + " 만원" );
	  } );
	
	// 통근시간 commute-slider
	$( function() {
	    $( "#commute-slider" ).slider({
	      range: true,
	      min: 0,
	      max: 120,
	      step: 10,
	      values: [ 0, 120 ],
	      slide: function( event, ui ) {
	        $( "#commute" ).text( ui.values[ 0 ] + " 분 - " + ui.values[ 1 ] + " 분");
	      }
	    });
	    $( "#commute" ).text( $( "#commute-slider" ).slider( "values", 0 ) +
	      " 분 - " + $( "#commute-slider" ).slider( "values", 1 ) + " 분" );
	  } );
	</script>

</body>
</html>