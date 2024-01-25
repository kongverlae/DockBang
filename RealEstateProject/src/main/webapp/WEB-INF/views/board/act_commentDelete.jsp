<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	String category = (String)request.getParameter("category");
	String boardseq = (String)request.getParameter("boardseq");

	
	// int flag = (int)request.getAttribute("flag");
	int flag = (Integer)request.getAttribute("flag");
	
	out.println("<script type='text/javascript'>");	
	if(flag == 1){
		// 정상
		out.println("alert('삭제 완료');");
		// out.println("history.back();");
		 

	} else if(flag == 0){
		// 에러
		out.println("alert('작성하신 글만 삭제해주세요.');");
		// out.println("history.back();");
	}
	
	else if(flag == 2){
		out.println("alert('비회원 게시글은 삭제할 수 없습니다.');");
		// out.println("history.back();");
	}
	out.println("location.href = 'page_boardView.do?category=" + category + "&boardseq=" + boardseq + "';");
	out.println("</script>");
	
%>