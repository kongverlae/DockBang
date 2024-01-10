<!-- 지역 검색 창 + 매물 상세 검색 -->
<section class="site-header d-flex flex-column justify-content-center align-items-center pt-5.5 pb-3" style="padding-top: 100px;">
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