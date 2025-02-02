<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript" src="/resources/js/jquery.min.js"></script>
<script src="/resources/js/sweetalert2.min.js"></script>
<link rel="stylesheet" href="/resources/css/sweetalert2.min.css">
<style type="text/css">
th, td, option {
	text-align: center !important;
}
</style>
<script type="text/javascript">
$(function() {
	var processSttus = "";
	var searchCategory = "";
	var keyword = "";
	
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
			processSttus : processSttus, 
			searchCategory : searchCategory,
			keyword : keyword
		};
		
		$.ajax ({
			method: "post",
	    	url: "/cbs/svntAdmin/cstCheckList",
	    	data: JSON.stringify(data),
	    	contentType: "application/json",
	    	dataType: "json",
	    	async: false,
	    	success: function(result) {
//	     		console.log("result:" + result);
	    		var str = "";
	    		$.each(result.content, function(idx, customerVO) {
//	     			console.log("customerVO["+idx+"]",customerVO);
	    			
	    			// 영업 여부
					if(customerVO.bsnAt == null) strBsnAt = '-';
					else if(customerVO.bsnAt != '' && customerVO.bsnAt == 'F') strBsnAt = "폐업";
					else if(customerVO.bsnAt != '' && customerVO.bsnAt == 'T') strBsnAt = "영업중";
	    			// 범죄 이력 여부
					if(customerVO.crmnlHist == null) strCrmnlHist = '-';
					else if(customerVO.crmnlHist != '' && customerVO.crmnlHist == 'T') strCrmnlHist = "있음";
					else if(customerVO.crmnlHist != '' && customerVO.crmnlHist == 'F') strCrmnlHist = "없음";
	    			// 세금 체납 여부
					if(customerVO.taxNpymHist == null) strTaxNpymHist = '-';
					else if(customerVO.taxNpymHist != '' && customerVO.taxNpymHist == 'T') strTaxNpymHist = "있음";
					else if(customerVO.taxNpymHist != '' && customerVO.taxNpymHist == 'F') strTaxNpymHist = "없음";
	    			
					// 처리 상태
					var badge;
				    switch (customerVO.processSttus) {
				        case "CPS1": badge = "<span class='badge-phoenix badge-phoenix-warning badge' style='font-size:12.8px;'>CPS1 뜨면 안되는뎅</span>"; break;
				        case "CPS2": badge = "<span class='badge-phoenix badge-phoenix-secondary badge' style='font-size:12.8px;'>접수</span>"; break;
				        case "CPS3": badge = "<span class='badge-phoenix badge-phoenix-info badge' style='font-size:12.8px;'>승인</span>"; break;
				        case "CPS4": badge = "<span class='badge-phoenix badge-phoenix-danger badge' style='font-size:12.8px;'>비승인</span>"; break;
				        default: badge = ""; break;
				    }
//	 				console.log("customerVO["+idx+"]" + strBsnAt)
	    			str += `<tr>
	    						<td><a href="#cusDetModal" data-bs-toggle="modal" data-bs-target="#cusDetModal" data-cstmr-cd="\${customerVO.cstmrCd}" class="open-modal">\${customerVO.cstmrCd}</a></td>
	    						<td>\${customerVO.entrprsNm}</td>
	    						<td>\${customerVO.bizrno}</td>
	    						<td><b>\${strBsnAt}<b></td>
	    						<td><b>\${strCrmnlHist}<b></td>
	    						<td><b>\${strTaxNpymHist}<b></td>
	    						<td>
	    							\${badge}
	    						</td>
	    					</tr>`;
	    		});
	    		$("#tableBody").empty();
	    		$("#tableBody").append(str);
				$("#paging").html(result.pagingArea);
	    	}
		});
	}
	
	// ############################# 선택한  옵션 + 검색어에 따라 테이블 출력 ##############################
	$(".form-select").on("change", function() {
		processSttus = $("#processSttus").val();
		searchCategory = $("#searchCategory").val();
		
// 		console.log("processSttus: " + processSttus);
// 		console.log("searchCategory: " + searchCategory);
		
		var currentPage = "${param.currentPage}";
		if(currentPage == "") currentPage = "1";
		
		var data = {
			currentPage : currentPage, 
			processSttus : processSttus
		};
		
		$.ajax ({
			method: "post",
	    	url: "/cbs/svntAdmin/cstCheckList",
	    	data: JSON.stringify(data),
	    	contentType: "application/json",
	    	dataType: "json",
	    	async: false,
	    	success: function(result) {
//	     		console.log("result:" + result);
	    		var str = "";
	    		$.each(result.content, function(idx, customerVO) {
//	     			console.log("customerVO["+idx+"]",customerVO);
	    			
	    			// 영업 여부
					if(customerVO.bsnAt == null) strBsnAt = '-';
					else if(customerVO.bsnAt != '' && customerVO.bsnAt == 'F') strBsnAt = "폐업";
					else if(customerVO.bsnAt != '' && customerVO.bsnAt == 'T') strBsnAt = "영업중";
	    			// 범죄 이력 여부
					if(customerVO.crmnlHist == null) strCrmnlHist = '-';
					else if(customerVO.crmnlHist != '' && customerVO.crmnlHist == 'T') strCrmnlHist = "있음";
					else if(customerVO.crmnlHist != '' && customerVO.crmnlHist == 'F') strCrmnlHist = "없음";
	    			// 세금 체납 여부
					if(customerVO.taxNpymHist == null) strTaxNpymHist = '-';
					else if(customerVO.taxNpymHist != '' && customerVO.taxNpymHist == 'T') strTaxNpymHist = "있음";
					else if(customerVO.taxNpymHist != '' && customerVO.taxNpymHist == 'F') strTaxNpymHist = "없음";
	    			
					// 처리 상태
					var badge;
				    switch (customerVO.processSttus) {
				        case "CPS1": badge = "<span class='badge-phoenix badge-phoenix-warning badge' style='font-size:12.8px;'>CPS1 뜨면 안되는뎅</span>"; break;
				        case "CPS2": badge = "<span class='badge-phoenix badge-phoenix-secondary badge' style='font-size:12.8px;'>접수</span>"; break;
				        case "CPS3": badge = "<span class='badge-phoenix badge-phoenix-info badge' style='font-size:12.8px;'>승인</span>"; break;
				        case "CPS4": badge = "<span class='badge-phoenix badge-phoenix-danger badge' style='font-size:12.8px;'>비승인</span>"; break;
				        default: badge = ""; break;
				    }
//	 				console.log("customerVO["+idx+"]" + strBsnAt)
	    			str += `<tr>
	    						<td><a href="#cusDetModal" data-bs-toggle="modal" data-bs-target="#cusDetModal" data-cstmr-cd="\${customerVO.cstmrCd}" class="open-modal">\${customerVO.cstmrCd}</a></td>
	    						<td>\${customerVO.entrprsNm}</td>
	    						<td>\${customerVO.bizrno}</td>
	    						<td><b>\${strBsnAt}<b></td>
	    						<td><b>\${strCrmnlHist}<b></td>
	    						<td><b>\${strTaxNpymHist}<b></td>
	    						<td>
	    							\${badge}
	    						</td>
	    					</tr>`;
	    		});
	    		$("#tableBody").empty();
	    		$("#tableBody").append(str);
				$("#paging").html(result.pagingArea);
	    	}
		});
	});
	// #############################################################################################
	
	// ################################# 페이지 로딩시 테이블 출력하기 ##################################
	var currentPage = "${param.currentPage}";
	if(currentPage == "") currentPage = "1";
	
	var data = {currentPage : currentPage};
	
	$.ajax ({
		method: "post",
    	url: "/cbs/svntAdmin/cstCheckList",
    	data: JSON.stringify(data),
    	contentType: "application/json",
    	dataType: "json",
    	async: false,
    	success: function(result) {
//     		console.log("result:" + result);
    		var str = "";
    		$.each(result.content, function(idx, customerVO) {
//     			console.log("customerVO["+idx+"]",customerVO);
    			
    			// 영업 여부
				if(customerVO.bsnAt == null) strBsnAt = '-';
				else if(customerVO.bsnAt != '' && customerVO.bsnAt == 'F') strBsnAt = "폐업";
				else if(customerVO.bsnAt != '' && customerVO.bsnAt == 'T') strBsnAt = "영업중";
    			// 범죄 이력 여부
				if(customerVO.crmnlHist == null) strCrmnlHist = '-';
				else if(customerVO.crmnlHist != '' && customerVO.crmnlHist == 'T') strCrmnlHist = "있음";
				else if(customerVO.crmnlHist != '' && customerVO.crmnlHist == 'F') strCrmnlHist = "없음";
    			// 세금 체납 여부
				if(customerVO.taxNpymHist == null) strTaxNpymHist = '-';
				else if(customerVO.taxNpymHist != '' && customerVO.taxNpymHist == 'T') strTaxNpymHist = "있음";
				else if(customerVO.taxNpymHist != '' && customerVO.taxNpymHist == 'F') strTaxNpymHist = "없음";
    			
				// 처리 상태
				var badge;
			    switch (customerVO.processSttus) {
			        case "CPS1": badge = "<span class='badge-phoenix badge-phoenix-warning badge' style='font-size:12.8px;'>CPS1 뜨면 안되는뎅</span>"; break;
			        case "CPS2": badge = "<span class='badge-phoenix badge-phoenix-secondary badge' style='font-size:12.8px;'>접수</span>"; break;
			        case "CPS3": badge = "<span class='badge-phoenix badge-phoenix-info badge' style='font-size:12.8px;'>승인</span>"; break;
			        case "CPS4": badge = "<span class='badge-phoenix badge-phoenix-danger badge' style='font-size:12.8px;'>비승인</span>"; break;
			        default: badge = ""; break;
			    }
// 				console.log("customerVO["+idx+"]" + strBsnAt)
    			str += `<tr>
    						<td><a href="#cusDetModal" data-bs-toggle="modal" data-bs-target="#cusDetModal" data-cstmr-cd="\${customerVO.cstmrCd}" class="open-modal">\${customerVO.cstmrCd}</a></td>
    						<td>\${customerVO.entrprsNm}</td>
    						<td>\${customerVO.bizrno}</td>
    						<td><b>\${strBsnAt}<b></td>
    						<td><b>\${strCrmnlHist}<b></td>
    						<td><b>\${strTaxNpymHist}<b></td>
    						<td>
    							\${badge}
    						</td>
    					</tr>`;
    		});
    		$("#tableBody").append(str);
			$("#paging").html(result.pagingArea);
    	}
	});
	// #############################################################################################
	
	// ############################### 고객 코드 클릭시 고객 검사 요청 모달 ##############################
  $(".open-modal").click(function() {
	  //console.log("open-modal click");
	  cstmrCd = $(this).data("cstmr-cd");
	  //console.log("cstmrCd: " + cstmrCd);
	  let data = {cstmrCd: cstmrCd};
	  $.ajax ({
		  method: "post",
    	  url: "/cbs/svntAdmin/oneCustomer",
    	  data: JSON.stringify(data),
    	  contentType: "application/json",
    	  dataType: "json",
    	  success: function(result) {
    		entrprsNm = result.entrprsNm;
    		reprsntAdres = result.reprsntAdres;
    		bizrno = result.bizrno;
			$("#entrprsNm").val(entrprsNm);
			$("#reprsntAdres").val(reprsntAdres);
			$("#bizrno").val(bizrno);
			
			bsnAt = result.bsnAt;				// 영업 여부
			crmnlHist = result.crmnlHist;		// 범죄 여부
			taxNpymHist = result.taxNpymHist;	// 세금 체납 여부
			
			//console.log("고객 코드 클릭시 고객 검사 요청 모달 bsnAt: " + bsnAt)
			
			if(bsnAt == null && crmnlHist == null && taxNpymHist == null) { // 값이 없으면 고객 검사 버튼 활성화, 있으면 비활성화
				  $("#reqBtn").prop("disabled", false);
			} else {
				  $("#reqBtn").prop("disabled", true);
			}
    	  }
	  });
  });
  // ############################################################################################
	
  var cstmrCd = "";
  var entrprsNm = ""; 		// 기업명
  var reprsntAdres = ""; 	// 주소
  var bizrno = ""; 			// 사업자등록번호
  var bsnAt = ""; 			// 영업여부
  var crmnlHist = ""; 		// 범죄여부
  var taxNpymHist = ""; 	// 세금체납여부
  
  // ##################################### 고객 검사 버튼 클릭시 ####################################
	$("#reqBtn").on("click", function() {
// 	console.log("cstmrCd 전역변수 체크: " + cstmrCd);
	let timerInterval;
	Swal.fire({
	  title: "고객 검사",
	  html: "고객의 영업 여부, 세금 체납 이력, <br> 범죄 이력을 조회 중입니다.",
	  timer: 1500,
	  timerProgressBar: true,
	  didOpen: () => {
	    Swal.showLoading();
	    const timer = Swal.getPopup().querySelector("b");
	    timerInterval = setInterval(() => {
	      timer.textContent = `${Swal.getTimerLeft()}`;
	    }, 100);
	  },
	  willClose: () => {
	    clearInterval(timerInterval);
	  }
		}).then((result) => {
		  if (result.dismiss === Swal.DismissReason.timer) {
			  let data = { cstmrCd : cstmrCd };
			  $.ajax ({
		    	  method: "post",
		    	  url: "/cbs/svntAdmin/cusChkRandUpd",
		    	  data: JSON.stringify(data),
		    	  contentType: "application/json",
		    	  dataType: "json",
		    	  async: false
		      });
		      $('#cusChkModal').modal('show'); // 모달 열기
		  }
		});
	  });
  // ############################################################################################
  
  // ################################### 검사 완료 모달 열렸을 때 ###################################
  $('#cusChkModal').on('show.bs.modal', function (event) {
	  //console.log("검사 완료 모달 열렸을 때1 cstmrCd: " + cstmrCd);
	  var modal = $(this);
	  modal.find('#entrprsNm').val(entrprsNm);
	  modal.find('#reprsntAdres').val(reprsntAdres);
	  modal.find('#bizrno').val(bizrno);
	  
	  let data = {cstmrCd: cstmrCd};
	$.ajax({
		method: "post",
		url: "/cbs/svntAdmin/oneCusChk",
		data: JSON.stringify(data),
		contentType: "application/json",
		dataType: "json",
		async: false,
		success: function (result) {
// 			console.log("oneCusChk result: " + result)
			if(result.bsnAt === "T") bsnAt = "영업중";
			else if(result.bsnAt === "F") bsnAt = "폐업";
	              
			if(result.crmnlHist === "T") crmnlHist = "있음";
			else if(result.crmnlHist === "F") crmnlHist = "없음";

			if(result.taxNpymHist === "T") taxNpymHist = "있음";
			else if(result.taxNpymHist === "F") taxNpymHist = "없음";
			
			if(result.bsnAt === "F" || result.crmnlHist === "T" || result.taxNpymHist === "T") {
				$("#checkTxt").text("통관 진행이 불가한 고객입니다. 처리 상태를 변경해 주세요.");
			}
			if(result.bsnAt === "T" && result.crmnlHist === "F" && result.taxNpymHist === "F") {
				$("#checkTxt").text("통관 진행이 가능한 고객입니다. 처리 상태를 변경해 주세요.");
			}
		}
	});
	  var badgeClass = (bsnAt == "영업중") ? "info" : "danger";
	  var badgeHTML = '<span class="badge badge-phoenix badge-phoenix-' + badgeClass + '">' + bsnAt + '</span>';
	  $("#bsnAt").html(badgeHTML);
	  
	  var badgeClass = (crmnlHist == "없음") ? "info" : "danger";
	  var badgeHTML = '<span class="badge badge-phoenix badge-phoenix-' + badgeClass + '">' + crmnlHist + '</span>';
	  $("#crmnlHist").html(badgeHTML);
	  
	  var badgeClass = (taxNpymHist == "없음") ? "info" : "danger";
	  var badgeHTML = '<span class="badge badge-phoenix badge-phoenix-' + badgeClass + '">' + taxNpymHist + '</span>';
	  $("#taxNpymHist").html(badgeHTML);
	  
	  // --------------------------- 승인, 비승인 선택 --------------------------- 
	  var checkVal = "";
	  $("input[name=sel]").change(function(){		  
		  checkVal = $("input[name=sel]:checked").val();
	  });
	  // -----------------------------------------------------------------------
	  
	  // ----------------- 상태 변경 버튼 클릭시 고객 처리 상태 변경 ------------------
	  $("#updSttus").on("click", function() {
		  Swal.fire({
			  title: "고객 상태를 변경하시겠습니까?",
			  icon: "warning",
			  showCancelButton: true,
			  confirmButtonColor: "#3085d6",
			  cancelButtonColor: "#d33",
			  confirmButtonText: "예",
			  cancelButtonText: "아니오"
			}).then((result) => {
			  if (result.isConfirmed) {
				  let data2 = {cstmrCd : cstmrCd, processSttus : checkVal};
				  $.ajax({
					  method: "post",
					  url: "/cbs/svntAdmin/updSttus",
					  data: JSON.stringify(data2),
					  contentType: "application/json",
					  dataType: "json",
					  async: false,
					  success: function(result) {
						  console.log(result);
					  }		
				  });
			      Swal.fire({
			        title: "고객 상태가 변경되었습니다.",
			        icon: "success"
			      });
			  }
			});
	  });
	  // -----------------------------------------------------------------------
   });
