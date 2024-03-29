
(function ($) {
	"use strict";
	
	var availableTags = [
	 "가락시장",
	 "강남",
	 "강남구청",
	 "강동",
	 "강동구청",
	 "강일", 
	 "개롱", 
	 "개포동",
	 "거여", 
	 "경찰병원",
	 "고덕", 
	 "고속터미널", 
	 "교대", 
	 "구룡", 
	 "구반포",
	 "굽은다리",
	 "길동", 
	 "남부터미널", 
	 "내방", 
	 "논현", 
	 "대모산입구", 
	 "대청", 
	 "대치", 
	 "도곡", 
	 "둔촌동",
	 "둔촌오륜",
	 "마천", 
	 "매봉", 
	 "명일", 
	 "몽촌토성",
	 "문정", 
	 "반포", 
	 "방배", 
	 "방이", 
	 "복정", 
	 "봉은사",
	 "사평", 
	 "삼성", 
	 "삼성중앙",
	 "삼전", 
	 "상일동",
	 "서초", 
	 "석촌", 
	 "석촌고분",
	 "선릉", 
	 "선정릉",
	 "송파", 
	 "송파나루",
	 "수서", 
	 "신논현",
	 "신반포",
	 "신사",
	 "암사",
	 "압구정",
	 "압구정로데오",
	 "양재", 
	 "양재시민의숲",
	 "언주",
	 "역삼",
	 "오금",
	 "올림픽공원",
	 "일원",
	 "잠실",
	 "잠실나루",
	 "잠실새내",
	 "잠원",
	 "장지",
	 "종합운동장", 
	 "중앙보훈병원",
	 "천호",
	 "청계산입구", 
	 "청담",
	 "학동",
	 "학여울",
	 "한성백제",
	 "한티"
	];
	$( "#station-autocomplete" ).autocomplete({
		delay: 0,
		source: availableTags,
		minLength: 1,
        autoFocus: true  // Focus on the first item by default
	});
	
	
	$('#suggestion').on('click', function(e) {
	      if($(this).has(e.target).length === 0) {
	        e.stopPropagation();
	      }
	    });
	
	$( "#slider" ).slider({
		range: true,
		values: [ 17, 67 ]
	});
	
	// 전세가 l-deposit-slider
	$( function() {
	    $( "#l-deposit-slider" ).slider({
	      range: true,
	      min: 0,
	      max: 500,
	      step: 10,
	      values: [ 0, 500 ],
	      slide: function( event, ui ) {
	        $( "#l-deposit" ).text( ui.values[ 0 ] + " 만원 - " + ui.values[ 1 ] + " 만원");
	        refreshFilterKeywords();
	        console.log(filterKeywords);
	      }
	    });
	    $( "#l-deposit" ).text( $( "#l-deposit-slider" ).slider( "values", 0 ) +
	      " 만원 - " + $( "#l-deposit-slider" ).slider( "values", 1 ) + " 만원" );
	  } );
	
	// 월세가 m-deposit-slider
	$( function() {
	    $( "#m-deposit-slider" ).slider({
	      range: true,
	      min: 0,
	      max: 500,
	      step: 10,
	      values: [ 0, 500 ],
	      slide: function( event, ui ) {
	        $( "#m-deposit" ).text( ui.values[ 0 ] + " 만원 - " + ui.values[ 1 ] + " 만원");
	        refreshFilterKeywords();
	        console.log(filterKeywords);
	      }
	    });
	    $( "#m-deposit" ).text( $( "#m-deposit-slider" ).slider( "values", 0 ) +
	      " 만원 - " + $( "#m-deposit-slider" ).slider( "values", 1 ) + " 만원" );
	  } );
	
	
	// 월세 monthly-fee-slider
	$( function() {
	    $( "#monthly-fee-slider" ).slider({
	      range: true,
	      min: 0,
	      max: 500,
	      step: 10,
	      values: [ 0, 500 ],
	      slide: function( event, ui ) {
	        $( "#monthly-fee" ).text( ui.values[ 0 ] + " 만원 - " + ui.values[ 1 ] + " 만원");
	      	refreshFilterKeywords();
	        console.log(filterKeywords);
	      }
	    });
	    $( "#monthly-fee" ).text( $( "#monthly-fee-slider" ).slider( "values", 0 ) +
	      " 만원 - " + $( "#monthly-fee-slider" ).slider( "values", 1 ) + " 만원" );
	  } );
	
	// 매물가 price-slider
	$( function() {
	    $( "#price-slider" ).slider({
	      range: true,
	      min: 0,
	      max: 500,
	      step: 10,
	      values: [ 0, 500 ],
	      slide: function( event, ui ) {
	        $( "#price" ).text( ui.values[ 0 ] + " 만원 - " + ui.values[ 1 ] + " 만원");
	      	refreshFilterKeywords();
	        console.log(filterKeywords);
	      }
	    });
	    $( "#price" ).text( $( "#price-slider" ).slider( "values", 0 ) +
	      " 만원 - " + $( "#price-slider" ).slider( "values", 1 ) + " 만원" );
	  } );
	
	// 통근시간 commute-slider
	$( function() {
	    $( "#commute-slider" ).slider({
	      range: true,
	      min: 0,
	      max: 120,
	      step: 10,
	      values: [ 0, 120 ],
	      slide: function( event, ui ) {
	        $( "#commute" ).text( ui.values[ 0 ] + " 분 - " + ui.values[ 1 ] + " 분");
	      }
	    });
	    $( "#commute" ).text( $( "#commute-slider" ).slider( "values", 0 ) +
	      " 분 - " + $( "#commute-slider" ).slider( "values", 1 ) + " 분" );
	  } );
	  
	  
	const filterKeywords = {
		"station": null,		// 지하철 역
		
		"commuteWay": null,		// 통근 방식
		"commuteMin": null,		// 통근 시간 min
		"commuteMax": null,		// 통근 시간 max
		
		"op": null, 			// 오피스텔
		"sh": null,				// 주택
		"or": null,				// 원룸
		"at": null,			// 아파트
				
		"l": null,				// 전세 
		"m": null,				// 월세
		"p": null,				// 매매
				
		"lDepositMin": null,	// 전세가 min
		"lDepositMax": null,	// 전세가 max
		"mDepositMin": null,	// 월세가 min
		"mDepositMax": null,	// 월세가 max
		"montylyFeeMin": null,	// 월세 min
		"monthlyFeeMax": null,	// 월세 max
		"priceMin": null, 		// 매매가 min
		"priceMax": null 		// 매매가 max
	};
	function refreshFilterKeywords() {
			filterKeywords.station = $("#station-autocomplete").val();
			filterKeywords.commuteWay = $("input[name='commuteWay']:checked").val();
			filterKeywords.commuteMin = $( "#commute-slider" ).slider( "values", 0 );
			filterKeywords.commuteMax = $( "#commute-slider" ).slider( "values", 1 );
	
			filterKeywords.op = $( "#houseTypeOp" ).prop( "checked" );
			filterKeywords.sh = $( "#houseTypeSh" ).prop( "checked" );
			filterKeywords.or = $( "#houseTypeOr" ).prop( "checked" );
			filterKeywords.at = $( "#houseTypeAt" ).prop( "checked" );
		
			filterKeywords.l = $( "#offerTypeL" ).prop( "checked" );
			filterKeywords.m = $( "#offerTypeM" ).prop( "checked" );
			filterKeywords.p = $( "#offerTypeP" ).prop( "checked" );
		
			filterKeywords.lDepositMin = $( "#l-deposit-slider" ).slider( "values", 0 );
			filterKeywords.lDepositMax = $( "#l-deposit-slider" ).slider( "values", 1 );
			filterKeywords.mDepositMin = $( "#m-deposit-slider" ).slider( "values", 0 );
			filterKeywords.mDepositMax = $( "#m-deposit-slider" ).slider( "values", 1 );
			filterKeywords.montylyFeeMin = $( "#monthly-fee-slider" ).slider( "values", 0 );
			filterKeywords.monthlyFeeMax = $( "#monthly-fee-slider" ).slider( "values", 1 );
			filterKeywords.priceMin = $( "#price-slider" ).slider( "values", 0 );
			filterKeywords.priceMax = $( "#price-slider" ).slider( "values", 1 );

			//console.log(filterKeywords);
		}
	$(document).ready(function(){
		//filterKeywords.station = document.getElementById( "station-autocomplete" ).value; 
		//filterKeywords.commuteWay = document.querySelector( 'input[name="commuteWay"]:checked' ).value; 
		//console.log(cpage);
	});
	
	// house_type 필터 만들기
	// offer_type 필터 만들기 
	// 매물 가격 정보 필터 만들기
	// 
	
	// 필터링 하는 함수
	function filteringList(before) {
		return before.filter(item => {
   			return (item.house_type === 'at' && filterKeywords.at) ||
				(item.house_type === 'op' && filterKeywords.op) ||
				(item.house_type === 'sh' && filterKeywords.sh) ||
				(item.house_type === 'or' && filterKeywords.or);
			})
	}
	
	function refreshable() {
		refreshFilterKeywords();
		//console.log(filterKeywords);
		//changedArr = filteringList(saleJsonArr);
		/*changedArr = saleJsonArr.filter(item => {
   			return (item.house_type === 'at' && filterKeywords.at) ||
				(item.house_type === 'op' && filterKeywords.op) ||
				(item.house_type === 'sh' && filterKeywords.sh) ||
				(item.house_type === 'or' && filterKeywords.or);
			})
		console.log(saleJsonArr.length);*/
	}
	
	// 오피스텔 체크박스 이벤트
    $("#houseTypeOp").change(function(){
        if($(this).is(":checked")){
            // 체크되었을 때의 동작
            console.log("오피스텔이 선택되었습니다.");
			$("#houseTypeAt").prop("checked", false);
        } else {
            // 해제되었을 때의 동작
            console.log("오피스텔이 해제되었습니다.");
        }
		refreshable();
		let house_type_list = [];
		if( filterKeywords.at ){
			house_type_list.push("at");
		}
		if( filterKeywords.op ){
			house_type_list.push("op");
		}
		if( filterKeywords.sh ){
			house_type_list.push("sh");
		}
		if( filterKeywords.or ){
			house_type_list.push("or");
		}
		//console.log(house_type_list);
		searchSaleSeq(house_type_list);
    });

    // 주택 체크박스 이벤트
    $("#houseTypeSh").change(function(){
        if($(this).is(":checked")){
            console.log("주택이 선택되었습니다.");
			$("#houseTypeAt").prop("checked", false);
        } else {
            console.log("주택이 해제되었습니다.");
        }
		refreshable();
		let house_type_list = [];
		if( filterKeywords.at ){
			house_type_list.push("at");
		}
		if( filterKeywords.op ){
			house_type_list.push("op");
		}
		if( filterKeywords.sh ){
			house_type_list.push("sh");
		}
		if( filterKeywords.or ){
			house_type_list.push("or");
		}
		//console.log(house_type_list);
		searchSaleSeq(house_type_list);
    });

    // 원룸 체크박스 이벤트
    $("#houseTypeOr").change(function(){
        if($(this).is(":checked")){
            console.log("원룸이 선택되었습니다.");
            $("#houseTypeAt").prop("checked", false);
        } else {
            console.log("원룸이 해제되었습니다.");
        }
        
		refreshable();
		let house_type_list = [];
		if( filterKeywords.at ){
			house_type_list.push("at");
		}
		if( filterKeywords.op ){
			house_type_list.push("op");
		}
		if( filterKeywords.sh ){
			house_type_list.push("sh");
		}
		if( filterKeywords.or ){
			house_type_list.push("or");
		}
		//console.log(house_type_list);
		searchSaleSeq(house_type_list);
    });

    // 아파트 체크박스 이벤트
    $("#houseTypeAt").change(function(){
        if($(this).is(":checked")){
            console.log("아파트가 선택되었습니다.");
			// 아파트가 선택되었을 때 다른 체크박스들을 해제
            $("#houseTypeOp, #houseTypeSh, #houseTypeOr").prop("checked", false);
        } else {
            console.log("아파트가 해제되었습니다.");
        }
        refreshable();
        let house_type_list = [];
		if( filterKeywords.at ){
			house_type_list.push("at");
		}
		if( filterKeywords.op ){
			house_type_list.push("op");
		}
		if( filterKeywords.sh ){
			house_type_list.push("sh");
		}
		if( filterKeywords.or ){
			house_type_list.push("or");
		}
		//console.log(house_type_list);
		searchSaleSeq(house_type_list);
    });

    // 모든 집 유형 체크박스의 변경 이벤트
    $("[id^=houseType]").change(function(){
        var checkedCount = $("[id^=houseType]:checked").length;

        // 최소 하나의 체크박스는 선택되어 있어야 함
        if (checkedCount === 0) {
            // 현재 체크박스 선택 취소
            $(this).prop("checked", true);
        }
      	// let house_type_list = [];
        //console.log($("[id^=houseType]:checked"));
		/*
        $("[id^=houseType]:checked").forEach(checked => {
        	console.log(checked);
        	house_type_list = checked;
        	console.log(house_type_list);
        });
        */
    });
    
	// 모든 거래 유형 체크박스의 변경 이벤트
    $("[id^=offerType]").change(function(){
        var checkedCount = $("[id^=offerType]:checked").length;

        // 최소 하나의 체크박스는 선택되어 있어야 함
        if (checkedCount === 0) {
            // 현재 체크박스 선택 취소
            $(this).prop("checked", true);
        }
    });
    
    
    // 전세가 입력 슬라이더 
    $("#offerTypeL").change(function(){
        if($(this).is(":checked")){
            console.log("전세 체크.");
			$("#lSlider").show();
        } else {
            console.log("전세 체크 해제.");
            $("#lSlider").hide();
        }
    });
    
	// 월세가 입력 슬라이더 
    $("#offerTypeM").change(function(){
        if($(this).is(":checked")){
            console.log("전세 체크.");
			$("#mSlider").show();
        } else {
            console.log("전세 체크 해제.");
            $("#mSlider").hide();
        }
    });
    
	// 매매가 입력 슬라이더 
    $("#offerTypeP").change(function(){
        if($(this).is(":checked")){
            console.log("전세 체크.");
			$("#pSlider").show();
        } else {
            console.log("전세 체크 해제.");
            $("#pSlider").hide();
        }
    });


    /*
    $(".refreshable").change( function(){
		//console.log(this);
		refreshFilterKeywords();
		console.log(filterKeywords);
		saleJsonArr = filteringList(saleJsonArr);
		console.log(saleJsonArr.length);
	});
	*/
    function test() {
	    let list = "";
		for( let i = 0; i < 20; i++ ) {
			list += "<div style='height: 100px' class='row my-2'>";
			list += "<div class='col-5 thumb-post'>";
			list += "<img alt='매물 사진' src=";
			list += "'" + saleJsonArr[i].sale_pic + "'";
			list += ">";
			/*https://dockbang-sale-picture-bucket.s3.ap-northeast-2.amazonaws.com/OP/OP_0001.jpg*/
			list += "</div>";
			list += "<div class='col-7'>";
			list += "매매 4억7700<br>";
			list += "아파트, 크기, 층<br>";
			list += "지역<br>";
			list += "</div>";
			list += "</div>";
		}
	}
	
	function searchSaleSeq(house_type_list){
		$.ajax({
			// jsp, xml 등 페이지 주소
			url: '/act_house_type_search.do',
			type: 'get',
			// json, xml, html, text 등
			// 파라미터 입력하기
			data: { 'house_type_list': house_type_list },
			traditional: true,
			dataType: 'json',
			// 성공 4 && 200 이라는 말
			success: function(json) {
				// 거리 기반 검색 성공
				//console.log(json);
				
			},
			// 실패 
			error: function(e) {
				alert('[에러]' + e.status);
			}
		});
	};
})(window.jQuery);


