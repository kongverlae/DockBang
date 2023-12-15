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
					<div class="mx-auto">

						<!--  <form method="get" class="custom-form mt-4 pt-2 mb-lg-0 mb-5"
		  					role="search" action="page_search.do">-->
		  					<div class="custom-form mt-4 pt-2 mb-lg-0 mb-5"	role="search">
								<div class="input-group input-group-lg">
									<span class="input-group-text bi-search" id="basic-addon1">
	
									</span> <input name="keyword" type="search" class="form-control"
										id="keyword" placeholder="수원시, 장안구, 정자동 등 주소 입력"
										aria-label="Search">
	
									<button id="searchbtn" type="submit" class="form-control">Search</button>
								</div>
							</div>
						<!--  </form>-->
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
			$(document).ready(function(){
				const keyword = '${keyword}';
				// console.log("keyword: " + keyword);
				
				let defaultAddress = '강남구 역삼동 819-10';
				
				let mapDiv = document.getElementById('map');
				
				// 지도 위치
				let map = new naver.maps.Map(mapDiv, {
				    center: new naver.maps.LatLng(37.3595704, 127.105399),
				    zoom: 15
				    //, mapTypeControl: true
				});
				
				// 마커 위치
				let marker = new naver.maps.Marker({
				    position: new naver.maps.LatLng(37.3595704, 127.105399),
				    map: map
				});
				
				// 마커 위치 변경 이벤트
				naver.maps.Event.addListener(map, 'click', function(e) {
				    marker.setPosition(e.coord);
				    
				});
				
				let infoWindow = new naver.maps.InfoWindow({
				    anchorSkew: true
				});
	
				map.setCursor('pointer');
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
				        
				        // 마커를 검색위치로 새로 설정
						marker.setMap(null);
				        marker = new naver.maps.Marker({
						    position: new naver.maps.LatLng(point),
						    map: map
						});
				        
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
	
				function initGeocoder() {
				    map.addListener('click', function(e) {
				        searchCoordinateToAddress(e.coord);
				    });
	
				    $('#keyword').on('keydown', function(e) {
				    	let keyCode = e.which;
	
				        if (keyCode === 13) { // Enter Key
				            searchAddressToCoordinate($('#keyword').val());
				        }
				    });
	
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