<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    


<%

	String category = (String)request.getAttribute("category");
	Integer boardseq = (Integer) request.getAttribute("boardseq");

	int flag = (Integer)request.getAttribute( "flag" );
	out.println( "<script type='text/javascript'>" );
	if(flag == 0) {
		out.println( "alert('글수정 성공');" );
		out.println( "location.href='./view.do?seq=" + boardseq + "';" );
	} else if(flag == 1) {
		out.println( "alert('비밀번호 오류');" );
		out.println( "history.back();" );
	} else {
		out.println( "alert('글수정 에러');" );
		out.println( "history.back();" );
	}
	out.println( "</script>" );
%>