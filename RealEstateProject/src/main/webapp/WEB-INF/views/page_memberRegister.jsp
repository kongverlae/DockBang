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
	<%@ include file="page_nav.jsp" %>

	<!-- page content -->
	 <main>
        <div class="input-form col-md-12 mx-auto" >
            <h4 class="mb-3">회원가입</h4>
            <form class="validation-form" novalidate action="act_memberRegister.do" method="post">
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
<!--                         <div class="invalid-feedback"> -->
<!--                             유효한 이메일 주소를 입력해주세요. -->
<!--                         </div> -->
                    </div>
                </div>

                <div class="mb-3">
                    <label for="password">비밀번호</label>
                    <input type="password" class="form-control" id="password" name="password" placeholder="" value="" required>
<!--                     <div class="invalid-feedback"> -->
<!--                         비밀번호를 입력해주세요. -->
<!--                     </div> -->
                </div>

                <div class="mb-3">
                    <label for="confirmPassword">비밀번호 확인</label>
                    <input type="password" class="form-control" id="confirmPassword" placeholder="" value="" required>
<!--                     <div class="invalid-feedback"> -->
<!--                         비밀번호를 다시 입력해주세요. -->
<!--                     </div> -->
                </div>

                <button class="btn btn-primary btn-lg btn-block" type="submit">가입 완료</button>
            </form>
        </div>
 
    </main>

	<!-- footer page include -->
	<%@ include file="page_footer.jsp" %>
	
	<!-- JAVASCRIPT FILES -->
	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap.bundle.min.js"></script>
	<script src="js/jquery.sticky.js"></script>
	<script src="js/click-scroll.js"></script>
	<script src="js/custom.js"></script>
</body>
</html>