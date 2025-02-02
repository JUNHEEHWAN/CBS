<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="/resources/js/sweetalert2.min.js"></script>
<link rel="stylesheet" href="/resources/css/sweetalert2.min.css">
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
.det {
	width: 1350px;
	height: 770px; ! important;
	left: -300px;
}

    #ims {
        width: 100%;
        height: auto;
        display: block;
    }

.input-group.aa-1.w-100 {
	padding-top: 40px;
}

</style>
<script>
	$(function() {

		let currentPage = "${param.currentPage}";
		let keyword = $(this).val();
		let userID = $('#userID').val();

		if (currentPage == "") {
			currentPage = "1";
		}

		let data = {
			"keyword" : keyword,
			"currentPage" : currentPage,
		};
		console.log(data);

		$.ajax({
					url : "/cbs/quar/quarPaperList",
					contentType : "application/json;charset=utf-8",
					data : JSON.stringify(data),
					type : "post",
					dataType : "json",
					success : function(result) {
						console.log("List 체크: ", result);
						console.log("result.content 체크: ", result.content);

						let str = "";
						$.each(result.content,function(idx, quarantineRequestVO) {
											//console.log("quarantineRequestVO[" + idx + "]", quarantineRequestVO.qrantRequestCd);
											str += "<tr>";

											str += "<td class='align-middle' scope='row' id='entrManageNo'>"
													+ quarantineRequestVO.entrManageNo
													+ "</td>";
											str += "<td class='align-middle'>"
													+ quarantineRequestVO.allQrantJudg
													+ "</td>";
											str += "<td class='align-middle'><span class='badge badge-phoenix badge-phoenix-success'>"
													+ quarantineRequestVO.qrantResultAt
													+ "</span></td>";
											str += "<td><button type='button' class='btn btn-sm btn-outline-primary' id='customButton'>결과서 확인</button></td>";
											str += "<td><button type='button' class='btn btn-sm btn-outline-primary' id='chitButton'>전표 확인</button></td>";

											str += "</tr>";
										});
						$("#quarPapertable").append(str);
						$('#divPaging').html(result.pagingArea);
						console.log("리스트 출력 확인");
					}
				});

		// 검사서 출력 버튼 클릭 시 이벤트 처리
		$(document).on("click","#customButton",function() {

					var row = $(this).closest('tr');

					var entrManageNo = row.find('#entrManageNo').text();
					let url = '/cbs/quar/qpaper?entrManageNo='
							+ encodeURIComponent(entrManageNo);
					window.open(url, 'quarPaperWindow',
							'width=1000, height=1600');
				});
		// 전표 출력 버튼 클릭 시 이벤트 처리
		$(document).on("click","#chitButton",function() {

					var row = $(this).closest('tr');

					var entrManageNo = row.find('#entrManageNo').text();

					console.log("entrManageNo 값:", entrManageNo);

					let url = '/cbs/quar/qchitpaper?entrManageNo='
							+ encodeURIComponent(entrManageNo);
					window.open(url, 'quarPaperWindow',
							'width=1100, height=600');
				});
	});
</script>
<div class="card h-50 position-relative">
	<!-- <img id="ims" src="/resources/img/테스트6.png" style="position: absolute; top: 130px; left: -22px; z-index: 1;">  -->
			<div style="text-align: center; margin=0; max-width: 100%; height: auto;">
                <img id="ims" src="/resources/img/진행5.png">
            </div>
	<div class="my-3"></div>
   <div class="box_st5">
       <div class="box_st_ico">
          <div class="my-3"></div>
           <div class="ico_boxImg">
               <img src="/resources/img/titlelogo.png" style="width:100px;height:100px; float:left; margin-right: 20px;">
           </div>
           <div style="float:left;">
              <div class="my-3"></div>
               <h3 class="fs18 pc_black">검사/검역 문서</h3>
               <p>이 페이지는 <span style="color:#155eb6;"><b>검사/검역이 완료된 물품의 문서를 조회</b></span>하는 페이지입니다.<br>기타 궁금하신 점은 관세청 콜센터 125번으로 문의하시기 바랍니다.</p>
           </div>
           <div style="clear:both;"></div>
       </div>
   </div>
	<div class="card-body">
		<!-- ####################################검색 조건################################################ -->
		<div class="input-group aa-1 w-100"
			style="display: flex; justify-content: space-between;">
			<div style="flex: 0.8;"></div>
			<div style="flex: 0.15;">
				<select class="form-select1 form-select-sm h-100 form-select"
					id="searchList" style="width: 100%;">
					<option value="" selected>전체검색</option>
					<option value="Q.ENTR_MANAGE_NO">통관관리번호</option>
					<option value="Q.QRANT_RESULT_AT">검역검사여부</option>
					<option value="I.ALL_QRANT_JUDG">검역판정</option>
				</select>
			</div>
			<div class="input-group" style="flex: 0.4;">
				<input class="form-control" id="keyword" type="text">
				<button class="btn btn-primary btn-sm w-5" type="button"
					id="searchBtn">검색</button>
			</div>
		</div>
		<!-- ####################################검색 조건################################################ -->
		<br>
		<sec:authorize access="isAuthenticated()">
			<sec:authentication property="principal.userVO" var="user" />
			<input type="hidden" id="userID"
				value="<sec:authentication property='principal.username'/>">
		</sec:authorize>
		<div id="tableExample4"
			data-list='{"valueNames":["검역전","검역완료"],"filter":{"key":"payment"}}'>
			<!-- ===========================선택==================================== -->
			<div class="table-responsive">
				<table class="table table-sm fs-9 mb-0" style="text-align: center;">
					<thead>
						<tr class="bg-body-highlight">
							<th>통관관리번호</th>
							<th>검사검역판정</th>
							<th>검사검역여부</th>
							<th>결과서</th>
							<th>전표</th>
						</tr>
					</thead>
					<tbody id="quarPapertable" class="list">
						<%-- ajax 사용 List 채워짐 --%>
					</tbody>
				</table>
			</div>
			<br>
			<div id="divPaging"></div>
		</div>
	</div>
</div>
</html>