﻿
<%@page import="ch.qos.logback.core.recovery.ResilientSyslogOutputStream"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.dockbang.model.BoardTO"%>
<%@ page import="com.dockbang.model.BoardTO" %>
<%@page import="java.util.List"%>
<%
	List<BoardTO> boardView = (List) request.getAttribute("boardView");
    String category = (String) request.getAttribute("category");
    Integer boardseq = (Integer) request.getAttribute("boardseq");
    String name3 = (String) session.getAttribute("nickname");
    String password = (String) session.getAttribute("password");
    String email = (String) session.getAttribute("email");


 
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
  
        String script = "";
        
        if (!writer.equals(name3)) {
            // writer와 name3이 다를 때 경고창을 띄우고 이전 페이지로 이동
            script = "alert('작성자와 사용자가 다릅니다. 이전 페이지로 이동합니다.');";
            script += "history.back();";
        }

        // script 출력
        out.println("<script>" + script + "</script>");
    
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


<link rel="stylesheet" type="text/css" href="./css/board_write.css">
<script type="text/javascript">
	window.onload = function() {
		document.getElementById( 'dbtn' ).onclick = function() {
			if( document.dfrm.password.value.trim() == '' ) {
				alert( '비밀번호를 입력하셔야 합니다.' );
				return;
			}
			document.dfrm.submit();
		};
	};
</script>
</head>

<body>


	<!-- header page include -->
	<%@ include file="../page_nav.jsp" %>
	
	<main>
<!-- 상단 디자인 -->
<!-- <div class="contents1">  -->
<!-- 	<div class="con_title">  -->
<!-- 		<p style="margin: 0px; text-align: right"> -->
<!-- 			<img style="vertical-align: middle" alt="" src="./images/home_icon.gif" /> &gt; 커뮤니티 &gt; <strong>여행지리뷰</strong> -->
<!-- 		</p> -->
<!-- 	</div>  -->

	<form action="/act_boardDelete.do?category=<%=category %>&boardseq=<%=boardseq %>" method="post" name="dfrm" style="margin-top:130px;">


	<input type="hidden" name="seq" value="=seq %" />
		<div class="contents_sub">
		<!--게시판-->
			<div class="board_write">
				<table>
				<tr>
					<th class="top">글쓴이</th>
					<td class="top" colspan="3"><input type="text" name="writer" value="<%=name3 %>" class="board_view_input_mail" maxlength="5" /></td>
				</tr>
				<tr>
					<th>제목</th>
					<td colspan="3"><input type="text" name="subject" value="<%=subject %>" class="board_view_input" /></td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td colspan="3"><input type="password" name="password
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					" value="" class="board_view_input_mail"/></td>
				</tr>
				</table>
			</div>

			<div class="btn_area">
				<div class="align_left">			
					<input type="button" value="목록" class="btn_list btn_txt02" style="cursor: pointer;" onclick="location.href='page_boardList.do?category=${category}'" />
					<input type="button" value="보기" class="btn_list btn_txt02" style="cursor: pointer;" onclick="location.href='page_boardView.do?category=${category}'" />
				</div>
				<div class="align_right">			
					<input type="button" value="삭제" id="dbtn" class="btn_write btn_txt01" style="cursor: pointer;" />					
				</div>	
			</div>	
			<!--//게시판-->
		</div>
	</form>
</div>
</main>
<!-- 하단 디자인 -->

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
