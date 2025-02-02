<!-- table https://prium.github.io/phoenix/v1.14.0/modules/tables/bulk-select.html -->
<!-- 상태버튼 https://prium.github.io/phoenix/v1.14.0/modules/tables/advance-tables.html -->
<!-- modal https://prium.github.io/phoenix/v1.14.0/modules/components/modal.html -->
<!-- option https://prium.github.io/phoenix/v1.14.0/modules/components/dropdown.html# -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<style>
th, td { text-align: center !important; }
</style>
<script type="text/javascript" src="/resources/js/jquery.min.js"></script>
<!-- <script src="/resources/js/sweetalert2.min.js"></script> -->
<!-- <link rel="stylesheet" href="/resources/css/sweetalert2.min.css"> -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script type="text/javascript">
var entrManageNo = "";
$(document).ready(function() {
  // ###################### 체크박스 클릭 ######################
  $("#warehousingBtn").on("click", function() {
  	  // console.log("test");
  	  var checkbox = $("input[name=checkbox2]:checked");
  	  
  	  checkbox.each(function(i) {
  	    var tr = checkbox.parent().parent().parent().eq(i);
  	    var td = tr.children();
  	    // console.log("td: " + td.eq(5).text()); -> 입고 요청일
  	    entrManageNo = td.eq(2).text(); // 통관 관리 번호
  	    // console.log("통관 관리 번호: " + entrManageNo);
  	  
  	    $("#insUseBounded .modal-body h5").text("통관 관리 번호 " + entrManageNo);
  	  });
  });
  //#########################################################
  // ###################### 입고 등록 모달 ######################
  var zone = "";
  var no = "";
  $("select[name=zone], select[name=no]").change(function(){
    zone = $("select[name=zone]").val();
    no = $("select[name=no]").val();
    console.log("zone:",zone+"no:",no);
  });
  //###########################################################
  // ###################### 입고 등록 버튼 ######################
  $("#insBtn").on("click", function() {
	if(zone == "" && no == "") {
		zone = "A";
		no = "1";
	}
    swal({
      title: zone+ "구역 " + no + "번에 입고하시겠습니까?",
      icon: "warning",
      buttons: true,
      dangerMode: true
    }).then((willInsert) => {
      if(willInsert) {
    	var bndwasCd = zone + "" + no;
    	//console.log("bndwasCd:",bndwasCd,"entrManageNo",entrManageNo);
    	let data = {bndwasCd: bndwasCd, entrManageNo: entrManageNo};
    	//console.log("data체크:",data);
    	$.ajax({
    	  method: "post",
    	  url: "/cbs/bounded/insUseBounded",
    	  data: JSON.stringify(data),
    	  contentType: "application/json",
    	  dataType: "json",
    	  success: function(result) {
    		swal({
    		  title: "입고 등록이 완료되었습니다.",
    		  icon: "success"
    		}).then(function() {
    		  location.href = "/cbs/bounded/warehousing";
    		});
    	  },
    	  error: function(e) {
    		swal("실패", "작업이 정상적으로 처리되지 않았습니다.", "error");
    	  }, timeout: 100000
    	});
      }	
    });
  });
  //###########################################################
});
//################### 체크박스 전체 선택 ####################
function selectAll(selectAll) {
  //console.log("나 눌렀엉?");
  const checkboxes = document.getElementsByName("checkbox2");
  checkboxes.forEach((checkbox) => {
	if(checkbox.disabled) return;
    checkbox.checked = selectAll.checked; 
  });
}
//#########################################################
</script>
<div class="card h-50">
  <div class="card-body">
    <h3>입고 요청 목록</h3>
      <div class="row justify-content-end g-0">
        <div class="p-4 code-to-copy">
          <div id="table">
            <div class="table-responsive">
              <table class="table table-hover">
                <thead>
                  <tr class="bg-body-highlight">
                    <th class="white-space-nowrap fs-9 align-middle ps-0" style="max-width:20px; width:18px;">
                      <div class="form-check mb-0 fs-8">
                        <input class="form-check-input" name="checkbox1" type="checkbox" onclick="selectAll(this)"/>
                      </div>
                    </th>
                    <th scope="col">No.</th>
                    <th scope="col">통관 관리 번호</th>
                    <th scope="col">물품 번호</th>
                    <th scope="col">기업명</th>
                    <th scope="col">입고 요청일</th>
                    <th scope="col">상태</th>
                  </tr>
                </thead>
                <tbody class="list" id="bulk-select-body">
                  <c:forEach var="boundedReqVO" items="${boundedReqList}" varStatus="stat">
                  <tr>
                      <td class="fs-9 align-middle">
                          <div class="form-check mb-0 fs-8"><input class="form-check-input" name="checkbox2" type="checkbox" <c:if test="${boundedReqVO.wrhousngDe != null}"> disabled checked </c:if>></div>
                      </td>
                      <td>${stat.count}</td>
                      <td>${boundedReqVO.entrManageNo}</td>
                      <td>${boundedReqVO.goodsNo}</td>
                      <td>${boundedReqVO.entrprsNm}</td>
                      <td><fmt:formatDate value="${boundedReqVO.wrhousngRequstDe}" pattern="yyyy-MM-dd"/></td>
                      <td>
                      <c:if test="${boundedReqVO.wrhousngDe == null}">
                        <span class="badge badge-phoenix ms-auto fs-9 badge-phoenix-info">입고 요청</span>
                      </c:if>
                      <c:if test="${boundedReqVO.wrhousngDe != null}">
                        <span class="badge badge-phoenix ms-auto fs-9 badge-phoenix-secondary">입고 완료</span>
                      </c:if>
                      </td>
                  </tr>
                  </c:forEach>
                </tbody>
              </table>
            </div>
            <div class="d-flex flex-between-center pt-3 mb-3">
              <div class="pagination d-none"><li class="active"><button class="page" type="button" data-i="1" data-page="5">1</button></li><li><button class="page" type="button" data-i="2" data-page="5">2</button></li><li><button class="page" type="button" data-i="3" data-page="5">3</button></li></div>
              <p class="mb-0 fs-9"></p>
              <div class="d-flex">
                <button class="btn btn-primary" type="button" data-bs-toggle="modal" data-bs-target="#insUseBounded" id="warehousingBtn">입고</button>
              </div>
            </div>
          </div>
        </div>
      </div>
	</div>
</div>

<!-- ################################################# 모달 시작 ################################################# -->
<div class="modal fade" id="insUseBounded" tabindex="-1" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">입고 등록</h5>
        <button class="btn p-1" type="button" data-bs-dismiss="modal" aria-label="Close"><span class="fas fa-times fs-9"></span></button>
      </div>
      <div class="modal-body">
        <p class="text-body-tertiary lh-lg mb-0"><h5></h5></p>
	    <div class="row">
		  <div class="col p-2">
		    <select class="form-select form-select-sm" name="zone">
	          <option>A</option>
	          <option>B</option>
	          <option>C</option>
	          <option>D</option>
	        </select>
	      </div>
		  <div class="col p-2">구역</div>
		  <div class="col p-2">
		    <select class="form-select form-select-sm" name="no">
	          <option>1</option>
	          <option>2</option>
	          <option>3</option>
	          <option>4</option>
	        </select>
	      </div>
		  <div class="col p-2">번</div>
		</div>
      </div>
      <div class="modal-footer">
        <button class="btn btn-primary" type="button" id="insBtn">등록</button>
        <button class="btn btn-outline-primary" type="button" data-bs-dismiss="modal">닫기</button>
      </div>
    </div>
  </div>
</div>
<!-- ################################################# 모달 끝 ################################################# -->
