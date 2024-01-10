<%@page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.dockbang.model.PoliceTO"%>
<%@page import="com.dockbang.model.MovieTO"%>
<%@page import="com.dockbang.model.FoodTO"%>
<%@page import="com.dockbang.model.SaleTO"%>
<%
	// 매물 정보
	SaleTO saleTO = (SaleTO)request.getAttribute("saleTO");
	// 주변시설 정보
	FoodTO convTO = (FoodTO)request.getAttribute("convTO");
	FoodTO foodTO = (FoodTO)request.getAttribute("foodTO");
	FoodTO cafeTO = (FoodTO)request.getAttribute("cafeTO");
	MovieTO movieTO = (MovieTO)request.getAttribute("movieTO");
	PoliceTO policeTO = (PoliceTO)request.getAttribute("policeTO");
	
//	System.out.println((saleTO.getTelevision() == null) ? "널널해요" : saleTO.getTelevision());
%>
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

</head>

<body>
	<!-- header page include -->
	<%@ include file="page_nav.jsp" %>
	
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
	    
	    	<!-- 매물 자체 정보 -->
	        <div class="row justify-content-center">
				<div class="col-lg-12 col-12 text-center">
		        	<h3 class="mb-4">매물 상세 정보</h3>
		        </div>
	            <div class="col-lg-8 col-12 text-center mt-3">
					<div class="custom-block bg-white shadow-lg">
						<div class="col-lg-12 col-12 text-start">
							<!-- <div class="">
								<h3>매물 이름</h3>
							</div> -->
							<div class="mt-3">
								<h6 class="m-0"><b>매물 이름</b><!-- ( 192.168.0.1 | kong@ver.lae | 127.000 37.000 ) --></h6>
								<%=saleTO.getTitle() %>
								<!-- ( 192.168.0.1 | kong@ver.lae | 127.000 37.000 ) -->
								<!-- <div class="m-0">2019.12.05. 10:56 | 89,994 읽음</div> -->
							</div>
							<hr>

							<div class="row justify-content-center">
								<div class="col-lg-11 col-12 text-center">
									<img alt="thief with gun" src="../../../images/colleagues-working-cozy-office-medium-shot.jpg">
				        		</div>
								<div class="col-lg-11 col-12 text-start">
									
									<h6>매물 정보</h6>
									<!--  <div>거래 유형 : 전세/월세/매매 중 1</div> -->
									<div>거래 유형 : <%= saleTO.getSale_type() %></div>
									<!-- 전세일 때: 보증금 출력 -->
									<!-- 월세일 때: 보증금, 월세 출력-->
									<!-- 매매일 때: 매매가 출력 -->
									<div>보증금: 		<%= ((saleTO.getMonthly_fee() == null) ? "-" : saleTO.getMonthly_fee()) %></div>
									<div>융자금: 		<%= ((saleTO.getLoan_amount() == null) ? "-" : saleTO.getLoan_amount()) %></div>
									<div>관리비: 		<%= ((saleTO.getManage_fee() == null) ? "-" : saleTO.getManage_fee()) %></div>
									<div>공인중개사:	<%= ((saleTO.getAgency() == null) ? "-" : saleTO.getAgency()) %></div>
									<div>소재지: 		<%= ((saleTO.getAddress() == null) ? "-" : saleTO.getAddress()) %></div>
									<hr>
									
									<!-- 없으면 -로 표시 됨 -->
									<h6>매물 상세 정보</h6>
									<div>주택구분: 		<%= ((saleTO.getHouse_type() == null) ? "-" : saleTO.getHouse_type()) %></div>
									<div>전용면적: 		<%= ((saleTO.getArea() == null) ? "-" : saleTO.getArea()) %> ㎡</div>
									<div>건축물용도:	<%= ((saleTO.getHouse_usage() == null) ? "-" : saleTO.getHouse_usage()) %></div>
									<div>사용승인일:	<%= ((saleTO.getBuilt_date() == null) ? "-" : saleTO.getBuilt_date()) %></div>
									<div>해당층/총층:	<%= ((saleTO.getFloor() == null) ? "-" : saleTO.getFloor()) %>
														/
														<%= ((saleTO.getHeight() == null) ? "-" : saleTO.getHeight()) %></div>
									<div>방수/욕실수: 	<%= ((saleTO.getRoom() == null) ? "-" : saleTO.getRoom()) %>
														/
														<%= ((saleTO.getBathroom() == null) ? "-" : saleTO.getBathroom()) %></div>
									<div>총주차대수: 	<%= ((saleTO.getNum_parking() == null) ? "-" : saleTO.getNum_parking()) %></div>
									<hr>
									
									<!-- 옵션 항목이 있을 경우 출력 -->
									<h6>옵션</h6>
									<%
										out.println("<ul>");
																	
										if(saleTO.getNew_built() != null && saleTO.getNew_built().equals("1"))
											out.println("<div><li>신축</li></div>");
										
										if(saleTO.getFull_option() != null && saleTO.getFull_option().equals("1"))
											out.println("<div><li>풀옵션</li></div>");
										
										if (saleTO.getMain_street() != null && saleTO.getMain_street().equals("1"))
											out.println("<div><li>큰길가</li></div>");
										
										if (saleTO.getParking_ok() != null && saleTO.getParking_ok().equals("1"))
											out.println("<div><li>주차 가능</li></div>");
										
										if (saleTO.getPet_ok() != null && saleTO.getPet_ok().equals("1"))
											out.println("<div><li>애완동물 가능</li></div>");
										
										if (saleTO.getBed() != null && saleTO.getBed().equals("1"))
											out.println("<div><li>침대 O</li></div>");
										
										if (saleTO.getDesk() != null && saleTO.getDesk().equals("1"))
											out.println("<div><li>책상 O</li></div>");
										
										if (saleTO.getCloset() != null && saleTO.getCloset().equals("1"))
											out.println("<div><li>옷장 O</li></div>");
										
										if (saleTO.getBuilt_in_closet() != null && saleTO.getBuilt_in_closet().equals("1"))
											out.println("<div><li>붙박이장 O</li></div>");
										
										if (saleTO.getDining_table() != null && saleTO.getDining_table().equals("1"))
											out.println("<div><li>식탁 O</li></div>");
										
										if (saleTO.getSofa() != null && saleTO.getSofa().equals("1"))
											out.println("<div><li>소파 O</li></div>");
										
										if (saleTO.getShoe_closet() != null && saleTO.getShoe_closet().equals("1"))
											out.println("<div><li>신발장 O</li></div>");
										
										if (saleTO.getRefrigerator() != null && saleTO.getRefrigerator().equals("1"))
											out.println("<div><li>냉장고 O</li></div>");
										
										if (saleTO.getLaundry() != null && saleTO.getLaundry().equals("1"))
											out.println("<div><li>세탁기 O</li></div>");
										
										if (saleTO.getDryer() != null && saleTO.getDryer().equals("1"))
											out.println("<div><li>건조기 O</li></div>");
										
										if (saleTO.getShower_booth() != null && saleTO.getShower_booth().equals("1"))
											out.println("<div><li>샤워부스 O</li></div>");
										
										if (saleTO.getBath() != null && saleTO.getBath().equals("1"))
											out.println("<div><li>욕조 O</li></div>");
										
										if (saleTO.getBidet() != null && saleTO.getBidet().equals("1"))
											out.println("<div><li>비데 O</li></div>");
										
										if (saleTO.getSink() != null && saleTO.getSink().equals("1"))
											out.println("<div><li>싱크대 O</li></div>");
										
										if (saleTO.getGas_stove() != null && saleTO.getGas_stove().equals("1"))
											out.println("<div><li>가스레인지 O</li></div>");
										
										if (saleTO.getInduction() != null && saleTO.getInduction().equals("1"))
											out.println("<div><li>인덕션 O</li></div>");
										
										if (saleTO.getMicrowave() != null && saleTO.getMicrowave().equals("1"))
											out.println("<div><li>전자레인지 O</li></div>");
										
										if (saleTO.getGas_oven() != null && saleTO.getGas_oven().equals("1"))
											out.println("<div><li>가스오븐 O</li></div>");
										
										if (saleTO.getInner_guard() != null && saleTO.getInner_guard().equals("1"))
											out.println("<div><li>자체 경비원 O</li></div>");
										
										if (saleTO.getVideo_phone() != null && saleTO.getVideo_phone().equals("1"))
											out.println("<div><li>비디오폰 O</li></div>");
										
										if (saleTO.getInter_phone() != null && saleTO.getInter_phone().equals("1"))
											out.println("<div><li>인터폰 O</li></div>");
										
										if (saleTO.getCard_key() != null && saleTO.getCard_key().equals("1"))
											out.println("<div><li>카드키 O</li></div>");
										
										if (saleTO.getCctv() != null && saleTO.getCctv().equals("1"))
											out.println("<div><li>CCTV O</li></div>");
										
										if (saleTO.getOuter_guard() != null && saleTO.getOuter_guard().equals("1"))
											out.println("<div><li>사설 경비원 O</li></div>");
										
										if (saleTO.getDoor_security() != null && saleTO.getDoor_security().equals("1"))
											out.println("<div><li>현관 보안 O</li></div>");
										
										if (saleTO.getElevator() != null && saleTO.getElevator().equals("1"))
											out.println("<div><li>엘리베이터 O</li></div>");
										
										if (saleTO.getFire_alarm() != null && saleTO.getFire_alarm().equals("1"))
											out.println("<div><li>화재경보기 O</li></div>");
										
										if (saleTO.getWindow_guard() != null && saleTO.getWindow_guard().equals("1"))
											out.println("<div><li>방범창 O</li></div>");
										
										if (saleTO.getVeranda() != null && saleTO.getVeranda().equals("1"))
											out.println("<div><li>베란다 O</li></div>");
										
										if (saleTO.getTelevision() != null && saleTO.getTelevision().equals("1"))
											out.println("<div><li>TV O</li></div>");
	
										out.println("</ul>");
									%>
									<hr>
									<!-- 관리비 항목이 있을 경우 출력 -->
									<h6>관리비 포함 항목</h6>
									<%
										out.println("<ul>");
									
										if(saleTO.getGas() != null && saleTO.getGas().equals("1")) out.println("<div><li>가스</li></div>");
										if(saleTO.getElectric() != null && saleTO.getElectric().equals("1")) out.println("<div><li>전기</li></div>");
										if(saleTO.getWater() != null && saleTO.getWater().equals("1")) out.println("<div><li>수도</li></div>");
										if(saleTO.getInternet() != null && saleTO.getInternet().equals("1")) out.println("<div><li>인터넷</li></div>");
										if(saleTO.getTv_license() != null && saleTO.getTv_license().equals("1")) out.println("<div><li>TV 라이센스</li></div>");
										
										out.println("</ul>");
									%>
				        		</div>
			        		</div>
			        		
			        	</div>
					</div>
	            </div>
	        </div>
	        
	        <!-- 매물 주변 편의시설 정보 -->
	        <div class="row justify-content-center">
		        <div class="col-lg-8 col-12 text-center mt-3">
					<div class="custom-block bg-white shadow-lg">
					
					<div class="row justify-content-center">

								<div class="col-lg-11 col-12 text-start">
								<% DecimalFormat df = new DecimalFormat("#.##"); // 소수점 둘째자리까지 표현 %>
									<h6>매물 주변 편의시설 정보</h6>
									<div>편의점: <%= convTO.getBusiness_name() %> - <%= convTO.getRoad_address() %> (<%= df.format(convTO.getDistance()) %> m)</div>
									<div>음식점: <%= foodTO.getBusiness_name() %> - <%= foodTO.getRoad_address() %> (<%= df.format(foodTO.getDistance()) %> m)</div>
									<div>카페: <%= cafeTO.getBusiness_name() %> - <%= cafeTO.getRoad_address() %> (<%= df.format(cafeTO.getDistance()) %> m)</div>
									<div>영화관: <%= movieTO.getBusiness_name() %> - <%= movieTO.getJi_address() %> (<%= df.format(movieTO.getDistance()) %> m)</div>
									<div>경찰서: <%= policeTO.getDivision() %> - <%= policeTO.getAddress() %> (<%= df.format(policeTO.getDistance()) %> m)</div>
				        		</div>
			        		</div>
					
					</div>
	            </div>
	        </div>
	        
	    </div>
	</section>
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
