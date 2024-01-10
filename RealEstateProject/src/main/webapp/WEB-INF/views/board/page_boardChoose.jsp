<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.dockbang.model.BoardTO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>

<%
/*
String category = (String)request.getAttribute("category");
List<BoardTO> boardChoose = (List)request.getAttribute("boardChoose");
String title = "";
if(category.equals("news")){
    title = "뉴스게시판";
} else if(category.equals("notice")){
    title = "공지게시판";
} else if(category.equals("free")){
    title = "자유게시판";
}*/
   %>
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
	<%@ include file="../page_nav.jsp" %>

	<!-- page content -->
	<main>
		<header class="site-header d-flex flex-column justify-content-center align-items-center">
		    <div class="container">
		        <div class="row align-items-center">
		
		            <div class="col-lg-5 col-12">
		                <nav aria-label="breadcrumb">
		                    <ol class="breadcrumb">
		                        <li class="breadcrumb-item"><a href="/">Homepage</a></li>
		                        <li class="breadcrumb-item active" aria-current="page">게시판</li>
		                    </ol>
		                </nav>
		
		                <h2 class="text-white">게시판</h2>
		            </div>
		
		        </div>
		    </div>
		</header>
		
		
		<section class="section-padding">
		    <div class="container">
		        <div class="row">
		            <div class="col-lg-12 col-12 text-center">
		                <h3 class="mb-4">게시판</h3>
		            </div>
		            <div class="col-lg-8 col-12 mt-3 mx-auto">
		                <div class="custom-block custom-block-topics-listing bg-white shadow-lg mb-5">
		                    <div class="d-flex">
		                        <img src="images/topics/undraw_Remote_design_team_re_urdx.png" class="custom-block-image img-fluid" alt="">
		
		                        <div class="custom-block-topics-listing-info d-flex">
		                            <div>
		                                <h5 class="mb-2">공지게시판</h5>
		
		                                <p class="mb-0">독방 운영 관련 내용들을 제시하는 게시판</p>
		
		                                <a href="page_boardList.do?category=notice" class="btn custom-btn mt-3 mt-lg-4">Learn More</a>
		                            </div>
		
		                            <span class="badge bg-design rounded-pill ms-auto">14</span>
		                        </div>
		                    </div>
		                </div>
		
		                <div class="custom-block custom-block-topics-listing bg-white shadow-lg mb-5">
		                    <div class="d-flex">
		                        <img src="images/topics/undraw_online_ad_re_ol62.png" class="custom-block-image img-fluid" alt="">
		
		                        <div class="custom-block-topics-listing-info d-flex">
		                            <div>
		                                <h5 class="mb-2">뉴스게시판</h5>
		
		                                <p class="mb-0">당신을 위해 다양한 부동산 정보들을 모아놓았어요 머시기 머시기 머시기 </p>
		
		                                <a href="page_boardList.do?category=news" class="btn custom-btn mt-3 mt-lg-4">Learn More</a>
		                            </div>
		
		                            <span class="badge bg-advertising rounded-pill ms-auto">30</span>
		                        </div>
		                    </div>
		                </div>
		
		                <div class="custom-block custom-block-topics-listing bg-white shadow-lg mb-5">
		                    <div class="d-flex">
		                        <img src="images/topics/undraw_Podcast_audience_re_4i5q.png" class="custom-block-image img-fluid" alt="">
		
		                        <div class="custom-block-topics-listing-info d-flex">
		                            <div>
		                                <h5 class="mb-2">자유게시판</h5>
		
		                                <p class="mb-0">자유로운 주제를 가지고 사용할 수 있는 게시판</p>
		
		                                <a href="page_boardList.do?category=free" class="btn custom-btn mt-3 mt-lg-4">Learn More</a>
		                            </div>
		
		                            <span class="badge bg-music rounded-pill ms-auto">20</span>
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