<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<head>
<script type="text/javascript" src="/resources/js/jquery.min.js"></script>
<script src="/resources/js/sweetalert2.min.js"></script>
<link rel="stylesheet" href="/resources/css/sweetalert2.min.css">
<style type="text/css">
table {
	text-align: center !important;
    vertical-align: middle !important;
}
</style>
<script type="text/javascript">
var entrManageNo = "";
const entryStatus = function(tr){      //클릭 함수
// 	console.log("클릭한 행 값 = ", tr);
	entrManageNo = tr.text;
// 	console.log("부모에서 선택한 행의 통관번호 : ", entrManageNo);
	entryNo(entrManageNo);
}

const entryNo = function(entrManageNo){      //통관번호 자식창으로 보내면서 해당 페이지 호출하는 함수
	console.log("통관번호 : ", entrManageNo);
	console.log("부모창에서 자식창으로 보내는 값 : ", entrManageNo);
	document.querySelector("#parents").value = entrManageNo;
// 	var newWindow = window.open('/cbs/cstbrkr/entryProcessStatusPopup','_blank','width=1500, height=850, top=70, left=200, scrollbars=no');
	window.open('/cbs/cstbrkr/entryProcessStatusPopup','_blank','width=1500, height=850, top=70, left=200, scrollbars=no');
}
	
