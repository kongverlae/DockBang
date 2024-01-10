<%@page import="com.dockbang.model.SubwayStationTO"%>
<%@page import="java.util.List"%>
<%@page import="com.dockbang.model.SaleTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String keyword = request.getParameter("keyword");
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
	<link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@500;600;700&family=Open+Sans&display=swap" rel="stylesheet">
	<link href="css/bootstrap.min.css" rel="stylesheet">
	<link href="css/bootstrap-icons.css" rel="stylesheet">
	<link href="css/templatemo-topic-listing.css" rel="stylesheet">  
	<link href="css/jquery-ui.min.css" rel="stylesheet">
</head>

<body style="overflow: hidden;">
	<!-- header page include -->
	<%@ include file="page_nav.jsp" %>

	<!-- 지역 검색 창 + 매물 상세 검색 -->
	<!-- <section class="site-header d-flex flex-column justify-content-center align-items-center pt-5.5 pb-3" style="padding-top: 100px;"> -->
	<section class="site-header d-flex flex-column justify-content-center align-items-center pt-5.5 pb-3" style="height:20vh;padding-top: 100px;">
		<div class="container">
	        <div class="row align-items-center">
	        	
	        	<!-- 지역 검색 창 시작 -->
	        	<form method="get" class="custom-form col-lg-2 col-4" role="search" action="page_search.do">
					<div class="input-group input-group-lg p-1">
						<!-- <button type="submit" class="form-control">Search</button> -->
						<input name="keyword" type="search" class="form-control m-0"
							id="keyword" placeholder=""
							aria-label="Search">
						<!-- <button class="input-group-text  bi-search" id="basic-addon1"></button>  -->
						<button type="submit" class="bi-search p-1"></button> 
					</div>
				</form>
				<!-- 지역 검색 창 끝 -->
						
				<!-- 매물 상세 검색 그룹 -->	
	            <div class="col-lg-10 col-8">
	            	<!-- 지하철 역 이동 시간 기반 검색 -->
					<div class="btn-group">
				        <button type="button" class="btn custom-btn dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
				            지역검색
				        </button>
				        
				        <ul class="dropdown-menu p-3" style="width:300%; z-index:1;">
				            <!-- 드롭다운 메뉴의 항목들 -->
				            <li>
				            	<!-- 지하철역 검색(자동완성) -->
				            	<h6>직장 검색(지하철역 검색)</h6>
							    <input type="text" class="form-control" id="station-autocomplete" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
							    <div id="suggestion" aria-labelledby="station-autocomplete" style="z-index:2;">
							      <!-- Autocomplete suggestions will be placed here -->
							    </div>
								<hr>
								
								<h6>통근방식</h6>
								<div class="form-check form-check-inline">
								  <input class="form-check-input" type="radio" name="commuteWay" id="commuteWayRadio1" value="work" disabled>
								  <label class="form-check-label" for="commuteWayRadio1">도보</label>
								</div>
								<div class="form-check form-check-inline">
								  <input class="form-check-input" type="radio" name="commuteWay" id="commuteWayRadio2" value="subway" checked>
								  <label class="form-check-label" for="commuteWayRadio2">지하철</label>
								</div>
								<div class="form-check form-check-inline">
								  <input class="form-check-input" type="radio" name="commuteWay" id="commuteWayRadio3" value="car" disabled>
								  <label class="form-check-label" for="commuteWayRadio3">자차</label>
								</div>
								<hr>
								
								<h6>통근 시간</h6>
								<div id="commute-slider" class="mx-2 mb-2"></div>
								<p>
								  <label for="commute">통근 시간:</label>
								  <label id="commute"></label>
								</p>
				            </li>
				        </ul>
    				</div>

				    <div class="btn-group">
				        <!-- 집유형 드롭다운 -->
				        <button type="button" class="btn custom-btn dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">집유형</button>
				        <ul class="dropdown-menu p-3" style="width:200%;">
				            <!-- 드롭다운 메뉴의 항목들 -->
				            <li>
								<div class="form-check form-check-inline">
								  <input class="form-check-input" type="checkbox" id="houseTypeOp" value="OP" checked>
								  <label class="form-check-label" for="houseTypeOp">오피스텔</label>
								</div>
                                <div class="form-check form-check-inline">
								  <input class="form-check-input" type="checkbox" id="houseTypeSh" value="SH" checked>
								  <label class="form-check-label" for="houseTypeSh">주택</label>
								</div>
								<div class="form-check form-check-inline">
								  <input class="form-check-input" type="checkbox" id="houseTypeOr" value="OR" checked>
								  <label class="form-check-label" for="houseTypeOr">원룸</label>
								</div>
								<hr>
					            <div class="form-check form-check-inline">
								  <input class="form-check-input" type="checkbox" id="houseTypeAt" value="AT">
								  <label class="form-check-label" for="houseTypeAt">아파트</label>
								</div>
								<hr>
								<div>아파트는 다른 유형과 같이 선택할 수 없습니다.</div>
				            </li>
				        </ul>
				    </div>

				    <div class="btn-group">
				        <!-- 가격 드롭다운 -->
				        <button type="button" class="btn custom-btn dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">가격</button>
				        <ul class="dropdown-menu p-3" style="width:400%;">
				            <!-- 드롭다운 메뉴의 항목들 -->
				            <li>
				            	<h6>거래 유형 / 중복 선택: </h6>
								<div class="form-check form-check-inline">
								  <input class="form-check-input" type="checkbox" id="offerTypeL" value="L" checked>
								  <label class="form-check-label" for="offerTypeL">전세</label>
								</div>
								<div class="form-check form-check-inline">
								  <input class="form-check-input" type="checkbox" id="offerTypeM" value="M" checked>
								  <label class="form-check-label" for="offerTypeM">월세</label>
								</div>
                                <div class="form-check form-check-inline">
								  <input class="form-check-input" type="checkbox" id="offerTypeP" value="P" checked>
								  <label class="form-check-label" for="offerTypeP">매매</label>
								</div>
								<hr>
								
								<h6>전세</h6>
								<div id="l-deposit-slider" class="mx-2 mb-2"></div>
								<p>
								  <label for="l-deposit">보증금:</label>
								  <label id="l-deposit"></label>
								</p>
								<hr>
								
								<h6>월세</h6>
								<div id="m-deposit-slider" class="mx-2 mb-2"></div>
								<p>
								  <label for="m-deposit">보증금:</label>
								  <label id="m-deposit"></label>
								</p>
								<div id="monthly-fee-slider" class="mx-2 mb-2"></div>
								<p>
								  <label for="monthly-fee">매매가:</label>
								  <label id="monthly-fee"></label>
								</p>
								<hr>
								
								<h6>매매</h6>
								<div id="price-slider" class="mx-2 mb-2"></div>
								<p>
								  <label for="price">매매가:</label>
								  <label id="price"></label>
								</p>
								<hr>
				            </li>
				        </ul>
				    </div>

				    <div class="btn-group">
				        <!-- 추가필터 드롭다운 -->
				        <button type="button" class="btn custom-btn dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">추가필터</button>
				        <ul class="dropdown-menu">
				            <!-- 드롭다운 메뉴의 항목들 -->
				            <li>
								음식점<br>
								영화관<br>
								보안: 경찰<br>
				            </li>
				        </ul>
				    </div>
				 	
	            </div> <!-- 드롭다운 메뉴 내용 종료 -->
	            
	        </div>
	    </div>
	</section>
	<!-- page content -->
	<main>
		<div class="row" >
			<section class="section" id="section-3" >
				<div id="map" style="width: 100%; height: 80vh; margin: auto;"></div>
				<code id="snippet" class="snippet"></code>
			</section>
		</div>
	</main>	

	<!-- footer page include -->
	<%-- <%@ include file="page_footer.jsp" %> --%>
	
	<!-- JAVASCRIPT FILES -->
	<!-- jquery -->
	<!-- <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script> -->
	<!-- <script src="js/jquery.min.js"></script> -->
	<script src="js/jquery.js"></script>
	<!-- <script src="js/bootstrap.bundle.min.js"></script> -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
	<script src="js/jquery.sticky.js"></script>
	<script src="js/click-scroll.js"></script>
	<script src="js/custom.js"></script>
	<script src="js/jquery-ui.min.js"></script>
	<!-- search page에서 사용하는 jquery ui 컴포넌트들을 제어하기 위한 js -->
	<script src="js/search.js"></script>

		<!-- 각자 발급받은 Client ID 값 넣기 -->
		<script type="text/javascript"
			src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=0xkngoqc6q&submodules=geocoder"></script>
		<script id="code">
			/* 코드 부분이였는데 */
			
			// 동 위치 정보
			const dongMarkers = [
		        { position: new naver.maps.LatLng(37.4550628, 127.0695079), message: '내곡동' },
		        { position: new naver.maps.LatLng(37.4719823, 127.0374623), message: '양재동' },
		        { position: new naver.maps.LatLng(37.4883869, 127.0167954), message: '서초동' },
		        { position: new naver.maps.LatLng(37.4794939, 126.9931207), message: '방배동' },
		        { position: new naver.maps.LatLng(37.5151065, 127.0137779), message: '잠원동' },
		        { position: new naver.maps.LatLng(37.5039744, 127.0007494), message: '반포동' },
		        { position: new naver.maps.LatLng(37.4802905, 127.0626272), message: '개포동' },
		        { position: new naver.maps.LatLng(37.5136787, 127.0317124), message: '논현동' },
		        { position: new naver.maps.LatLng(37.4991887, 127.0633458), message: '대치동' },
		        { position: new naver.maps.LatLng(37.4885906, 127.0452757), message: '도곡동' },
		        { position: new naver.maps.LatLng(37.513975, 127.0561274), message: '삼성동' },
		        { position: new naver.maps.LatLng(37.4863964, 127.1006971), message: '수서동' },
		        { position: new naver.maps.LatLng(37.5271478, 127.0334517), message: '압구정동' },
		        { position: new naver.maps.LatLng(37.5000776, 127.0385419), message: '역삼동' },
		        { position: new naver.maps.LatLng(37.4880579, 127.0828672), message: '일원동' },
		        { position: new naver.maps.LatLng(37.5233931, 127.0479736), message: '청담동' },
		        { position: new naver.maps.LatLng(37.5067945, 127.0830482), message: '잠실동' },
		        { position: new naver.maps.LatLng(37.5239227, 127.0989719), message: '신천동' },
		        { position: new naver.maps.LatLng(37.5332133, 127.113992), message: '풍납동' },
		        { position: new naver.maps.LatLng(37.5156746, 127.1253915), message: '방이동' },
		        { position: new naver.maps.LatLng(37.5051072, 127.1135469), message: '송파동' },
		        { position: new naver.maps.LatLng(37.5024352, 127.1026694), message: '석촌동' },
		        { position: new naver.maps.LatLng(37.5019016, 127.0918885), message: '삼전동' },
		        { position: new naver.maps.LatLng(37.4956865, 127.1184047), message: '가락동' },
		        { position: new naver.maps.LatLng(37.5040047, 127.1340203), message: '오금동' },
		        { position: new naver.maps.LatLng(37.4855846, 127.1225635), message: '문정동' },
		        { position: new naver.maps.LatLng(37.4768715, 127.1320663), message: '장지동' },
		        { position: new naver.maps.LatLng(37.4897279, 127.1449912), message: '거여동' },
		        { position: new naver.maps.LatLng(37.4984934, 127.1527443), message: '마천동' },
		        { position: new naver.maps.LatLng(37.5675265, 127.1729313), message: '강일동' },
		        { position: new naver.maps.LatLng(37.5638217, 127.1582312), message: '고덕동' },
		        { position: new naver.maps.LatLng(37.5578058, 127.1310675), message: '암사동' },
		        { position: new naver.maps.LatLng(37.5443765, 127.1276202), message: '천호동' },
		        { position: new naver.maps.LatLng(37.5490445, 127.1508229), message: '명일동' },
		        { position: new naver.maps.LatLng(37.5396157, 127.1459293), message: '길동' },
		        { position: new naver.maps.LatLng(37.5304933, 127.128992), message: '성내동' },
		        { position: new naver.maps.LatLng(37.5282539, 127.1447139), message: '둔촌동' },
		        { position: new naver.maps.LatLng(37.5235332, 127.0230659), message: '신사동' }
		        // Add more markers as needed
		    ];
			
			// 매뭉 정보 불러오기
			const saleLats = [];
			const saleLons = [];
			const saleTitleArray = [];
			const saleDongArray = [];

			<%
			  // JSP 코드를 사용하여 SaleTO 목록에 접근
			  List<SaleTO> saleList = (List<SaleTO>)request.getAttribute("sale");
			  for (SaleTO saleItem : saleList) {
			%>
			  saleLats.push(<%= saleItem.getLat() %>);
			  saleLons.push(<%= saleItem.getLon() %>);
			  saleTitleArray.push('<%= saleItem.getTitle() %>');
			  saleDongArray.push('<%= saleItem.getTitle().split(" ")[0] %>');
			<%
			  }
			%>
			const saleMarkers = [];
			for (let i = 0; i < saleLats.length; i++) {
				saleMarkers.push({ position: new naver.maps.LatLng(saleLats[i], saleLons[i]), message: saleTitleArray[i] });

			}
			
			// 역 정보 불러오기
			const stationLats = [];
			const stationLons = [];
			const stationTitleArray = [];

			<%
			  List<SubwayStationTO> station = (List<SubwayStationTO>)request.getAttribute("station");
			  for (SubwayStationTO stationItem : station) {
			%>
			  stationLats.push(<%= stationItem.getLatitude() %>);
			  stationLons.push(<%= stationItem.getLongitude() %>);
			  stationTitleArray.push('<%= stationItem.getName() %>');
			<%
			  }
			%>
			
			const stationMarkers = [];
			for (let i = 0; i < stationLats.length; i++) {
				stationMarkers.push({ position: new naver.maps.LatLng(stationLats[i], stationLons[i]), message: stationTitleArray[i] });
			            htmlAddresses.push((i+1) +'. '+ addrType +' '+ address);
			        }
					
			        /*
			        infoWindow.setContent([
			            '<div style="padding:10px;min-width:200px;line-height:150%;">',
			            '<h4 style="margin-top:5px;">검색 좌표</h4><br />',
			            htmlAddresses.join('<br />'),
			            '</div>'
			        ].join('\n'));

			        infoWindow.open(map, latlng);
			        */
			    });
			}
			


			$(document).ready(function(){
				
				// 검색어를 받아오는 부분
				let keyword = '${keyword}';
				// console.log("keyword: " + keyword);
				
				// 검색한 동의 경계선 정보 받아 오기
				let local = '${lineLocal}';
				let formattedLocal = local.replace(/\[|\]/g, '');
				let localArray = formattedLocal.split(',').map(item => item.trim());
				let lineLat = ${lineLat};
				let lineLon = ${lineLon};
				
				let polygon;
				
				// 기본 주소 설정
				let defaultAddress = '강남구 역삼동 819-10';
				
				// 지도를 표시할 div 요소를 가져옴
				let mapDiv = document.getElementById('map');
				
				// 네이버 지도 객체를 생성하고 설정
				let map = new naver.maps.Map(mapDiv, {
				    center: new naver.maps.LatLng(37.3595704, 127.105399),
				    zoom: 13
				    //, mapTypeControl: true
				});
				
				
				 
				// 동 마커 생성
				const infoWindows = [];
				function drawPolygon(keyword) {
				    if (polygon) {
				        polygon.setMap(null);
				    }

				    let indices = [];
				    for (let i = 0; i < localArray.length; i++) {
				        if (localArray[i] === keyword) {
				            indices.push(i);
				        }
				    }

				    if (indices.length > 0) {
				        // 모든 인덱스에 대응하는 lineLat와 lineLon 추출
				        let polygonCoords = indices.map(function(index) {
				            return new naver.maps.LatLng(lineLat[index], lineLon[index]);
				        });

				        // 경계선 그리기
				        polygon = new naver.maps.Polygon({
				            map: map,
				            paths: polygonCoords,
				            strokeColor: '#f00',
				            strokeWeight: 2,
				            strokeOpacity: 0.7,
				            fillColor: '#00f',
				            fillOpacity: 0.3
				        });
				    } else {
				        console.log('local 배열에서 해당 키워드를 찾을 수 없습니다.');
				    }
				}
				
				// 동 경계선
				dongMarkers.forEach(markerInfo => {
				    const marker = new naver.maps.Marker({
				        position: markerInfo.position,
				        map: map,
				        icon: {
				            content: "<div style='border: 1px solid #000; background-color: white; padding: 5px; font-size: 12px;'>" + markerInfo.message + "</div>",
				            size: new naver.maps.Size(30, 30),
				            anchor: new naver.maps.Point(15, 30)
				        }
				    });

				    naver.maps.Event.addListener(marker, 'click', function() {
				        map.panTo(markerInfo.position);
				        
				        // 편의성을 위한 클릭시 확대만 되게
				        if(map.getZoom() < 14){
					        map.setZoom(14);	
				        }
				        
				        // 클릭한 마커의 위치의 키워드로 설정
				        keyword = markerInfo.message;

				        // 경계선 그리기 함수 호출
				        drawPolygon(keyword);
				    });
				});
			    
			    // 줌 확대 따른 마커 표시
			    naver.maps.Event.addListener(map, 'zoom_changed', function() {
				    const currentZoom = map.getZoom();
				
				    console.log(currentZoom);
				
				    // 역 마커 표시 여부 설정
				    stationMarkers.forEach(markerInfo => {
				        const marker = markerInfo.marker;
				
				        if (currentZoom >= 14) {
				            marker.setMap(map);
				        } else {
				            marker.setMap(null);
				        }
				    });
				
				    // 기존 정보 창 닫기
				    infoWindows.forEach(window => window.close());
				});

			   
			    let markers = [];

			   let bounds; // bounds를 전역 변수로 선언
				
			   // 현재 지도가 보여주는 위치
			   function initializeBounds() {
			       bounds = map.getBounds();
			   }
	
			   initializeBounds(); // 초기에 bounds 초기화
				
				// 매물 마커 생성
			   saleMarkers.forEach(markerInfo => {
			        const marker = new naver.maps.Marker({
			            position: markerInfo.position,
			            map: null, // 초기에는 지도에 표시하지 않음
			        });

			        markerInfo.marker = marker; // 마커 정보에 실제 마커 객체 저장

			        const infoWindow = new naver.maps.InfoWindow({
			            content: markerInfo.message
			        });

			        if (keyCode === 13) { // Enter Key
			            searchAddressToCoordinate($('#keyword').val());
			        }
			    });

			 	// 검색 버튼 클릭 이벤트 리스너 등록
			    $('#searchbtn').on('click', function(e) {
			    	// alert("searchbtn 클릭");
			        e.preventDefault();

			        naver.maps.Event.addListener(marker, 'click', function() {
			        	polygon.setMap(null);
			            infoWindows.forEach(window => window.close());
			            infoWindow.open(map, marker);
			            map.panTo(markerInfo.position);
			        });
			        
			        // 마커들 저장
			        markers.push(marker);
			    });
				
			   // 맵 이동 이벤트 
			   naver.maps.Event.addListener(map, 'idle', function() {
				    bounds = map.getBounds(); // 맵의 이동이 있을 때마다 bounds 업데이트
				    const currentZoom = map.getZoom();
				    if (currentZoom >= 17) {
					    updateMarkers(map, markers);
			        }  else {
			            hideAllMarkers(markers);
			        }
				});

				function updateMarkers(map, markers) {
					let mapBounds = bounds; // 업데이트된 bounds 사용
				    let marker, position;

				    for (let i = 0; i < markers.length; i++) {
				        marker = markers[i];
				        position = marker.getPosition();

				        if (mapBounds.hasLatLng(position)) {
				            showMarker(map, marker);
				        } else {
				            hideMarker(map, marker);
				        }
				    }
				}

				function showMarker(map, marker) {
				    if (marker.getMap()) return;
				    marker.setMap(map);
				}

				function hideMarker(map, marker) {
				    if (!marker.getMap()) return;
				    marker.setMap(null);
				}
				
				function hideAllMarkers(markers) {
				    for (let i = 0; i < markers.length; i++) {
				        hideMarker(map, markers[i]);
				    }
				}
			    
			   // 역 마커 생성
			   stationMarkers.forEach(markerInfo => {
			        const marker = new naver.maps.Marker({
			            position: markerInfo.position,
			            map: null, // 초기에는 지도에 표시하지 않음
			        });
	
			        markerInfo.marker = marker; // 마커 정보에 실제 마커 객체 저장
	
			        const infoWindow = new naver.maps.InfoWindow({
			            content: markerInfo.message
			        });
	
			        infoWindows.push(infoWindow);
	
			        naver.maps.Event.addListener(marker, 'click', function() {
			        	polygon.setMap(null);
			        	map.setZoom(16);
			            infoWindows.forEach(window => window.close());
			            infoWindow.open(map, marker);
			            map.panTo(markerInfo.position);
			        });
			    });
			   
			   
			   
			    function searchCoordinateToAddress(latlng) {	    	
			    	
			    }			
				
				// 지도 커서를 손가락 모양으로 설정
				map.setCursor('pointer');
				 
				// 좌표를 주소로 변환하는 함수
				function searchCoordinateToAddress(latlng) {
	
				    infoWindow.close();
	
				    naver.maps.Service.reverseGeocode({
				        coords: latlng,
				        orders: [
				            naver.maps.Service.OrderType.ADDR,
				            naver.maps.Service.OrderType.ROAD_ADDR
				        ].join(',')
				    }, function(status, response) {
				        if (status === naver.maps.Service.Status.ERROR) {
				            return alert('Something Wrong!');
				        }
	
				        let items = response.v2.results,
				            address = '',
				            htmlAddresses = [];
	
				        for (let i=0, ii=items.length, item, addrType; i<ii; i++) {
				            item = items[i];
				            address = makeAddress(item) || '';
				            addrType = item.name === 'roadaddr' ? '[도로명 주소]' : '[지번 주소]';
	
				            htmlAddresses.push((i+1) +'. '+ addrType +' '+ address);
				        }
						
				        /*
				        infoWindow.setContent([
				            '<div style="padding:10px;min-width:200px;line-height:150%;">',
				            '<h4 style="margin-top:5px;">검색 좌표</h4><br />',
				            htmlAddresses.join('<br />'),
				            '</div>'
				        ].join('\n'));
	
				        infoWindow.open(map, latlng);
				        */
				    });
				}
	
				// 주소를 좌표로 변환하는 함수
				function searchAddressToCoordinate(address) {
				    naver.maps.Service.geocode({
				        query: address
				    }, function(status, response) {
				        if (status === naver.maps.Service.Status.ERROR) {
				            return alert('Something Wrong!');
				        }
	
				        if (response.v2.meta.totalCount === 0) {
				            // return alert('검색 결과: ' + response.v2.meta.totalCount);
				            return alert('검색 결과가 없습니다.');
				        }
	
				        let htmlAddresses = [],
				            item = response.v2.addresses[0],
				            point = new naver.maps.Point(item.x, item.y);
	
				        if (item.roadAddress) {
				            htmlAddresses.push('[도로명 주소] ' + item.roadAddress);
				        }
	
				        if (item.jibunAddress) {
				            htmlAddresses.push('[지번 주소] ' + item.jibunAddress);
				        }
	
				        if (item.englishAddress) {
				            htmlAddresses.push('[영문명 주소] ' + item.englishAddress);
				        }
	
	
				        map.setCenter(point);
				        
				        /*
				        infoWindow.setContent([
				            '<div style="padding:10px;min-width:200px;line-height:150%;">',
				            '<h4 style="margin-top:5px;">검색 주소 : '+ address +'</h4><br />',
				            htmlAddresses.join('<br />'),
				            '</div>'
				        ].join('\n'));
				        infoWindow.open(map, point);
				        */
				    });
				}

			
			
			// 지오코더 초기화 함수를 호출
			naver.maps.onJSContentLoaded = initGeocoder;

		});
	</script>
	<!-- <style>
		@media (max-width: 767px) {
			.hero-section {
				height: 200px;
			}
		}
	</style> -->
</body>
</html> 