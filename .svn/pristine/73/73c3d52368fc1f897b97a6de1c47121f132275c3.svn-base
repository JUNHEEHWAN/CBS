





<!-- paperJudge -> getEntry, entryJudge로 변경 -->




<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<head>
<meta charset="UTF-8">
<title>서류 심사</title>
<script src="/resources/js/sweetalert2.min.js"></script>
<link rel="stylesheet" href="/resources/css/sweetalert2.min.css">
<style type="text/css">
th, td { text-align: center !important; }
.modal-content { width: 1350px; height:770px; !important; left: -300px; }
</style>
<script type="text/javascript" src="/resources/js/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
  //############################# 접수 대기 목록 옵션 클릭시 테이블 불러오기 ###########################
  $("select[id=opt]").change(function(){
    var optVal = $("#opt option:selected").val();
    // console.log("optVal: " + optVal);
    
    if(optVal === "mine") location.href = "/cbs/svntAdmin/paperJudge";
    
    if(optVal === "all") {
    	$.ajax ({
    	  method: "post",
      	  url: "/cbs/svntAdmin/allList",
      	  success: function(result) {
      		  var str = "";
      		  $("#myList").html("");
      		  str += `
      			  <div class='table-responsive' id='allList'>
				  <table class='table table-hover'>
				  <thead>
				  <tr class='bg-body-highlight'>
				  <th><input class='form-check-input' name='checkbox1' type='checkbox' onclick='selectAll(this)'/></th>
				  <th>통관관리번호</th>
				  <th>의뢰자</th>
				  <th>통지처정보</th>
				  <th>통관구분</th>
				  <th>관할세관과</th>
				  <th>세관담당자</th>
				  <th>운송형태</th>
				  <th>목적국</th>
				  <th>신고일자</th>
				  </tr>
				  </thead>
				  <tbody class='list'>
      		  `;
      		  $.each(result, function(i) {
      			  // console.log("result[i].sttemntDe: " + result[i].sttemntDe);
				  str += `
					  <tr>
					  <td><input class='form-check-input' name='chkBox' id='chkBox' type='checkbox' value='hi'/></td>
					  <td><a href='#detailModal' data-bs-toggle='modal' data-bs-target='#detailModal' data-entr-manage-no='\${result[i].entrManageNo}' class='open-modal'>\${result[i].entrManageNo}</a></td>
					  <td>\${result[i].client}</td>
					  <td>\${result[i].notifyInfo}</td>
					  <td>\${result[i].entrSe}</td>
					  <td>\${result[i].manctmKwa}</td>
					  <td>\${result[i].manctmKwaCharger}</td>
					  <td>\${result[i].trnsprtStle}</td>
					  <td>\${result[i].coudes}</td>
					  <td>\${result[i].sttemntDe}</td>
					  </tr>
				  `;
			  });
      		  str += `
      			  </tbody>
				  </table>
				  </div>
				  <div class="d-flex justify-content-end">
				  <button class="btn btn-primary px-5 me-2" type="button" id="pick">배정</button>
				  </div>
      		  `;
      		  $("#myList").html(str);
      	  }
    	});
    }
  });
  // #############################################################################################
  
   // ############################## 체크박스 클릭시 통관 관리 번호 배열로 ##############################
  var entrNoArr = [];
  $(document).on("click", ".form-check-input[name='chkBox']", function() {
	  var entrManageNo = $(this).closest("tr").find("a.open-modal").data("entr-manage-no");
      //console.log("entrManageNo: " + entrManageNo);
      entrNoArr.push(entrManageNo);
      //console.log("entrNoArr[0]: " + entrNoArr[0]);
      //console.log("entrNoArr[1]: " + entrNoArr[1]);
  });
  // #############################################################################################
  
  // ########################## 배정 버튼 클릭시 통관 번호 담당 공무원 업데이트 ##########################
	$(document).on("click", "#pick", function() {
		var count = entrNoArr.length;
		//console.log("entrNoArr[0]: " + entrNoArr[0]);
	    //console.log("count: " + count);
		Swal.fire({
			title: "선택한 총 " + count + "건의 통관을 배정하시겠습니까?",
			showCancelButton: true,
			confirmButtonText: "예",
			cancelButtonText: "닫기"
		}).then((result) => {
			$.ajax ({
				method: "post",
				url: "/cbs/svntAdmin/updPbsvntCd",
				data: { entrNoArr : entrNoArr.join(",") },
				success: function(result) {
					console.log("upd result: " + result);
				}
			});
			if (result.isConfirmed) {
				Swal.fire({
				    title: "배정되었습니다. 담당 목록으로 이동합니다.",
				    icon: "success",
				    showConfirmButton: true
				}).then(function(result) {
				    if (result.isConfirmed) {
				        location.href = "/cbs/svntAdmin/paperJudge";
				    }
				});
			} else if (result.isDenied) {
				Swal.fire("처리 도중 오류가 발생했습니다.", "", "info");
			}
		});
	});
	// #############################################################################################
  
  // ############################### 고객 코드 클릭시 통관 진행 현황 모달 ##############################
    $(document).on("click", ".open-modal", function() {
    // console.log("open-modal click");
    var entrManageNo = $(this).data("entr-manage-no");
    // console.log("entrManageNo: " + entrManageNo);
    $(".showEntrNo").html('<h4>통관 관리 번호 <a class="fw-bold" style="color: #3874FF;">#' + entrManageNo + '</a> 진행 현황</h4>');
    
    let data = {entrManageNo: entrManageNo};
    
    $.ajax ({
      method: "post",
  	  url: "/cbs/svntAdmin/oneEntrDet",
  	  data: JSON.stringify(data),
  	  contentType: "application/json",
  	  dataType: "json",
  	  success: function(result) {
  	    console.log("result: " + result);
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
	<div class="card h-50">
		<div class="card-body">
		<h3>서류 심사</h3>
			<div id="tableExample4">
	  			<div class="row justify-content-end g-0">
	    			<div class="col-auto px-3">
	    				<select class="form-select form-select-sm mb-3" id="opt">
	        				<option selected value="mine">내 담당 목록</option>
	        				<option value="all">접수 대기 목록</option>
	      				</select>
	      			</div>	
				</div>
				<div class="table-responsive" id="myList">
					<table class="table table-hover">
						<thead>
							<tr class="bg-body-highlight">
								<th>통관관리번호</th>
								<th>의뢰자</th>
								<th>통지처정보</th>
								<th>통관구분</th>
								<th>관할세관과</th>
								<th>세관담당자</th>
								<th>운송형태</th>
								<th>목적국</th>
								<th>신고일자</th>
								<th></th>
							</tr>
		      			</thead>
		      			<tbody class="list">
		      				<c:forEach var="paperJudgeList" items="${paperJudgeList}">
		      				<tr>
		          				<td><a href="#detailModal" data-bs-toggle="modal" data-bs-target="#detailModal" data-entr-manage-no="${paperJudgeList.entrManageNo}" class="open-modal">${paperJudgeList.entrManageNo}</a></td>
		          				<td>${paperJudgeList.client}</td>
		          				<td>${paperJudgeList.notifyInfo}</td>
		          				<td>${paperJudgeList.entrSe}</td>
		          				<td>${paperJudgeList.manctmKwa}</td>
		          				<td>${paperJudgeList.manctmKwaCharger}</td>
		          				<td>${paperJudgeList.trnsprtStle}</td>
		          				<td>${paperJudgeList.coudes}</td>
		          				<td><fmt:formatDate value="${paperJudgeList.sttemntDe}" pattern="yyyy-MM-dd"/></td>
		          				<td><button class="btn btn-phoenix-primary px-5 me-2">검역신청</button></td>
		        			</tr>
		        			</c:forEach>
		        		</tbody>
					</table>
	  			</div>
	  			<div class="my-6"></div>
	  			<nav aria-label="Page navigation example">
					<ul class="pagination justify-content-center">
						<li class="page-item"><a class="page-link" href="#" tabindex="-1" aria-disabled="true">이전</a></li>
						<li class="page-item active"><a class="page-link" href="#">1</a></li>
						<li class="page-item"><a class="page-link" href="#">2</a></li>
						<li class="page-item"><a class="page-link" href="#">3</a></li>
						<li class="page-item"><a class="page-link" href="#">4</a></li>
						<li class="page-item"><a class="page-link" href="#">5</a></li>
						<li class="page-item"><a class="page-link" href="#">다음</a></li>
					</ul>
				</nav>
			</div>
		</div>
	</div>
</body>

<!-- ############################################ 모달 ############################################ -->
<div class="modal fade" id="detailModal" tabindex="-1" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="detailModal">통관 상세</h5><button class="btn p-1" type="button" data-bs-dismiss="modal" aria-label="Close"><span class="fas fa-times fs-9"></span></button>
      </div>
      <div class="modal-body">
          <section class="pt-5 pb-9">
        <div class="container-small cart">
          <div class="d-flex flex-wrap justify-content-between align-items-end mb-5">
            <div class="showEntrNo"> js에서 처리 </div>
          </div>
          <div class="row gy-9 gx-5">
            <div class="col-12 col-lg-8">
              <div class="border rounded-3 overflow-hidden h-100">
                <div class="container-fluid">
                  <div class="row">
                    <div class="col-md-6 mb-3 mt-2">
                      <div class="input-group">
                        <div class="input-group-text">담당 관세사명</div>
						<input class="form-control" id="" type="text" value="" readonly>
					  </div>
					</div>
                    <div class="col-md-6 mb-3 mt-2">
                      <div class="input-group">
                        <div class="input-group-text">자격 번호</div>
						<input class="form-control" id="" type="text" value="" readonly>
					  </div>
					</div>
				  </div>
                  <div class="row">
                    <div class="col-md-6 mb-3 mt-2">
                      <div class="input-group">
                        <div class="input-group-text">고객명</div>
						<input class="form-control" id="" type="text" value="" readonly>
					  </div>
					</div>
					<div class="col-md-6 mb-3 mt-2">
					  <div class="input-group">
					    <div class="input-group-text">사업자등록번호</div>
						<input class="form-control" id="" type="text" value="" readonly>
					  </div>
					</div>
				  </div>
                  <div class="row">
                    <div class="col-md-4 mb-3 mt-2">
                      <div class="input-group">
                        <div class="input-group-text">담당자 이름</div>
						<input class="form-control" id="" type="text" value="" readonly>
					  </div>
					</div>
					<div class="col-md-4 mb-3 mt-2">
					  <div class="input-group">
					    <div class="input-group-text">담당자 번호</div>
						<input class="form-control" id="" type="text" value="" readonly>
					  </div>
					</div>
					<div class="col-md-4 mb-3 mt-2">
					  <div class="input-group">
					    <div class="input-group-text">담당자 메일</div>
						<input class="form-control" id="" type="text" value="" readonly>
					  </div>
					</div>
				  </div>
                  <div class="row">
                    <div class="col-md-4 mb-3 mt-2">
                      <div class="input-group">
                        <div class="input-group-text">통지처 정보</div>
						<input class="form-control" id="" type="text" value="" readonly>
					  </div>
					</div>
					<div class="col-md-4 mb-3 mt-2">
					  <div class="input-group">
					    <div class="input-group-text">통관 구분</div>
						<input class="form-control" id="" type="text" value="" readonly>
					  </div>
					</div>
					<div class="col-md-4 mb-3 mt-2">
					  <div class="input-group">
					    <div class="input-group-text">관할 세관</div>
						<input class="form-control" id="" type="text" value="" readonly>
					  </div>
					</div>
				  </div>
                  <div class="row">
                    <div class="col-md-6 mb-3 mt-2">
                      <div class="input-group">
                        <div class="input-group-text">HS 코드</div>
						<input class="form-control" id="" type="text" value="" readonly>
					  </div>
					</div>
					<div class="col-md-2 mb-3 mt-2">
					  <div class="input-group">
					    <div class="input-group-text">수량</div>
						<input class="form-control" id="" type="text" value="" readonly>
					  </div>
					</div>
					<div class="col-md-2 mb-3 mt-2">
					  <div class="input-group">
					    <div class="input-group-text">단가</div>
						<input class="form-control" id="" type="text" value="" readonly>
					  </div>
					</div>
					<div class="col-md-2 mb-3 mt-2">
					  <div class="input-group">
					    <div class="input-group-text">중량</div>
						<input class="form-control" id="" type="text" value="" readonly>
					  </div>
					</div>
				  </div>
                  <div class="row">
                    <div class="col-md-6 mb-3 mt-2">
                      <div class="input-group">
                        <div class="input-group-text">물품명</div>
						<input class="form-control" id="" type="text" value="" readonly>
					  </div>
					</div>
					<div class="col-md-6 mb-3 mt-2">
					  <div class="input-group">
					    <div class="input-group-text">거래품명</div>
						<input class="form-control" id="" type="text" value="" readonly>
					  </div>
					</div>
				  </div>
				  <div class="row">
                    <div class="col-md-4 mb-3 mt-2">
                      <div class="input-group">
                        <div class="input-group-text">B/L No.</div>
						<input class="form-control" id="" type="text" value="" readonly>
					  </div>
					</div>
					<div class="col-md-4 mb-3 mt-2">
					  <div class="input-group">
					    <div class="input-group-text">운송 형태</div>
						<input class="form-control" id="" type="text" value="" readonly>
					  </div>
					</div>
					<div class="col-md-4 mb-3 mt-2">
					  <div class="input-group">
					    <div class="input-group-text">선박 출발일</div>
						<input class="form-control" id="" type="text" value="" readonly>
					  </div>
					</div>
				  </div>
				</div>
			  </div>
            </div>
            <div class="col-12 col-lg-4">
              <div class="timeline-vertical">
                <div class="timeline-item">
                  <div class="row g-md-3 align-items-center mb-8 mb-lg-10">
                    <div class="col-12 col-md-auto d-flex">
                      <div class="timeline-item-date text-end order-1 order-md-0 me-md-4">
                        <p class="fs-10 fw-semibold text-body-tertiary mb-0"><br class="d-none d-md-block">2024-03-01</p>
                      </div>
                      <div class="timeline-item-bar position-relative me-3 me-md-0">
                        <div class="icon-item icon-item-sm bg-success" data-bs-theme="light"><svg class="svg-inline--fa fa-check text-white fs-10" aria-hidden="true" focusable="false" data-prefix="fas" data-icon="check" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512" data-fa-i2svg=""><path fill="currentColor" d="M438.6 105.4C451.1 117.9 451.1 138.1 438.6 150.6L182.6 406.6C170.1 419.1 149.9 419.1 137.4 406.6L9.372 278.6C-3.124 266.1-3.124 245.9 9.372 233.4C21.87 220.9 42.13 220.9 54.63 233.4L159.1 338.7L393.4 105.4C405.9 92.88 426.1 92.88 438.6 105.4H438.6z"></path></svg><span class="fa-solid fa-check text-white fs-10"></span> Font Awesome fontawesome.com</div><span class="timeline-bar border-end border-success"></span>
                      </div>
                    </div>
                    <div class="col">
                      <div class="timeline-item-content ps-6 ps-md-3">
                        <h4>통관 접수</h4>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="timeline-item">
                  <div class="row g-md-3 align-items-center mb-8 mb-lg-10">
                    <div class="col-12 col-md-auto d-flex">
                      <div class="timeline-item-date text-end order-1 order-md-0 me-md-4">
                        <p class="fs-10 fw-semibold text-body-tertiary mb-0"><br class="d-none d-md-block">2024-03-02</p>
                      </div>
                      <div class="timeline-item-bar position-relative me-3 me-md-0">
                        <div class="icon-item icon-item-sm bg-body-quaternary" data-bs-theme="light"><svg class="svg-inline--fa fa-check text-white fs-10" aria-hidden="true" focusable="false" data-prefix="fas" data-icon="check" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512" data-fa-i2svg=""></svg><span class="fa-solid fa-check text-white fs-10"></span> Font Awesome fontawesome.com</div><span class="timeline-bar border-end border-dashed"></span>
                      </div>
                    </div>
                    <div class="col">
                      <div class="timeline-item-content ps-6 ps-md-3">
                        <h4>서류 심사</h4>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="timeline-item">
                  <div class="row g-md-3 align-items-center mb-8 mb-lg-10">
                    <div class="col-12 col-md-auto d-flex">
                      <div class="timeline-item-date text-end order-1 order-md-0 me-md-4">
                        <p class="fs-10 fw-semibold text-body-tertiary mb-0"><br class="d-none d-md-block">2024-03-03</p>
                      </div>
                      <div class="timeline-item-bar position-relative me-3 me-md-0">
                        <div class="icon-item icon-item-sm bg-body-quaternary" data-bs-theme="light"><svg class="svg-inline--fa fa-truck-ramp-box text-white fs-10" aria-hidden="true" focusable="false" data-prefix="fas" data-icon="truck-ramp-box" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 640 512" data-fa-i2svg=""></svg><span class="fa-solid fa-truck-ramp-box text-white fs-10"></span> Font Awesome fontawesome.com</div><span class="timeline-bar border-end border-dashed"></span>
                      </div>
                    </div>
                    <div class="col">
                      <div class="timeline-item-content ps-6 ps-md-3">
                        <h4>검사 검역</h4>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="timeline-item">
                  <div class="row g-md-3 align-items-center mb-8 mb-lg-10">
                    <div class="col-12 col-md-auto d-flex">
                      <div class="timeline-item-date text-end order-1 order-md-0 me-md-4">
                        <p class="fs-10 fw-semibold text-body-tertiary mb-0"><br class="d-none d-md-block">2024-03-04</p>
                      </div>
                      <div class="timeline-item-bar position-relative me-3 me-md-0">
                        <div class="icon-item icon-item-sm bg-body-quaternary" data-bs-theme="light"><svg class="svg-inline--fa fa-truck text-white fs-10" aria-hidden="true" focusable="false" data-prefix="fas" data-icon="truck" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 640 512" data-fa-i2svg=""></svg><span class="fa-solid fa-truck text-white fs-10"></span> Font Awesome fontawesome.com</div><span class="timeline-bar border-end border-dashed"></span>
                      </div>
                    </div>
                    <div class="col">
                      <div class="timeline-item-content ps-6 ps-md-3">
                        <h4>창고 입고</h4>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="timeline-item">
                  <div class="row g-md-3 align-items-center">
                    <div class="col-12 col-md-auto d-flex">
                      <div class="timeline-item-date text-end order-1 order-md-0 me-md-4">
                        <p class="fs-10 fw-semibold text-body-tertiary mb-0"><br class="d-none d-md-block">2024-03-05</p>
                      </div>
                      <div class="timeline-item-bar position-relative me-3 me-md-0">
                        <div class="icon-item icon-item-sm bg-body-quaternary" data-bs-theme="light"><svg class="svg-inline--fa fa-truck-fast text-white fs-10" aria-hidden="true" focusable="false" data-prefix="fas" data-icon="truck-fast" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 640 512" data-fa-i2svg=""></svg><span class="fa-solid fa-truck-fast text-white fs-10"></span> Font Awesome fontawesome.com</div>
                      </div>
                    </div>
                    <div class="col">
                      <div class="timeline-item-content ps-6 ps-md-3">
                        <h4>출고 및 통관 완료</h4>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>end of .container
      </section>
      </div>
      <div class="modal-footer"><button class="btn btn-outline-primary" type="button" data-bs-dismiss="modal">닫기</button></div>
    </div>
  </div>
</div>
<!-- ############################################################################################# -->