<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    


<%

	String category = (String)request.getAttribute("category");
	String subject= (String)request.getAttribute("subject2");
	String content = (String)request.getAttribute("content2");
	//Integer boardseq = (Integer) request.getAttribute("boardseq");
	
	System.out.println("subject2: " + subject);
    System.out.println("content2: " + content);
	

	int flag = (Integer)request.getAttribute("flag");
	
	out.println("<script type='text/javascript'>");	
	if(flag == 1){
		// 정상
		out.println("alert('수정 완료');");
		out.println("location.href = 'page_boardList.do?category=" + category + "'");
	} else if(flag == 0){
		// 에러
		out.println("alert('수정 실패');");
		out.println("history.back();");
	}
	out.println("</script>");
	
%>