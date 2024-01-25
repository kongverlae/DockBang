<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   
    
<%
	//로그인에 따라 바뀜
    String html="";
    String drops = "Login";
    if (session != null && session.getAttribute("nickname") != null) {
        // 로그인 상태
        String name = (String) session.getAttribute("nickname");
        html = "<ul class=\"dropdown-menu\">" +
                           
                           // "<li class=\"user-email\">" + name + "</li>" +
                           "<li class=\"dropdown-item\"><b>" + name + "</b></li>" +
                        		   "<li><button class=\"dropdown-item\" type=\"button\" onclick=\"window.location.href = 'page_mypage.do'\">마이페이지</button></li>" +
                           "<li><button class=\"dropdown-item\" type=\"button\" onclick=\"window.location.href = 'act_memberLogout.do'\">로그아웃</button></li>" +
                           "</ul>";
		drops = name;
       	
    } else {
        // 로그인되지 않은 상태
        html = "<ul class=\"dropdown-menu\">" +
                           "<li><button class=\"dropdown-item\" type=\"button\" onclick=\"window.location.href='page_memberLogin.do'\">로그인</button></li>" +
                           "<li><button class=\"dropdown-item\" type=\"button\" onclick=\"window.location.href='page_memberRegister.do'\">회원가입</button></li>" +
                           "</ul>";
    }
%>
<!-- nav 시작 -->
<nav class="navbar navbar-expand-lg">
	<div class="container">
		<a class="navbar-brand" href="page_main.do"> <i class="bi-back"></i>
			<span>독방</span>
		</a>

		<!-- <div class="d-lg-none ms-auto me-4">
			<a href="#top" class="navbar-icon bi-person smoothscroll"></a>
		</div> -->

		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarNav" aria-controls="navbarNav"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarNav">
			<ul class="navbar-nav ms-lg-5 me-lg-auto">
				<li class="nav-item"><a class="nav-link"
					href="page_main.do" >Home</a></li>

				<li class="nav-item"><a class="nav-link"
					href="page_search.do" style="color: var(--primary-color)">지도</a></li>

				<!-- <li class="nav-item"><a class="nav-link"
					href="page_survey.do" style="color: var(--primary-color)">나만의 집 찾기</a></li> -->

				<li class="nav-item"><a class="nav-link"
					href="page_boardChoose.do" style="color: var(--primary-color)">게시판</a></li>

				<!-- <li class="nav-item"><a class="nav-link"
					href="#section_5" style="color: var(--primary-color)">Contact</a></li> -->
					
				<li class="nav-item dropdown">
				
				</li>
			</ul>
			<%-- <ul class="navbar-nav">
				<li class="nav-item dropdown">
					<div class="dropdown">
						<button class="btn btn-secondary dropdown-toggle" type="button"
						data-bs-toggle="dropdown" aria-expanded="false">&nbsp[계정]&nbsp</button>
						<%=html %>
					</div>
				</li>
			</ul> --%>
			<ul class="navbar-nav">
				<li class="nav-item dropdown">
					<div class="dropdown">
					<!-- <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> -->
					<a class="btn btn-secondary dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    	<span class="text-nowrap"><%=drops %></span> <!-- text-nowrap 클래스 추가 -->
                	</a>
					<%=html %>
                	</div>
				</li>
			</ul>
		</div>
	</div>
</nav>
<!-- nav 종료 -->