<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <script src="/resources/js/sweetalert2.min.js"></script>
	<link rel="stylesheet" href="/resources/css/sweetalert2.min.css" />
    <style type="text/css">
		th, td { text-align: center !important; }
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
         #ims {
	       max-width: 100%;
	       height: auto;
	   		}
    	.searchAdresBtn{
		    border: none;
		    cursor: pointer;
		}
    	
      </style>
      <script type="text/javascript" src="/resources/js/jquery.min.js"></script>
      
<!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@다음 주소API@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
      <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	  <script>
	    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
	    $(document).ready(function(){
	    	$('.searchAdresBtn').click(function(){
	    		new daum.Postcode({
					oncomplete: function(data) {
						$('[id=reprsntAdresIns]').val(data.address);
					}
				}).open();
	    	});
	    });
	    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
	    $(document).ready(function(){
	    	$('.searchAdresBtn2').click(function(){
	    		new daum.Postcode({
					oncomplete: function(data) {
						$('[id=reprsntAdresIns2]').val(data.address);
					}
				}).open();
	    	});
	    });
	    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
	    $(document).ready(function(){
	    	$('.updateAdresBtn').click(function(){
	    		new daum.Postcode({
					oncomplete: function(data) {
						$('[id=reprsntAdresUpd]').val(data.address);
					}
				}).open();
	    	});
	    });
	  </script>
<!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
      
      <script type="text/javascript">
