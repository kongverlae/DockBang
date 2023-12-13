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

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
        integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
        crossorigin="anonymous">

    <!-- Google Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@500;600;700&family=Open+Sans&display=swap"
        rel="stylesheet">

    <!-- Bootstrap Icons CSS -->
    <link href="css/bootstrap-icons.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="css/templatemo-topic-listing.css" rel="stylesheet">

  <style>
    /* 여기는 추가적인 사용자 정의 스타일입니다. */
    body {
        font-family: Arial, sans-serif;
        background-color: #f4f4f4;
        margin: 0;
        padding: 0;
        display: flex;
        align-items: center;
        justify-content: center;
        height: 100vh;
    }

    .signup-container {
        background-color: #fff;
        padding: 20px;
        border-radius: 8px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        width: 300px;
        text-align: center;
    }

    .signup-container label {
        display: block;
        margin-bottom: 8px;
        font-weight: bold;
    }

    .signup-container input {
        width: 100%;
        padding: 8px;
        margin-bottom: 16px;
        box-sizing: border-box;
        border: 1px solid #ccc;
        border-radius: 4px;
    }

    .signup-container button {
        background-color: #4caf50;
        color: #fff;
        padding: 10px;
        border: none;
        border-radius: 4px;
        cursor: pointer;
    }

    .signup-container button:hover {
        background-color: #45a049;
    }

    .input-form {
        margin-top: 50px; /* 원하는 여백 크기로 조절하세요 */
    }
</style>
</head>

<body>
    <!-- Nav page include -->
    <%@ include file="page_nav.jsp"%>

    <!-- page content -->
    <main>
        <div class="input-form col-md-12 mx-auto">
    <h4 class="mb-3">회원가입</h4>
    <form class="validation-form" novalidate>
        <div class="row">
            <div class="mb-3">
                <label for="name">이름</label>
                <input type="text" class="form-control" id="name" placeholder="" value="" required>
            </div>
            <div class="mb-3">
                <label for="email">이메일</label>
                <input type="email" class="form-control" id="email" placeholder="" value="" required>
            </div>
        </div>

        <div class="mb-3">
            <label for="password">비밀번호</label>
            <input type="password" class="form-control" id="password" placeholder="" value="" required>
        </div>

        <div class="mb-3">
            <label for="confirmPassword">비밀번호 확인</label>
            <input type="password" class="form-control" id="confirmPassword" placeholder="" value="" required>
        </div>

        <button class="btn btn-primary btn-lg btn-block" type="submit">가입 완료</button>
    </form>
</div>
        <!-- footer page include -->
        <%@ include file="page_footer.jsp"%>
    </main>

    <!-- JAVASCRIPT FILES -->
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.bundle.min.js"></script>
    <script src="js/jquery.sticky.js"></script>
    <script src="js/click-scroll.js"></script>
    <script src="js/custom.js"></script>
</body>
</html>