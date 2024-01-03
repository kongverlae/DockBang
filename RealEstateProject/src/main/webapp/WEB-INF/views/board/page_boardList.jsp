<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String list = "";
	for( int i = 0 ; i < 10 ; i++ ) {
		list += "<tr>" +
	            "<td>" + i + "</td> <!-- 글번호 -->" +
	            "<td><a href='page_boardView.do'>게시글 제목 " + i + "</a></td> <!-- 글제목 -->" +
	            "<td>작성자" + i + "</td> <!-- 글쓴이 -->" +
	            "<td>2023-01-01</td> <!-- 작성일자 -->" +
	            "<!-- 기타 필요한 칼럼 값들 추가 -->" +
	        	"</tr>";
	}
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
	                        <li class="breadcrumb-item"><a href="page_boardChoose.do">게시판</a></li>
	
	                        <li class="breadcrumb-item active" aria-current="page">공지 게시판</li>
	                    </ol>
	                </nav>
	                <h2 class="text-white">공지 게시판</h2>
	            </div>
	        </div>
	    </div>
	</header>
	<section id="c1" class="section-padding">
	    <div class="container">
	        <div class="row justify-content-center">
	            <!-- <div class="col-lg-2 col-2 text-center">
	                <h5 class="mb-4">게시판</h5>
	                <div class="custom-block custom-block-topics-listing bg-white shadow-lg mb-5">
	                   	<a href="#"><h6>제목1</h6></a>
	                </div>
	                <div class="custom-block custom-block-topics-listing bg-white shadow-lg mb-5">
	                   	<a href="#"><h6>제목1</h6></a>
	                </div> 
	                <div class="custom-block custom-block-topics-listing bg-white shadow-lg mb-5">
	                   	<a href="#"><h6>제목1</h6></a>
	                </div>         
	            </div> -->
				<div class="col-lg-12 col-12 text-center">
		        	<h3 class="mb-4">공지 게시판</h3>
		        </div>
	            <div class="col-lg-8 col-12 text-center mt-3">
	            	<!-- justify-content-[ between, center, start, end] -->
	                <!-- <h3 class="mb-4">
	                	글목록
	                </h3> -->
	            
	                <div class="custom-block bg-white shadow-lg">
	                    <!-- 글 갯수 -->
	                    <span class="badge bg-finance rounded-pill ms-auto">30</span>
	                    <table class="table table-hover">
						    <thead>
						        <tr>
						            <th scope="col">#</th> <!-- 글번호 -->
						            <th scope="col">제목</th> <!-- 글제목 -->
						            <th scope="col">작성자</th> <!-- 글쓴이 -->
						            <th scope="col">작성일</th> <!-- 작성일자 -->
						            <!-- 기타 필요한 칼럼들 추가 -->
						        </tr>
						    </thead>
		                    <!-- 페이지 입력 -->
		                    <tbody>
		                    	<%=list %>
						        <!-- <tr>
						            <td>1</td> 글번호
						            <td><a href="#">게시글 제목 1</a></td> 글제목
						            <td>작성자1</td> 글쓴이
						            <td>2023-01-01</td> 작성일자
						            기타 필요한 칼럼 값들 추가
						        </tr>
						        <tr>
						            <td>2</td> 글번호
						            <td><a href="#">게시글 제목 2</a></td> 글제목
						            <td>작성자2</td> 글쓴이
						            <td>2023-01-02</td> 작성일자
						            기타 필요한 칼럼 값들 추가
						        </tr>
						        <tr>
						            <td>3</td> 글번호
						            <td><a href="#">게시글 제목 3</a></td> 글제목
						            <td>작성자3</td> 글쓴이
						            <td>2023-01-02</td> 작성일자
						            기타 필요한 칼럼 값들 추가
						        </tr>
						        <tr>
						            <td>4</td> 글번호
						            <td><a href="#">게시글 제목 4</a></td> 글제목
						            <td>작성자4</td> 글쓴이
						            <td>2023-01-02</td> 작성일자
						            기타 필요한 칼럼 값들 추가
						        </tr> -->
						        <!-- 추가적인 행들을 필요한 만큼 반복해서 추가 -->
						    </tbody>
	    	                <!-- 페이지 입력 끝 -->
						</table>
						<div class="col-12 justify-content-end text-end mt-3">
		                    <a href="page_boardWrite.do" class="btn custom-btn col-3 mx-3">글작성</a>
						</div>
	                    <!-- 페이지 네비게이션 -->
		                <nav aria-label="Page navigation example">
		                    <ul class="pagination justify-content-center mb-0">
		                        <li class="page-item">
		                            <a class="page-link" href="#" aria-label="Previous">
		                                <span aria-hidden="true">Prev</span>
		                            </a>
		                        </li>
		
		                        <li class="page-item active" aria-current="page">
		                            <a class="page-link" href="#">1</a>
		                        </li>
		                        
		                        <li class="page-item">
		                            <a class="page-link" href="#">2</a>
		                        </li>
		                        
		                        <li class="page-item">
		                            <a class="page-link" href="#">3</a>
		                        </li>
		
		                        <li class="page-item">
		                            <a class="page-link" href="#">4</a>
		                        </li>
		
		                        <li class="page-item">
		                            <a class="page-link" href="#">5</a>
		                        </li>
		                        
		                        <li class="page-item">
		                            <a class="page-link" href="#" aria-label="Next">
		                                <span aria-hidden="true">Next</span>
		                            </a>
		                        </li>
		                    </ul>
		                </nav>
		                <!-- 페이지 네비게이션 종료 -->
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