$(function () {
	
	$(document).ready(function() {
        // 목록을 가져와서 표시하는 함수 호출
        listing();
    });
	
	let scaleSe = null;
	let mfrcRealmSe = null;
	let bsnAt = null
	let crmnlHist = null;
	let taxNpymHist = null;
	let processSttus = null;
	let searchList = null;
	let keyword = null;
	 
$("#searchBtn").on("click", function () {
	searchBtn();
});
$("#resetBtn").on("click", function () {
	location.reload();
});
	
function searchBtn (){
	
	keyword = $("#keyword").val();
	searchList = $("#searchList").val();
	console.log("scaleSe 선택 값:", scaleSe);
	console.log("mfrcRealmSe 선택 값:", mfrcRealmSe);
	console.log("bsnAt 선택 값:", bsnAt);
	console.log("crmnlHist 선택 값:", crmnlHist);
	console.log("taxNpymHist 선택 값:", taxNpymHist);
	console.log("processSttus 선택 값:", processSttus);
	console.log("searchList 선택 값:", searchList);
	console.log("keyword 선택 값:", keyword);
	
	 let currentPage = "${param.currentPage}";

	    if (currentPage == "") {
	        currentPage = "1";
	    }else {
	        currentPage = "1";
				}

	    //json 오브젝트
	    let data = {
	        "currentPage": currentPage,
	        "scaleSe": scaleSe,
	        "mfrcRealmSe": mfrcRealmSe,
	        "bsnAt": bsnAt,
	        "crmnlHist": crmnlHist ,
	        "taxNpymHist": taxNpymHist,
	        "processSttus": processSttus,
	        "searchList":searchList,
	        "keyword": keyword
	    };
	    console.log(data);
	    
	    $.ajax({
	        url: "/cbs/cstbrkr/customer",
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
	                /* str += "<td>" + (ChargeCustomerVO.bsnAt === 'T' ? '영업중' : (ChargeCustomerVO.bsnAt === 'F' ? '폐업' : '-')) + "</td>";
	                str += "<td>" + (ChargeCustomerVO.crmnlHist === 'T' ? '이력 있음' : (ChargeCustomerVO.crmnlHist === 'F' ? '이력 없음' : '-')) + "</td>";
	                str += "<td>" + (ChargeCustomerVO.taxNpymHist === 'T' ? '이력 있음' : (ChargeCustomerVO.taxNpymHist === 'F' ? '이력 없음' : '-')) + "</td>";
	                str += "<td>" + (ChargeCustomerVO.processSttus === 'CPS1' ? '<span class="badge badge-phoenix badge-phoenix-secondary">신청전</span>' :
	                    (ChargeCustomerVO.processSttus === 'CPS2' ? '<span class="badge badge-phoenix badge-phoenix-primary">처리중</span>' :
	                    (ChargeCustomerVO.processSttus === 'CPS3' ? '<span class="badge badge-phoenix badge-phoenix-success">승인</span>' :
	                    (ChargeCustomerVO.processSttus === 'CPS4' ? '<span class="badge badge-phoenix badge-phoenix-warning">미승인</span>' : '-')))) + "</td>"; */
	                str += "</tr>";
	            });
// 	            console.log("str : " + str);
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
	console.log("select change 실행");
	scaleSe = $("#scaleSe").val();
	mfrcRealmSe = $("#mfrcRealmSe").val();
	bsnAt = $("#bsnAt").val();
	crmnlHist = $("#crmnlHist").val();
	taxNpymHist = $("#taxNpymHist").val();
	processSttus = $("#processSttus").val();
	 
	console.log("scaleSe 선택 값1:", scaleSe);
	console.log("mfrcRealmSe 선택 값:", mfrcRealmSe);
	console.log("bsnAt 선택 값:", bsnAt);
	console.log("crmnlHist 선택 값:", crmnlHist);
	console.log("taxNpymHist 선택 값:", taxNpymHist);
	console.log("processSttus 선택 값:", processSttus);
    /////	검색 리스트 출력	////////	
    let currentPage = "${param.currentPage}";

    if (currentPage == "") {
        currentPage = "1";
    }else{
        currentPage = "1";
    }

    //json 오브젝트
    let data = {
        "currentPage": currentPage,
        "scaleSe": scaleSe,
        "mfrcRealmSe": mfrcRealmSe,
        "bsnAt": bsnAt,
        "crmnlHist": crmnlHist ,
        "taxNpymHist": taxNpymHist,
        "processSttus": processSttus
    };
    console.log(data);

    $.ajax({
        url: "/cbs/cstbrkr/customer",
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
                /* str += "<td>" + (ChargeCustomerVO.bsnAt === 'T' ? '영업중' : (ChargeCustomerVO.bsnAt === 'F' ? '폐업' : '-')) + "</td>";
                str += "<td>" + (ChargeCustomerVO.crmnlHist === 'T' ? '이력 있음' : (ChargeCustomerVO.crmnlHist === 'F' ? '이력 없음' : '-')) + "</td>";
                str += "<td>" + (ChargeCustomerVO.taxNpymHist === 'T' ? '이력 있음' : (ChargeCustomerVO.taxNpymHist === 'F' ? '이력 없음' : '-')) + "</td>";
                str += "<td>" + (ChargeCustomerVO.processSttus === 'CPS1' ? '<span class="badge badge-phoenix badge-phoenix-secondary">신청전</span>' :
                    (ChargeCustomerVO.processSttus === 'CPS2' ? '<span class="badge badge-phoenix badge-phoenix-primary">처리중</span>' :
                    (ChargeCustomerVO.processSttus === 'CPS3' ? '<span class="badge badge-phoenix badge-phoenix-success">승인</span>' :
                    (ChargeCustomerVO.processSttus === 'CPS4' ? '<span class="badge badge-phoenix badge-phoenix-warning">미승인</span>' : '-')))) + "</td>"; */
                str += "</tr>";
            });
//	            console.log("str : " + str);
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
	// 값 확인
	 let currentPage = "${param.currentPage}";
	console.log('currentPage:', currentPage);
	 if(currentPage ==""){
	  	  currentPage = "1";
	    }
	
  //json 오브젝트
  let data = {
		  "currentPage": currentPage
	    };
	    console.log(data);
  
	    $.ajax({
	        url: "/cbs/cstbrkr/customer",
	        contentType: "application/json;charset=utf-8",
	        data: JSON.stringify(data),
	        type: "post",
	        dataType: "json",
	        success: function(result) {
	            console.log("result : ", result);
	            let str = "";
	            $.each(result.content, function(idx, ChargeCustomerVO) {
	                console.log("ChargeCustomerVO 확인!", ChargeCustomerVO);
	                console.log("ChargeCustomerVO 확인!", ChargeCustomerVO);
	                str += "<tr>";
	                str += "<td><a href='#' data-bs-toggle='modal' data-bs-target='#modalDetail' class='open-modal' data-cstmr-cd="+ChargeCustomerVO.cstmrCd+">"+ChargeCustomerVO.cstmrCd+"</a>";
	                str += "<td>" + ChargeCustomerVO.entrprsNm + "</td>";
	                str += "<td>" + ChargeCustomerVO.ectmrk + "</td>";
	                str += "<td>" + ChargeCustomerVO.bizrno + "</td>";
	                str += "<td>" + ChargeCustomerVO.cprNo + "</td>";
	                str += "<td>" + (ChargeCustomerVO.scaleSe === 'SSE1' ? '대기업' : (ChargeCustomerVO.scaleSe === 'SSE2' ? '중소기업' : (ChargeCustomerVO.scaleSe === 'SSE3' ? '소상공인' :(ChargeCustomerVO.scaleSe === 'SSE4' ? '자영업자' :	'-')))) + "</td>";
	                str += "<td>" + (ChargeCustomerVO.mfrcRealmSe === 'CMRS1' ? '수출' : (ChargeCustomerVO.mfrcRealmSe === 'CMRS2' ? '수입' : '-')) + "</td>";
	                /* str += "<td>" + (ChargeCustomerVO.bsnAt === 'T' ? '영업중' : (ChargeCustomerVO.bsnAt === 'F' ? '폐업' : '-')) + "</td>";
	                str += "<td>" + (ChargeCustomerVO.crmnlHist === 'T' ? '이력 있음' : (ChargeCustomerVO.crmnlHist === 'F' ? '이력 없음' : '-')) + "</td>";
	                str += "<td>" + (ChargeCustomerVO.taxNpymHist === 'T' ? '이력 있음' : (ChargeCustomerVO.taxNpymHist === 'F' ? '이력 없음' : '-')) + "</td>";
	                str += "<td>" + (ChargeCustomerVO.processSttus === 'CPS1' ? '<span class="badge badge-phoenix badge-phoenix-secondary">신청전</span>' :
	                    (ChargeCustomerVO.processSttus === 'CPS2' ? '<span class="badge badge-phoenix badge-phoenix-primary">처리중</span>' :
	                    (ChargeCustomerVO.processSttus === 'CPS3' ? '<span class="badge badge-phoenix badge-phoenix-success">승인</span>' :
	                    (ChargeCustomerVO.processSttus === 'CPS4' ? '<span class="badge badge-phoenix badge-phoenix-warning">미승인</span>' : '-')))) + "</td>"; */
	                str += "</tr>";
	            });
// 	           console.log("str : " + str);
	            console.log("검색어 검색 실행");
	            // 기존 리스트 삭제
	            $('#cstlist').empty();
	            // 데이터 추가
	            $('#cstlist').append(str);
	            // 페이징 영역 업데이트
	            $('#divPaging').html(result.pagingArea);
	        }
	        });
};
          // 등록 버튼을 클릭했을 때
          $('#btnInsert').on('click', function() {
              // 등록 모달 열기
              $('#modalInsert').modal('show');

              $(document).ready(function () {
                // 법인 사업자를 클릭할 때
                $('#legaltab').click(function () {
                  // 법인 사업자를 표시
                  $('#tab-legaltab').show();
                  // 개인 사업자를 감춤
                  $('#tab-indivtab').hide();
                });

                // 개인 사업자를 클릭할 때
                $('#indivtab').click(function () {
                  // 개인 사업자를 표시
                  $('#tab-indivtab').show();
                  // 법인 사업자를 감춤
                  $('#tab-legaltab').hide();
                });
              });
          });

          //+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

          // 수정 모달이 열릴 때 이벤트 처리
          $('#modalUpdate').on('show.bs.modal', function () {
              // "cprNo" 필드의 값 가져오기
              var cprNoValue = $('#cprNoUpd').val();

              // "cprNo" 값이 null이 아닌 경우 readonly 해제
              if (cprNoValue !== null && cprNoValue !== "") {   // 법인일때
                $('#cprNoUpd').removeAttr('readonly'); // readonly 속성 제거
              } else { // "cprNo" 값이 null이면 readonly 설정     // 개인일때
                $('#cprNoUpd').attr('readonly', true); // readonly 속성 추가
              }
              console.log("cprNoValue:", cprNoValue); // "cprNo" 필드의 값 콘솔에 출력하여 확인
          });
          

          // 수정 버튼 클릭 시
          $('#btnUpdate').on('click', function() {
            // 선택한 고객 정보 가져오기
            var cstmrCd = $('#cstmrCdDet').val();
            var entrprsNm = $('#entrprsNmDet').val();
            var reprsntAdres = $('#reprsntAdresDet').val();
            var reprsntDetailAdres = $('#reprsntDetailAdresDet').val();
            var reprsntTelno = $('#reprsntTelnoDet').val();
            var reprsntEmail = $('#reprsntEmailDet').val();
            var charger = $('#chargerDet').val();
            var ectmrk = $('#ectmrkDet').val();
            var bizrno = $('#bizrnoDet').val();
            var cprNo = $('#cprNoDet').val();
            var scaleSe = $('#scaleSeDet').val();
            var mfrcRealmSe = $('#mfrcRealmSeDet').val();
            var bsnAt = $('#bsnAtDet').val();
            var crmnlHist = $('#crmnlHistDet').val();
            var taxNpymHist = $('#taxNpymHistDet').val();
            var processSttus = $('#processSttusDet').val();
            console.log("scaleSe:",scaleSe);

            // 수정 모달에 가져온 고객 정보 채우기
            $('#cstmrCdUpd').val(cstmrCd);
            $('#entrprsNmUpd').val(entrprsNm);
            $('#reprsntAdresUpd').val(reprsntAdres);
            $('#reprsntDetailAdresUpd').val(reprsntDetailAdres);
            $('#reprsntTelnoUpd').val(reprsntTelno);
            $('#reprsntEmailUpd').val(reprsntEmail);
            $('#chargerUpd').val(charger);
            $('#ectmrkUpd').val(ectmrk);
            $('#bizrnoUpd').val(bizrno);
            $('#cprNoUpd').val(cprNo);
            $('input[name="inlineRadioOptions1"][value="' + scaleSe + '"]').prop('checked', true);
            $('input[name="inlineRadioOptions2"][value="' + mfrcRealmSe + '"]').prop('checked', true);
            $('#bsnAtUpd').val(bsnAt);
            $('#crmnlHistUpd').val(crmnlHist);
            $('#taxNpymHistUpd').val(taxNpymHist);
            $('#processSttusUpd').val(processSttus);

              // 상세 모달 닫기  
              $('#modalDetail').modal('hide');
              // 수정 모달 열기   
              $('#modalUpdate').modal('show');
              
          });
          
          //+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
          
         // @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@모달 상세@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
          $(document).on("click", ".open-modal", function() {
            console.log("open-modal click");
            var cstmrCd = $(this).data("cstmr-cd");
            console.log("cstmrCd: " + cstmrCd);
            let data = { cstmrCd: cstmrCd };
            $.ajax({
              method: "post",
              url: "/cbs/cstbrkr/chargeCustomerDetail",
              data: JSON.stringify(data),
              contentType: "application/json",
              dataType: "json",
              success: function (result) {
                console.log("result: ", result);
                  $("#cstmrCdDet").val(result.cstmrCd);
                  $("#entrprsNmDet").val(result.entrprsNm);
                  $("#reprsntAdresDet").val(result.reprsntAdres);
                  $("#reprsntDetailAdresDet").val(result.reprsntDetailAdres);
                  $("#reprsntTelnoDet").val(result.reprsntTelno);
                  $("#reprsntEmailDet").val(result.reprsntEmail);
                  $("#chargerDet").val(result.charger);
                  $("#ectmrkDet").val(result.ectmrk);
                  $("#bizrnoDet").val(result.bizrno);
                  $("#cprNoDet").val(result.cprNo);
				/*  
				  var scaleSe = "";
                  if(result.scaleSe == "SSE1") scaleSe = "대기업";
                  if(result.scaleSe == "SSE2") scaleSe = "중소기업";
                  if(result.scaleSe == "SSE3") scaleSe = "소상공인";
                  if(result.scaleSe == "SSE4") scaleSe = "자영업자"; 
				*/
                  $("#scaleSeDet").val(result.scaleSe);			
                  $("#mfrcRealmSeDet").val(result.mfrcRealmSe);	
                  $("#bsnAtDet").val(result.bsnAt);				
                  $("#crmnlHistDet").val(result.crmnlHist);		
                  $("#taxNpymHistDet").val(result.taxNpymHist);	
                  $("#processSttusDet").val(result.processSttus);
                
                  
               // 기업규모 값에 따라 출력되는 값 설정
                  var scaleSeDetText = "";
                  switch (result.scaleSe) {
                      case "SSE1":
                          scaleSeDetText = "대기업";
                          break;
                      case "SSE2":
                          scaleSeDetText = "중소기업";
                          break;
                      case "SSE3":
                          scaleSeDetText = "소상공인";
                          break;
                      case "SSE4":
                          scaleSeDetText = "자영업자";
                          break;
                      default:
                          scaleSeDetText = " - ";
                  }
                  $("#scaleSeDet").val(scaleSeDetText);
                  
               // 주력분야 값에 따라 출력되는 값 설정
                  var mfrcRealmSeDetText = "";
                  switch (result.mfrcRealmSe) {
                      case "CMRS1":
                    	  mfrcRealmSeDetText = "수출";
                          break;
                      case "CMRS2":
                    	  mfrcRealmSeDetText = "수입";
                          break;
                      default:
                    	  mfrcRealmSeDetText = " - ";
                  }
                  $("#mfrcRealmSeDet").val(mfrcRealmSeDetText);
                 
               // 영업여부 값에 따라 출력되는 값 설정
                  let bsnAtDetText = "";
                  switch (result.bsnAt) {
                      case "T":
                    	  bsnAtDetText = "영업중";
                          break;
                      case "F":
                    	  bsnAtDetText = "폐업";
                          break;
                      default:
                    	  bsnAtDetText = " - ";
                  }
                  $("#bsnAtDet").val(bsnAtDetText);
                  
               // 범죄이력 값에 따라 출력되는 값 설정
                  let crmnlHistDetText = "";
                  switch (result.crmnlHist) {
                      case "T":
                    	  crmnlHistDetText = "이력 있음";
                          break;
                      case "F":
                    	  crmnlHistDetText = "이력 없음";
                          break;
                      default:
                    	  crmnlHistDetText = " - ";
                  }
                  $("#crmnlHistDet").val(crmnlHistDetText);
                  
               // 세금체납이력 값에 따라 출력되는 값 설정
                  let taxNpymHistDetText = "";
                  switch (result.taxNpymHist) {
                      case "T":
                    	  taxNpymHistDetText = "이력 있음";
                          break;
                      case "F":
                    	  taxNpymHistDetText = "이력 없음";
                          break;
                      default:
                    	  taxNpymHistDetText = " - ";
                  }
                  $("#taxNpymHistDet").val(taxNpymHistDetText);
                  
               // 고객상태 승인여부 값에 따라 출력되는 값 설정
                  let processSttusDetText = "";
                  switch (result.processSttus) {
                      case "CPS1":
                    	  processSttusDetText = "신청전";
                          break;
                      case "CPS2":
                    	  processSttusDetText = "처리중";
                          break;
                      case "CPS3":
                    	  processSttusDetText = "승인";
                          break;
                      case "CPS4":
                    	  processSttusDetText = "미승인";
                          break;
                      default:
                    	  processSttusDetText = " - ";
                  }
                  $("#processSttusDet").val(processSttusDetText);
              	}
            });
            console.log("cstmrCd끝: " + cstmrCd);
          });
           // @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@  
          
          $(document).ready(function(){
            // 등록 완료 버튼 클릭 시
            $("#cusInsert").click(function(){
            	Swal.fire({
            		title:"등록 하시겠습니까?",
            		showCancelButton: true,
	                confirmButtonText: "등록",
	                cancelButtonText: "취소"		
            	}).then(function(result){
            		if (result.isConfirmed) {
                        // 확인 버튼을 클릭한 경우
                        if ($("#legaltab").hasClass("active")) {
                            // 법인 탭이 활성화된 경우
                        	insertLegalData();
                        } else if ($("#indivtab").hasClass("active")) {
                            // 개인 탭이 활성화된 경우
                        	insertIndivData();
                        }
                    } else if (result.dismiss === Swal.DismissReason.cancel) {
                        // 취소 버튼을 클릭한 경우
                        Swal.fire("취소되었습니다.", "", "error");
                    }
                });
            });
             
			
          // @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@법인 고객 등록@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
			    function insertLegalData() {
			    	
			    	var scaleSe;
			    	if ($("#scaleSeIns1").is(":checked")) {
			    		scaleSe = "SSE1"; // 대기업 선택 시 "SSE1"로 설정
			    	} else if ($("#scaleSeIns2").is(":checked")) {
			    		scaleSe = "SSE2"; // 중소기업 선택 시 "SSE2"로 설정
			    	} else if ($("#scaleSeIns3").is(":checked")) {
		                scaleSe = "SSE3"; // 소상공인 선택 시 "SSE3"로 설정
		            } else if ($("#scaleSeIns4").is(":checked")) {
		                scaleSe = "SSE4"; // 자영업자 선택 시 "SSE4"로 설정
		            }
            
			    	var mfrcRealmSe;
			    	if ($("#mfrcRealmSeIns1").is(":checked")) {
			    	    mfrcRealmSe = "CMRS1"; // 수출 선택 시 "CMRS1"로 설정
			    	} else if ($("#mfrcRealmSeIns2").is(":checked")) {
			    	    mfrcRealmSe = "CMRS2"; // 수입 선택 시 "CMRS2"로 설정
			    	}
        	  
        	  		var legalData = {
		    		    // 폼에 있는 법인 정보 수집
		    		    entrprsNm: $("#entrprsNmIns").val(),
		    		    reprsntAdres: $("#reprsntAdresIns").val(),
		    		    reprsntDetailAdres: $("#reprsntDetailAdresIns").val(),
		    		    reprsntTelno: $("#reprsntTelnoIns").val(),
		    		    reprsntEmail: $("#reprsntEmailIns").val(),
		    		    charger: $("#chargerIns").val(),
		    		    ectmrk: $("#ectmrkIns").val(),
		    		    bizrno: $("#bizrnoIns").val(),
		    		    cprNo: $("#cprNoIns").val(),
		    		    scaleSe: scaleSe,
		    		    mfrcRealmSe: mfrcRealmSe 
		    		};

			
			        // Ajax 요청 보내기
			        $.ajax({
			            type: "POST",
			            url: "/cbs/cstbrkr/legalChargeCustomerInsert", // 법인 정보를 처리하는 백엔드 파일의 경로
			            contentType : "application/json; charset=utf-8",
			            data: JSON.stringify(legalData), // 법인 정보 데이터 보내기
			            success: function(response){
			            	Swal.fire({
                                title: "등록되었습니다",
                                icon: "success",
                                showConfirmButton: true
                            }).then(function(result){
                                if (result.isConfirmed) {
                                    // 확인 버튼을 클릭하면 페이지를 새로고침합니다.
                                    window.location.reload();
                                }
                            });
                        },
                        error: function(xhr, status, error) {
                            Swal.fire({
                                title: "정보 등록에 실패했습니다.",
                                icon: "error",
                                showConfirmButton: true
                            	});
                        	}
                    	});
          			}
          // @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@법인 고객 등록 끝@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@  
			
          // @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@개인 고객 등록@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
			    function insertIndivData() {
			        
			    	var mfrcRealmSe2;
			    	if ($("#mfrcRealmSeIns3").is(":checked")) {
			    	    mfrcRealmSe2 = "CMRS1"; // 수출 선택 시 "CMRS1"로 설정
			    	} else if ($("#mfrcRealmSeIns4").is(":checked")) {
			    	    mfrcRealmSe2 = "CMRS2"; // 수입 선택 시 "CMRS2"로 설정
			    	}
        	  
        	  		var individualData = {
			            // 폼에 있는 개인 정보 수집
			            entrprsNm: $("#entrprsNmIns2").val(),
			            reprsntAdres: $("#reprsntAdresIns2").val(),
			            reprsntDetailAdres: $("#reprsntDetailAdresIns2").val(),
			            reprsntTelno: $("#reprsntTelnoIns2").val(),
			            reprsntEmail: $("#reprsntEmailIns2").val(),
			            charger: $("#chargerIns2").val(),
			            ectmrk: $("#ectmrkIns2").val(),
			            bizrno: $("#bizrnoIns2").val(),
			            mfrcRealmSe: mfrcRealmSe2
			        };
			
			        // Ajax 요청 보내기
			        $.ajax({
			            type: "POST",
			            url: "/cbs/cstbrkr/indivChargeCustomerInsert", // 개인 정보를 처리하는 백엔드 파일의 경로
			            contentType : "application/json; charset=utf-8",
			            data: JSON.stringify(individualData), // 개인 정보 데이터 보내기
			            success: function(response){
			            	Swal.fire({
                                title: "등록되었습니다",
                                icon: "success",
                                showConfirmButton: true
                            }).then(function(result){
                                if (result.isConfirmed) {
                                    // 확인 버튼을 클릭하면 페이지를 새로고침합니다.
                                    window.location.reload();
                                }
                            });
                        },
                        error: function(xhr, status, error) {
                            Swal.fire({
                                title: "정보 등록에 실패했습니다.",
                                icon: "error",
                                showConfirmButton: true
                            	});
                        	}
                    	});
          			}
			
          // @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@개인 고객 등록 끝@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@  


          // @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@고객 삭제@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@  
            $("#btnDelete").on("click", function() {
    var cstmrCd = $("#cstmrCdDet").val();

    Swal.fire({
        title: "삭제하시겠습니까?",
        icon: "question",
        showCancelButton: true,
        confirmButtonText: "삭제",
        cancelButtonText: "취소"
    }).then(function(result) {
        if (result.isConfirmed) {
            $.ajax({
                url: "/cbs/cstbrkr/checkCstmrCd",
                type: "post",
                data: { cstmrCd: cstmrCd },
                dataType: "text",
                success: function(result) {
                    console.log(result);
                    if (result > 0) {
                        Swal.fire({
                            title: "통관목록에 고객코드가 존재합니다.",
                            icon: "warning",
                            confirmButtonText: "확인"
                        });
                    } else {
                        $.ajax({
                            url: "/cbs/cstbrkr/chargeCustomerDelete",
                            contentType: "application/json; charset=utf-8",
                            data: JSON.stringify({ cstmrCd: cstmrCd }),
                            type: "post",
                            dataType: "text",
                            success: function(result) {
                                console.log("result : ", result);
                                if (result == "1") {
                                    console.log("삭제처리하기");
                                    var tdVal;
                                    $("tr").each(function() {
                                        tdVal = $(this).children("td").eq(0).html();
                                        if (cstmrCd == tdVal) {
                                            $(this).remove();
                                        }
                                    });
                                    Swal.fire({
                                        title: "삭제가 완료되었습니다.",
                                        icon: "success",
                                        confirmButtonText: "확인"
                                    }).then(function() {
                                        window.location.reload(); // 삭제 후 새로고침
                                    });
                                }
                                $("#modalDetail").modal("hide");
                            }
                        });
                    }
                }
            });
        }
    });
});

          // @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@고객 삭제 끝@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@  

          // @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@고객 수정@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@  
          
          $("#btnUpdateEnd").on("click", function() {
    Swal.fire({
        title: "수정 하시겠습니까?",
        icon: "question",
        showCancelButton: true,
        confirmButtonText: "확인",
        cancelButtonText: "취소"
    }).then(function(result) {
        if (result.isConfirmed) {
            console.log("수정완료 버튼 눌렀을 때 Btn clickzzzz");
            console.log("btnUpdateEnd : ");
            let cstmrCd = $('#cstmrCdUpd').val();
            let entrprsNm = $('#entrprsNmUpd').val();
            let reprsntAdres = $('#reprsntAdresUpd').val();
            let reprsntDetailAdres = $('#reprsntDetailAdresUpd').val();
            let reprsntTelno = $('#reprsntTelnoUpd').val();
            let reprsntEmail = $('#reprsntEmailUpd').val();
            let charger = $('#chargerUpd').val();
            let ectmrk = $('#ectmrkUpd').val();
            let bizrno = $('#bizrnoUpd').val();
            let cprNo = $('#cprNoUpd').val();
            let scaleSe = $('input[name="inlineRadioOptions1"]:checked').val();
            let mfrcRealmSe = $('input[name="inlineRadioOptions2"]:checked').val();
            let bsnAt = $('#bsnAtUpd').val();
            let crmnlHist = $('#crmnlHistUpd').val();
            let taxNpymHist = $('#taxNpymHistUpd').val();
            let processSttus = $('#processSttusUpd').val();

            if (scaleSe !== null) {
                let updateData = {
                    "cstmrCd": cstmrCd,
                    "entrprsNm": entrprsNm,
                    "reprsntAdres": reprsntAdres,
                    "reprsntDetailAdres": reprsntDetailAdres,
                    "reprsntTelno": reprsntTelno,
                    "reprsntEmail": reprsntEmail,
                    "charger": charger,
                    "ectmrk": ectmrk,
                    "bizrno": bizrno,
                    "cprNo": cprNo,
                    "scaleSe": scaleSe,
                    "mfrcRealmSe": mfrcRealmSe,
                    "bsnAt": bsnAt,
                    "crmnlHist": crmnlHist,
                    "taxNpymHist": taxNpymHist,
                    "processSttus": processSttus
                };
                $.ajax({
                    type: "POST",
                    url: "/cbs/cstbrkr/legalChargeCustomerUpdate",
                    data: JSON.stringify(updateData),
                    contentType: "application/json",
                    dataType: "json",
                    success: function(response) {
                        console.log("업데이트 성공:", response);
                        // 업데이트 완료 후, SweetAlert2로 알림 표시
                        Swal.fire({
                            title: "수정이 완료되었습니다",
                            icon: "success",
                            showConfirmButton: true
                        }).then(function(result) {
                            if (result.isConfirmed) {
                                // 확인 버튼을 클릭하면 페이지를 새로고침합니다.
                                window.location.reload();
                            }
                        });
                    }
                });
            } else {
                let updateData = {
                    "cstmrCd": cstmrCd,
                    "entrprsNm": entrprsNm,
                    "reprsntAdres": reprsntAdres,
                    "reprsntDetailAdres": reprsntDetailAdres,
                    "reprsntTelno": reprsntTelno,
                    "reprsntEmail": reprsntEmail,
                    "charger": charger,
                    "ectmrk": ectmrk,
                    "bizrno": bizrno,
                    "scaleSe": scaleSe,
                    "mfrcRealmSe": mfrcRealmSe,
                    "bsnAt": bsnAt,
                    "crmnlHist": crmnlHist,
                    "taxNpymHist": taxNpymHist,
                    "processSttus": processSttus
                };
                $.ajax({
                    type: "POST",
                    url: "/cbs/cstbrkr/indivChargeCustomerUpdate",
                    data: JSON.stringify(updateData),
                    contentType: "application/json",
                    dataType: "json",
                    success: function(response) {
                        // 성공적으로 업데이트가 이루어졌을 때 실행할 로직
                        console.log("업데이트 성공:", response);
                        // 업데이트 완료 후, SweetAlert2로 알림 표시
                        Swal.fire({
                            title: "수정이 완료되었습니다",
                            icon: "success",
                            showConfirmButton: true
                        }).then(function(result) {
                            if (result.isConfirmed) {
                                // 확인 버튼을 클릭하면 페이지를 새로고침합니다.
                                window.location.reload();
                            }
                        });
                    }
                });
            }
        }
    });
});
});        
          // @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@고객 수정 끝@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@  
});        
        </script>

      <!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@담당 고객목록@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@   -->
      <div class="card h-50">
      <div style="text-align: left; margin=0; max-width: 100%; height: auto;">
	      <img id="ims" src="/resources/img/진행1.png">
	      
	      <div class="box_st5">
          <div class="box_st_ico">
             <div class="my-3"></div>
              <div class="ico_boxImg">
                  <img src="/resources/img/titlelogo.png" style="width:100px;height:100px; float:left; margin-right: 20px;">
              </div>
              <div style="float:left;">
                 <div class="my-3"></div>
                  <h3 class="fs18 pc_black">담당 고객 목록</h3>
                  <p>이 페이지는 <span style="color:#155eb6;"><b>관세사의 담당 고객 관리</b></span>를 하는 페이지입니다.<br>기타 궁금하신 점은 관세청 콜센터 125번으로 문의하시기 바랍니다.</p>
              </div>
              <div style="clear:both;"></div>
          </div>
      </div>
      
	  </div>
        <div class="card-body">
          <div style="display: none;">
            <sec:authorize access="isAuthenticated()">
               <sec:authentication property="principal.userVO" var="user" />
               <input id="userCd" type="text" value="${user.userCd}">
            </sec:authorize>
         </div>
          <div id="tableExample4">
            <div class="input-group mb-3 w-75 ms-auto p-2 bd-highlight" style="padding: 10px;">
    				<select class="form-select select" id="scaleSe">
		            		<option selected value="">기업규모</option>
		            		<option value="SSE1">기업규모 : 대기업</option>
							<option value="SSE2">기업규모 : 중소기업</option>
							<option value="SSE3">기업규모 : 소상공인</option>
							<option value="SSE4">기업규모 : 자영업자</option>
		        	</select>
    				<select class="form-select select" id="mfrcRealmSe">
		            		<option selected value="">주력분야</option>
		            		<option value="CMRS1">주력분야 : 수출</option>
							<option value="CMRS2">주력분야 : 수입</option>
		        	</select>
    				<!-- <select class="form-select select" id="bsnAt">
		            		<option selected value="">영업여부</option>
		            		<option value="T">영업여부 : 영업</option>
							<option value="F">영업여부 : 폐업</option>
		        	</select>
    				<select class="form-select select" id="crmnlHist">
		            		<option value="" selected>범죄이력</option>
							<option value="T">범죄이력 : 있음</option>
							<option value="F">범죄이력 : 없음</option>
		        	</select>
    				<select class="form-select select" id="taxNpymHist">
		            		<option selected value="">세금체납이력</option>
		            		<option value="T">세금체납이력 : 있음</option>
							<option value="F">세금체납이력 : 없음</option>
		        	</select>
					<select class="form-select select" id="processSttus">
	            		<option value="" selected>고객상태 승인여부</option>
	            		<option value="CPS1">고객상태 : 신청전</option>
						<option value="CPS2">고객상태 : 처리중</option>
						<option value="CPS3">고객상태 : 승인</option>
						<option value="CPS4">고객상태 : 미승인</option>
		        	</select> -->
		        	<select class="form-select select" id="searchList">
						<option value="" selected>전체검색</option>
						<option value="A.CSTMR_CD">고객코드</option>
						<option value="B.ENTRPRS_NM">기업명</option>
						<option value="B.ECTMRK">통관고유부호</option>
						<option value="B.BIZRNO">사업자등록번호</option>
						<option value="C.CPR_NO">법인번호</option>
					</select>		
		        	
    				<input type="text" id="keyword" class="form-control" placeholder="검색어를 입력하세요." aria-label="" aria-describedby="button-addon2" style="flex: 1;">
    				<button class="btn btn-primary btn-sm" type="button" id="searchBtn">검색</button>
    				<button class="btn btn-phoenix-primary btn-sm px-3 me-1" type="button" id="resetBtn">초기화</button>
				</div>
            <div class="table-responsive" style="text-align: center;">
              <table class="table table-sm fs-9 mb-0">
                <thead>
                  <tr class="bg-body-highlight">
                    <th>고객코드</th>
                    <th>기업명</th>
                    <th>통관고유부호</th>
                    <th>사업자등록번호</th>
                    <th>법인번호</th>
                    <th>기업규모</th>
                    <th>주력분야</th>
                    <!-- <th>영업여부</th>
                    <th>범죄이력</th>
                    <th>세금체납이력</th>
                    <th>고객상태 승인여부</th> -->
                  </tr>
                </thead>
                <tbody id="cstlist">
