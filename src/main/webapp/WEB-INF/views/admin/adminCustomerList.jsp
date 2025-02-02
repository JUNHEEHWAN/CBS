<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<style type="text/css">
th, td {
	text-align: center !important;
}
</style>
<style>
#modalInsert1 .row {
	margin-bottom: 10px;
	/* 각 입력 필드 아래에 10px의 여백 추가 */
}

#modalInsert2 .row {
	margin-bottom: 10px;
	/* 각 입력 필드 아래에 10px의 여백 추가 */
}

.modal-body {
	position: relative;
	-webkit-box-flex: 1;
	-ms-flex: 1 1 auto;
	flex: 1 1 auto;
	padding: 5px;
	/* box-sizing: border-box; */
}
.col-auto{
	margin: 1px;
}
.asd {
    display: flex;
    flex-direction: row; /* 요소들을 가로로 나열합니다. */
    justify-content: space-between; /* 요소들을 동일한 간격으로 분산 정렬합니다. */
    align-items: center; /* 요소들을 수직 가운데 정렬합니다. */
}
.input-group.aa-1.w-100 {
    padding-top: 40px;
}
.form-check-input, .form-select {
    width: auto;
}


</style>
<script type="text/javascript" src="/resources/js/jquery.min.js"></script>
<script type="text/javascript">
$(function() {

	$(document).ready(function() {
        // 목록을 가져와서 표시하는 함수 호출
        listing();
    });
	
	// 비밀번호 입력 필드에서 Enter 키 누를 때 확인 버튼 클릭
    $('#keyword').keypress(function(event) {
        if (event.which === 13) { // Enter 키
            event.preventDefault(); // 기본 동작 방지
            searchBtn(); // 비밀번호 확인 함수 호출
        }
    });
	
	
		 let kwScaleSe = null;
		 let kwMfrcRealmSe = null;
		 let kwBsnAt = null
		 let kwCrmnlHist = null;
		 let kwTaxNpymHist = null;
		 let kwProcessSttus = null;
		 let searchList = null;
		 let keyword = null;
		 
	$("#searchBtn").on("click", function () {
		searchBtn();
	});
	$("#listReset").on("click", function () {
		location.reload();
	});
		function searchBtn (){
		
		keyword = $("#keyword").val();
		searchList = $("#searchList").val();
		
// 		console.log("kwScaleSe 선택 값:", kwScaleSe);
// 		console.log("kwMfrcRealmSe 선택 값:", kwMfrcRealmSe);
// 		console.log("kwBsnAt 선택 값:", kwBsnAt);
// 		console.log("kwCrmnlHist 선택 값:", kwCrmnlHist);
// 		console.log("kwTaxNpymHist 선택 값:", kwTaxNpymHist);
// 		console.log("kwProcessSttus 선택 값:", kwProcessSttus);
// 		console.log("searchList 선택 값:", searchList);
// 		console.log("keyword 선택 값:", keyword);
		
		 let currentPage = "${param.currentPage}";

		    if (currentPage == "") {
		        currentPage = "1";
		    }else {
		        currentPage = "1";
					}

		    //json 오브젝트
		    let data = {
		        "currentPage": currentPage,
		        "kwScaleSe": kwScaleSe,
		        "kwMfrcRealmSe": kwMfrcRealmSe,
		        "kwBsnAt": kwBsnAt,
		        "kwCrmnlHist": kwCrmnlHist ,
		        "kwTaxNpymHist": kwTaxNpymHist,
		        "kwProcessSttus": kwProcessSttus,
		        "searchList":searchList,
		        "keyword": keyword
		    };
		    console.log(data);
		    
		    $.ajax({
		        url: "/cbs/admin/cstlist",
		        contentType: "application/json;charset=utf-8",
		        data: JSON.stringify(data),
		        type: "post",
		        dataType: "json",
		        success: function (result) {
		            console.log("result : ", result);
		            let str = "";
		            $.each(result.content, function (idx, ChargeCustomerVO) {
		                console.log("ChargeCustomerVO 확인!", ChargeCustomerVO);
		                str += "<tr>";
		                str += "<td><a href='#' data-bs-toggle='modal' data-bs-target='#modalDetail' class='open-modal' data-cstmr-cd='" + ChargeCustomerVO.cstmrCd + "'>" + ChargeCustomerVO.cstmrCd + "</a></td>";
		                str += "<td>" + ChargeCustomerVO.entrprsNm + "</td>";
		                str += "<td>" + ChargeCustomerVO.ectmrk + "</td>";
		                str += "<td>" + ChargeCustomerVO.bizrno + "</td>";
		                str += "<td>" + ChargeCustomerVO.cprNo + "</td>";
		                str += "<td>" + (ChargeCustomerVO.scaleSe === 'SSE1' ? '대기업' : (ChargeCustomerVO.scaleSe === 'SSE2' ? '중소기업' : (ChargeCustomerVO.scaleSe === 'SSE3' ? '소상공인' :(ChargeCustomerVO.scaleSe === 'SSE4' ? '자영업자' :	'-')))) + "</td>";
		                str += "<td>" + (ChargeCustomerVO.mfrcRealmSe === 'CMRS1' ? '수출' : (ChargeCustomerVO.mfrcRealmSe === 'CMRS2' ? '수입' : '-')) + "</td>";
		                str += "<td>" + (ChargeCustomerVO.bsnAt === 'T' ? '영업중' : (ChargeCustomerVO.bsnAt === 'F' ? '폐업' : '-')) + "</td>";
		                str += "<td>" + (ChargeCustomerVO.crmnlHist === 'T' ? '이력 있음' : (ChargeCustomerVO.crmnlHist === 'F' ? '이력 없음' : '-')) + "</td>";
		                str += "<td>" + (ChargeCustomerVO.taxNpymHist === 'T' ? '이력 있음' : (ChargeCustomerVO.taxNpymHist === 'F' ? '이력 없음' : '-')) + "</td>";
		                str += "<td>" + (ChargeCustomerVO.processSttus === 'CPS1' ? '<span class="badge badge-phoenix badge-phoenix-secondary">신청전</span>' :
		                    (ChargeCustomerVO.processSttus === 'CPS2' ? '<span class="badge badge-phoenix badge-phoenix-primary">처리중</span>' :
		                    (ChargeCustomerVO.processSttus === 'CPS3' ? '<span class="badge badge-phoenix badge-phoenix-success">승인</span>' :
		                    (ChargeCustomerVO.processSttus === 'CPS4' ? '<span class="badge badge-phoenix badge-phoenix-warning">미승인</span>' : '-')))) + "</td>";
		                str += "<td>" + ChargeCustomerVO.userVO.userNm + "</td>";
		                str += "</tr>";
		            });
//	 	            console.log("str : " + str);
		            console.log("검색어 검색 실행");
		            // 기존 리스트 삭제
		            $('#cstlist').empty();
		            // 데이터 추가
		            $('#cstlist').append(str);
		            // 페이징 영역 업데이트
		            $('#divPaging').html(result.pagingArea);
		        }
		    });
		}
	$(".select").on("change", function () {
		 kwScaleSe = $("#kwScaleSe").val();
		 kwMfrcRealmSe = $("#kwMfrcRealmSe").val();
		 kwBsnAt = $("#kwBsnAt").val();
		 kwCrmnlHist = $("#kwCrmnlHist").val();
		 kwTaxNpymHist = $("#kwTaxNpymHist").val();
		 kwProcessSttus = $("#kwProcessSttus").val();
		 
// 		console.log("kwScaleSe 선택 값:", kwScaleSe);
// 		console.log("kwMfrcRealmSe 선택 값:", kwMfrcRealmSe);
// 		console.log("kwBsnAt 선택 값:", kwBsnAt);
// 		console.log("kwCrmnlHist 선택 값:", kwCrmnlHist);
// 		console.log("kwTaxNpymHist 선택 값:", kwTaxNpymHist);
// 		console.log("kwProcessSttus 선택 값:", kwProcessSttus);

	    /////	검색 리스트 출력////////	
	    let currentPage = "${param.currentPage}";

	    if (currentPage == "") {
	        currentPage = "1";
	    }else{
	        currentPage = "1";
	    }

	    //json 오브젝트
	    let data = {
	        "currentPage": currentPage,
	        "kwScaleSe": kwScaleSe,
	        "kwMfrcRealmSe": kwMfrcRealmSe,
	        "kwBsnAt": kwBsnAt,
	        "kwCrmnlHist": kwCrmnlHist ,
	        "kwTaxNpymHist": kwTaxNpymHist,
	        "kwProcessSttus": kwProcessSttus
	    };
	    console.log(data);

	    $.ajax({
	        url: "/cbs/admin/cstlist",
	        contentType: "application/json;charset=utf-8",
	        data: JSON.stringify(data),
	        type: "post",
	        dataType: "json",
	        success: function (result) {
	            console.log("result : ", result);
	            let str = "";
	            $.each(result.content, function (idx, ChargeCustomerVO) {
	                console.log("ChargeCustomerVO 확인!", ChargeCustomerVO);
	                str += "<tr>";
	                str += "<td><a href='#' data-bs-toggle='modal' data-bs-target='#modalDetail' class='open-modal' data-cstmr-cd='" + ChargeCustomerVO.cstmrCd + "'>" + ChargeCustomerVO.cstmrCd + "</a></td>";
	                str += "<td>" + ChargeCustomerVO.entrprsNm + "</td>";
	                str += "<td>" + ChargeCustomerVO.ectmrk + "</td>";
	                str += "<td>" + ChargeCustomerVO.bizrno + "</td>";
	                str += "<td>" + ChargeCustomerVO.cprNo + "</td>";
	                str += "<td>" + (ChargeCustomerVO.scaleSe === 'SSE1' ? '대기업' : (ChargeCustomerVO.scaleSe === 'SSE2' ? '중소기업' : (ChargeCustomerVO.scaleSe === 'SSE3' ? '소상공인' :(ChargeCustomerVO.scaleSe === 'SSE4' ? '자영업자' :	'-')))) + "</td>";
	                str += "<td>" + (ChargeCustomerVO.mfrcRealmSe === 'CMRS1' ? '수출' : (ChargeCustomerVO.mfrcRealmSe === 'CMRS2' ? '수입' : '-')) + "</td>";
	                str += "<td>" + (ChargeCustomerVO.bsnAt === 'T' ? '영업중' : (ChargeCustomerVO.bsnAt === 'F' ? '폐업' : '-')) + "</td>";
	                str += "<td>" + (ChargeCustomerVO.crmnlHist === 'T' ? '이력 있음' : (ChargeCustomerVO.crmnlHist === 'F' ? '이력 없음' : '-')) + "</td>";
	                str += "<td>" + (ChargeCustomerVO.taxNpymHist === 'T' ? '이력 있음' : (ChargeCustomerVO.taxNpymHist === 'F' ? '이력 없음' : '-')) + "</td>";
	                str += "<td>" + (ChargeCustomerVO.processSttus === 'CPS1' ? '<span class="badge badge-phoenix badge-phoenix-secondary">신청전</span>' :
	                    (ChargeCustomerVO.processSttus === 'CPS2' ? '<span class="badge badge-phoenix badge-phoenix-primary">처리중</span>' :
	                    (ChargeCustomerVO.processSttus === 'CPS3' ? '<span class="badge badge-phoenix badge-phoenix-success">승인</span>' :
	                    (ChargeCustomerVO.processSttus === 'CPS4' ? '<span class="badge badge-phoenix badge-phoenix-warning">미승인</span>' : '-')))) + "</td>";
	                str += "<td>" + ChargeCustomerVO.userVO.userNm + "</td>";
	                str += "</tr>";
	            });
// 	            console.log("str : " + str);
	            console.log("변경 검색 실행");
	            // 기존 리스트 삭제
	            $('#cstlist').empty();
	            // 데이터 추가
	            $('#cstlist').append(str);
	            // 페이징 영역 업데이트
	            $('#divPaging').html(result.pagingArea);
	        }
	    });
	});

	
/////	기본 리스트 출력////////	
// 	let keyword = $(this).val();
// console.log("keyword : " + keyword);
function listing () {
	let currentPage = "${param.currentPage}";
    
    if(currentPage ==""){
  	  currentPage = "1";
    }
	
  //json 오브젝트
  let data = {
		  	"currentPage": currentPage,
	        "kwScaleSe": kwScaleSe,
	        "kwMfrcRealmSe": kwMfrcRealmSe,
	        "kwBsnAt": kwBsnAt,
	        "kwCrmnlHist": kwCrmnlHist ,
	        "kwTaxNpymHist": kwTaxNpymHist,
	        "kwProcessSttus": kwProcessSttus
	    };
	    console.log(data);
  
	    $.ajax({
	        url: "/cbs/admin/cstlist",
	        contentType: "application/json;charset=utf-8",
	        data: JSON.stringify(data),
	        type: "post",
	        dataType: "json",
	        success: function(result) {
	            console.log("result : ", result);
	            let str = "";
	            $.each(result.content, function(idx, ChargeCustomerVO) {
	                console.log("ChargeCustomerVO 확인!", ChargeCustomerVO);
	                str += "<tr>";
	                str += "<td><a href='#' data-bs-toggle='modal' data-bs-target='#modalDetail' class='open-modal' data-cstmr-cd='" + ChargeCustomerVO.cstmrCd + "'>" + ChargeCustomerVO.cstmrCd + "</a></td>";
	                str += "<td>" + ChargeCustomerVO.entrprsNm + "</td>";
	                str += "<td>" + ChargeCustomerVO.ectmrk + "</td>";
	                str += "<td>" + ChargeCustomerVO.bizrno + "</td>";
	                str += "<td>" + ChargeCustomerVO.cprNo + "</td>";
	                str += "<td>" + (ChargeCustomerVO.scaleSe === 'SSE1' ? '대기업' : (ChargeCustomerVO.scaleSe === 'SSE2' ? '중소기업' : (ChargeCustomerVO.scaleSe === 'SSE3' ? '소상공인' :(ChargeCustomerVO.scaleSe === 'SSE4' ? '자영업자' :	'-')))) + "</td>";
        	        str += "<td>" + (ChargeCustomerVO.mfrcRealmSe === 'CMRS1' ? '수출' : (ChargeCustomerVO.mfrcRealmSe === 'CMRS2' ? '수입' : '-')) + "</td>";
	                str += "<td>" + (ChargeCustomerVO.bsnAt === 'T' ? '영업중' : (ChargeCustomerVO.bsnAt === 'F' ? '폐업' : '-')) + "</td>";
	                str += "<td>" + (ChargeCustomerVO.crmnlHist === 'T' ? '이력 있음' : (ChargeCustomerVO.crmnlHist === 'F' ? '이력 없음' : '-')) + "</td>";
	                str += "<td>" + (ChargeCustomerVO.taxNpymHist === 'T' ? '이력 있음' : (ChargeCustomerVO.taxNpymHist === 'F' ? '이력 없음' : '-')) + "</td>";
	                str += "<td>" + (ChargeCustomerVO.processSttus === 'CPS1' ? '<span class="badge badge-phoenix badge-phoenix-secondary">신청전</span>' :
	                    (ChargeCustomerVO.processSttus === 'CPS2' ? '<span class="badge badge-phoenix badge-phoenix-primary">처리중</span>' :
	                    (ChargeCustomerVO.processSttus === 'CPS3' ? '<span class="badge badge-phoenix badge-phoenix-success">승인</span>' :
	                    (ChargeCustomerVO.processSttus === 'CPS4' ? '<span class="badge badge-phoenix badge-phoenix-warning">미승인</span>' : '-')))) + "</td>";
	                str += "<td>" + ChargeCustomerVO.userVO.userNm + "</td>";
	                str += "</tr>";
	            });
// 	            console.log("str : " + str);
				// 기존 리스트 삭제
	            $('#cstlist').empty();
	            // #cstlist가 존재하는지 확인하고, 해당 요소에 데이터를 추가
	            if ($('#cstlist').length) {
	                $("#cstlist").append(str);
	            } else {
	                console.error("#cstlist가 존재하지 않습니다.");
	            }
	            // 페이징 영역 업데이트
	            $('#divPaging').html(result.pagingArea);
	        }
		
		}
	)
};
		// @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@모달 상세@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
		 $(document).on("click", ".open-modal", function() {
			console.log("open-modal click");
			var cstmrCd = $(this).data("cstmr-cd");
			console.log("cstmrCd: " + cstmrCd);
			let data = {
				cstmrCd : cstmrCd
			};
			$.ajax({
				method : "post",
				url : "/cbs/cstbrkr/chargeCustomerDetail",
				data : JSON.stringify(data),
				contentType : "application/json",
				dataType : "json",
				success : function(result) {
					console.log("result",result);
					$("#cstmrCd").val(result.cstmrCd);
					$("#entrprsNm").val(result.entrprsNm);
					$("#reprsntAdres").val(result.reprsntAdres);
					$("#reprsntTelno").val(result.reprsntTelno);
					$("#reprsntEmail").val(result.reprsntEmail);
					$("#charger").val(result.charger);
					$("#ectmrk").val(result.ectmrk);
					$("#bizrno").val(result.bizrno);
					$("#cprNo").val(result.cprNo);

					if (result.scaleSe === 'SSE1') {$("#scaleSe").val('대기업');
					} else if (result.scaleSe === 'SSE2') {$("#scaleSe").val('중소기업');
					} else if (result.scaleSe === 'SSE3') {$("#scaleSe").val('소상공인');
					} else if (result.scaleSe === 'SSE4') {$("#scaleSe").val('자영업자');
					} else { $("#scaleSe").val('') }

					if (result.mfrcRealmSe === 'CMRS1') {$("#mfrcRealmSe").val('수출');
					} else if (result.mfrcRealmSe === 'CMRS2') {$("#mfrcRealmSe").val('수입');
					} else { $("#mfrcRealmSe").val('') }

					if (result.bsnAt === 'T') {$("#bsnAt").val('영업중');
					} else if (result.bsnAt === 'F') {$("#bsnAt").val('폐업');
					} else { $("#bsnAt").val('') }

					if (result.crmnlHist === 'T') {$("#crmnlHist").val('이력 있음');
					} else if (result.crmnlHist === 'F') {$("#crmnlHist").val('이력 없음');
					} else { $("#crmnlHist").val('') }

					if (result.taxNpymHist === 'T') {$("#taxNpymHist").val('이력 있음');
					} else if (result.taxNpymHist === 'F') {$("#taxNpymHist").val('이력 없음');
					} else { $("#taxNpymHist").val('') }

					if (result.processSttus === 'CPS1') {$("#processSttus").val('신청전');
					} else if (result.processSttus === 'CPS2') {$("#processSttus").val('처리중');
					} else if (result.processSttus === 'CPS3') {$("#processSttus").val('승인');
					} else if (result.processSttus === 'CPS4') {$("#processSttus").val('미승인');
					} else { $("#processSttus").val('') }
				}
			});
		});
// 		@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@모달 상세@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@  
		
	});
