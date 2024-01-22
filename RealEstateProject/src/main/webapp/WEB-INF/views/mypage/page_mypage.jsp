<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page errorPage="../error/error_mypage.jsp" %>
<%@page import="com.dockbang.model.MemberTO"%>
<%@ page import="com.dockbang.model.BookmarkTO" %>
<%@ page import="java.util.List" %>
<%
	MemberTO to = (MemberTO)request.getAttribute("userInfo");
    String bookmarkTOListJson = (String)request.getAttribute("bookmarkTOListJson");
    String bookmarkSaleListJson = (String)request.getAttribute("bookmarkSaleListJson");

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
	/*letter-spacing: 4px; !* 글자 사이 간격 조절 *!*/
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

        // 페이지 로딩이 완료된 후 실행
        $(document).ready(function () {
	        // 서버에서 받아온 사용자 정보
	        let userInfo = {
	            socialAccount: "<%= to.getSocial() %>",
	            email: "<%= to.getEmail() %>",
	            name: "<%= to.getName() %>",
                bookmarkTOArray: <%= bookmarkTOListJson %>,
                bookmarkSaleArray: <%= bookmarkSaleListJson %>
	        };
            
            const showUserInfo = function () {
                $("#socialAccount").html("소셜 유무: " + userInfo.socialAccount);
                $("#userEmail").html("이메일: " + userInfo.email);
                $("#userName").html("이름: " + userInfo.name);
            }

            const hideUserInfo = function(){
                $("#socialAccount").html("");
                $("#userEmail").html("");
                $("#userName").html("");
            }

            const showBookmark = function (){
                let bookmarkHTML = '';
                // console.log(userInfo.bookmarkArray);
                userInfo.bookmarkTOArray.forEach(function (bookmark){
                    // bookmarkTO의 saleseq를 이용하여 bookmarkSaleArray에서 검색
                    let saleData = userInfo.bookmarkSaleArray.find(function(bookmarkSale) {
                        return bookmarkSale.sale_seq === bookmark.saleseq;
                    });

                    // bookmarkHTML += '<div><a href="./page_saleInfo.do?sale_seq=' + saleData.sale_seq + '" target="_blank">'
                    //     + '<img src="' + saleData.sale_pic + '" width="100">'
                    //     + bookmark.memo + '</a></div>';

                    bookmarkHTML += "<a href=";
                    bookmarkHTML += "'page_saleInfo.do?sale_seq=" + saleData.sale_seq + "' ";
                    bookmarkHTML += "target='_blank' rel='noreferrer' style='height: 150px' class='row my-2'>";
                    bookmarkHTML += "<div class='col-5 thumb-post'>";
                    bookmarkHTML += "<img alt='매물 사진' src=";
                    bookmarkHTML += "'" + saleData.sale_pic + "'";
                    bookmarkHTML += " width='100'>";
                    bookmarkHTML += "<div class='row-5'>" + bookmark.memo + "</div>";
                    bookmarkHTML += "</div>";
                    bookmarkHTML += "<div class='col-7'>";
                    if(saleData.sale_type=="P"){
                        //list += data.sale_type + data.price + "<br>";
                        bookmarkHTML += "매매 " + saleData.price + "만원<br>";
                    } else if (saleData.sale_type=="l"){
                        //list += data.sale_type + data.deposit + "<br>";
                        bookmarkHTML += "전세 " + saleData.deposit + "만원<br>";
                    } else if (saleData.sale_type=="m"){
                        //list += data.sale_type + data.deposit + "/" + data.monthly_fee + "<br>";
                        bookmarkHTML += "월세 " + saleData.deposit + "만원/" + saleData.monthly_fee + "만원<br>";
                    }
                    switch(saleData.house_type){
                        case 'AT':
                            bookmarkHTML += "아파트";
                            break;
                        case 'OP':
                            bookmarkHTML += "오피스텔";
                            break;
                        case 'SH':
                            bookmarkHTML += "주택";
                            break;
                        case 'OR':
                            bookmarkHTML += "원룸";
                            break;
                        default:
                            bookmarkHTML += "정보 없음";
                            break;
                    }
                    bookmarkHTML += ", " + saleData.area + "㎡,";
                    bookmarkHTML += saleData.floor + "/" + saleData.height + "<br>";
                    bookmarkHTML += saleData.address + "<br>";
                    bookmarkHTML += "</div>";
                    bookmarkHTML += "</a>";
                });
                // console.log(bookmarkHTML);

                $("#bookmarkList").html(bookmarkHTML);
            }

            const hideBookmark = function(){
                $("#bookmarkList").html("");
            }

            const showHistory = function(){
                $("#history").html("<b>미구현</b>");
            }

            const hideHistory = function(){
                $("#history").html("");
            }

            // '내 정보' 클릭 시 서버에서 받아온 데이터를 페이지에 표시
            $("#myInfoLink").click(function () {
                hideHistory();
                hideBookmark();
                showUserInfo();
            });
            
            // '내 정보' 클릭 시 서버에서 받아온 데이터를 페이지에 표시
            $("#bookmarkLink").click(function () {
                hideHistory();
                hideUserInfo();
                showBookmark();
            });

            $("#historyLink").click(function () {
                hideUserInfo();
                hideBookmark();
                showHistory();
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
            <a id="bookmarkLink" href="#">즐겨 찾기</a>
            <a id="historyLink" href="#">검색 히스토리</a>

            <div id="userInfo">
                <!-- 북마크 리스트 -->
                <div id="bookmarkList"></div>

                <!-- 사용자 정보 표시 -->
                <div id="socialAccount"></div>
                <div id="userEmail"></div>
                <div id="userName"></div>

                <!-- 사용자 검색 히스토리 -->
                <div id="history"></div>


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