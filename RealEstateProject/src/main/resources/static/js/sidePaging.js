/**
 * 
 */
"use strict"

class Right {
	
	constructor(filteredSeq){
		this.cpage = 1;
		this.maxLender = 20;
		this.filteredSeq = filteredSeq;
		this.pageSize = Math.ceil(this.filteredSeq.length/this.maxLender);;
	}
	
	// cpage를 설정하는 함수
	setCpage(cpage) {
		this.cpage = cpage;
	}
	// cpage를 반환하는 함수
	getCpage() {
		return this.cpage;
	}
	// maxLender를 설정하는 함수
	setMaxLender(maxLender) {
		this.maxLender = maxLender;
	}
	// maxLender를 반환하는 함수
	getMaxLender() {
		return this.maxLender;
	}
	// filteredSeq를 설정하는 함수
	setFilteredSeq(filteredSeq) {
		this.filteredSeq = filteredSeq;
		this.pageSize = Math.ceil(this.filteredSeq.length/this.maxLender);;
	}
	// filteredSeq를 반환하는 함수
	getFilteredSeq() {
		return this.filteredSeq;
	}
	// pageSize를 반환하는 함수
	getPageSize() {
		return this.pageSize;
	}
	
	
	// 지도 화면 사이드에 표시되는 매물 리스트 그리는 함수
	drawSideListing() {
		// 
		let start = ( ( this.cpage - 1 ) * this.maxLender );
		// 들어온 seq 리스트를 seq만 가지고 있는 배열로 변경하는 작업
		let last = (((start + this.maxLender)<this.filteredSeq.length) ? start + this.maxLender : this.filteredSeq.length);

		// 최대 20개 혹은 입력된 갯수 만큼 매물의 정보를 가져오기 위한 작업		
		let atSeqList = [];
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
				// list = 매물 리스트를 표시하기 위한 html 문자열을 저장하는 변수
				let list = "";
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
					} else if (data.sale_type=="L"){
						//list += data.sale_type + data.deposit + "<br>";					
						list += "전세 " + data.deposit + "만원<br>";					
					} else if (data.sale_type=="M"){
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
	}
	
	drawSidePaging() {
		// page 시작점
		let pageStart = ( ( this.cpage >= 3 ) ? this.cpage - 2 : 1 );
		// page 종료점 
		let pageLast = ( ( ( pageStart + 4) < this.pageSize ) ? pageStart + 4 : this.pageSize );
		
		// page 들을 출력하기 위한 html
		let paging = "";
		// 페이징 이전 [<]
		paging += "<li class='page-item'>";
		// 현재 페이지가 1이면 동작 불가
		if(this.cpage==1){
			paging += "<div id='pbtn' class='page-link w-10' aria-label='Previous'>";
			paging += "<span aria-hidden='true'>&lt;</span></div></li>";
		} else {
			paging += "<button id='pbtn' class='page-link w-10' aria-label='Previous'>";
			paging += "<span aria-hidden='true'>&lt;</span></button></li>";
		}
	    
		// 페이징 번호 출력 [1][2][3][4][5]
		for(let i=pageStart; i<=pageLast; i++){
			// 현재 페이지 번호와 같을 경우 현재 페이지라는 표시를 함
			if(this.cpage == i){
				paging += "<li class='page-item active' aria-current='page'>";
				paging += "<div id='pbtn" + i + "' class='page-link w-1'>" + i + "</div></li>";
			} else {
				paging += "<li class='page-item' aria-current='page'>";
				paging += "<button id='pbtn" + i + "' class='page-link w-1'>" + i + "</button></li>";
			}
		}				
	    
		// 페이징 이후 [>]
		paging += "<li class='page-item'>";
		if(this.cpage==pageSize){
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
		if(!(this.cpage==1)){
			$("#pbtn").on( "click", function(){
				this.cpage--;
				this.drawSideListing();
				this.drawSidePaging();
			} );
		}
		// 페이징 번호 부분 버튼[1][2][3] 할당
		for(let i=pageStart; i<=pageLast; i++){
			let pbtnName = "#pbtn" + i;
			//console.log("pbtn name: " + pbtnName);
			if( !(this.cpage == i) ){
				$( pbtnName ).on( "click", function() {
					//console.log("버튼 누름");
					this.cpage = i;
					drawSideListing();
					drawSidePaging();
				});
			}
		}
		
		// 페이징 이후 버튼[>] 할당
		if(!(this.cpage==pageSize)){
			$("#nbtn").on( "click", function(){
				this.cpage++;
				drawSideListing();
				drawSidePaging();
			} );
		}
	}
	
	// 마커를 활성화하거나 비활성화 하는 함수들
	// 마커를 전체 비활성화하는 함수
	clearFilter(markers) {
		for(let i=0; i<markers.length; i++) {
			markers[i].check = false;
		}
		return markers;
	}
	
	// 마커를 입력한 seqList 만큼 활성화하는 함수
	applyFilter(markers) {
		this.filteredSeq.forEach(seq => {
			markers[seq-1].check = true;
		});
		return markers;
	}
}