<%--                   <c:forEach var="chargeCustomerVO" items="${chargeCustomerList}" varStatus="stat"> --%>
<!--                     <tr> -->
<%--                       <td><a href="#" data-bs-toggle="modal" data-bs-target="#modalDetail" class="open-modal" data-cstmr-cd="${chargeCustomerVO.cstmrCd}">${chargeCustomerVO.cstmrCd}</a> --%>
<!--                       </td> -->
<%--                       <td>${chargeCustomerVO.entrprsNm}</td> --%>
<%--                       <td>${chargeCustomerVO.ectmrk}</td> --%>
<%--                       <td>${chargeCustomerVO.bizrno}</td> --%>
<%--                       <td>${chargeCustomerVO.cprNo}</td> --%>
<!--                       <td> -->
<%--                         <c:choose> --%>
<%--                           <c:when test="${chargeCustomerVO.scaleSe eq 'SSE1'}">대기업</c:when> --%>
<%--                           <c:when test="${chargeCustomerVO.scaleSe eq 'SSE2'}">중소기업</c:when> --%>
<%--                           <c:when test="${chargeCustomerVO.scaleSe eq 'SSE3'}">소상공인</c:when> --%>
<%--                           <c:when test="${chargeCustomerVO.scaleSe eq 'SSE4'}">자영업자</c:when> --%>
<%--                           <c:when test="${chargeCustomerVO.scaleSe eq ''}"></c:when> --%>
<%--                         </c:choose> --%>
<!--                       </td> -->
<!--                       <td> -->
<%--                         <c:choose> --%>
<%--                           <c:when test="${chargeCustomerVO.mfrcRealmSe eq 'CMRS1'}">수출</c:when> --%>
<%--                           <c:when test="${chargeCustomerVO.mfrcRealmSe eq 'CMRS2'}">수입</c:when> --%>
<%--                           <c:when test="${chargeCustomerVO.mfrcRealmSe eq ''}"></c:when> --%>
<%--                         </c:choose> --%>
<!--                       </td> -->
<!--                       <td> -->
<%--                         <c:choose> --%>
<%--                           <c:when test="${chargeCustomerVO.bsnAt eq 'T'}">영업중</c:when> --%>
<%--                           <c:when test="${chargeCustomerVO.bsnAt eq 'F'}">폐업</c:when> --%>
<%--                           <c:when test="${chargeCustomerVO.bsnAt eq ''}">-</c:when> --%>
<%--                         </c:choose> --%>
<!--                       </td> -->
<!--                       <td> -->
<%--                         <c:choose> --%>
<%--                           <c:when test="${chargeCustomerVO.crmnlHist eq 'T'}">이력 있음</c:when> --%>
<%--                           <c:when test="${chargeCustomerVO.crmnlHist eq 'F'}">이력 없음</c:when> --%>
<%--                           <c:when test="${chargeCustomerVO.crmnlHist eq ''}">-</c:when> --%>
<%--                         </c:choose> --%>
<!--                       </td> -->
<!--                       <td> -->
<%--                         <c:choose> --%>
<%--                           <c:when test="${chargeCustomerVO.taxNpymHist eq 'T'}">이력 있음</c:when> --%>
<%--                           <c:when test="${chargeCustomerVO.taxNpymHist eq 'F'}">이력 없음</c:when> --%>
<%--                           <c:when test="${chargeCustomerVO.taxNpymHist eq ''}">-</c:when> --%>
<%--                         </c:choose> --%>
<!--                       </td> -->
<!--                       <td> -->
<%--                         <c:choose> --%>
<%--                           <c:when test="${chargeCustomerVO.processSttus eq 'CPS1'}"> --%>
<!--                             <span class="badge badge-phoenix badge-phoenix-secondary">신청전</span> -->
<%--                           </c:when> --%>
<%--                           <c:when test="${chargeCustomerVO.processSttus eq 'CPS2'}"> --%>
<!--                             <span class="badge badge-phoenix badge-phoenix-primary">처리중</span> -->
<%--                           </c:when> --%>
<%--                           <c:when test="${chargeCustomerVO.processSttus eq 'CPS3'}"> --%>
<!--                             <span class="badge badge-phoenix badge-phoenix-success">승 인</span> -->
<%--                           </c:when> --%>
<%--                           <c:when test="${chargeCustomerVO.processSttus eq 'CPS4'}"> --%>
<!--                             <span class="badge badge-phoenix badge-phoenix-warning">반 려</span> -->
<%--                           </c:when> --%>
<%--                         </c:choose> --%>
<!--                       </td> -->
<!--                     </tr> -->
<%--                   </c:forEach> --%>
                </tbody>
              </table>
            </div>
            <div class="my-6"></div>
            <div id="divPaging"></div>
            <div class="d-flex justify-content-end">
              <button class="btn btn-primary px-5 me-2" type="button" id="btnInsert">등록</button>
            </div>
          </div>
        </div>
      </div>
      <!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@담당 고객목록@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@   -->
 
      <!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@상세 모달@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@   -->
      <div class="modal fade" id="modalDetail" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-xl custom-detail-modal">
          <div class="modal-content">
            <div class="modal-header">
              <h5 class="modal-title" id="modalDetail">담당고객 상세보기</h5><button class="btn p-1" type="button"
                data-bs-dismiss="modal" aria-label="Close"><span class="fas fa-times fs-9"></span></button>
            </div>
           
            <div class="modal-body">
              <div class="row" id="dynamicRows">
                <div class="col-md-6 mb-3 mt-2">
             <div class="input-group">
               <div class="input-group-text" style="width: 130px;">고객코드</div>
              <input class="form-control" id="cstmrCdDet" type="text" readonly>
             </div>
           </div>
           <div class="col-md-6 mb-3 mt-2">
             <div class="input-group">
               <div class="input-group-text" style="width: 130px;">기업명</div>
              <input class="form-control" id="entrprsNmDet" type="text" readonly>
             </div>
           </div>
           </div>
           <div class="row" id="dynamicRows">
            <div class="col-md-6 mb-3 mt-2">
             <div class="input-group">
               <div class="input-group-text" style="width: 130px;">대표주소</div>
              <input class="form-control" id="reprsntAdresDet" type="text" readonly>
             </div>
           </div>
            <div class="col-md-6 mb-3 mt-2">
             <div class="input-group">
               <div class="input-group-text" style="width: 130px;">상세주소</div>
              <input class="form-control" id="reprsntDetailAdresDet" type="text" readonly>
             </div>
           </div>
           </div>
           <div class="row" id="dynamicRows">
           <div class="row" id="fam">
            <div class="col-md-4 mb-3 mt-2">
             <div class="input-group">
               <div class="input-group-text" style="width: 130px;">대표이메일</div>
              <input class="form-control" id="reprsntEmailDet" type="text" readonly>
             </div>
           </div>
           <div class="col-md-4 mb-3 mt-2">
             <div class="input-group">
               <div class="input-group-text" style="width: 130px;">대표전화번호</div>
              <input class="form-control" id="reprsntTelnoDet" type="text" readonly>
             </div>
           </div>
           <div class="col-md-4 mb-3 mt-2">
             <div class="input-group">
               <div class="input-group-text" style="width: 130px;">담당자</div>
              <input class="form-control" id="chargerDet" type="text" readonly>
             </div>
           </div>
           </div>
           </div>
           <div class="row" id="dynamicRows">
            <div class="row" id="fam">
            <div class="col-md-4 mb-3 mt-2">
             <div class="input-group">
               <div class="input-group-text" style="width: 130px;">통관고유부호</div>
              <input class="form-control" id="ectmrkDet" type="text" readonly>
             </div>
           </div>
           <div class="col-md-4 mb-3 mt-2">
             <div class="input-group">
               <div class="input-group-text" style="width: 130px;">사업자등록번호</div>
              <input class="form-control" id="bizrnoDet" type="text" readonly>
             </div>
           </div>
            <div class="col-md-4 mb-3 mt-2">
             <div class="input-group">
               <div class="input-group-text" style="width: 130px;">법인번호</div>
              <input class="form-control" id="cprNoDet" type="text" readonly>
             </div>
            </div>
            </div>
            </div>
            <div class="row" id="dynamicRows">
              <div class="row" id="fam">
              <div class="col-md-4 mb-3 mt-2">
             <div class="input-group">
               <div class="input-group-text" style="width: 130px;">기업규모</div>
              <input class="form-control" id="scaleSeDet" type="text" readonly>
             </div>
           </div>
            <div class="col-md-4 mb-3 mt-2">
             <div class="input-group">
               <div class="input-group-text" style="width: 130px;">주력분야</div>
              <input class="form-control" id="mfrcRealmSeDet" type="text" readonly>
             </div>
           </div>
           <div class="col-md-4 mb-3 mt-2">
             <div class="input-group">
               <div class="input-group-text" style="width: 130px;">영업여부</div>
              <input class="form-control" id="bsnAtDet" type="text" readonly>
             </div>
           </div>
           </div>
           </div>
           <div class="row" id="dynamicRows">
            <div class="row" id="fam">
            <div class="col-md-4 mb-3 mt-2">
              <div class="input-group">
              <div class="input-group-text" style="width: 130px;">범죄이력</div>
              <input class="form-control" id="crmnlHistDet" type="text" readonly>
             </div>
           </div>
           <div class="col-md-4 mb-3 mt-2">
             <div class="input-group">
               <div class="input-group-text" style="width: 130px;">세금체납이력</div>
              <input class="form-control" id="taxNpymHistDet" type="text" readonly>
             </div>
           </div>
           <div class="col-md-4 mb-3 mt-2">
             <div class="input-group">
               <div class="input-group-text" style="width: 130px;">고객상태 승인여부</div>
              <input class="form-control" id="processSttusDet" type="text" readonly>
             </div>
           </div>
          </div>
          </div>
           
     
            <div class="modal-footer">
				<button class="btn btn-outline-danger me-1 mb-1" type="button" id="btnDelete">삭제</button>
	            <button class="btn btn-primary" type="button" id="btnUpdate">수정</button>
	            <button class="btn btn-outline-primary" type="button" data-bs-dismiss="modal">닫기</button>
            </div>
          </div>
        </div>
      </div>
    </div>
      <!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@상세 모달 끝@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@   -->
      
