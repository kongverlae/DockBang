<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.dockbang.model.SaleTO"%>
<%@page import="com.dockbang.model.SaleDongTO"%>
<%@page import="com.dockbang.model.SubwayStationTO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
    
<%@page import="org.json.simple.JSONArray"%>
<%@page import="org.json.simple.JSONObject"%>
<%
	String keyword = request.getParameter("keyword");

	// 역 근처 매물 출력 확인용
	/*
	Map<String, List<SaleTO>> map = (Map)request.getAttribute("salesNearStationMap");
	if(map != null){
		for(Map.Entry<String, List<SaleTO>> entry : map.entrySet()){
			System.out.println(entry.getKey());
			for(SaleTO saleTO:entry.getValue()){
				System.out.print(saleTO.getTitle() + "\t");
			}
			System.out.println();
			System.out.println();
		}
	}
	*/
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
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
	<!-- <link href="css/bootstrap.min.css" rel="stylesheet"> -->
	<link href="css/bootstrap-icons.css" rel="stylesheet">
	<link href="css/templatemo-topic-listing.css" rel="stylesheet">   
	<link href="css/jquery-ui.min.css" rel="stylesheet">
	
	<style type="text/css">
		.thumb-post img {
			object-fit: cover; /* keep aspect ratio */
			object-position: 50% 50%;
			width: 100%;
			height: 90px;
			/* width: fit-content; */
			/* height: 100px; */
			/* max-height: 100%; */
			/* margin-bottom: 1rem; */
			/* padding-right: 10px; */
		}
	</style>
</head>

