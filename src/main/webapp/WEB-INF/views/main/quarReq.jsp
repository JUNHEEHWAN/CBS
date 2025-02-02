<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link href="/resources/css/theme.min.css" type="text/css" rel="stylesheet" id="style-default">
<script type="text/javascript" src="/resources/js/jquery.min.js"></script>
<script src="/resources/js/sweetalert2.min.js"></script>
<link rel="stylesheet" href="/resources/css/sweetalert2.min.css">
<script type="text/javascript">
$(function() {
	var entrManageNo = new URLSearchParams(window.location.search).get("entrManageNo");
	var goodsNo = new URLSearchParams(window.location.search).get("goodsNo");
	var idValue = new URLSearchParams(window.location.search).get("idValue");
	//console.log("entrManageNo: " + entrManageNo);
	var qrantRequestCd = "";
	var requstDe = "";
	var qrantSe = "";
	$.ajax ({
		method: "post",
        url: "/cbs/svntAdmin/getQrantRequestCd",
        dataType: "text",
        async: false,
        success: function(result) {
        	$("#entrManageNo").val(entrManageNo);
        	$("#qrantRequestCd").val(result);
        }
	});
	
	$("#quarReqBtn").on("click", function() {
		entrmanageNo = $("#entrManageNo").val();
		qrantRequestCd = $("#qrantRequestCd").val();
// 		console.log("entrmanageNo: " + entrmanageNo + "qrantRequestCd: " + qrantRequestCd);
		
		requstDe = $("#requstDe").val();
		requstPlace = $("#requstPlace").val();
// 		console.log("requstDe: " + requstDe + "requstPlace: " + requstPlace);
		console.log("goodsNo: " + goodsNo);
		
		$(".input-group.mb-3 input[type='checkbox']").each(function() {
			if ($(this).is(":checked")) {
				var se = $(this).val();
				qrantSe += se;
			}
		});
// 	console.log("체크된 검역 요청 장소:", requestPlaces);
		
		Swal.fire({
			title: "검역을 신청하시겠습니까?",
			icon: "warning",
			showCancelButton: true,
			confirmButtonColor: "#3085d6",
			cancelButtonColor: "#d33",
			confirmButtonText: "예"
		}).then((result) => {
			if (result.isConfirmed) {
				let data = {entrManageNo:entrManageNo, qrantRequestCd:qrantRequestCd, requstDe:requstDe, requstPlace:requstPlace, qrantSe:qrantSe, goodsNo:goodsNo};
// 				console.log("data: " + data);
				$.ajax ({
					method: "post",
                    url: "/cbs/svntAdmin/insQuarRequest",
                    data: JSON.stringify(data),
                    contentType: "application/json",
                    dataType: "json"
				});
            	Swal.fire({
					title: "검역 신청 완료",
					text: "검역 신청이 완료되었습니다.",
					icon: "success"
				}).then(function(result) {
					window.close();
				});
			}
			});
		window.opener.disableBtn(idValue); // 검역신청시 부모창의 검역신청 버튼 비활성화
		});
	
	
	// ##################### 자동완성 #####################
	$("#autoBtn").on("click", function() {
		console.log("click");
		$("#requstDe").val("2024-04-17");
		$("#requstPlace").val("부산검역창고");
		$("input[value='1'], input[value='2'], input[value='3']").prop("checked", true);
	});
	// ###################################################
});


</script>
<div class="modal-content">
    <div class="modal-header">
        <h4 class="modal-title" id="exampleModalLabel"><br>검역 신청</h4>
    </div>
    <div class="modal-body">
        <div class="my-3"></div>
        <div class="tab-content">
            <div class="tab-pane fade show active" id="" role="tabpanel">
            <div class="my-3"></div>
		<div class="row">
	        <div class="my-3"></div>
	        <div class="col-md-3 mb-3">
	            <div class="input-group">
	                <div class="input-group-text">검역 요청 코드</div>
	                <input class="form-control" id="qrantRequestCd" type="text" readonly>
	            </div>
	        </div>
      	</div>
		<div class="row">
	        <div class="col-md-3 mb-3">
	            <div class="input-group">
	                <div class="input-group-text">통관 관리 번호</div>
	                <input class="form-control" id="entrManageNo" type="text" readonly>
	            </div>
	        </div>
      	</div>
		<div class="row">
	        <div class="col-md-3 mb-3">
	            <div class="input-group">
	                <div class="input-group-text">요청 일자</div>
	                <input class="form-control" id="requstDe" type="date">
	            </div>
	        </div>
      	</div>
		<div class="row">
	        <div class="col-md-3 mb-3">
	            <div class="input-group">
	                <div class="input-group-text">요청 장소</div>
	                <select class="form-select" aria-label="category" id="requstPlace">
						<option>선택</option>
						<option value="부산검역창고">부산검역창고</option>
						<option value="울산검역창고">울산검역창고</option>
						<option value="인천검역창고">인천검역창고</option>
						<option value="대전검역창고">대전검역창고</option>
					</select>
	            </div>
	        </div>
      	</div>
        <div class="row">
        	<div class="input-group mb-3">
        	  <div class="input-group-text">검역 구분</div>
			  <div class="input-group-text" style="background-color: white !important;">
			    <input class="form-check-input" type="checkbox" value="1">
			  </div>
			  <input class="form-control" type="text" value="정밀검사">
			  <div class="input-group-text" style="background-color: white !important;">
			    <input class="form-check-input" type="checkbox" value="2">
			  </div>
			  <input class="form-control" type="text" value="관능검사">
			  <div class="input-group-text" style="background-color: white !important;">
			    <input class="form-check-input" type="checkbox" value="3">
			  </div>
			  <input class="form-control" type="text" value="임상검사">
			</div>
          <div class="col-md-3">
              <div class="input-group justify-content-end">
              	  <button class="btn btn-link me-1 mb-1" type="button" id="autoBtn">자동완성</button>
                  <button class="btn btn-info me-1 mb-1" type="button" style="border-radius: 10px !important;" id="quarReqBtn">검역 신청</button> <!-- 처리 상태에 따라 버튼 다르게 보이게 하기 (ajax) -->
                  &nbsp;&nbsp;
                  <button class="btn btn-outline-secondary me-1 mb-1" type="button" style="border-radius: 10px !important;" onclick="window.close()">닫기</button>
                  &nbsp;&nbsp;
              </div>
          </div>
        </div>
	</div>
    </div>
</div>
</div>