<!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@등록 모달 시작@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@   -->
<div class="modal fade" id="modalInsert" tabindex="-1"
	aria-hidden="true">
	<div
		class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-xl custom-insert-modal">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="staticBackdropLabel">담당고객 등록</h5>
				<button class="btn p-1" type="button" data-bs-dismiss="modal"
					aria-label="Close">
					<span class="fas fa-times fs-9"></span>
				</button>
			</div>
			<div class="modal-body">
				<div class="ml-auto">
					<ul class="nav nav-underline fs-9" id="myTab" role="tablist">
						<li class="nav-item" role="presentation"><a
							class="nav-link active ml-2" id="legaltab" data-bs-toggle="tab"
							href="#tab-legaltab" role="tab" aria-controls="tab-legaltab"
							aria-selected="true">법인고객</a></li>
						<li class="nav-item" role="presentation"><a
							class="nav-link ml-2" id="indivtab" data-bs-toggle="tab"
							href="#tab-indivtab" role="tab" aria-controls="tab-indivtab"
							aria-selected="false" tabindex="-1">개인고객</a></li>
					</ul>
				</div>
<!-- ############################################ 법인등록 모달 시작 ############################################ -->
				<div class="tab-content">
					<div class="tab-pane fade show active" id="tab-legaltab"
						role="tabpanel" aria-labelledby="legaltab">
						<div class="w-100" id="legaltab">

							<div class="row" id="dynamicRows">
								<div class="col-md-6 mb-3 mt-2">
									<div class="input-group">
										<div class="input-group-text" style="width: 120px;">기업명</div>
										<input class="form-control" id="entrprsNmIns" type="text" required>
									</div>
								</div>
								<div class="col-md-6 mb-3 mt-2">
									<div class="input-group">
										<div class="input-group-text" style="width: 120px;">법인번호</div>
										<input class="form-control" id="cprNoIns" type="text" required>
									</div>
								</div>
							</div>
							<div class="row" id="dynamicRows">
								<div class="col-md-6 mb-3 mt-2">
									<div class="input-group">
										<div class="input-group-text" style="width: 120px;">통관고유부호</div>
										<input class="form-control" id="ectmrkIns" type="text" required>
									</div>
								</div>
								<div class="col-md-6 mb-3 mt-2">
									<div class="input-group">
										<div class="input-group-text" style="width: 120px;">사업자등록번호</div>
										<input class="form-control" id="bizrnoIns" type="text" required>
									</div>
								</div>
							</div>
							<div class="row" id="dynamicRows">
								<div class="col-md-4 mb-3 mt-2">
									<div class="input-group">
										<div class="input-group-text" style="width: 120px;">담당자</div>
										<input class="form-control" id="chargerIns" type="text" required>
									</div>
								</div>
								<div class="col-md-4 mb-3 mt-2">
									<div class="input-group">
										<div class="input-group-text" style="width: 120px;">대표전화번호</div>
										<input class="form-control" id="reprsntTelnoIns" type="text" required>
									</div>
								</div>
								<div class="col-md-4 mb-3 mt-2">
									<div class="input-group">
										<div class="input-group-text" style="width: 120px;">대표이메일</div>
										<input class="form-control" id="reprsntEmailIns" type="text" required>
									</div>
								</div>
							</div>
						</div>
						<div class="row" id="dynamicRows">
						    <div class="col-md-6 mb-3 mt-2">
						        <div class="input-group">
						            <div class="input-group-text" style="width: 120px;">대표주소</div>
						            <input class="form-control" id="reprsntAdresIns" type="text" readonly required>
						            <button class="searchAdresBtn"><i data-feather="search"></i></button>
						        </div>
						    </div>
						    <div class="col-md-6 mb-3 mt-2">
						        <div class="input-group">
						            <div class="input-group-text" style="width: 120px;">상세주소</div>
						            <input class="form-control" id="reprsntDetailAdresIns" type="text">
						        </div>
						    </div>
						</div>
						<div class="row" id="dynamicRows">
							<div class="col-md-6 mb-3 mt-2">
								<div class="input-group">
									<div class="input-group-text" style="width: 120px;">기업규모</div>
									<div class="form-check">
										<input class="form-check-input" id="scaleSeIns1"
											name="inlineRadioOptions1" type="radio" value="SSE1">
										<label class="form-check-label" for="">대기업</label>
									</div>
									<div class="form-check">
										<input class="form-check-input" id="scaleSeIns2"
											name="inlineRadioOptions1" type="radio" value="SSE2">
										<label class="form-check-label" for="">중소기업</label>
									</div>
									<div class="form-check">
										<input class="form-check-input" id="scaleSeIns3"
											name="inlineRadioOptions1" type="radio" value="SSE3">
										<label class="form-check-label" for="">소상공인</label>
									</div>
									<div class="form-check">
										<input class="form-check-input" id="scaleSeIns4"
											name="inlineRadioOptions1" type="radio" value="SSE4">
										<label class="form-check-label" for="">자영업자</label>
									</div>
								</div>
							</div>
							<div class="col-md-6 mb-3 mt-2">
								<div class="input-group">
									<div class="input-group-text" style="width: 120px;">주력분야</div>
									<div class="form-check">
										<input class="form-check-input" id="mfrcRealmSeIns1"
											name="inlineRadioOptions2" type="radio" value="CMRS1">
										<label class="form-check-label" for="mfrcRealmSeIns1">수출</label>
									</div>
									<div class="form-check">
										<input class="form-check-input" id="mfrcRealmSeIns2"
											name="inlineRadioOptions2" type="radio" value="CMRS2">
										<label class="form-check-label" for="mfrcRealmSeIns2">수입</label>
									</div>
								</div>
							</div>
						</div>
					</div>
