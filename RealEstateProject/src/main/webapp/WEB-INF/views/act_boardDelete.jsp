<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    


<%

	String category = (String)request.getAttribute("category");
	//String subject = (String)request.getAttribute("subject");
	//String content = (String)request.getAttribute("content");
	//Integer boardseq = (Integer) request.getAttribute("boardseq");
	

	int flag = (Integer)request.getAttribute("flag");
	
	out.println("<script type='text/javascript'>");	
	if(flag == 1){
		// 정상
		out.println("alert('삭제 완료');");
		out.println("location.href = 'page_boardList.do?category=" + category + "'");
	} else if(flag == 0){
		// 에러
		out.println("alert('삭제 실패');");
		out.println("history.back();");
	}
	out.println("</script>");
	
%>