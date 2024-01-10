<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@page import="javax.naming.Context"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.NamingException"%>

<%@page import="javax.sql.DataSource"%>

<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>

<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@page import="com.oreilly.servlet.MultipartRequest" %>
<%@page import="java.io.File" %>
<%
	String uploadPath="C:/Java/Jsp-workspace/BoardEx01/src/main/webapp/upload";
	int maxFileSize = 2 * 1024 * 1024;
	String encType = "utf-8";
	
	MultipartRequest multi = new MultipartRequest(request, uploadPath, maxFileSize, encType, new DefaultFileRenamePolicy());

	String  seq = multi.getParameter("seq");
	String  subject = multi.getParameter("subject");
	String  mail ="";
	if( !multi.getParameter("mail1").equals("") && !multi.getParameter("mail2").equals("")){
		mail = multi.getParameter("mail1") + "@" + multi.getParameter("mail2"); 
	}
	String  password = multi.getParameter("password");
	String  content = multi.getParameter("content");
	
	
	String newfilename = multi.getFilesystemName("upload"); // ���� �̸�
	long newfilesize = 0;
	if(multi.getFile("upload") != null ){
		newfilesize = multi.getFile("upload").length(); // ���� ũ��
	}

	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	
	int flag = 2;
	
	try{
		Context initCtx = new InitialContext();
		Context envCtx = (Context)initCtx.lookup( "java:comp/env" );
		DataSource dataSource = (DataSource)envCtx.lookup( "jdbc/mariadb3" );
		
		conn = dataSource.getConnection();
		
		String sql = "select filename from pds_board1 where seq=?";
	    pstmt = conn.prepareStatement(sql);
	    pstmt.setString(1, seq );
	    
	    rs= pstmt.executeQuery();
	    
	    String oldfilename = null;
	    if(rs.next()){
	    	oldfilename = rs.getString("filename");
	    }
	    
	    // ���ο� ÷������ ������
	    if( newfilename != null){
	    	sql = "update pds_board1 set subject = ?, mail = ?, content = ?, filename = ?, filesize=? where seq = ? and password = ?";
	    	pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, subject);
			pstmt.setString(2, mail);
			pstmt.setString(3, content);
			pstmt.setString(4, newfilename);
			pstmt.setLong(5, newfilesize);
			pstmt.setString(6, seq);
			pstmt.setString(7, password);
	    }else{
	    	sql = "update pds_board1 set subject = ?, mail = ?, content = ? where seq = ? and password = ?";
	    	pstmt = conn.prepareStatement(sql);
	    	
			pstmt.setString(1, subject);
			pstmt.setString(2, mail);
			pstmt.setString(3, content);
			pstmt.setString(4, seq);
			pstmt.setString(5, password);
	    }
		
		int result = pstmt.executeUpdate();
		
		if(result == 0){
			flag = 1;
			
			// �߸� ���ε�� ���� ����
			if( newfilename !=null){
				File file = new File( uploadPath, newfilename);
				file.delete();
			}
		}else if(result == 1){
			flag = 0;
			// ���� ���� / ���ο� ���� ���ε� / ���� ���� ����
			if( newfilename !=null && oldfilename !=null){
				File file = new File( uploadPath, oldfilename);
				file.delete();
			}
		}
		
		
	} catch( NamingException e ) {
		System.out.println( "[����] : " + e.getMessage() );
	} catch( SQLException e ) {
		System.out.println( "[����] : " + e.getMessage() );
	} finally {
		if( pstmt != null ) pstmt.close();
		if( conn != null ) conn.close();
		if( rs != null ) conn.close();
    }
    
	out.println( "<script type='text/javascript'>" );
	if(flag == 0) {
		out.println( "alert('�ۼ��� ����');" );
		out.println( "location.href='board_view1.jsp?seq=" + seq + "';" );
	} else if(flag == 1) {
		out.println( "alert('��й�ȣ ����');" );
		out.println( "history.back();" );
	} else {
		out.println( "alert('�ۼ��� ����');" );
		out.println( "history.back();" );
	}
	out.println( "</script>" );
%>