<!-- ############################################ 법인등록 모달 끝 ############################################ -->
<!-- ############################################ 개인등록 모달 시작 ############################################ -->
					<div class="tab-pane fade" id="tab-indivtab" role="tabpanel"
						aria-labelledby="indivtab">
						<div class="w-100" id="indivtab">
							<div class="row" id="dynamicRows">
								<div class="col-md-6 mb-3 mt-2">
									<div class="input-group">
										<div class="input-group-text" style="width: 120px;">사업자명</div>
										<input class="form-control" id="entrprsNmIns2" type="text" required>
									</div>
								</div>
							</div>
							<div class="row" id="dynamicRows">
								<div class="col-md-6 mb-3 mt-2">
									<div class="input-group">
										<div class="input-group-text" style="width: 120px;">통관고유부호</div>
										<input class="form-control" id="ectmrkIns2" type="text" required>
									</div>
								</div>
								<div class="col-md-6 mb-3 mt-2">
									<div class="input-group">
										<div class="input-group-text" style="width: 120px;">사업자등록번호</div>
										<input class="form-control" id="bizrnoIns2" type="text" required>
									</div>
								</div>
							</div>
							<div class="row" id="dynamicRows">
								<div class="col-md-4 mb-3 mt-2">
									<div class="input-group">
										<div class="input-group-text" style="width: 120px;">담당자</div>
										<input class="form-control" id="chargerIns2" type="text" required>
									</div>
								</div>
								<div class="col-md-4 mb-3 mt-2">
									<div class="input-group">
										<div class="input-group-text" style="width: 120px;">대표전화번호</div>
										<input class="form-control" id="reprsntTelnoIns2" type="text" required>
									</div>
								</div>
								<div class="col-md-4 mb-3 mt-2">
									<div class="input-group">
										<div class="input-group-text" style="width: 120px;">대표이메일</div>
										<input class="form-control" id="reprsntEmailIns2" type="text" required>
									</div>
								</div>
							</div>
							<div class="row" id="dynamicRows">
								<div class="col-md-6 mb-3 mt-2">
									<div class="input-group">
										<div class="input-group-text" style="width: 120px;">대표주소</div>
										<input class="form-control" id="reprsntAdresIns2" type="text" readonly required>
										<button class="searchAdresBtn2"><i data-feather="search"></i></button>
									</div>
								</div>
								<div class="col-md-6 mb-3  mt-2">
									<div class="input-group">
										<div class="input-group-text" style="width: 120px;">상세주소</div>
										<input class="form-control" id="reprsntDetailAdresIns2" type="text">
									</div>
								</div>
							</div>
							<div class="row" id="dynamicRows">
								<div class="col-md-6 mb-3 mt-2">
									<div class="input-group">
										<div class="input-group-text" style="width: 120px;">기업규모</div>
										<div class="form-check">
											<input class="form-check-input" id="scaleSeIns1"
												name="inlineRadioOptions1" type="radio" value="SSE1">
											<label class="form-check-label" for="">대기업</label>
										</div>
										<div class="form-check">
											<input class="form-check-input" id="scaleSeIns2"
												name="inlineRadioOptions1" type="radio" value="SSE2">
											<label class="form-check-label" for="">중소기업</label>
										</div>
										<div class="form-check">
											<input class="form-check-input" id="scaleSeIns3"
												name="inlineRadioOptions1" type="radio" value="SSE3">
											<label class="form-check-label" for="">소상공인</label>
										</div>
										<div class="form-check">
											<input class="form-check-input" id="scaleSeIns4"
												name="inlineRadioOptions1" type="radio" value="SSE4">
											<label class="form-check-label" for="">자영업자</label>
										</div>
									</div>
								</div>
								<div class="col-md-6 mb-3 mt-2">
									<div class="input-group">
										<div class="input-group-text" style="width: 120px;">주력분야</div>
										<div class="form-check">
											<input class="form-check-input" id="mfrcRealmSeIns3"
												name="inlineRadioOptions3" type="radio" value="CMRS1">
											<label class="form-check-label" for="">수출</label>
										</div>
										<div class="form-check">
											<input class="form-check-input" id="mfrcRealmSeIns4"
												name="inlineRadioOptions3" type="radio" value="CMRS2">
											<label class="form-check-label" for="">수입</label>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
