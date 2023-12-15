<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<link
	href="https://fonts.googleapis.com/css2?family=Montserrat:wght@500;600;700&family=Open+Sans&display=swap"
	rel="stylesheet">
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/bootstrap-icons.css" rel="stylesheet">
<link href="css/templatemo-topic-listing.css" rel="stylesheet">


<style>
main {
	font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
	margin: 0;
	padding: 0;
	background-color: #f8f9fa;
	margin-top: 160px;
}

nav {
	background-color: transparent;
	box-shadow: 0px 5px 10px rgba(0, 0, 0, 0.1);
	overflow: hidden;
	position: fixed;
	width: 100%;
	text-align: center;
	transition: background-color 0.3s, box-shadow 0.3s;
	z-index: 1000;
	margin-top: 40px;
}

nav a {
	display: inline-block;
	color: #495057;
	text-align: center;
	padding: 20px 20px;
	text-decoration: none;
	transition: color 0.3s;
	letter-spacing: 4px; /* 글자 사이 간격 조절 */
	font-size: 20px;
}

nav a:hover {
	color: #007bff;
}

#userInfoBox {
	display: flex;
	justify-content: center;
	margin-top: 20px;
}

#userInfo {
	display: flex;
	flex-direction: column;
	align-items: center;
	background-color: #f8f9fa;
	border: 1px solid #ced4da;
	border-radius: 8px;
	padding: 20px;
	text-align: center;
	box-shadow: 0px 5px 10px rgba(0, 0, 0, 0.1);
	margin-top: 20px;
}

/* 사용자 정보 각 항목의 스타일 */
#userInfo>div {
	margin: 10px 0;
	font-size: 16px;
}

/* 소셜 계정 색상 스타일 */
#socialAccount {
	color: #007bff;
}
</style>

<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
 <script>
        // 서버에서 받아온 사용자 정보
        var userInfo = {
            socialAccount: "<%= session.getAttribute("social") %>",
            email: "<%= session.getAttribute("email") %>",
            name: "<%= session.getAttribute("nickname") %>"
        };

        // 페이지 로딩이 완료된 후 실행
        $(document).ready(function () {
            // '내 정보' 클릭 시 서버에서 받아온 데이터를 페이지에 표시
            $("#myInfoLink").click(function () {
                $("#socialAccount").text("소셜 유무: " + userInfo.socialAccount);
                $("#userEmail").text("이메일: " + userInfo.email);
                $("#userName").text("이름: " + userInfo.name);
            });
        });
    </script>

</head>

<body>
    <!-- header page include -->
    <%@ include file="../page_nav.jsp"%>

    <!-- page content -->
    <main>
        <div style="font-size: 35px; text-align: center;">
            <b>My page</b>
        </div>
        <nav>
            <a id="myInfoLink" href="#">내 정보</a>
            <a href="page_mypage.do">즐겨 찾기</a>
            <a href="page_mypage.do">검색 히스토리</a>
            <a href="page_mypage.do">~~~~~~~~</a>
            <a href="page_mypage.do">~~~~~~</a>

            <!-- 세션에서 가져온 사용자 정보 표시 -->
            <div id="userInfo">
                <div id="socialAccount"></div>
                <div id="userEmail"></div>
                <div id="userName"></div>
            </div>
        </nav>
    </main>
    <footer style="margin-top: 300px;">
        <!-- footer page include -->
        <%@ include file="../page_footer.jsp"%>
    </footer>
    <!-- JAVASCRIPT FILES -->
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.bundle.min.js"></script>
    <script src="js/jquery.sticky.js"></script>
    <script src="js/click-scroll.js"></script>
    <script src="js/custom.js"></script>
</body>
</html>