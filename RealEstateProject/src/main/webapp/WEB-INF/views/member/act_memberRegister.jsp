<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	
	// int flag = (int)request.getAttribute("flag");
	int flag = (Integer)request.getAttribute("flag");
	
	out.println("<script type='text/javascript'>");	
	if(flag == 1){
		// 정상
		out.println("alert('작성 완료');");
		out.println("location.href = '../page_main.do';");	
	} else if(flag == 0){
		// 에러
		out.println("alert('작성 실패');");
		out.println("history.back();");
	}
	out.println("</script>");
	
%>