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
	                        <li class="breadcrumb-item active" aria-current="page">글쓰기</li>
	                    </ol>
	                </nav>
	                <h2 class="text-white">글쓰기</h2>
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
		        	<h3 class="mb-4">글쓰기입니다 대회는 아니구요</h3>
		        </div>
	            <div class="col-lg-8 col-12 text-center mt-3">
					<div class="custom-block bg-white shadow-lg">
						<div class="col-lg-12 col-12">
						<div class="mt-0 text-start">
								<h6 class="m-0"><b>총강든도</b>( kong@ver.lae )</h6>
								<!-- <div class="m-0">2019.12.05. 10:56 | 89,994 읽음</div> -->
								<hr>
							</div>
				            <form action="#" method="post" class="custom-form contact-form" role="form">
				                <div class="row">
									<!-- 작성자와 이메일 체크 -->
				                    <!-- <div class="col-lg-6 col-md-6 col-12">
				                        <div class="form-floating">
				                            <input type="text" name="name" id="name" class="form-control" placeholder="Name" required="">
				                            
				                            <label for="floatingInput">작성자</label>
				                        </div>
				                    </div>
				
				                    <div class="col-lg-6 col-md-6 col-12"> 
				                        <div class="form-floating">
				                            <input type="email" name="email" id="email" pattern="[^ @]*@[^ @]*" class="form-control" placeholder="Email address" required="">
<<<<<<< HEAD
				                            <input type="email" name="email" id="email" pattern="[^@]+@[^.]+\.[a-zA-Z]{2,}" class="form-control" placeholder="Email address" required="">
=======
>>>>>>> parent of cb5055e (design: page_boardView 추가)
				                            
				                            <label for="floatingInput">이메일</label>
				                        </div>
				                    </div> -->
				
				                    <div class="col-lg-12 col-12">
				                        <div class="form-floating">
				                            <input type="text" name="subject" id="name" class="form-control" placeholder="Name" required="">
				                            
				                            <label for="floatingInput">글제목</label>
				                        </div>
				
				                        <div class="form-floating">
				                            <textarea class="form-control" id="content" name="content" placeholder="Tell me about the project"></textarea>
				                            <label for="floatingTextarea">내용을 입력해주세요</label>
				                        </div>
				                    </div>
				                    
				                    <div class="col-lg-12 col-12">
										<input type="file" name="upload" id="upload" class="form-control form-control-sm ">
				                    </div>
				                    
				                    <!-- <div class="border border-dark rounded-3 p-4 my-3"> -->
					                    <div>
					                    	<p>※ 개인정보 수집 및 이용에 관한 안내</p>
					                    </div>
					                    <div class="d-flex justify-content-center col-lg-12 col-12">
					                    	<div class="form-floating col-10">
												<div class="border text-start p-3 my-2">
												1. 수집 개인정보 항목 : 회사명, 담당자명, 메일 주소, 전화번호, 홈페이지 주소, 팩스번호, 주소<br>
												2. 개인정보의 수집 및 이용목적 : 제휴신청에 따른 본인확인 및 원활한 의사소통 경로 확보<br>
												3. 개인정보의 이용기간 : 모든 검토가 완료된 후 3개월간 이용자의 조회를 위하여 보관하며, 이후 해당정보를 지체 없이 파기합니다.<br>
												4. 그 밖의 사항은 개인정보취급방침을 준수합니다.
												</div>
			 	 							</div>
					                    </div>
					                    
					                    <div class="col-lg-12 col-12">
					                    	<div class="form-floating">
						                    <div class="d-flex justify-content-center col-12">
				 	 							<div class="form-check col-10 text-start">
													<input class="form-check-input" type="checkbox" id="invalidCheck" required>
													<label class="form-check-label" for="invalidCheck">
												    	개인정보 수집 및 이용에 대해 동의합니다.
												   	</label>
				 	 							</div>
						                    </div>
					                    	</div>
					                    </div>
				                    <!-- </div> -->
				                    <div class="d-flex justify-content-between mt-3">
				                    	<div class="align-items-center col-3">
					                    	<a href="page_boardList.do" class="btn custom-btn custom-border-btn col-12">목록</a>
				                    	</div>
				                    	<div class="col-3">
					                        <button type="submit" class="form-control">쓰기</button>
				                    	</div>
									</div>
				                </div>
				            </form>
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