<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<head>
<script type="text/javascript" src="/resources/js/jquery.min.js"></script>
<script src="/resources/js/sweetalert2.min.js"></script>
<link rel="stylesheet" href="/resources/css/sweetalert2.min.css">
<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>

<style type="text/css">
th, td { text-align: center !important; style: vertical-align: middle !important; }
.modal-content { width: 1350px; height:770px; !important; left: -300px; }
</style>
<script type="text/javascript">
	var entrManageNo = "";
	const entryStatus = function(tr){      //클릭 함수
		console.log("클릭한 행 값 = ", tr);
		entrManageNo = tr.text;
		console.log("부모에서 선택한 행의 통관번호 : ", entrManageNo);
		entryNo(entrManageNo);
	}

	const entryNo = function(entrManageNo){      //통관번호 자식창으로 보내면서 해당 페이지 호출하는 함수
		console.log("통관번호 : ", entrManageNo);
		console.log("부모창에서 자식창으로 보내는 값 : ", entrManageNo);
		document.querySelector("#parents").value = entrManageNo;
		var newWindow = window.open('/cbs/cstbrkr/entryProcessStatusPopup','_blank','width=1500, height=850, top=70, left=200, scrollbars=no');
	}
	
$(function() {
	
	var entrSe = "";
	var manctmKwa = "";
	var qrantTargetAt = "";
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
			manctmKwa : manctmKwa,
			qrantTargetAt : qrantTargetAt,
			searchCategory : searchCategory,
			keyword : keyword
		};
		
		$.ajax ({
			method: "post",
	    	url: "/cbs/svntAdmin/list",
	    	data: JSON.stringify(data),
	    	contentType: "application/json",
	    	dataType: "json",
	    	success: function(result) {
	    		//console.log("result:" + result);
	    		var str = "";
	    		$.each(result.content, function(idx, entryVO) {
//	     			console.log("entryVO["+idx+"]",entryVO);
	    			str += `<tr>
	    			    		<td><input class='form-check-input' name='chkBox' id='chkBox' type='checkbox'/></td>
			    			    <td><a href='#' class='open-window' onclick='entryStatus(this)'>\${entryVO.entrManageNo}</a></td>
			    			    <td>\${entryVO.client}</td>
			    			    <td>\${entryVO.notifyInfo}</td>
			    			    <td>\${entryVO.entrSe == 'EES1' ? '수출' : '수입'}</td>
			    			    <td>\${entryVO.manctmKwa}</td>
			    			    <td>\${entryVO.manctmKwaCharger}</td>
			    			    <td>\${entryVO.trnsprtStle}</td>
			    			    <td>\${entryVO.coudes}</td>
			    			    <td>\${entryVO.qrantTargetAt == 1 ? '<span class="badge badge-phoenix badge-phoenix-info" style="font-size:12.8px;">서류</span>' : '<span class="badge badge-phoenix badge-phoenix-danger" style="font-size:12.8px;">검역</span>'}</td>
	    					</tr>`;
	    		});
	    		$("#tableBody").empty();
	    		$("#tableBody").append(str);
				$("#paging").html(result.pagingArea);
	    	}
		});
		
	};
	
	var stateMap = stateMap = {
			"EPS1": ["통관 신청"],
		    "EPS2": ["통관 신청", "통관 접수"],
		    "EPS3": ["통관 신청", "통관 접수", "입고 신청"],
		    "EPS4": ["통관 신청", "통관 접수", "입고 신청", "입고 완료"],
		    "EPS5": ["통관 신청", "통관 접수", "입고 신청", "입고 완료", "검역 신청"],
		    "EPS6": ["통관 신청", "통관 접수", "입고 신청", "입고 완료", "검역 신청", "검역 접수"],
		    "EPS7": ["통관 신청", "통관 접수", "입고 신청", "입고 완료", "검역 신청", "검역 접수", "검역 완료"],
		    "EPS8": ["통관 신청", "통관 접수", "입고 신청", "입고 완료", "검역 신청", "검역 접수", "검역 완료", "검역 승인"],
// 		    "EPS9": ["통관 신청", "통관 접수", "입고 신청", "입고 완료", "검역 신청", "검역 접수", "검역 완료", "검역 반려"],
		    "EPS10": ["통관 신청", "통관 접수", "입고 신청", "입고 완료", "검역 신청", "검역 접수", "검역 완료", "검역 승인", "출고 신청"],
		    "EPS11": ["통관 신청", "통관 접수", "입고 신청", "입고 완료", "검역 신청", "검역 접수", "검역 완료", "검역 승인", "출고 신청", "출고 완료"],
		    "EPS12": ["통관 신청", "통관 접수", "입고 신청", "입고 완료", "검역 신청", "검역 접수", "검역 완료", "검역 승인", "출고 신청", "출고 완료", "수출입 승인"]
		};
	
	// ############################### 통관 관리 번호 클릭시 통관 진행 현황 모달 ##########################
    $(document).on("click", ".open-window", function() {
	    let dataNo = { entrManageNo: entrManageNo };
	    $.ajax ({
	    	method: "post",
	    	url: "/cbs/svntAdmin/oneEntryDetail",
	    	data: JSON.stringify(dataNo),
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

  	// ######################### 선택한  옵션에 맞는 테이블 출력 (검색어는 따로) ###########################
	$(".form-select").on("change", function() {
		entrSe = $("#entrSe").val();					// 통관 구분
		manctmKwa = $("#manctmKwa").val();				// 관할 세관
		qrantTargetAt = $("#qrantTargetAt").val();  	// 심사 종류
		searchCategory = $("#searchCategory").val();  	// 검색 카테고리
		
// 		console.log("entrSe: " + entrSe);
// 		console.log("manctmKwa: " + manctmKwa);
// 		console.log("qrantTargetAt: " + qrantTargetAt);
// 		console.log("searchCategory: " + searchCategory);
		
		var currentPage = "${param.currentPage}";
		if(currentPage == "") currentPage = "1";
		
		var data = {
			currentPage : currentPage,
			entrSe : entrSe,
			manctmKwa : manctmKwa,
			qrantTargetAt : qrantTargetAt
		};
		
		$.ajax ({
			method: "post",
	    	url: "/cbs/svntAdmin/list",
	    	data: JSON.stringify(data),
	    	contentType: "application/json",
	    	dataType: "json",
	    	success: function(result) {
	    		//console.log("result:" + result);
	    		var str = "";
	    		$.each(result.content, function(idx, entryVO) {
//	     			console.log("entryVO["+idx+"]",entryVO);
	    			str += `<tr>
	    			    		<td><input class='form-check-input' name='chkBox' id='chkBox' type='checkbox'/></td>
			    			    <td><a href='#' class='open-window' onclick='entryStatus(this)'>\${entryVO.entrManageNo}</a></td>
			    			    <td>\${entryVO.client}</td>
			    			    <td>\${entryVO.notifyInfo}</td>
			    			    <td>\${entryVO.entrSe == 'EES1' ? '수출' : '수입'}</td>
			    			    <td>\${entryVO.manctmKwa}</td>
			    			    <td>\${entryVO.manctmKwaCharger}</td>
			    			    <td>\${entryVO.trnsprtStle}</td>
			    			    <td>\${entryVO.coudes}</td>
			    			    <td>\${entryVO.qrantTargetAt == 1 ? '<span class="badge badge-phoenix badge-phoenix-info" style="font-size:12.8px;">서류</span>' : '<span class="badge badge-phoenix badge-phoenix-danger" style="font-size:12.8px;">검역</span>'}</td>
	    					</tr>`;
	    		});
	    		$("#tableBody").empty();
	    		$("#tableBody").append(str);
				$("#paging").html(result.pagingArea);
	    	}
		});
	});
	// #############################################################################################
  
	// ################################# 화면 로딩시 테이블 ajax 처리 ##################################
	var currentPage = "${param.currentPage}";
	if(currentPage == "") currentPage = "1";
	
	var data = {currentPage : currentPage};
	
	$.ajax ({
		method: "post",
    	url: "/cbs/svntAdmin/list",
    	data: JSON.stringify(data),
    	contentType: "application/json",
    	dataType: "json",
    	success: function(result) {
    		//console.log("result:" + result);
    		var str = "";
    		$.each(result.content, function(idx, entryVO) {
//     			console.log("entryVO["+idx+"]",entryVO);
    			str += `<tr>
    			    		<td><input class='form-check-input' name='chkBox' id='chkBox' type='checkbox'/></td>
		    			    <td><a href='#' class='open-window' onclick='entryStatus(this)'>\${entryVO.entrManageNo}</a></td>
		    			    <td>\${entryVO.client}</td>
		    			    <td>\${entryVO.notifyInfo}</td>
		    			    <td>\${entryVO.entrSe == 'EES1' ? '수출' : '수입'}</td>
		    			    <td>\${entryVO.manctmKwa}</td>
		    			    <td>\${entryVO.manctmKwaCharger}</td>
		    			    <td>\${entryVO.trnsprtStle}</td>
		    			    <td>\${entryVO.coudes}</td>
		    			    <td>\${entryVO.qrantTargetAt == 1 ? '<span class="badge badge-phoenix badge-phoenix-info" style="font-size:12.8px;">서류</span>' : '<span class="badge badge-phoenix badge-phoenix-danger" style="font-size:12.8px;">검역</span>'}</td>
    					</tr>`;
    		});
    		$("#tableBody").append(str);
			$("#paging").html(result.pagingArea);
    	}
	});
	// #############################################################################################
	
	// ############################## 체크박스 클릭시 통관 관리 번호 배열로 ##############################
	   var entrNoArr = [];
   $(document).on("click", ".form-check-input[name='chkBox']", function() {
 var row = $(this).closest("tr");
        var pushItem = row.find("td:nth-child(2) a").text();
      console.log("pushItem: " + pushItem);
      entrManageNo = { entrManageNo : pushItem }
      entrNoArr.push(entrManageNo);
      console.log("위entrNoArr[0]: " + entrNoArr[0]);
      console.log("위entrNoArr[1]: " + entrNoArr[1]);
   });
	// #############################################################################################
	
	// ########################## 배정 버튼 클릭시 통관 번호 담당 공무원 업데이트 ##########################
	$(document).on("click", "#pick", function() {
		var count = entrNoArr.length;
		console.log("아래entrNoArr[0]: " + entrNoArr[0]);
	    console.log("count: " + count);
		Swal.fire({
			title: "선택한 총 " + count + "건의 통관을 접수하시겠습니까?",
			showCancelButton: true,
			confirmButtonText: "예",
			cancelButtonText: "닫기"
		}).then((result) => {
			$.ajax ({
				method: "post",
		    	url: "/cbs/svntAdmin/updPbsvntCd",
		    	data: JSON.stringify(entrNoArr),
		    	contentType: "application/json",
		    	dataType: "json",
				success: function(result) {
					console.log("upd result: " + result);
				}
			});
			$.ajax ({ // 처리 상태 업데이트
				method: "post",
		    	url: "/cbs/svntAdmin/eps2upd",
		    	data: JSON.stringify(entrNoArr),
		    	contentType: "application/json",
		    	dataType: "json",
				success: function(result) {
					console.log("ins result: " + result);
				}
			});
			if (result.isConfirmed) {
				Swal.fire({
				    title: "접수되었습니다. 담당 목록으로 이동합니다.",
				    icon: "success",
				    showConfirmButton: true
				}).then(function(result) {
				    if (result.isConfirmed) {
				        location.href = "/cbs/svntAdmin/entryJudge";
				    }
				});
			} else if (result.isDenied) {
				Swal.fire("처리 도중 오류가 발생했습니다.", "", "info");
			}
		});
	});
	// #############################################################################################
});
//###################################### 체크박스 전체 선택 ####################################
function selectAll(selectAll) {
	//console.log("나 눌렀엉?");
	const checkboxes = document.getElementsByName("chkBox");
	checkboxes.forEach((checkbox) => {
		if(checkbox.disabled) return;
		checkbox.checked = selectAll.checked; 
	});
}
//##############################################################################################
</script>
</head>
<body>
<div>
	<input type="text" id="parents" value="" style="display: none;">
</div>
	<div class="card h-50">
		<img alt="" src="/resources/img/진행3.png">
		<div class="box_st5">
		    <div class="box_st_ico">
		    	<div class="my-3"></div>
		        <div class="ico_boxImg">
		            <img src="/resources/img/titlelogo.png" style="width:100px;height:100px; float:left; margin-right: 20px;">
		        </div>
		        <div style="float:left;">
		        	<div class="my-3"></div>
		            <h3 class="fs18 pc_black">통관 접수</h3>
		            <p>이 페이지는 관세사가 통관 신청 후 <span style="color:#155eb6;"><b>행정 공무원이 통관을 접수하는 페이지</b></span>입니다.<br>기타 궁금하신 점은 관세청 콜센터 125번으로 문의하시기 바랍니다.</p>
		        </div>
		        <div style="clear:both;"></div>
		    </div>
		</div>
		<div class="card-body">
			<div id="tableExample4">
				<div class="input-group mb-3 w-75 ms-auto p-2 bd-highlight" style="padding: 10px;">
			<select class="form-select" id="entrSe">
				<option selected value="">통관 구분</option>
				<option value="all">통관 구분: 전체</option>
				<option value="EES1">통관 구분: 수출</option>
				<option value="EES2">통관 구분: 수입</option>
			</select> 
			<select class="form-select" id="manctmKwa">
				<option selected value="">관할 세관</option>
				<option value="all">관할 세관: 전체</option>
				<option value="대전">관할 세관: 대전</option>
				<option value="부산">관할 세관: 부산</option>
				<option value="울산">관할 세관: 울산</option>
				<option value="인천">관할 세관: 인천</option>
			</select> 
			<select class="form-select" id="qrantTargetAt">
				<option selected value="">심사 종류</option>
				<option value="all">심사 종류: 전체</option>
				<option value="1">심사 종류: 서류</option>
				<option value="2">심사 종류: 검역</option>
			</select> 
			<select class="form-select" id="searchCategory">
				<option selected value="">검색 카테고리 선택</option>
				<option value="ENTR_MANAGE_NO">통관관리번호</option>
				<option value="CLIENT">의뢰자</option>
				<option value="NOTIFY_INFO">통지처</option>
				<option value="MANCTM_KWA_CHARGER">세관담당자</option>
				<option value="TRNSPRT_STLE">운송형태</option>
				<option value="COUDES">목적국가</option>
			</select> 
			<input type="text" id="keyword" class="form-control" placeholder="검색어를 입력하세요." aria-label="" aria-describedby="button-addon2" style="flex: 1;">
			<button class="btn btn-primary btn-sm" type="button" id="searchBtn" onclick="">검색</button>
			<button class="btn btn-phoenix-primary btn-sm px-3 me-1" type="button" id="resetBtn" onclick="">초기화</button>
		</div>
				<div class="table-responsive" id="myList">
					<table class="table table-sm fs-9 mb-0">
						<thead>
							<tr class="bg-body-highlight">
								<th><input class='form-check-input' name='checkbox1' type='checkbox' onclick='selectAll(this)'/></th>
								<th>통관관리번호</th>
								<th>의뢰자</th>
								<th>통지처</th>
								<th>통관구분</th>
								<th>관할세관</th>
								<th>세관담당자</th>
								<th>운송형태</th>
								<th>목적국가</th>
								<th>심사종류</th>
							</tr>
		      			</thead>
		      			<tbody class="list" id="tableBody">
		      				<!-- ajax 처리 -->
		      			</tbody>
					</table>
	  			</div>
	  			<div class="d-flex justify-content-end">
					<button class="btn btn-primary px-5 me-2" type="button" id="pick">접수</button>
				</div>
				<div class="my-6"></div>
	  			<div id="paging">
	  				<!-- js 처리 -->
				</div>
			</div>
		</div>
	</div>
</body>