</script>

<!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@담당 고객목록@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@   -->
<div class="card h-50">
	<div class="card-body">
		<h3>고객 목록</h3>
		<div></div>
      <!-- ===========================검색==================================== -->
		<div class="input-group aa-1 w-100">
			<div class="col-auto" style="flex: 0.8;">
				<select class="form-select form-select-sm h-100 select" id="kwScaleSe">
					<option value="" selected>기업규모 : 전체</option>
					<option value="SSE1">기업규모 : 대기업</option>
					<option value="SSE2">기업규모 : 중소기업</option>
					<option value="SSE3">기업규모 : 소상공인</option>
					<option value="SSE4">기업규모 : 자영업자</option>
				</select>
			</div>
			<div class="col-auto" style="flex: 0.8;">
				<select class="form-select form-select-sm h-100 select" id="kwMfrcRealmSe">
					<option value="" selected>주력분야 : 전체</option>
					<option value="CMRS1">주력분야 : 수출</option>
					<option value="CMRS2">주력분야 : 수입</option>
				</select>
			</div>
			<div class="col-auto" style="flex: 0.8;">
				<select class="form-select form-select-sm h-100 select" id="kwBsnAt">
					<option value="" selected>영업여부 : 전체</option>
					<option value="T">영업여부 : 영업</option>
					<option value="F">영업여부 : 폐업</option>
				</select>
			</div>
			<div class="col-auto" style="flex: 0.8;">
				<select class="form-select form-select-sm h-100 select" id="kwCrmnlHist">
					<option value="" selected>범죄이력 : 전체</option>
					<option value="T">범죄이력 : 있음</option>
					<option value="F">범죄이력 : 없음</option>
				</select>
			</div>
			<div class="col-auto" style="flex: 0.8;">
				<select class="form-select form-select-sm h-100 select" id="kwTaxNpymHist">
					<option value="" selected>세금체납이력 : 전체</option>
					<option value="T">세금체납이력 : 있음</option>
					<option value="F">세금체납이력 : 없음</option>
				</select>
			</div>
			<div class="col-auto" style="flex: 0.8;">
				<select class="form-select form-select-sm h-100 select" id="kwProcessSttus">
					<option value="" selected>고객상태 승인여부 : 전체</option>
					<option value="CPS1">고객상태 : 신청전</option>
					<option value="CPS2">고객상태 : 처리중</option>
					<option value="CPS3">고객상태 : 승인</option>
					<option value="CPS4">고객상태 : 미승인</option>
				</select>
			</div>
			<div class="col-auto" style="flex: 0.8;">
			</div>
			<div class="asd">
			<div style="flex: 0.8;">
				<select class="form-select form-select-sm h-100 selectall" id="searchList">
					<option value="" selected>전체검색</option>
					<option value="B.CSTMR_CD">고객코드</option>
					<option value="B.ENTRPRS_NM">기업명</option>
					<option value="B.ECTMRK">통관고유부호</option>
					<option value="B.BIZRNO">사업자등록번호</option>
					<option value="C.CPR_NO">법인번호</option>
					<option value="D.USER_NM">담당관세사</option>
				</select>
			</div>
					<div class="input-group">
						<input class="form-control" id="keyword" type="text">
			<button class="btn btn-primary btn-sm w-5" type="button" id="searchBtn">검색</button>
			<button class="btn btn-phoenix-secondary " type="button" id="listReset">초기화</button>
					</div>
			</div>
		</div>
		<!-- ===========================검색==================================== -->