<!-- ############################################ 개인등록 모달 끝 ############################################ -->
				</div>
			</div>
			<div class="modal-footer">
				<button class="btn btn-primary" type="button"
					data-bs-dismiss="modal" id="cusInsert">등록</button>
				<button class="btn btn-outline-primary" type="button"
					data-bs-dismiss="modal">닫기</button>
			</div>
		</div>
	</div>
</div>
<!-- ############################################등록 모달 끝 ############################################ -->

<!-- ############################################ 고객 수정 모달 시작 ############################################ -->
<div class="modal fade" id="modalUpdate" tabindex="-1" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-xl custom-update-modal">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="modalUpdate">담당고객 수정</h5><button class="btn p-1" type="button"
          data-bs-dismiss="modal" aria-label="Close"><span class="fas fa-times fs-9"></span></button>
      </div>
     
      <div class="modal-body">
        <div class="row" id="dynamicRows">
          <div class="col-md-6 mb-3 mt-2">
       <div class="input-group">
         <div class="input-group-text" style="width: 130px;">고객코드</div>
        <input class="form-control" id="cstmrCdUpd" type="text" readonly>
       </div>
     </div>
     <div class="col-md-6 mb-3 mt-2">
       <div class="input-group">
         <div class="input-group-text" style="width: 130px;">기업명</div>
        <input class="form-control" id="entrprsNmUpd" type="text" >
       </div>
     </div>
     </div>
     <div class="row" id="dynamicRows">
      <div class="col-md-6 mb-3 mt-2">
       <div class="input-group">
         <div class="input-group-text" style="width: 130px;">대표주소</div>
        <input class="form-control" id="reprsntAdresUpd" type="text" readonly>
        <button class="updateAdresBtn"><i data-feather="search"></i></button>
       </div>
     </div>
      <div class="col-md-6 mb-3 mt-2">
       <div class="input-group">
         <div class="input-group-text" style="width: 130px;">상세주소</div>
        <input class="form-control" id="reprsntDetailAdresUpd" type="text" >
       </div>
     </div>
     </div>
     <div class="row" id="dynamicRows">
      <div class="col-md-4 mb-3 mt-2">
       <div class="input-group">
         <div class="input-group-text" style="width: 130px;">대표이메일</div>
        <input class="form-control" id="reprsntEmailUpd" type="text" >
       </div>
     </div>
     <div class="col-md-4 mb-3 mt-2">
       <div class="input-group">
         <div class="input-group-text" style="width: 130px;">대표전화번호</div>
        <input class="form-control" id="reprsntTelnoUpd" type="text" >
       </div>
     </div>
     <div class="col-md-4 mb-3 mt-2">
       <div class="input-group">
         <div class="input-group-text" style="width: 130px;">담당자</div>
        <input class="form-control" id="chargerUpd" type="text" >
       </div>
     </div>
     </div>
     <div class="row" id="dynamicRows">
      <div class="col-md-4 mb-3 mt-2">
       <div class="input-group">
         <div class="input-group-text" style="width: 130px;">통관고유부호</div>
        <input class="form-control" id="ectmrkUpd" type="text" >
       </div>
     </div>
     <div class="col-md-4 mb-3 mt-2">
       <div class="input-group">
         <div class="input-group-text" style="width: 130px;">사업자등록번호</div>
        <input class="form-control" id="bizrnoUpd" type="text" >
       </div>
     </div>
      <div class="col-md-4 mb-3 mt-2">
       <div class="input-group">
         <div class="input-group-text" style="width: 130px;">법인번호</div>
        <input class="form-control" id="cprNoUpd" type="text" >
       </div>
      </div>
      </div>
      <div class="row" id="dynamicRows">    
          <div class="col-md-6 mb-3 mt-2">
            <div class="input-group">
              <div class="input-group-text" style="width: 130px;">기업규모</div>
              <div class="form-check">
                <input class="form-check-input" id="scaleSeUpd1" name="inlineRadioOptions1" type="radio" value="SSE1">
                <label class="form-check-label" for="">대기업</label>
              </div>
              <div class="form-check">
                <input class="form-check-input" id="scaleSeUpd2" name="inlineRadioOptions1" type="radio" value="SSE2">
                <label class="form-check-label" for="">중소기업</label>
              </div>
              <div class="form-check">
                <input class="form-check-input" id="scaleSeUpd3" name="inlineRadioOptions1" type="radio" value="SSE3">
                <label class="form-check-label" for="">소상공인</label>
              </div>
              <div class="form-check">
                <input class="form-check-input" id="scaleSeUpd4" name="inlineRadioOptions1" type="radio" value="SSE4">
                <label class="form-check-label" for="">자영업자</label>
              </div>
            </div>
          </div>
          <div class="col-md-6 mb-3 mt-2">
            <div class="input-group">
              <div class="input-group-text" style="width: 130px;">주력분야</div>
                <div class="form-check">
                  <input class="form-check-input" id="mfrcRealmSeUpd1" name="inlineRadioOptions2" type="radio" value="CMRS1">
                  <label class="form-check-label" for="mfrcRealmSeUpd1">수출</label>
                </div>
                <div class="form-check">
                  <input class="form-check-input" id="mfrcRealmSeUpd2" name="inlineRadioOptions2" type="radio" value="CMRS2">
                  <label class="form-check-label" for="mfrcRealmSeUpd2">수입</label>
                </div>
              </div>
            </div>
     </div>
     <div class="row" id="dynamicRows">
        <div class="col-md-3 mb-3 mt-2">
          <div class="input-group">
            <div class="input-group-text" style="width: 130px;">영업여부</div>
            <input class="form-control" id="bsnAtUpd" type="text" readonly>
          </div>
        </div>
      <div class="col-md-3 mb-3 mt-2">
        <div class="input-group">
        <div class="input-group-text" style="width: 130px;">범죄이력</div>
        <input class="form-control" id="crmnlHistUpd" type="text" readonly>
       </div>
     </div>
     <div class="col-md-3 mb-3 mt-2">
       <div class="input-group">
         <div class="input-group-text" style="width: 130px;">세금체납이력</div>
        <input class="form-control" id="taxNpymHistUpd" type="text" readonly>
       </div>
     </div>
     <div class="col-md-3 mb-3 mt-2">
       <div class="input-group">
         <div class="input-group-text" style="width: 130px;">고객상태 승인여부</div>
        <input class="form-control" id="processSttusUpd" type="text" readonly>
       </div>
     </div>
    </div>
     

      <div class="modal-footer">
        <button class="btn btn-primary" type="button" id="btnUpdateEnd">수정완료</button>
        <button class="btn btn-outline-primary" type="button" data-bs-dismiss="modal">닫기</button>
      </div>
    </div>
  </div>
</div>
</div>
<!-- ############################################ 고객 수정 모달 끝 ############################################ -->