$(function() {
	
	var entrSe = "";
	var processSttus = "";
	var startDate = "";
	var endDate = "";
	var searchCategory = "";
	
	// Enter 키 누를 때 확인 버튼 클릭
    $('#keyword').keypress(function(event) {
        if (event.which === 13) {
            event.preventDefault();
            searchBtn();
        }
    });
	
    $("#searchBtn").on("click", function () {
		searchBtn();
	});
	$("#resetBtn").on("click", function () {
		location.reload();
	});
	
	function searchBtn() {
		keyword = $("#keyword").val();
		console.log("keyword: " + keyword);
		
		var currentPage = "${param.currentPage}";
		if(currentPage == "") currentPage = "1";
		
		var data = {
			currentPage : currentPage,
			entrSe : entrSe,
			processSttus : processSttus,
			startDate : startDate,
			endDate : endDate,
			searchCategory : searchCategory,
			keyword : keyword
		};
		
		$.ajax ({
			method: "post",
	    	url: "/cbs/svntAdmin/judgeList",
	    	data: JSON.stringify(data),
	    	contentType: "application/json",
	    	dataType: "json",
	    	success: function(result) {
// 	    		console.log("result:" + result);
	    		var str = "";
	    		$.each(result.content, function(idx, entryProcessStatusVO) {
// 	    			console.log("entryProcessStatusVO["+idx+"]",entryProcessStatusVO);
	    			str += `<tr>
	    			    		<td><a href='#' class='open-window' onclick='entryStatus(this)'>\${entryProcessStatusVO.entrManageNo}</a></td>
	    			    		<td><span class='badge-phoenix badge-phoenix-secondary badge' style='font-size:12.8px;'>\${entryProcessStatusVO.processSttus}</span></td>
	    			    		<td>\${entryProcessStatusVO.entrSe == 'EES1' ? '수출' : '수입'}</td>
	    			    		<td>\${entryProcessStatusVO.userNm}</td>
	    			    		<td>\${entryProcessStatusVO.telno}</td>
	    			    		<td>\${entryProcessStatusVO.emailAdres}</td>
	    			    		<td>\${entryProcessStatusVO.processDe}</td>
	    					</tr>`;
	    		});
	    		$("#tableBody").empty();
	    		$("#tableBody").append(str);
				$("#paging").html(result.pagingArea);
	    	}
		});
	};
	
	// ################################# 화면 로딩시 테이블 ajax 처리 ##################################
	var currentPage = "${param.currentPage}";
	if(currentPage == "") currentPage = "1";
	
	var data = {currentPage : currentPage};
	
	$.ajax ({
		method: "post",
    	url: "/cbs/svntAdmin/judgeList",
    	data: JSON.stringify(data),
    	contentType: "application/json",
    	dataType: "json",
    	success: function(result) {
//     		console.log("result:" + result);
    		var str = "";
    		$.each(result.content, function(idx, entryProcessStatusVO) {
//     			console.log("entryProcessStatusVO["+idx+"]",entryProcessStatusVO);
    			str += `<tr>
    			    		<td><a href='#' class='open-window' onclick='entryStatus(this)'>\${entryProcessStatusVO.entrManageNo}</a></td>
    			    		<td><span class='badge-phoenix badge-phoenix-secondary badge' style='font-size:12.8px;'>\${entryProcessStatusVO.processSttus}</span></td>
    			    		<td>\${entryProcessStatusVO.entrSe == 'EES1' ? '수출' : '수입'}</td>
    			    		<td>\${entryProcessStatusVO.userNm}</td>
    			    		<td>\${entryProcessStatusVO.telno}</td>
    			    		<td>\${entryProcessStatusVO.emailAdres}</td>
    			    		<td>\${entryProcessStatusVO.processDe}</td>
    					</tr>`;
    		});
    		$("#tableBody").append(str);
			$("#paging").html(result.pagingArea);
    	}
	});
	// #############################################################################################
	
	// ######################### 선택한  옵션에 맞는 테이블 출력 (검색어는 따로) ###########################
	$(".form-select").on("change", function() {
		entrSe = $("#entrSe").val();
		processSttus = $("#processSttus").val();
		startDate = $("#startDate").val();
		endDate = $("#endDate").val();
		searchCategory = $("#searchCategory").val();
		
		var currentPage = "${param.currentPage}";
		if(currentPage == "") currentPage = "1";
		
		var data = {
			currentPage : currentPage,
			entrSe : entrSe,
			processSttus : processSttus,
			startDate : startDate,
			endDate : endDate
		};
		
		$.ajax ({
			method: "post",
	    	url: "/cbs/svntAdmin/judgeList",
	    	data: JSON.stringify(data),
	    	contentType: "application/json",
	    	dataType: "json",
	    	success: function(result) {
// 	    		console.log("result:" + result);
	    		var str = "";
	    		$.each(result.content, function(idx, entryProcessStatusVO) {
// 	    			console.log("entryProcessStatusVO["+idx+"]",entryProcessStatusVO);
	    			str += `<tr>
	    			    		<td><a href='#' class='open-window' onclick='entryStatus(this)'>\${entryProcessStatusVO.entrManageNo}</a></td>
	    			    		<td><span class='badge-phoenix badge-phoenix-secondary badge' style='font-size:12.8px;'>\${entryProcessStatusVO.processSttus}</span></td>
	    			    		<td>\${entryProcessStatusVO.entrSe == 'EES1' ? '수출' : '수입'}</td>
	    			    		<td>\${entryProcessStatusVO.userNm}</td>
	    			    		<td>\${entryProcessStatusVO.telno}</td>
	    			    		<td>\${entryProcessStatusVO.emailAdres}</td>
	    			    		<td>\${entryProcessStatusVO.processDe}</td>
	    					</tr>`;
	    		});
	    		$("#tableBody").empty();
	    		$("#tableBody").append(str);
				$("#paging").html(result.pagingArea);
	    	}
		});
		
	});
	// #############################################################################################
	
	var stateMap = stateMap = {
			"EPS1": ["통관 신청"],
		    "EPS2": ["통관 신청", "통관 접수"],
		    "EPS3": ["통관 신청", "통관 접수", "입고 신청"],
		    "EPS4": ["통관 신청", "통관 접수", "입고 신청", "입고 완료"],
		    "EPS5": ["통관 신청", "통관 접수", "입고 신청", "입고 완료", "검역 신청"],
		    "EPS6": ["통관 신청", "통관 접수", "입고 신청", "입고 완료", "검역 신청", "검역 접수"],
		    "EPS7": ["통관 신청", "통관 접수", "입고 신청", "입고 완료", "검역 신청", "검역 접수", "검역 완료"],
		    "EPS8": ["통관 신청", "통관 접수", "입고 신청", "입고 완료", "검역 신청", "검역 접수", "검역 완료", "수출입 승인"],
// 		    "EPS9": ["통관 신청", "통관 접수", "입고 신청", "입고 완료", "검역 신청", "검역 접수", "검역 완료", "검역 반려"],
		};
	
	// ############################### 통관 관리 번호 클릭시 통관 진행 현황 모달 ##########################
    $(document).on("click", ".open-window", function() {
	    let data = { entrManageNo: entrManageNo };
	    $.ajax ({
	    	method: "post",
	    	url: "/cbs/svntAdmin/oneEntryDetail",
	    	data: JSON.stringify(data),
	    	contentType: "application/json",
	    	dataType: "json",
	    	success: function(result) {
	    		//console.log("result: ", result);
	    		// ################## 상세 정보 값 채워넣기 ##################
	    		$("#entrprsNm").val(result.entrprsNm);
	    		$("#customerType").val(result.customerType);
	    		var scaleSe = "";
	    		if(result.scaleSe == "SSE1") scaleSe = "대기업";
	    		if(result.scaleSe == "SSE2") scaleSe = "중소기업";
	    		if(result.scaleSe == "SSE1") scaleSe = "소상공인";
	    		if(result.scaleSe == "SSE1") scaleSe = "자영업자";
	    		$("#scaleSe").val(scaleSe);
	    		$("#qualfNo").val(result.qualfNo);
	    		$("#userNm").val(result.userNm);
	    		$("#telno").val(result.telno);
	    		$("#emailAdres").val(result.emailAdres);
	    		$("#cmpnm").val(result.expterCmpnm == null ? result.imprCmpnm : result.expterCmpnm);
	    		$("#adres").val(result.expterAdres == null ? result.imprAdres : result.expterAdres);
	    		$("#telno2").val(result.expterTelno == null ? result.imprTelno : result.expterTelno);
	    		$("#charger").val(result.expterCharger == null ? result.imprCharger : result.expterCharger);
	    		$("#waybilNo").val(result.waybilNo);
	    		$("#trnsprtStle").val(result.trnsprtStle);
	    		$("#coudes").val(result.coudes);
	    		$("#shipNm").val(result.shipNm);
	    		$("#startPrt").val(result.startPrt);
	    		$("#arvlPrt").val(result.arvlPrt);
	    		$("#shipStartDe").val(result.shipStartDe);
	    		$("#shipEndDe").val(result.shipEndDe);
	    		
	    		//console.log("result.processSttus: ", result.processSttus);
	    		// ################## 처리 상태에 따라 불 들어오게 ##################
	    		var activeElements = stateMap[result.processSttus];
	    		console.log("activeElements: " + activeElements);
	    		if (activeElements) {
					activeElements.forEach(function(liText) {
						$("li:contains('" + liText + "')").addClass("active");
	    		    });
	    		}
	    		// #############################################################
	    	}
	    });
	});
  	// #############################################################################################
});
</script>
</head>
<body>
	<div>
		<input type="text" id="parents" value="" style="display: none;">
	</div>
	<div class="card h-50">
		<div class="box_st5">
		    <div class="box_st_ico">
		    	<div class="my-3"></div>
		        <div class="ico_boxImg">
		            <img src="/resources/img/titlelogo.png" style="width:100px;height:100px; float:left; margin-right: 20px;">
		        </div>
		        <div style="float:left;">
		        	<div class="my-3"></div>
		            <h3 class="fs18 pc_black">통관 심사</h3>
		            <p>이 페이지는 <span style="color:#155eb6;"><b>실시간으로 통관 정보를 확인</b></span>하는 페이지입니다.<br>기타 궁금하신 점은 관세청 콜센터 125번으로 문의하시기 바랍니다.</p>
		        </div>
		        <div style="clear:both;"></div>
		    </div>
		</div>
		<div class="card-body">
			<div id="tableExample4">
				<div class="input-group mb-3 w-75 ms-auto p-2 bd-highlight"
					style="padding: 10px;">
					<select class="form-select" id="processSttus">
						<option selected value="">처리 상태</option>
						<option value="">처리 상태: 전체</option>
						<option value="통관 접수">처리 상태: 통관 접수</option>
						<option value="운송(입고) 신청">처리 상태: 운송(입고) 신청</option>
						<option value="운송(입고) 완료">처리 상태: 운송(입고) 완료</option>
						<option value="검역 신청">처리 상태: 검역 신청</option>
						<option value="검역 접수">처리 상태: 검역 접수</option>
						<option value="검역 완료">처리 상태: 검역 완료</option>
						<option value="검역 승인">처리 상태: 검역 승인</option>
						<option value="검역 불통과">처리 상태: 검역 불통과</option>
						<option value="운송(출고) 신청">처리 상태: 운송(출고) 신청</option>
						<option value="운송(출고) 완료">처리 상태: 운송(출고) 완료</option>
						<option value="수출입 승인">처리 상태: 수출입 승인</option>
					</select> 
					<select class="form-select" id="entrSe">
						<option selected value="">통관 구분</option>
						<option value="all">통관 구분: 전체</option>
						<option value="EES1">통관 구분: 수출</option>
						<option value="EES2">통관 구분: 수입</option>
					</select> 
					<input type="date" id="startDate" class="form-control"
						placeholder="시작일" aria-label="" aria-describedby="button-addon2">
					<input type="date" id="endDate" class="form-control"
						placeholder="종료일" aria-label="" aria-describedby="button-addon2">
					<select class="form-select" id="searchCategory">
						<option selected value="">검색 카테고리 선택</option>
						<option value="ENTR_MANAGE_NO">통관관리번호</option>
						<option value="USER_NM">담당자명</option>
						<option value="TELNO">담당자번호</option>
						<option value="EMAIL_ADRES">담당자이메일</option>
					</select> <input type="text" id="keyword" class="form-control"
						placeholder="검색어를 입력하세요." aria-label=""
						aria-describedby="button-addon2" style="flex: 1;">
					<button class="btn btn-primary btn-sm" type="button" id="searchBtn"
						onclick="">검색</button>
					<button class="btn btn-phoenix-primary btn-sm px-3 me-1"
						type="button" id="resetBtn" onclick="">초기화</button>
				</div>
				<div class="table-responsive" id="">
					<table class="table table-sm fs-9 mb-0">
						<thead>
							<tr class="bg-body-highlight">
								<th>통관관리번호</th>
								<th>처리상태</th>
								<th>통관구분</th>
								<th>담당자명</th>
								<th>담당자번호</th>
								<th>담당자이메일</th>
								<th>처리일시</th>
							</tr>
						</thead>
						<tbody class="list" id="tableBody">
							<!-- ajax 처리 -->
						</tbody>
					</table>
				</div>
				<div class="my-3"></div>
				<div id="paging">
					<!-- js 처리 -->
				</div>
			</div>
		</div>
	</div>
</body>
