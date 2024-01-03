<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


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

<link rel="stylesheet" type="text/css" href="./css/board_view.css">
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
<script type="text/javascript">
	/*
	window.onload = function() {
		document.getElementById('submit2').onclick = function() {
			if(document.cfrm.cwriter.value.trim() == "") {
				alert('이름을 입력하셔야 합니다.');
				return false;				
			}
			if(document.cfrm.cpassword.value.trim() == "") {
				alert('비밀번호를 입력하셔야 합니다.');
				return false;				
			}
			if(document.cfrm.ccontent.value.trim() == "") {
				alert('내용을 입력하셔야 합니다.');
				return false;				
			}
			document.cfrm.submit();
		};
	};
	*/
	$( document ).ready( function() {
		$( '#btn1' ).on( 'click', function() {
			alert( 'button click' );
			// 검사
			writeServer();
		});
		
		readServer();
	});
	
	const readServer = function() {
		$.ajax({
			url: 'cmt_list.do',
			type: 'get',
			data: {
				seq: seq
			},
			dataType: 'json',
			success: function(json) {
				
				let html = '';
				$.each( json.data, function(index, value) {
					html += '<tr>';
					html += '	<td class="coment_re" width="20%">';
					html += '		<strong>' + value.writer + '</strong> (' + value.wdate + ')';
					html += '		<div class="coment_re_txt">' + value.content + '</div>';
					html += '	</td>';
					html += '</tr>';					
				});

				$( '#result' ).html( html );
				
			},
			error: function() {
				
			}
		});
	};

	const writeServer = function() {
		$.ajax({
			url: 'cmt_write_ok.do',
			type: 'get',
			data: {
				seq: $( '#seq' ).val(),
				writer: $( '#cwriter' ).val(),
				password: $( '#cpassword' ).val(),
				content: $( '#ccontent' ).val()
			},
			dataType: 'json',
			success: function(json) {
				
				if(json.flag == 0 ) {
					alert( '입력 성공' );
					readServer();
				} else {
					alert( '입력 실패' );
				}				
			},
			error: function() {
				
			}
		});
	};

	
	document.getElementById('image1').onclick = function() {
		if(document.dfrm.password.value.trim() == "") {
			alert('비밀번호를 입력하셔야 합니다.');
			return false;				
		}
		document.dfrm.submit();
	};
</script>
</head>

<body>
	<!-- header page include -->
	<%@ include file="../page_nav.jsp" %>
<<<<<<< HEAD
	
	<!-- header page -->
	<header class="site-header d-flex flex-column justify-content-center align-items-center">
		<div class="container">
	        <div class="row align-items-center">
	            <div class="col-lg-5 col-12">
	                <nav aria-label="breadcrumb">
	                    <ol class="breadcrumb">
	                        <li class="breadcrumb-item"><a href="page_boardList.do">공지 게시판</a></li>
	                        <li class="breadcrumb-item active" aria-current="page">글보기</li>
	                    </ol>
	                </nav>
	                <h2 class="text-white">글보기</h2>
	            </div>
	        </div>
		</div>
	</header>
	
	<!-- page content -->
	<main>
	<section id="c1" class="section-padding">
	    <div class="container">
	        <div class="row justify-content-center">
				<div class="col-lg-12 col-12 text-center">
		        	<h3 class="mb-4">글보기입니다 만지시면 안되요</h3>
		        </div>
	            <div class="col-lg-8 col-12 text-center mt-3">
					<div class="custom-block bg-white shadow-lg">
						<div class="col-lg-12 col-12 text-start">
							<div class="">
								<h3>[독방] 나만의 집찾기를 소개할게요</h3>
							</div>
							
							<div class="mt-3">
								<h6 class="m-0"><b>총강든도</b>( 192.168.0.1 | kong@ver.lae | 127.000 37.000 )</h6>
								<div class="m-0">2019.12.05. 10:56 | 89,994 읽음</div>
							</div>
							
							<hr>
							<div class="row justify-content-center">
							<div class="col-lg-11 col-12 text-center">
								<img alt="thief with gun" src="../../../images/colleagues-working-cozy-office-medium-shot.jpg">
			        		</div>
							<div class="col-lg-11 col-12 text-start">
								<div>안녕하세요 총강든도에요</div>
								<div>오늘은 독방의 나만의 집찾기 서비스에 대해서 알아볼 거에요</div>
								<div>나만의 집 찾기 서비스란 조건에 따른 지역과 집을 추천해주는 서비스에요</div>
								<div>잘 이용해서 좋은집을 찾아보자구요</div>
								<!-- <p>안녕하세요 총강이에요</p>
								<p>오늘은 독방의 나만의 집찾기 서비스에 대해서 알아볼 거에요</p>
								<p>나만의 집 찾기 서비스란 조건에 따른 지역과 집을 추천해주는 서비스에요</p>
								<p>잘 이용해서 좋은집을 찾아보자구요</p> -->
			        		</div>
			        		</div>
			        		
			        		<hr>
			        		
			        		<div class="d-flex justify-content-between mt-3">
								<a href="page_boardList.do" class="btn custom-btn custom-border-btn col-3">목록</a>
		                    	<div class="btn-group col-lg-4 col-5" role="group" >
								  	<a href="page_boardModify.do" class="btn custom-btn custom-border-btn">수정</a>
								  	<a href="#" class="btn custom-btn custom-border-btn">삭제</a>
			                        <a href="page_boardWrite.do" class="btn custom-btn">쓰기</a>
		                    	</div>
							</div>
			        		
			        	</div>
					</div>
	            </div>
	        </div>
	        <div class="row justify-content-center">
		        <div class="col-lg-8 col-12 text-center mt-3">
					<div class="custom-block bg-white shadow-lg">
						<h6 class="text-start">총강든도</h6>
						<form action="#" method="post" class="custom-form contact-form row" role="form">
							<div class="col-lg-12 col-12 text-start px-2">
		                        <div class="form-floating">
		                            <textarea class="form-control h-25 mx-0 mb-0" rows="3" id="content" name="content" placeholder="댓글을 입력해주세요"></textarea>
		                            <label for="floatingTextarea">바르고 고운말을 사용하여 올바른 인터넷 문화를 만들어 갑시다.</label>
		                        </div>
							</div>
						</form>
						<div class="col-lg-12 col-12 m-0 mt-2 mb-2 row justify-content-end">
							<input type="submit" class="btn custom-btn col-3" value="작성하기"></input>
						</div>
						<hr>
						<div class="text-start">
							<div class="d-flex justify-content-between">
								<h6>총강든도</h6>
								<div class="dropdown">
									<button class="btn py-0 dropdown-togle" type="button" id="dropdownMenuButton" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
									:
									</button>
									<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
									    <a class="dropdown-item" href="#">수정</a>
									    <a class="dropdown-item" href="#">삭제</a>
									</div>
								</div>
							</div>
							다들 댓글 달아주셔서 감사합니다.🔫🔫🔫<br>
							<div class="text-muted mt-1">2024-01-03 10:31</div>
							<hr>
							<h6>칼강든도</h6>
							이 글 보고 집 구했더니 정말로 만족스러운 집을 구했어요⚔️⚔️⚔️<br>
							<div class="text-muted mt-1">2024-01-03 10:31</div>
							<hr>
							<h6>칼든강도</h6>
							이 글 보고 집 구했더니 정말로 만족스러운 집을 털었어요<br>
							<div class="text-muted mt-1">2024-01-03 10:31</div>
							<hr>
							<h6>가던말던</h6>
							이 글 보고 집 구했더니 정말로 만족스러운 집을 구하던가 말던가 했어요<br>
							<div class="text-muted mt-1">2024-01-03 10:31</div>
							<hr>
							<h6>킨더가든</h6>
							이 글 보고 집 구했더니 정말로 만족스러운 유치원을 구했어요<br>
							<div class="text-muted mt-1">2024-01-03 10:31</div>
							<hr>
						</div>
					</div>
	            </div>
	        </div>
	    </div>
	</section>
	</main>	
