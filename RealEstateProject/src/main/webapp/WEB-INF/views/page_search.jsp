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
</head>

<body>
	<!-- header page include -->
	<%@ include file="page_nav.jsp" %>

	<!-- page content -->
	<main>
			<section
			class="hero-section justify-content-center align-items-center">
			<div class="container">
				<div class="row">
					<div class="col-lg-8 col-12 mx-auto">
						<!-- 제목 -->
						<h1 class="text-white text-center">독방</h1>
						<!-- 부제목 -->
						<h6 class="text-center">원하는 부동산을 더 쉽게 찾으세요</h6>
						<form method="get" class="custom-form mt-4 pt-2 mb-lg-0 mb-5"
							role="search" action="page_search.do">
							<div class="input-group input-group-lg">
								<span class="input-group-text bi-search" id="basic-addon1">
								</span> <input name="keyword" type="search" class="form-control"
									id="keyword" placeholder="수원시, 장안구, 정자동 등 주소 입력"
									aria-label="Search">
								<button type="submit" class="form-control">Search</button>
							</div>
						</form>
					</div>
				</div>
			</div>
	
		</section>
		
		<div class="row">
			<section class="section" id="section-3" >
				<div id="map" style="width: 100%; height: 300px; margin: auto"></div>
				<code id="snippet" class="snippet"></code>
			</section>
		</div>
		<!-- jquery -->
		<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
		<!-- 각자 발급받은 Client ID 값 넣기 -->
		<script type="text/javascript"
			src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=0xkngoqc6q&submodules=geocoder"></script>
		<script id="code">
			const markers = [
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
		        { position: new naver.maps.LatLng(37.5282539, 127.1447139), message: '둔촌동' }
		        // Add more markers as needed
		    ];
			
			const latt = ${lats};
			console.log(latt);
			const lonn = ${lons};
			console.log(lonn);
			const markers1 = [];
			for (let i = 0; i < latt.length; i++) {
				markers1.push({ position: new naver.maps.LatLng(latt[i], lonn[i]), message: 'aa' });

			}

			$(document).ready(function(){
				
				// 검색어를 받아오는 부분
				let keyword = '${keyword}';
				// console.log("keyword: " + keyword);
				
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
				
				 // 지도를 클릭할 때마다 마커 위치를 변경
				naver.maps.Event.addListener(map, 'click', function(e) {
				    marker.setPosition(e.coord);
				    
				});
				
			 	const infoWindows = [];
				
			    markers.forEach(markerInfo => {
			        const marker = new naver.maps.Marker({
			            position: markerInfo.position,
			            map: map
			        });

			        const infoWindow = new naver.maps.InfoWindow({
			            content: markerInfo.message
			        });

			        infoWindows.push(infoWindow);

			        naver.maps.Event.addListener(marker, 'click', function() {
			            infoWindows.forEach(window => window.close());
			            infoWindow.open(map, marker);
			            map.panTo(markerInfo.position);

			            // 클릭한 마커의 위치의 키워드로 설정
			            keyword = markerInfo.message;
			            console.log("aaaa", keyword);
			            window.location.href = 'page_search.do?keyword=' + keyword;
			        });
			    });
			    
			    markers1.forEach(markerInfo => {
			        const marker = new naver.maps.Marker({
			            position: markerInfo.position,
			            map: map
			        });

			        const infoWindow = new naver.maps.InfoWindow({
			            content: markerInfo.message
			        });

			        infoWindows.push(infoWindow);

			        naver.maps.Event.addListener(marker, 'click', function() {
			            infoWindows.forEach(window => window.close());
			            infoWindow.open(map, marker);
			            map.panTo(markerInfo.position);
			        });
			    });
			    
				// 검색한 동의 경계선 정보 받아 오기
				let lats = ${lat};
				let lons = ${lon};
				let polygonCoords = lats.map(function(lat, index) {
				    return new naver.maps.LatLng(lat, lons[index]);
				});
				
				// 경계선 그리기
				let polygon = new naver.maps.Polygon({
				    map: map,
				    paths: [polygonCoords],
				    strokeColor: '#f00',
				    strokeWeight: 2,
				    strokeOpacity: 0.7,
				    fillColor: '#00f',
				    fillOpacity: 0.3
				});
				
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
			
				// 지오코더 초기화 함수
				function initGeocoder() {
					
					// 지도 클릭 이벤트 리스너 등록
				    map.addListener('click', function(e) {
				        searchCoordinateToAddress(e.coord);
				    });
	
				    // 검색어 입력창에서 엔터 키 입력 이벤트 리스너 등록
				    $('#keyword').on('keydown', function(e) {
				    	let keyCode = e.which;
	
				        if (keyCode === 13) { // Enter Key
				            searchAddressToCoordinate($('#keyword').val());
				        }
				    });
	
				 	// 검색 버튼 클릭 이벤트 리스너 등록
				    $('#searchbtn').on('click', function(e) {
				    	// alert("searchbtn 클릭");
				        e.preventDefault();
	
				        searchAddressToCoordinate($('#keyword').val());
				    });

					// 이전 페이지에서 검색어가 들어오면 해당 키워드로 검색
					if(keyword === '' || keyword == null){
				    	searchAddressToCoordinate(defaultAddress);
					} else{
				    	searchAddressToCoordinate(keyword);
					}
				}
	
				function makeAddress(item) {
				    if (!item) {
				        return;
				    }
	
				    let name = item.name,
				        region = item.region,
				        land = item.land,
				        isRoadAddress = name === 'roadaddr';
	
				    let sido = '', sigugun = '', dongmyun = '', ri = '', rest = '';
	
				    if (hasArea(region.area1)) {
				        sido = region.area1.name;
				    }
	
				    if (hasArea(region.area2)) {
				        sigugun = region.area2.name;
				    }
	
				    if (hasArea(region.area3)) {
				        dongmyun = region.area3.name;
				    }
	
				    if (hasArea(region.area4)) {
				        ri = region.area4.name;
				    }
	
				    if (land) {
				        if (hasData(land.number1)) {
				            if (hasData(land.type) && land.type === '2') {
				                rest += '산';
				            }
	
				            rest += land.number1;
	
				            if (hasData(land.number2)) {
				                rest += ('-' + land.number2);
				            }
				        }
	
				        if (isRoadAddress === true) {
				            if (checkLastString(dongmyun, '면')) {
				                ri = land.name;
				            } else {
				                dongmyun = land.name;
				                ri = '';
				            }
	
				            if (hasAddition(land.addition0)) {
				                rest += ' ' + land.addition0.value;
				            }
				        }
				    }
	
				    return [sido, sigugun, dongmyun, ri, rest].join(' ');
				}
	
				function hasArea(area) {
				    return !!(area && area.name && area.name !== '');
				}
	
				function hasData(data) {
				    return !!(data && data !== '');
				}
	
				function checkLastString (word, lastString) {
				    return new RegExp(lastString + '$').test(word);
				}
	
				function hasAddition (addition) {
				    return !!(addition && addition.value);
				}
				
				// 지오코더 초기화 함수를 호출
				naver.maps.onJSContentLoaded = initGeocoder;
	
			});

			
			
		</script>
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