//############################################################################################
});
</script>
<div class="card h-50">
	<img alt="" src="/resources/img/진행1.png">
	<div class="box_st5">
	    <div class="box_st_ico">
	    	<div class="my-3"></div>
	        <div class="ico_boxImg">
	            <img src="/resources/img/titlelogo.png" style="width:100px;height:100px; float:left; margin-right: 20px;">
	        </div>
	        <div style="float:left;">
	            <h3 class="fs18 pc_black">고객 검사</h3>
	            <p>이 페이지는 <span style="color:#155eb6;"><b>고객의 영업 여부, 범죄 이력 여부, 세금 체납 여부를 조회</b></span>하는 페이지입니다.<br>기타 궁금하신 점은 관세청 콜센터 125번으로 문의하시기 바랍니다.</p>
	        </div>
	        <div style="clear:both;"></div>
	    </div>
	</div>
	<div class="card-body">
		<div class="input-group mb-3 w-75 ms-auto p-2 bd-highlight" style="padding: 10px;">
			<select class="form-select" id="processSttus">
				<option selected>처리 상태</option>
				<option value="all">처리 상태: 전체</option>
				<option value="CPS2">처리 상태: 접수</option>
				<option value="CPS3">처리 상태: 승인</option>
				<option value="CPS4">처리 상태: 비승인</option>
			</select> 
			<select class="form-select" id="searchCategory">
				<option selected value="">검색 카테고리 선택</option>
				<option value="CSTMR_CD">고객코드</option>
				<option value="ENTRPRS_NM">기업명</option>
				<option value="BIZRNO">사업자등록번호</option>
			</select> 
			<input type="text" id="keyword" class="form-control" placeholder="검색어를 입력하세요." aria-label="" aria-describedby="button-addon2" style="flex: 1;">
			<button class="btn btn-primary btn-sm" type="button" id="searchBtn" onclick="">검색</button>
			<button class="btn btn-phoenix-primary btn-sm px-3 me-1" type="button" id="resetBtn" onclick="">초기화</button>
		</div>
		<div class="table-responsive">
			<table class="table table-sm fs-9 mb-0">
				<thead>
					<tr class="bg-body-highlight">
						<th scope="col">고객 코드</th>
						<th scope="col">기업명</th>
						<th scope="col">사업자등록번호</th>
						<th scope="col">영업 여부</th>
						<th scope="col">범죄 이력 여부</th>
						<th scope="col">세금 체납 여부</th>
						<th scope="col">처리 상태</th>
					</tr>
				</thead>
				<tbody class="list" id="tableBody">
					<!-- ajax -->
				</tbody>
			</table>
		</div>
		<div class="my-6"></div>
		<div id="paging">
			<!-- js 처리 -->
		</div>
	</div>
