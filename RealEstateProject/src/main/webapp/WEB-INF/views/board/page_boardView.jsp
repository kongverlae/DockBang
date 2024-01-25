<%@page import="com.dockbang.model.CommentTO"%>
<%@page import="java.io.Console"%>
<%@page import="ch.qos.logback.core.recovery.ResilientSyslogOutputStream"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.dockbang.model.BoardTO" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Optional" %>

<%
	List<BoardTO> boardView = (List) request.getAttribute("boardView");
	List<CommentTO> commentList = (List) request.getAttribute("commentList");
    String category = (String) request.getAttribute("category");
    Integer boardseq = (Integer) request.getAttribute("boardseq");
    String name5 = (String) session.getAttribute("nickname");
    String userseq = (String) session.getAttribute("email");
  
    
    if(name5==null){
    	name5 = "비회원";
    }
    if(userseq==null){
    	userseq="";
    }

    for (CommentTO comment : commentList) {
        String commentWriter = comment.getWriter();
        String commentContent = comment.getContent();
        String commentWdate = comment.getWdate();
        
       
    }
    
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
	<section id="c1" class="section-padding pt-1">
	    <div class="container">
	        <div class="row justify-content-center">
				<!-- <div class="col-lg-12 col-12 text-center">
		        	<h3 class="mb-4">글보기입니다 만지시면 안되요</h3>
		        </div> -->
	            <div class="col-lg-8 col-12 text-center mt-3">
					<div class="custom-block bg-white shadow-lg">
						<div class="col-lg-12 col-12 text-start">
							<div class="">
								<h3>[제목] <%=to.getSubject() %> </h3>
							</div>
						
							<div class="mt-3">
								<h6 class="m-0"><b><%=to.getWriter() %></b>( 192.168.0.1 | <%=to.getMail() %> | 127.000 37.000 )</h6>
								<div class="m-0"><%=to.getWdate() %> | <%=to.getHit() %></div>
							</div>
							
							<hr>
							<div class="row justify-content-center">
							<div class="col-lg-11 col-12 text-center">
								<img alt="thief with gun" src="../../../images/colleagues-working-cozy-office-medium-shot.jpg">
			        		</div>
							<div class="col-lg-11 col-12 text-start">
								<div><%=to.getContent() %>
								<!-- <div>안녕하세요 총강든도에요</div>
								<div>오늘은 독방의 나만의 집찾기 서비스에 대해서 알아볼 거에요</div>
								<div>나만의 집 찾기 서비스란 조건에 따른 지역과 집을 추천해주는 서비스에요</div>
								<div>잘 이용해서 좋은집을 찾아보자구요</div> -->
								<!-- <p>안녕하세요 총강이에요</p>
								<p>오늘은 독방의 나만의 집찾기 서비스에 대해서 알아볼 거에요</p>
								<p>나만의 집 찾기 서비스란 조건에 따른 지역과 집을 추천해주는 서비스에요</p>
								<p>잘 이용해서 좋은집을 찾아보자구요</p> -->
			        		</div>
			        		</div>
			        		
			        		<hr>
			        		
			        		<div class="d-flex justify-content-between mt-3">
								<a href="page_boardList.do?category=<%=category %>" class="btn custom-btn custom-border-btn col-3">목록</a>
		                    	<div class="btn-group col-lg-4 col-5" role="group" >
								  	<a href="page_boardModify.do?category=<%=category %>&boardseq=<%=boardseq %>" class="btn custom-btn custom-border-btn">수정</a>
								 	<a href="page_boardDelete.do?category=<%=category %>&boardseq=<%=boardseq %>" class="btn custom-btn custom-border-btn">삭제</a>
			                        <a href="page_boardWrite.do" class="btn custom-btn">쓰기</a>
		                    	</div>
							</div>
			        		
			        	</div>
					</div>
	            </div>
	        </div>
	        <div class="row justify-content-center">
		        <div class="col-lg-8 col-12 text-center mt-3">
					<div class="custom-block bg-white shadow-lg">
						<!--  <h6 class="text-start"><%=name5 %></h6> -->
						<form action="act_commentWrite.do?category=${category}&boardseq=${boardseq}" method="post" class="custom-form contact-form row" role="form">
   							 <input type="hidden" id="writer" name="writer" value="<%= name5 %>">
   							  <input type="hidden" id="userseq" name="userseq" value="<%=userseq %>"> 
    							<h6 class="text-start"><%= name5 %><%=userseq %></h6>
							<div class="col-lg-12 col-12 text-start px-2">
		                        <div class="form-floating">
		                       	
		                            <textarea class="form-control h-25 mx-0 mb-0" rows="3" id="content" name="content" placeholder="댓글을 입력해주세요"></textarea>
		                            <label for="floatingTextarea"></label>
		                        </div>
							</div>
							<div class="col-lg-12 col-12 m-0 mt-2 mb-2 row justify-content-end">
							<input type="submit" class="btn custom-btn col-3" value="작성하기"></input>
						</div>
						</form>
						<!--  
						<div class="col-lg-12 col-12 m-0 mt-2 mb-2 row justify-content-end">
							<input type="submit" class="btn custom-btn col-3" value="작성하기"></input>
						</div>
						-->
						<hr>
						<%
for (CommentTO comment : commentList) {
    String commentWriter = comment.getWriter();
    String commentContent = comment.getContent();
    String commentWdate = comment.getWdate();
%>
    <div class="text-start">
        <div class="d-flex justify-content-between">
            <h6><%=commentWriter %></h6>
            <div class="dropdown">
                <button class="btn py-0 dropdown-togle" type="button" id="dropdownMenuButton" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    :
                </button>
                <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                    <!--  <a class="dropdown-item" href="#">수정</a> -->
                    <form id="deleteForm" action="act_commentDelete.do" method="post" class="custom-form contact-form row" role="form">
   						 <input type="hidden" id="userseq" name="userseq" value="<%= userseq %>">
   						 <input type="submit" class="dropdown-item" value="삭제">
					</form>
                </div>
            </div>
        </div>
        <%=commentContent %><br>
        <div class="text-muted mt-1"><%=commentWdate %></div>
        <hr>
    </div>
<%
}
%>
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