</div>
			
			

		<div class="table-responsive" style="text-align: center;">
			<table class="table table-hover">
				<thead>
					<tr class="bg-body-highlight">
						<th>고객코드</th>
						<th>기업명</th>
						<th>통관고유부호</th>
						<th>사업자등록번호</th>
						<th>법인번호</th>
						<th>기업규모</th>
						<th>주력분야</th>
						<th>영업여부</th>
						<th>범죄이력</th>
						<th>세금체납이력</th>
						<th>고객상태 승인여부</th>
						<th>담당관세사</th>
					</tr>
				</thead>
				<tbody class="list" id="cstlist">

				</tbody>
			</table>
		</div>
		<div id="divPaging"></div>
	</div>
<!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@담당 고객목록@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@   -->

<!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@상세 모달@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@  -->
<div class="modal fade" id="modalDetail" tabindex="-1"
	aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="modalDetail">담당고객 상세보기</h5>
				<button class="btn p-1" type="button" data-bs-dismiss="modal"
					aria-label="Close">
					<span class="fas fa-times fs-9"></span>
				</button>
			</div>

			<div class="modal-body">
				<div class="col-auto">
					<div class="input-group">
						<div class="input-group-text" style="width: 140px;">고객코드</div>
						<input class="form-control" id="cstmrCd" type="text" readonly>
					</div>
				</div>
			</div>
			<div class="modal-body">
				<div class="col-auto">
					<div class="input-group">
						<div class="input-group-text" style="width: 140px;">기업명</div>
						<input class="form-control" id="entrprsNm" type="text" readonly>
					</div>
				</div>
			</div>
			<div class="modal-body">
				<div class="col-auto">
					<div class="input-group">
						<div class="input-group-text" style="width: 140px;">대표주소</div>
						<input class="form-control" id="reprsntAdres" type="text" readonly>
					</div>
				</div>
			</div>
			<div class="modal-body">
				<div class="col-auto">
					<div class="input-group">
						<div class="input-group-text" style="width: 140px;">대표전화번호</div>
						<input class="form-control" id="reprsntTelno" type="text" readonly>
					</div>
				</div>
			</div>
			<div class="modal-body">
				<div class="col-auto">
					<div class="input-group">
						<div class="input-group-text" style="width: 140px;">대표이메일</div>
						<input class="form-control" id="reprsntEmail" type="text" readonly>
					</div>
				</div>
			</div>
			<div class="modal-body">
				<div class="col-auto">
					<div class="input-group">
						<div class="input-group-text" style="width: 140px;">담당자</div>
						<input class="form-control" id="charger" type="text" readonly>
					</div>
				</div>
			</div>
			<div class="modal-body">
				<div class="col-auto">
					<div class="input-group">
						<div class="input-group-text" style="width: 140px;">통관고유부호</div>
						<input class="form-control" id="ectmrk" type="text" readonly>
					</div>
				</div>
			</div>
			<div class="modal-body">
				<div class="col-auto">
					<div class="input-group">
						<div class="input-group-text" style="width: 140px;">사업자등록번호</div>
						<input class="form-control" id="bizrno" type="text" readonly>
					</div>
				</div>
			</div>
			<div class="modal-body">
				<div class="col-auto">
					<div class="input-group">
						<div class="input-group-text" style="width: 140px;">법인번호</div>
						<input class="form-control" id="cprNo" type="text" readonly>
					</div>
				</div>
			</div>
			<div class="modal-body">
				<div class="col-auto">
					<div class="input-group">
						<div class="input-group-text" style="width: 140px;">기업규모</div>
						<input class="form-control" id="scaleSe" type="text"
							readonly>
					</div>
				</div>
			</div>
			<div class="modal-body">
				<div class="col-auto">
					<div class="input-group">
						<div class="input-group-text" style="width: 140px;">주력분야</div>
						<input class="form-control" id="mfrcRealmSe" type="text" readonly>
					</div>
				</div>
			</div>
			<div class="modal-body">
				<div class="col-auto">
					<div class="input-group">
						<div class="input-group-text" style="width: 140px;">영업여부</div>
						<input class="form-control" id="bsnAt" type="text" readonly>
					</div>
				</div>
			</div>
			<div class="modal-body">
				<div class="col-auto">
					<div class="input-group">
						<div class="input-group-text" style="width: 140px;">범죄이력</div>
						<input class="form-control" id="crmnlHist" type="text" readonly>
					</div>
				</div>
			</div>
			<div class="modal-body">
				<div class="col-auto">
					<div class="input-group">
						<div class="input-group-text" style="width: 140px;">세금체납이력</div>
						<input class="form-control" id="taxNpymHist" type="text" readonly>
					</div>
				</div>
			</div>
			<div class="modal-body">
				<div class="col-auto">
					<div class="input-group">
						<div class="input-group-text" style="width: 140px;">고객상태
							승인여부</div>
						<input class="form-control" id="processSttus" type="text" readonly>
					</div>
				</div>
			</div>


			<div class="modal-footer">
				<button class="btn btn-outline-primary" type="button"
					data-bs-dismiss="modal">닫기</button>
			</div>
		</div>
	</div>
</div>
<!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@상세 모달@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@   -->
