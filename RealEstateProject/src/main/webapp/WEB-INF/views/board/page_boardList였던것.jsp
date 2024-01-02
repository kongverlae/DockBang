<%@page import="com.dockbang.model.BoardTO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    String category = (String)request.getAttribute("category");
    List<BoardTO> boardList = (List)request.getAttribute("boardList");
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

    String html1 = "";
    for (int i = startIdx; i < endIdx; i++) {
        BoardTO to = boardList.get(i);
        html1 += "<div class='board-post' onmouseover='highlightPost(this)' onmouseout='unhighlightPost(this)' onclick='location.href='page_boardView.do?category=${category}''>";
        html1 += "<h6>" + to.getSubject() + "</h6>";
        html1 += "<p>작성자: " + to.getWriter() + "</p>";
        html1 += "<p>날짜: " + to.getWdate() +  "</p>";
        html1 += " </div>";
        
        // 5개마다 줄 바꿈
        if ((cpage + 1) % 5 == 0) {
            html1 += "<div style='clear:both;'></div>";
        }
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

    <style>
           	.left-sidebar {
            width: 200px;
            position: fixed;
            left: 0;
            top: 0;
            bottom: 0;
            background-color: #212529;
            padding-top: 40px;
            color: #fff;
            margin-top: 78px;
        }

        .left-sidebar a {
            padding: 60px 20px;
            text-decoration: none;
            color: #fff;
            display: block;
        }

        .left-sidebar a:hover {
            background-color: #343a40;
        }
    
        .main-content {
            padding-top: 130px;
        }

        .main-content .container {
            width: 60%;
        }

        .main-content .board-posts {
            margin-top: 20px;
        }

        .main-content .board-post {
            border: 1px solid #ddd;
            margin-bottom: 10px;
            padding: 10px;
            border-radius: 5px;
        }

        .main-content .board-post h6 {
            margin-bottom: 5px;
            font-size: 12px; 
        }

        .main-content .board-post p {
            margin: 0;
            font-size: 10px; 
        }
        
          .pagination {
            display: flex;
            justify-content: center;
            align-items: center;
            margin-top: 20px;
        }

        .pagination a {
            color: black;
            float: left;
            padding: 8px 16px;
            text-decoration: none;
        }

        .pagination a.active {
            background-color: #4CAF50;
            color: white;
        }
    </style>

     <script>
     function highlightPost(element) {
         // 마우스가 올라간 게시글의 배경 색상 변경
         element.style.backgroundColor = '#f0f0f0';
         // 마우스 커서 모양 변경
         element.style.cursor = 'pointer';
     }

     function unhighlightPost(element) {
         // 마우스가 나간 게시글의 배경 색상 원래대로 복원
         element.style.backgroundColor = '';
         // 마우스 커서 모양 원래대로 복원
         element.style.cursor = 'auto';
     }
    </script>
</head>

<body>
    <!-- header page include -->
    <%@ include file="../page_nav.jsp" %>

    <!-- page content -->
    <main class="main-content">
        <div class="container">
            <div class="left-sidebar">
                <!-- Left Sidebar Content Goes Here -->
                <h4 style="text-align: center;">Community</h4>
                <ul>
                    <li><a href="page_boardList.do?category=notice">공지 게시판</a></li>
                    <li><a href="page_boardList.do?category=free">자유 게시판</a></li>
                    <li><a href="page_boardList.do?category=news">뉴스 게시판</a></li>
                    <!-- Add more links as needed -->
                </ul>
            </div>

            <h4><%=title %></h4>

            <!-- 게시물 목록 -->
            <div class="board-posts">
                <%=html1 %>
            </div>

         <!-- 페이징 -->
            <div class="pagination">
                <%
                    int pageBlockSize = 5; // 한 블록당 페이지 수
                    int startPage = ((cpage - 1) / pageBlockSize) * pageBlockSize + 1;
                    int endPage = Math.min(startPage + pageBlockSize - 1, totalPage);

                    // 이전 페이지 링크
                    if (startPage > 1) { 
                %>
                    <a href="page_boardList.do?category=<%=category%>&cpage=<%=startPage-1%>">&lt;</a>
                <%
                    }

                    // 페이지 번호 출력
                    for (int i = startPage; i <= endPage; i++) { 
                %>
                    <a href="page_boardList.do?category=<%=category%>&cpage=<%=i%>" 
                    class="<%= (i == cpage) ? "active" : "" %>">
                    <%=i%>
                    </a>
                <%
                    }

                    // 다음 페이지 링크
                    if (endPage < totalPage) { 
                %>
                    <a href="page_boardList.do?category=<%=category%>&cpage=<%=endPage+1%>">&gt;</a>
                <%
                    }
                %>
            </div>

            <!-- 글쓰기 버튼 -->
            <div class="col-md-4 text-right">
                <button type="button" onclick="location.href='page_boardWrite.do?category=${category}'" class="btn btn-primary" data-toggle="modal" data-target="#writeModal">
                    글쓰기
                </button>
            </div>
        </div>
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