=======
<main>
<!-- 상단 디자인 -->
<!-- <div class="contents1">  -->
<!-- 	<div class="con_title">  -->
<!-- 		<p style="margin: 0px; text-align: right"> -->
<!-- 			<img style="vertical-align: middle" alt="" src="./images/home_icon.gif" /> &gt; 커뮤니티 &gt; <strong>여행지리뷰</strong> -->
<!-- 		</p> -->
<!-- 	</div> -->
>>>>>>> parent of cb5055e (design: page_boardView 추가)

	<div class="contents_sub">	
	<!--게시판-->
		<div class="board_view" style="margin-top:130px;">
			<table>
			<tr>
				<th width="10%">제목</th>
				<td width="60%">주제</td>
				<th width="10%">등록일</th>
				<td width="20%">날짜</td>
			</tr>
			<tr>
				<th>글쓴이</th>
				<td>writer + "(" + wip + "/" + mail + ")"</td>
				<th>조회</th>
				<td>hit </td>
			</tr>
			<tr>
				<th>위치정보</th>
				<td>
					위도 : (latitude > / 경도 : (longitude )
				</td>
				<th></th>
				<td></td>
			</tr>		
			<tr>
				<td colspan="4" height="200" valign="top" style="padding:20px; line-height:160%">
					<div id="bbs_file_wrap">
						<div>
							<img src="./upload/imagename " width="900" onerror="" /><br />
						</div>
					</div>
					content 
				</td>
			</tr>			
			</table>
			
			<table id="result">
			</table>

			<!-- <form action="#" method="post" name="cfrm"> -->
			<input type="hidden" id="cpage" value="cpage " />
			<input type="hidden" id="seq" value="seq " />
			<table>
			<tr>
				<td width="94%" class="coment_re">
					글쓴이 <input type="text" id="cwriter" maxlength="5" class="coment_input" />&nbsp;&nbsp;
					비밀번호 <input type="password" id="cpassword" class="coment_input pR10" />&nbsp;&nbsp;
				</td>
				<td width="6%" class="bg01"></td>
			</tr>
			<tr>
				<td class="bg01">
					<textarea id="ccontent" cols="" rows="" class="coment_input_text"></textarea>
				</td>
				<td align="right" class="bg01">
					<button type="button" id="btn1" class="btn_re btn_txt01">댓글등록</button>
				</td>
			</tr>
			</table>
			<!-- </form> -->
		</div>
		<div class="btn_area">
			<div class="align_left">			
				<input type="button" value="목록" class="btn_list btn_txt02" style="cursor: pointer;" onclick="location.href='page_boardList.do?category=${category}'" />
			</div>
			<div class="align_right">
				<input type="button" value="수정" class="btn_list btn_txt02" style="cursor: pointer;" onclick="location.href='page_boardModify.do?category=${category}'" />
				<input type="button" value="삭제" class="btn_list btn_txt02" style="cursor: pointer;" onclick="location.href='page_boardDelete.do?category=${category}'" />
				<input type="button" value="쓰기" class="btn_write btn_txt01" style="cursor: pointer;" onclick="location.href='page_boardWrite.do?category=${category}'" />
			</div>
		</div>
		<!--//게시판-->
	</div>
<!-- 하단 디자인 -->
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
