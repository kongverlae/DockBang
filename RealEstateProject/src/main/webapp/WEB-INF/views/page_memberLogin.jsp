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
body {
	font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
	margin: 0;
	display: flex;
	flex-direction: column;
	min-height: 100vh;
	background-color: #f8f9fa;
}

/* Add a margin-top to separate the login container from the nav */
main {
	margin-top: 20px;
}

/* Nav styles */
.page-nav {
	background-color: #343a40;
	color: #ffffff;
	padding: 10px;
	text-align: center;
}

/* Login container styles */
.login-container {
	background-color: #fff;
	border: 1px solid #ced4da;
	padding: 50px;
	border-radius: 8px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	width: 500px;
	margin: auto; /* Horizontally center the container */
	text-align: center;
    margin-top: 130px; /* Adjust the margin-top to your preference */
}

.form-group {
	margin-bottom: 20px;
}

.form-group label {
	display: block;
	margin-bottom: 8px;
	color: #495057;
}

.form-group input {
	width: 100%;
	padding: 10px;
	box-sizing: border-box;
	border: 1px solid #ced4da;
	border-radius: 4px;
	margin-top: 5px;
}

.form-group button {
	background-color: #007bff;
	color: #fff;
	padding: 12px;
	border: none;
	border-radius: 4px;
	cursor: pointer;
}

.form-group button:hover {
	background-color: #0056b3;
}

.form-group a {
	color: #007bff;
	text-decoration: none;
}

.form-group a:hover {
	text-decoration: underline;
}

/* Footer styles */
.page-footer {
	text-align: center;
	background-color: #f8f9fa;
	padding: 20px;
	width: 100%;
}
</style>
</head>

<body>
    <!-- Nav page include -->
    <%@ include file="page_nav.jsp"%>

    <!-- page content -->
    <main>
        <!-- login-container -->
        <div class="login-container">
            <h2 style="color: #007bff;">Login</h2>
            <form action="loginProcess.jsp" method="post">
                <div class="form-group">
                    <label for="username">Username:</label>
                    <input type="text" id="username" name="username" required>
                </div>
                <div class="form-group">
                    <label for="password">Password:</label>
                    <input type="password" id="password" name="password" required>
                </div>
                <div class="form-group">
                    <button type="submit">Login</button>
                </div>
                <div class="form-group">
                    <p>Don't have an account? <a href="#">Sign up</a></p>
                </div>
            </form>
            <div>
			  	<a href="${location}">
			       <button type="button" style="border: none; outline: none; background: none; padding: 0;">
			       		<img src="./images/kakao_login.png">
			       </button>
			   </a>
            </div>
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