</div>

<!-- ############################################ 고객 검사 요청 모달 ############################################ -->
<div class="modal fade" id="cusDetModal" tabindex="-1"
	aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="cusDetModal">고객 검사 요청</h5>
				<button class="btn p-1" type="button" data-bs-dismiss="modal"
					aria-label="Close">
					<span class="fas fa-times fs-9"></span>
				</button>
			</div>
			<div class="modal-body">
				<div class="col-auto">
					<div class="input-group">
						<div class="input-group-text">기업명</div>
						<input class="form-control" id="entrprsNm" type="text">
					</div>
				</div>
				<div class="input-group mt-3">
					<div class="input-group-text">주소</div>
					<input class="form-control" id="reprsntAdres" type="text">
				</div>
				<div class="input-group mt-3">
					<div class="input-group-text">사업자등록번호</div>
					<input class="form-control" id="bizrno" type="text">
				</div>
			</div>
			<div class="modal-footer">
				<button class="btn btn-outline-primary" type="button"
					data-bs-dismiss="modal">닫기</button>
				<button class="btn btn-primary" type="button"
					data-bs-dismiss="modal" id="reqBtn" disabled>고객 검사 요청</button>
			</div>
		</div>
	</div>
</div>
<!-- ############################################################################################# -->

<!-- ############################################ 고객 검사 완료 모달 ############################################ -->
<div class="modal fade" id="cusChkModal" tabindex="-1"
	aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="cusChkModal">고객 검사 완료</h5>
				<button class="btn p-1" type="button" data-bs-dismiss="modal"
					aria-label="Close">
					<span class="fas fa-times fs-9"></span>
				</button>
			</div>
			<div class="modal-body">
				<div class="col-auto">
					<div class="input-group">
						<div class="input-group-text">기업명</div>
						<input class="form-control" id="entrprsNm" type="text">
					</div>
				</div>
				<div class="input-group mt-3">
					<div class="input-group-text">주소</div>
					<input class="form-control" id="reprsntAdres" type="text">
				</div>
				<div class="input-group mt-3">
					<div class="input-group-text">사업자등록번호</div>
					<input class="form-control" id="bizrno" type="text">
				</div>
			</div>
			<table class="table">
				<tbody>
					<tr>
						<th scope="row">영업 여부</th>
						<th scope="row">범죄 여부</th>
						<th scope="row">세금 체납 여부</th>
					</tr>
					<tr>
						<td id="bsnAt"></td>
						<td id="crmnlHist"></td>
						<td id="taxNpymHist"></td>
					</tr>
				</tbody>
			</table>
			<button type="button" class="btn btn-outline-secondary"
				style="font-size: 16px; border-color: white; --phoenix-btn-hover-bg: none; --phoenix-btn-hover-color: none; cursor: text; text-align: left;"
				id="checkTxt">
				<!-- js -->
			</button>
			<div class="mt-3 col-12" style="margin-left: 170px !important;">
				<div class="form-check-inline form-check">
					<input type="radio" name="sel" id="option1"
						class="form-check-input" value="CPS3"> <label
						for="option1" class="form-check-label">승인</label>
				</div>
				<div class="form-check-inline form-check">
					<input type="radio" name="sel" id="option2"
						class="form-check-input" value="CPS4"> <label
						for="option2" class="form-check-label">비승인</label>
				</div>
			</div>
			<div class="my-3"></div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary" id="updSttus">상태
					변경</button>
				<button class="btn btn-outline-primary" type="button"
					data-bs-dismiss="modal" onclick="window.location.reload()">닫기</button>
			</div>
		</div>
	</div>
</div>
<!-- ############################################################################################# -->