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
<main>
<!-- 상단 디자인 -->
<!-- <div class="contents1">  -->
<!-- 	<div class="con_title">  -->
<!-- 		<p style="margin: 0px; text-align: right"> -->
<!-- 			<img style="vertical-align: middle" alt="" src="./images/home_icon.gif" /> &gt; 커뮤니티 &gt; <strong>여행지리뷰</strong> -->
<!-- 		</p> -->
<!-- 	</div> -->

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
				<input type="button" value="목록" class="btn_list btn_txt02" style="cursor: pointer;" onclick="location.href='page_boardNotice.do '" />
			</div>
			<div class="align_right">
				<input type="button" value="수정" class="btn_list btn_txt02" style="cursor: pointer;" onclick="location.href='page_boardNoticeModify.do '" />
				<input type="button" value="삭제" class="btn_list btn_txt02" style="cursor: pointer;" onclick="location.href='page_boardNoticeDelete.do'" />
				<input type="button" value="쓰기" class="btn_write btn_txt01" style="cursor: pointer;" onclick="location.href='page_boardNoticeWrite.do '" />
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