<body class="overflow-hidden">
	<!-- header page include -->
	<%@ include file="page_nav.jsp" %>

	<!-- searchMenu page include -->
	<%@ include file="page_searchMenu.jsp" %>

	<!-- page content -->
	<main class="container-fluid">
		<div class="row">	
			<!-- 지도 표시 -->
			<!-- <div style="width: 80%; padding: 0px"> -->
			<div class="col-4 col-sm-5 col-md-6 col-lg-7 col-xl-8 col-xxl-9 p-0">
				<div id="map" style="height: 80vh;"></div>
				<code id="snippet" class="snippet"></code>
			</div>
			
			<!-- 매물 리스트 표시 -->
			<!-- <div style="width: 20%;" class="p-0"> -->
			<div class="col-8 col-sm-7 col-md-6 col-lg-5 col-xl-4 col-xxl-3 p-0">
				<div class="overflow-y-auto overflow-x-hidden p-0" style="height: 80vh; ">
					<!-- 리스트 부분 -->
						<div class="container-fluid" id="sideListing">
							<!-- <div style="height: 100px" class="row my-2">
								사진
								<div class="col-5 thumb-post">
									<img alt="매물 사진" src="https://dockbang-sale-picture-bucket.s3.ap-northeast-2.amazonaws.com/OP/OP_0001.jpg">
								</div>
								내용
								<div class="col-7">
									매매 4억7700<br>
									아파트, 크기, 층<br>
									지역<br>
								</div>
							</div> -->
						</div>
					
						<!-- 페이징 부분 -->
						<div>
							<!-- 페이지 네비게이션 -->
			                <nav aria-label="Page navigation example">
			                    <ul id="sidePaging" class="pagination justify-content-center mb-0">
			                    	
			                        <!-- <li class="page-item">
			                            <a class="page-link w-10" aria-label="Previous">
			                                <span aria-hidden="true">&lt;</span>
			                            </a>
			                        </li>
									
			                        <li class="page-item active" aria-current="page">
			                            <a class="page-link w-10" href="#">1</a>
			                        </li>
			                        
			                        <li class="page-item">
			                            <a class="page-link w-10" href="#">2</a>
			                        </li>
			                        
			                        <li class="page-item">
			                            <a class="page-link w-10" href="#">3</a>
			                        </li>
			
			                        <li class="page-item">
			                            <a class="page-link w-10" href="#">4</a>
			                        </li>
			
			                        <li class="page-item">
			                            <a class="page-link w-10" href="#">5</a>
			                        </li>
			                        
			                        <li class="page-item">
			                            <a class="page-link w-10" href="#" aria-label="Next">
			                                <span aria-hidden="true"> &gt;</span>
			                            </a>
			                        </li> -->
			                        
			                    </ul>
			                </nav>
			                <!-- 페이지 네비게이션 종료 -->
						</div>
						<!-- 페이징 부분 종료 -->
					
				</div>
			</div>
		</div>
		
	</main>	

	<!-- footer page include -->
	<%-- <%@ include file="page_footer.jsp" %> --%>
	
	<!-- JAVASCRIPT FILES -->
	<!-- 	<script src="js/jquery.min.js"></script> -->
	<script src="js/jquery.js"></script>
	<!-- <script src="js/bootstrap.bundle.min.js"></script> -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
	<!-- <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script> -->
	<script src="js/jquery.sticky.js"></script>
	<script src="js/click-scroll.js"></script>
	<script src="js/custom.js"></script>
	<script src="js/jquery-ui.min.js"></script>
	<!-- search page에서 사용하는 jquery ui 컴포넌트들을 제어하기 위한 js -->
	<script src="js/search.js"></script>
	<!-- 각자 발급받은 Client ID 값 넣기 -->
	<script type="text/javascript"
		src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=0xkngoqc6q&submodules=geocoder"></script>
	<script type="text/javascript" src="js/MarkerClustering.js"></script>
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
		const saleSeqArray = [];
		
		<%
		  // JSP 코드를 사용하여 SaleTO 목록에 접근
		  List<SaleTO> saleList = (List<SaleTO>)request.getAttribute("sale");
		  for (SaleTO saleItem : saleList) {
		%>
		  saleLats.push(<%= saleItem.getLat() %>);
		  saleLons.push(<%= saleItem.getLon() %>);
		  saleTitleArray.push('<%= saleItem.getTitle() %>');
		  saleSeqArray.push('<%= saleItem.getSale_seq() %>');
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
		}
		
		// 동 매물 개수 정보			
		const dongName = [];
		const dongCount = [];
		
		for (let i = 0; i < saleDongArray.length; i++) {
		    const dong = saleDongArray[i];
		    const index = dongName.indexOf(dong);

		    if (index !== -1) {
		        // 이미 dongName 배열에 있는 동이면 해당 동에 대한 dongCount 값을 증가
		        dongCount[index]++;
		    } else {
		        // dongName 배열에 없는 동이면 새로운 동이므로 dongName에 추가하고 dongCount는 1로 초기화
		        dongName.push(dong);
		        dongCount[dongName.length - 1] = 1;
		    }
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
			
			
      // main
			// 동 마커 생성
			const infoWindows = [];
      // /main

			// 매뭉 정보 불러오기
			const saleLats = [];
			const saleLons = [];
			const saleTitleArray = [];
			const saleDongArray = [];
			
// 김재휘 원래 작업 위치
			
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
				let num = 0;
				const marker = new naver.maps.Marker({
				    position: markerInfo.position,
				    map: map,
				    icon: (() => {
				        for (let i = 0; i < dongName.length; i++) {
				            if (dongName[i] === markerInfo.message) {
				                return {
				                    content: "<div style='border: 1px solid #000; background-color: white; padding: 5px; font-size: 12px;'>" + dongCount[i] + " " + markerInfo.message + "</div>",
				                    size: new naver.maps.Size(30, 30),
				                    anchor: new naver.maps.Point(15, 30)
				                };
				            }
				        }
				        // 만약 해당하는 dongName이 없다면 기본 content로 설정
				        return {
				            content: "<div style='border: 1px solid #000; background-color: white; padding: 5px; font-size: 12px;'>" + markerInfo.message + "</div>",
				            size: new naver.maps.Size(30, 30),
				            anchor: new naver.maps.Point(15, 30)
				        };
				    })()
				    
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
		    
		    // 줌 확대 따른 마커 ㅍ시
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

		   	/*let bounds; // bounds를 전역 변수로 선언
			
		   // 현재 지도가 보여주는 위치
		   function initializeBounds() {
		       bounds = map.getBounds();
		   }

		   initializeBounds(); // 초기에 bounds 초기화*/
			
			// 매물 마커 생성
			saleMarkers.forEach(markerInfo => {
		        const marker = new naver.maps.Marker({
		            position: markerInfo.position,
		            map: null, // 초기에는 지도에 표시하지 않음
		            check: true,
		            message: markerInfo.message
		        });

		        /*markerInfo.marker = marker; // 마커 정보에 실제 마커 객체 저장

		        const infoWindow = new naver.maps.InfoWindow({
		            content: markerInfo.message
		        });

		        infoWindows.push(infoWindow);

		        naver.maps.Event.addListener(marker, 'click', function() {
		        	if (polygon) {
		        	    polygon.setMap(null);
		        	}
		            infoWindows.forEach(window => window.close());
		            infoWindow.open(map, marker);
		            map.panTo(markerInfo.position);
		        });*/
		        
		        // 마커들 저장
		        markers.push(marker);
		    });
		   
		   var htmlMarker1 = {
		            content: '<div style="cursor:pointer;width:40px;height:40px;line-height:42px;font-size:10px;color:white;text-align:center;font-weight:bold;background:url(images/cluster/cluster-marker-1.png);background-size:contain;"></div>',
		            size: N.Size(40, 40),
		            anchor: N.Point(20, 20)
		        },
		        htmlMarker2 = {
		            content: '<div style="cursor:pointer;width:40px;height:40px;line-height:42px;font-size:10px;color:white;text-align:center;font-weight:bold;background:url(images/cluster/cluster-marker-2.png);background-size:contain;"></div>',
		            size: N.Size(40, 40),
		            anchor: N.Point(20, 20)
		        },
		        htmlMarker3 = {
		            content: '<div style="cursor:pointer;width:40px;height:40px;line-height:42px;font-size:10px;color:white;text-align:center;font-weight:bold;background:url(images/cluster/cluster-marker-3.png);background-size:contain;"></div>',
		            size: N.Size(40, 40),
		            anchor: N.Point(20, 20)
		        },
		        htmlMarker4 = {
		            content: '<div style="cursor:pointer;width:40px;height:40px;line-height:42px;font-size:10px;color:white;text-align:center;font-weight:bold;background:url(images/cluster/cluster-marker-4.png);background-size:contain;"></div>',
		            size: N.Size(40, 40),
		            anchor: N.Point(20, 20)
		        },
		        htmlMarker5 = {
		            content: '<div style="cursor:pointer;width:40px;height:40px;line-height:42px;font-size:10px;color:white;text-align:center;font-weight:bold;background:url(images/cluster/cluster-marker-5.png);background-size:contain;"></div>',
		            size: N.Size(40, 40),
		            anchor: N.Point(20, 20)
		        };

		    var markerClustering = new MarkerClustering({
		        minClusterSize: 1,
		        maxZoom: 19,
		        map: map,
		        markers: markers,
		        disableClickZoom: false,
		        gridSize: 200,
		        icons: [htmlMarker1, htmlMarker2, htmlMarker3, htmlMarker4, htmlMarker5],
		        indexGenerator: function(count) {
		            var index = 0;
		            if (count >= 100 && count < 200) {
		                index = 1;
		            } else if (count >= 200 && count < 500) {
		                index = 2;
		            } else if (count >= 500 && count < 1000) {
		                index = 3;
		            } else if (count >= 1000) {
		                index = 4;
		            }

		            return index;
		        },
		        stylingFunction: function(clusterMarker, count) {
		            $(clusterMarker.getElement()).find('div:first-child').text(count);
		        }
		    });

			
		   // 맵 이동 이벤트 
		   /*naver.maps.Event.addListener(map, 'idle', function() {
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
			}*/
		    
		   // 역 마커 생성
		   stationMarkers.forEach(markerInfo => {
		        const marker = new naver.maps.Marker({
		            position: markerInfo.position,
		            map: null, // 초기에는 지도에 표시하지 않음
		            icon: {
		            	content: `<div style="cursor:pointer;display:flex;align-items:center;"><img src="images/station_icon.png" alt="Station Icon" style="width: 40px; height: 40px;"><span style="margin-left: 2px;">` + markerInfo.message + `</span></div>`,
		                anchor: new naver.maps.Point(20, 40) // 이미지의 중심점 설정
		            
		            }
		        });

		        markerInfo.marker = marker; // 마커 정보에 실제 마커 객체 저장

		        const infoWindow = new naver.maps.InfoWindow({
		            content: markerInfo.message
		        });

		        infoWindows.push(infoWindow);

		        naver.maps.Event.addListener(marker, 'click', function() {
		        	if (polygon) {
		        	    polygon.setMap(null);
		        	}
		        	map.setZoom(16);
		            infoWindows.forEach(window => window.close());
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

          // navermap
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
          // /navermap
          // main
					const infoWindow = new naver.maps.InfoWindow({
			            content: markerInfo.message
			        });
          // /main

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
			
			//=============김재휘 작업 중======================
			// 매물 목록은 seq만 유지하기 변수 이름은 saleSeqArray
			// 현재 사용하려는 매물 목록은 flteredSeq
			let filteredSeq = saleSeqArray;
			// sideList와 sidePage를 위한 변수들
			// cpage = 현재 페이지
		    let cpage = 1;
		    const maxLender = 20;
			// pageSize = 사용하려는 매물 목록 크기                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
			let pageSize = 1;
			let circles = [];

		    // cpage = 현재 페이지 
		    // maxLender = 최대 페이지 출력 수
		    // saleJsonArr = 매물 리스트
		    // let start = 페이지 번호에 따른 매물 리스트 시작 번호

		    // 지도 화면 사이드에 표시되는 매물 리스트 그리는 함수
		    function drawSideListing(filteredSeq) {
				let list = "";
				let start = ( ( cpage - 1 ) * maxLender );
				// 들어온 seq 리스트를 seq만 가지고 있는 배열로 변경하는 작업
				let atSeqList = [];
				let last = (((start + maxLender)<filteredSeq.length) ? start + maxLender : filteredSeq.length);
				for( let i = start; i < last; i++ ) {
					atSeqList.push(filteredSeq[i]);
				}

				$.ajax({
					// jsp, xml 등 페이지 주소
					url: '/act_saleList.do',
					type: 'get',
					// json, xml, html, text 등
					// 파라미터 입력하기
					traditional: true,
					data: {'seqList': atSeqList},
					dataType: 'json',
					// 성공 4 && 200 이라는 말
					success: function(json) {
						//console.log(json);
						//console.log(json[0]);
						//console.log(json[0].sale_seq);
						json.forEach( data => {
							list += "<a href=";
							list += "'page_saleInfo.do?sale_seq=" + data.sale_seq + "' ";
							list += "target='_blank' rel='noreferrer' style='height: 100px' class='row my-2'>";
							//list += "<div style='height: 100px' class='row my-2'>"
							list += "<div class='col-5 thumb-post'>";
							list += "<img alt='매물 사진' src=";
							list += "'" + data.sale_pic + "'";
							list += ">";
							list += "</div>";
							list += "<div class='col-7'>";
							if(data.sale_type=="P"){
								//list += data.sale_type + data.price + "<br>";					
								list += "매매 " + data.price + "만원<br>";					
							} else if (data.sale_type=="l"){
								//list += data.sale_type + data.deposit + "<br>";					
								list += "전세 " + data.deposit + "만원<br>";					
							} else if (data.sale_type=="m"){
								//list += data.sale_type + data.deposit + "/" + data.monthly_fee + "<br>";					
								list += "월세 " + data.deposit + "만원/" + data.monthly_fee + "만원<br>";					
							}
							switch(data.house_type){
								case 'AT':
									list += "아파트";
									break;
								case 'OP':
									list += "오피스텔";
									break;
								case 'SH':
									list += "주택";
									break;
								case 'OR':
									list += "원룸";
									break;
								default:
									list += "정보 없음";
									break;
							}
							list += ", " + data.area + "㎡,";
							list += data.floor + "/" + data.height + "<br>";
							list += data.address + "<br>";
							list += "</div>";
							//list += "</div>";
							list += "</a>";
						});
						
						$("#sideListing").html(list);
						
					},
					// 실패 
					error: function(e) {
						alert('[에러]' + e.status);
					}
				});
		    };
		    
		    // 사이트 페이징 그리는 함수
		    function drawSidePaging(){
		    	// page 시작점
				let pageStart = ( ( cpage >= 3 ) ? cpage - 2 : 1 );
				// page 종료점 
				let pageLast = ( ( ( pageStart + 4) < pageSize ) ? pageStart + 4 : pageSize );
				
				// page 들을 출력하기 위한 html
				let paging = "";
				// 페이징 이전 [<]
				paging += "<li class='page-item'>";
				// 현재 페이지가 1이면 동작 불가
				if(cpage==1){
					paging += "<div id='pbtn' class='page-link w-10' aria-label='Previous'>";
					paging += "<span aria-hidden='true'>&lt;</span></div></li>";
				} else {
					paging += "<button id='pbtn' class='page-link w-10' aria-label='Previous'>";
					paging += "<span aria-hidden='true'>&lt;</span></button></li>";
				}
		        
		    	// 페이징 번호 출력 [1][2][3][4][5]
				for(let i=pageStart; i<=pageLast; i++){
					// 현재 페이지 번호와 같을 경우 현재 페이지라는 표시를 함
					if(cpage == i){
						paging += "<li class='page-item active' aria-current='page'>";
						paging += "<div id='pbtn" + i + "' class='page-link w-1'>" + i + "</div></li>";
					} else {
						paging += "<li class='page-item' aria-current='page'>";
						paging += "<button id='pbtn" + i + "' class='page-link w-1'>" + i + "</button></li>";
					}
				}				
		        
		    	// 페이징 이후 [>]
				paging += "<li class='page-item'>";
				if(cpage==pageSize){
					paging += "<div id='nbtn' class='page-link w-10' aria-label='Next'>";
					paging += "<span aria-hidden='true'> &gt;</span></div></li>";
				} else {
					paging += "<button id='nbtn' class='page-link w-10' aria-label='Next'>";
					paging += "<span aria-hidden='true'> &gt;</span></button></li>";
				}		    	
		        
				// html 페이지에 작성하기
				$("#sidePaging").html(paging);

				// 페이징에 버튼 할당 하는 부분
			
				// 페이징 이전 버튼[<] 할당
				if(!(cpage==1)){
					$("#pbtn").on( "click", function(){
						cpage--;
						//drawSideListing(saleList);
						//drawSidePaging();
						drawSaleList(filteredSeq);
					} );
				}
				// 페이징 번호 부분 버튼[1][2][3] 할당
				for(let i=pageStart; i<=pageLast; i++){
					let pbtnName = "#pbtn" + i;
					//console.log("pbtn name: " + pbtnName);
					if( !(cpage == i) ){
						$( pbtnName ).on( "click", function() {
							//console.log("버튼 누름");
							cpage = i;
							//drawSideListing(saleList);
							//drawSidePaging();
							drawSaleList(filteredSeq);
						});
					}
				}
				
				// 페이징 이후 버튼[>] 할당
				if(!(cpage==pageSize)){
					$("#nbtn").on( "click", function(){
						cpage++;
						//drawSideListing(saleList);
						//drawSidePaging();
						drawSaleList(filteredSeq);
					} );
				}
		    }
			

			// 마커를 활성화하거나 비활성화 하는 함수들
			// 마커를 전체 비활성화하는 함수
			function clearFilter(){
				for(let i=0; i<markers.length; i++) {
					markers[i].check = false;
				}
			}
			// 마커를 원하는 seq들만 활성화하는 함수
			function applyFilter(filteredSeq){
				filteredSeq.forEach(seq => {
					//console.log(seq);
					// 한번 확인해보기 [seq]인지 [seq-1]인지 
					markers[seq-1].check = true;
					//markers[i].check = false;
				});
			}
			
			
			// 거리기반검색
			$("#commutebtn").on("click", function() {
				$.ajax({
					// jsp, xml 등 페이지 주소
					url: '/act_distance_search.do',
					type: 'get',
					// json, xml, html, text 등
					// 파라미터 입력하기
					data: {
						startStation: $("#station-autocomplete").val(),
						timeLimit: $( "#commute-slider" ).slider( "values", 1 )
					},
					dataType: 'json',
					// 성공 4 && 200 이라는 말
					success: function(json) {
						// 거리 기반 검색 성공
						console.log(json);
						// 기존 circle 객체들 비활성화
						circles.forEach( circle => {
							circle.setVisible(false);	
						});
						
						// 새로운 circle(지하철역 위치) 객체 생성 및 추가
						json.stationsNearStart.forEach(station => {
							let num = stationTitleArray.indexOf(station.name);	// 지하철역이 저장된 인덱스 번호
							// let title = stationTitleArray[num];				// 지하철역 이름(테스트용 출력에 사용)
							let lat = stationLats[num];							// 지하철역 위도 경도
							let lon = stationLons[num];							// 지하철역 위도 경도
							// 테스트용 출력 부분
							//console.log(num + "/" + title + "/" +  lat + "/" +  lon);
							let circle = new naver.maps.Circle({
								map: map,
								center: new naver.maps.LatLng(lat, lon),
								radius: 1000,
								fillColor: 'green',
								fillOpacity: 0.1
							});
							// 새로운 cirlce(지하철역 위치) 객체 추가
							circles.push(circle);
						});
						
						// 필터링된 seq 리스트 저장
						filteredSeq = json.salesNearStations[0];
						// 필터링된 seq 리스트 출력
						newSaleList(filteredSeq);
						markerClustering._redraw();
						console.log("markerClustering._redraw() executed");
						drawSaleList(filteredSeq);
					},
					// 실패 
					error: function(e) {
						alert('[에러]' + e.status);
					}
				});
			});
			
			// 기본 페이지, 클러스터링 변경, 클러스터링 클릭, 거리기반검색, 필터(상세)검색
			function newSaleList(filteredSeq) {
				cpage = 1;
				pageSize = Math.ceil(filteredSeq.length/maxLender);
				clearFilter();
				applyFilter(filteredSeq);
				// 기본 새로고침 후 사이드 페이지 드로우
			}
			
			// 기본 페이지, 클러스터링 변경, 클러스터링 클릭, 거리기반검색, 필터(상세)검색, 페이징이동
			function drawSaleList(filteredSeq) {
				drawSideListing(filteredSeq);
				drawSidePaging();
			}

			newSaleList(filteredSeq);
			drawSaleList(filteredSeq);
			//=============================================


		});
	</script>
</body>
</html> 