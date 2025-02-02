






<!-- 검역 내역 조회 보류 -->








<%-- <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> --%>
<%-- <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> --%>
<%-- <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> --%>
<!-- <script type="text/javascript" src="/resources/js/jquery.min.js"></script> -->
<!-- <script type="text/javascript"> -->
// $(document).ready(function() {
//   $("#detBtn").on("click", function() {
//     //console.log("눌렸엉");
//     var qrantNo = $(this).text();
//     //console.log("qrantNo: " + qrantNo);
//     let data = {qrantNo: qrantNo};
//     $.ajax ({
//       method: "post",
//   	  url: "/cbs/svntAdmin/oneQurantDet",
//   	  data: JSON.stringify(data),
//   	  contentType: "application/json",
//   	  dataType: "json",
//   	  success: function(result) {
//   		$("#quarDet input:eq(0)").val(result.goodsNo);
//   	    $("#quarDet input:eq(1)").val(result.goodsVO.hsCd);
//   	    $("#quarDet input:eq(2)").val(result.excDe);
//   	    $("#quarDet input:eq(3)").val(result.excPlace);
//   	    $("#quarDet input:eq(4)").val(result.userVO.userNm);
//   	    $("#quarDet textarea").val(result.quarantineItemVO.qrantProcssDetailCn);
//   	    $("#quarDet input:eq(5)").val(result.quarantineRequestVO.qrantResultAt);
//   	  }
//     });
//   });
// });
<!-- </script> -->
<!-- <div class="card h-50"> -->
<!-- 	<div class="card-body"> -->
<!-- 		<h3>검사 검역 결과 조회</h3> -->
<!-- 		<div class="card shadow-none border my-4"> -->
<!-- 			<table class="table table-hover table-striped" style="text-align: center;"> -->
<!-- 				<thead> -->
<!-- 	                <tr> -->
<!-- 	                  <th scope="col">검역 번호</th> -->
<!-- 	                  <th scope="col">물품 번호</th> -->
<!-- 	                  <th scope="col">수행 일시</th> -->
<!-- 	                  <th scope="col">수행 장소</th> -->
<!-- 	                  <th scope="col">검사 결과</th> -->
<!-- 	                </tr> -->
<!-- 				</thead> -->
<!-- 				<tbody> -->
<%-- 				  <c:forEach var="pbQuarList" items="${pbQuarList}"> --%>
<!-- 				  <tr> -->
<%-- 				    <td><a href="#quarDet" data-bs-toggle="modal" data-qrant-no="${pbQuarList.qrantNo}" id="detBtn">${pbQuarList.qrantNo}</a></td> --%>
<%-- 				    <td>${pbQuarList.goodsNo}</td> --%>
<%-- 				    <td><fmt:formatDate value="${pbQuarList.excDe}" pattern="yyyy-MM-dd"/></td> --%>
<%-- 				    <td>${pbQuarList.excPlace}</td> --%>
<%-- 				    <td>${pbQuarList.qrantResultAt}</td> --%>
<!-- 				  </tr> -->
<%-- 				  </c:forEach> --%>
<!-- 				</tbody> -->
<!-- 			</table> -->
<!-- 		</div> -->
<!-- 	</div> -->
<!-- </div> -->

<!-- <!-- ################################################# 모달 시작 ################################################# --> -->
<!-- <div class="modal fade" id="quarDet" tabindex="-1" aria-hidden="true"> -->
<!--   <div class="modal-dialog"> -->
<!--     <div class="modal-content"> -->
<!--       <div class="modal-header"> -->
<!--         <h5 class="modal-title">검역 상세</h5> -->
<!--         <button class="btn p-1" type="button" data-bs-dismiss="modal" aria-label="Close"><span class="fas fa-times fs-9"></span></button> -->
<!--       </div> -->
<!--       <div class="modal-body"> -->
<!--         <div class="row p-1"> -->
<!--             <label class="col" style="font-size: 17px;"><b>물품번호</b></label> -->
<!--             <label class="col" style="font-size: 17px;"><b>HS코드</b></label> -->
<!--         </div> -->
<!--         <div class="row p-1"> -->
<!--             <input class="col form-control" type="text" readonly> -->
<!--             <input class="col form-control" type="text" readonly> -->
<!--         </div> -->
<!--         <div class="row p-1"> -->
<!--             <label class="col" style="font-size: 17px;"><b>수행일시</b></label> -->
<!--             <label class="col" style="font-size: 17px;"><b>수행장소</b></label> -->
<!--             <label class="col" style="font-size: 17px;"><b>수행자</b></label> -->
<!--         </div> -->
<!--         <div class="row p-1"> -->
<!--             <input class="col form-control" type="text" readonly> -->
<!--             <input class="col form-control" type="text" readonly> -->
<!--             <input class="col form-control" type="text" readonly> -->
<!--         </div> -->
<!--         <div class="row p-1"> -->
<!--             <label class="col" style="font-size: 17px;"><b>절차상세</b></label> -->
<!--         </div> -->
<!--         <div class="row p-1"> -->
<!-- 		  <textarea class="form-control" style="height: 100px" readonly></textarea> -->
<!-- 		</div> -->
<!-- 		<div class="row p-1"> -->
<!--             <label class="col" style="font-size: 17px;"><b>검사결과</b></label> -->
<!--         </div> -->
<!--         <div class="row p-1"> -->
<!-- 		  <input class="col form-control" type="text" readonly> -->
<!-- 		</div> -->
<!--       </div> -->
<!--       <div class="modal-footer"> -->
<!--         <button class="btn btn-outline-primary" type="button" data-bs-dismiss="modal">닫기</button> -->
<!--       </div> -->
<!--     </div> -->
<!--   </div> -->
<!-- </div> -->
<!-- <!-- ################################################# 모달 끝 ################################################# --> -->