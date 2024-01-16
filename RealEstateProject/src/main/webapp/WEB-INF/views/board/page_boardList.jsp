<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.dockbang.model.BoardTO"%>
<%@page import="java.util.List"%>
<%

String category = (String)request.getAttribute("category");
List<BoardTO> boardList = (List)request.getAttribute("boardList");
String name4 = (String) session.getAttribute("nickname");



String title = "";
if(category.equals("news")){
    title = "뉴스게시판";
} else if(category.equals("notice")){
    title = "공지게시판";
} else if(category.equals("free")){
    title = "자유게시판";
}

int pageSize = 10; // 페이지당 표시할 게시물 수
int totalBoardCount = boardList.size(); // 전체 게시물 수

// 전체 페이지 수 계산
int totalPage = (totalBoardCount / pageSize) + ((totalBoardCount % pageSize) > 0 ? 1 : 0);

// 현재 페이지의 게시물 시작과 끝 인덱스 계산
int cpage = 1; // 기본 페이지
if (request.getParameter("cpage") != null) {
    cpage = Integer.parseInt(request.getParameter("cpage"));
}
int startIdx = (cpage - 1) * pageSize;
int endIdx = Math.min(cpage * pageSize, totalBoardCount);

String list = "";
int j = 1;
for (int i = startIdx; i < endIdx; i++) {
    BoardTO to = boardList.get(i);
    list += "<tr>" +
            "<td>" + to.getBoardseq() + "</td>" +
            "<td><a href=\"page_boardView.do?category=" + category + "&boardseq=" + to.getBoardseq() + "\">" + to.getSubject() + "</a></td>" +
            "<td>" + to.getWriter() + "</td>" +
            "<td>" + to.getWdate() + "</td>" +
            "<!-- 기타 필요한 칼럼 값들 추가 -->" +
            "</tr>";
    j++;
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
	
	                        <li class="breadcrumb-item active" aria-current="page"><%=title %></li>
	                    </ol>
	                </nav>
	                <h2 class="text-white"><%=title %></h2>
	            </div><%@page import="java.util.List"%>
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
		        	<h3 class="mb-4"><%=title %></h3>
		        </div>
	            <div class="col-lg-8 col-12 text-center mt-3">
	            	<!-- justify-content-[ between, center, start, end] -->
	                <!-- <h3 class="mb-4">
	                	글목록
	                </h3> -->
	            
	                <div class="custom-block bg-white shadow-lg">
	                    <!-- 글 갯수 -->
	                    <span class="badge bg-finance rounded-pill ms-auto"><%=totalBoardCount %></span>
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
		                    <a href="page_boardWrite.do?category=<%=category%>" class="btn custom-btn col-3 mx-3">글작성</a>
						</div>
	                    <!-- 페이지 네비게이션 -->
		                <nav aria-label="Page navigation example">
							<ul class="pagination justify-content-center mb-0">
		                    	<%
			                    int pageBlockSize = 5; // 한 블록당 페이지 수
			                    int startPage = ((cpage - 1) / pageBlockSize) * pageBlockSize + 1;
			                    int endPage = Math.min(startPage + pageBlockSize - 1, totalPage);
			                    if (startPage > 1) {

                  				%>
		                    	<!-- << prev button -->
		                        <li class="page-item">
		                            <a class="page-link"  href="page_boardList.do?category=<%=category%>&cpage=<%=startPage-1%>" aria-label="Previous">
		                                <span aria-hidden="true">Prev</span>
		                            </a>
		                        </li>
		                        
		                        <!-- [1][2][3][4][5] -->
		                        <%
			                    }
			                    for (int i = startPage; i <= endPage; i++) { 
                        		%>
		                        <!-- 현재 페이지와 같은 번호의 페이지 아이템이면 active 및 클릭 불가  -->
		                        <!-- 현재 페이지와 다른 번호의 페이지 아이템이면 그냥 출력 -->
		                        <li class="page-item active" aria-current="page">
		                            <a class="page-link" href="page_boardList.do?category=<%=category%>&cpage=<%=i%>" class="<%= (i == cpage) ? "active" : "" %>"> <%=i%></a>
		                        </li>
								<%
                    			}
                    			if (endPage < totalPage) { 
                        		%>  
		                        
		                        <li class="page-item">
		                            <a class="page-link" href="page_boardList.do?category=<%=category%>&cpage=<%=endPage+1%>" aria-label="Next">
		                                <span aria-hidden="true">Next</span>
		                            </a>
		                        <%
                    			}
								%>
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