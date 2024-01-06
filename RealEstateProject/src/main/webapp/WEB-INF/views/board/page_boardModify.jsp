<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.dockbang.model.BoardTO" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Optional" %>

<%
	List<BoardTO> boardView = (List) request.getAttribute("boardView");
    String category = (String) request.getAttribute("category");
    Integer boardseq = (Integer) request.getAttribute("boardseq");

    
 
    String subject = "";
    String writer = "";
    String mail = "";
    String wip = "";
    String wdate = "";
    String hit = "";
    String content = "";

   
  //  if (boardList != null && seq >= 0 && seq < boardList.size()) {
        BoardTO to = boardView.get(0);
        subject = to.getSubject();
        writer = to.getWriter();
        mail = to.getMail();
        wip = to.getWip();
        wdate = to.getWdate();
        hit = to.getHit();
        content = to.getContent();
  //  }
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
	                        <li class="breadcrumb-item active" aria-current="page">글수정</li>
	                    </ol>
	                </nav>
	                <h2 class="text-white">글수정</h2>
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
		        	<h3 class="mb-4">수정 주파 발진기는 각종 통신에서 주파수를 맞추기 위해 사용됩니다.</h3>
		        </div>
	            <div class="col-lg-8 col-12 text-center mt-3">
					<div class="custom-block bg-white shadow-lg">
						<div class="col-lg-12 col-12">
							<div class="mt-0 text-start">
								<h6 class="m-0"><b><%=writer %></b>( <%=mail %> )</h6>
								<!-- <div class="m-0">2019.12.05. 10:56 | 89,994 읽음</div> -->
								<hr>
							</div>
				            <form action="#" method="post" class="custom-form contact-form" role="form">
				                <div class="row">
				                	<!-- 작성자와 이메일 부분 -->
				                    <!-- <div class="col-lg-6 col-md-6 col-12">
				                        <div class="form-floating">
				                            <input type="text" name="name" id="name" class="form-control" placeholder="Name" required="">
				                            
				                            <label for="floatingInput">작성자</label>
				                        </div>
				                    </div>
				
				                    <div class="col-lg-6 col-md-6 col-12"> 
				                        <div class="form-floating">
				                            <input type="email" name="email" id="email" pattern="[^ @]*@[^ @]*" class="form-control" placeholder="Email address" required="">
				                            <input type="email" name="email" id="email" pattern="[^@]+@[^.]+\.[a-zA-Z]{2,}" class="form-control" placeholder="Email address" required="">
				                            
				                            <label for="floatingInput">이메일</label>
				                        </div>
				                    </div> -->
				
				                    <div class="col-lg-12 col-12">
				                        <div class="form-floating">
				                           <input type="text" name="subject" id="name" class="form-control" placeholder="Name" required="" value="<%= subject %>">
				                            
				                            <label for="floatingInput">글제목</label>
				                        </div>
				
				                        <div class="form-floating">
				                            <textarea class="form-control" id="content" name="content" placeholder="Tell me about the project"><%=content %></textarea>
				                            <label for="floatingTextarea">내용을 입력해주세요</label>
				                        </div>
				                    </div>
				                    
				                    <div class="col-lg-12 col-12">
										<input type="file" name="upload" id="upload" class="form-control form-control-sm ">
				                    </div>
				                    <div class="d-flex justify-content-between mt-3">
				                    	<div class="btn-group col-lg-3 col-3" role="group" >
										  	<a href="page_boardList.do" class="btn custom-btn">목록</a>
										  	<a href="page_boardView.do" class="btn custom-btn custom-border-btn">보기</a>
				                    	</div>
				                    	
										<a href="page_boardList.do" class="btn custom-btn col-3">수정</a>
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