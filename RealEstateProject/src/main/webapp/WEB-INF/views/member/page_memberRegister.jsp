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
	<link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@500;600;700&family=Open+Sans&display=swap" rel="stylesheet">
	<link href="css/bootstrap.min.css" rel="stylesheet">
	<link href="css/bootstrap-icons.css" rel="stylesheet">
	<link href="css/templatemo-topic-listing.css" rel="stylesheet">

	<!-- JQuery -->
	<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
	<script type="text/javascript">
		$(document).ready(() => {
			// 이메일 중복체크
			$('#emailCheckBtn').on('click', () => {
				// alert('click');

				const email = $('#email').val();
				// console.log('email: ' + email);

				// 이메일 정규 표현식으로 확인
				const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
				if(emailRegex.test(email) === false){
					alert('올바른 이메일이 아닙니다.');
					return;
				}

				<!-- email 중복 체크를 위한 ajax 요청 / MemberController > json_getUserCount / parameter: String -->
				$.ajax({
					url: 'json_getUserCount.do?email=' + email,
					type: 'get',
					dataType: 'json',
					success: function(jsonData){
						// console.log(jsonData['userCount']);
						if(jsonData['userCount'] !== 0){
							alert('동일한 이메일의 회원이 존재합니다.');
						} else{
							alert('가입 가능한 이메일입니다.');
							$('#registerConfirmBtn').prop('disabled', false);
							$('#email').prop('readonly', true);
							$('#emailCheckBtn').prop('disabled', true);
							$('#emailChangeBtn').prop('disabled', false);
						}
					},
					error: function(error){
						alert('알 수 없는 오류');
						console.log('에러: ' + error);
					}
				});
			});

			// 이메일 중복체크 완료 후 변경
			$('#emailChangeBtn').on('click', () =>{
				$('#registerConfirmBtn').prop('disabled', true);
				$('#email').prop('readonly', false).val('');
				$('#emailCheckBtn').prop('disabled', false);
				$('#emailChangeBtn').prop('disabled', true);
			});
		});

	</script>
</head>

<style>

    /* 여기는 추가적인 사용자 정의 스타일입니다. */
   .input-form {
        font-family: Arial, sans-serif;
        background-color: #f4f4f4;
        margin: 100px;
        padding: 20px;
        display: flex;
        align-items: center;
        justify-content: center;
/*          min-height: 100vh; /* 최소 높이를 화면 높이만큼 유지합니다.  */
        flex-direction: column; /* 컨텐츠를 수직으로 정렬합니다. */
    }

</style>
<body>
	<!-- header page include -->
	<%@ include file="../page_nav.jsp" %>
	<script>
		$(document).ready(() =>{
			// 비밀번호 동일여부 체크
			const passwordInput = document.getElementById("password");
			const confirmPasswordInput = document.getElementById("confirmPassword");
			const errorDiv = document.getElementById("error");
			confirmPasswordInput.addEventListener("input", checkPasswordMatch);

			function checkPasswordMatch() {
				const password = passwordInput.value;
				const confirmPassword = confirmPasswordInput.value;
				if (password === confirmPassword) {
					errorDiv.style.display = 'none';
				} else {
					errorDiv.style.display = 'block';
				}
			}

			$('#registerConfirmBtn').on('click', () =>{
				// 빈 칸 체크 후 가입 데이터 전송
				if($('#name').val().trim() === ''){
					alert('이름을 입력하세요.');
					return;
				}
				if($('#password').val().trim() === ''){
					alert('비밀번호를 입력하세요.');
					return;
				}
				if($('#password').val() !== $('#confirmPassword').val()){
					alert('비밀번호가 일치하지 않습니다.');
					return;
				}
				// 빈칸이 없고 비밀번호가 확인되면 제출
				$('#registerForm').submit();
			});
		});
	</script>

	<!-- page content -->
	 <main>
        <div class="input-form col-md-12 mx-auto" >
            <h4 class="mb-3">회원가입</h4>
            <form id="registerForm" class="validation-form" novalidate action="act_memberRegister.do" method="post">
                <div class="row">
                    <div class="mb-3">
                        <label for="name">이름</label>
                        <input type="text" class="form-control" id="name" name="name" placeholder="" value="" required>
<!--                         <div class="invalid-feedback"> -->
<!--                             이름을 입력해주세요. -->
<!--                         </div> -->
                    </div>
                    <div class="mb-3">
                        <label for="email">이메일</label>
                        <input type="email" class="form-control" id="email" name="email" placeholder="" value="" required>
						<div id="emailAvailabilityMessage"></div>
						<!-- 이메일 중복체크 -->
						<button type="button" id="emailCheckBtn" class="btn btn-secondary btn-sm btn-block">중복 체크</button>
						<!-- 이메일 변경 -->
						<button type="button" id="emailChangeBtn" class="btn btn-info btn-sm btn-block" disabled="disabled">이메일 변경</button>
                    </div>
                </div>

                <div class="mb-3">
			        <label for="password">비밀번호</label>
			        <input type="password" class="form-control" id="password" name="password" placeholder="" value="" required>
			    </div>

			    <div class="mb-3">
			        <label for="confirmPassword">비밀번호 확인</label>
			        <input type="password" class="form-control" id="confirmPassword" placeholder="" value="" required>
			        <div id="passwordMatchMessage"></div>
			        <div id="error" style="color: red; display: none;">
			            비밀번호가 일치하지 않습니다.
			        </div>
			    </div>
                <button id="registerConfirmBtn" class="btn btn-primary btn-lg btn-block" type="button" disabled="disabled">가입 완료</button>
            </form>
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