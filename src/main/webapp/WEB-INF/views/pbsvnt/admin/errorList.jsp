


<!-- 신고 내역 조회 보류 -->





<%-- <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> --%>
<%-- <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> --%>
<%-- <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>  --%>
<!-- <script type="text/javascript" src="/resources/js/jquery.min.js"></script> -->
<!-- <script type="text/javascript"> -->
// $(document).ready(function() {
//   $("#detBtn").on("click", function() {
//     var erordecNo = $(this).text();
//     let data = {erordecNo: erordecNo};
//     $.ajax ({
//       method: "post",
//   	  url: "/cbs/svntAdmin/oneErorDet",
//   	  data: JSON.stringify(data),
//   	  contentType: "application/json",
//   	  dataType: "json",
//   	  success: function(result) {
//   		$("#erroDet input:eq(0)").val(result.thngNo);
//   	    $("#erroDet input:eq(1)").val(result.erordecDe);
//   	    $("#erroDet input:eq(2)").val(result.aplcnt);
//   	    $("#erroDet textarea").val(result.erordecCn);
//   	  }
//     });
//   });
// });
<!-- </script> -->
<!-- <div class="card h-50"> -->
<!-- 	<div class="card-body"> -->
<!-- 		<h3>신고 내역 조회</h3> -->
<!-- 		<div class="card shadow-none border my-4"> -->
<!-- 			<table class="table table-hover table-striped" style="text-align: center;"> -->
<!-- 				<thead> -->
<!-- 	                <tr> -->
<!-- 	                  <th scope="col">신고 번호</th> -->
<!-- 	                  <th scope="col">물품 번호</th> -->
<!-- 	                  <th scope="col">신고 일시</th> -->
<!-- 	                  <th scope="col">신고자</th> -->
<!-- 	                </tr> -->
<!-- 				</thead> -->
<!-- 				<tbody> -->
<%-- 				  <c:forEach var="errorList" items="${errorList}"> --%>
<!-- 				  <tr> -->
<%-- 				    <td><a href="#erroDet" data-bs-toggle="modal" data-erordec-no="${errorList.erordecNo}" id="detBtn">${errorList.erordecNo}</a></td> --%>
<%-- 				    <td>${errorList.thngNo}</td> --%>
<%-- 				    <td><fmt:formatDate value="${errorList.erordecDe}" pattern="yyyy-MM-dd"/></td> --%>
<%-- 				    <td>${errorList.aplcnt}</td> --%>
<!-- 				  </tr> -->
<%-- 				  </c:forEach> --%>
<!-- 				</tbody> -->
<!-- 			</table> -->
<!-- 		</div> -->
<!-- 	</div> -->
<!-- </div> -->

<!-- <!-- ################################################# 모달 시작 ################################################# --> -->
<!-- <div class="modal fade" id="erroDet" tabindex="-1" aria-hidden="true"> -->
<!--   <div class="modal-dialog"> -->
<!--     <div class="modal-content"> -->
<!--       <div class="modal-header"> -->
<!--         <h5 class="modal-title">신고 상세</h5> -->
<!--         <button class="btn p-1" type="button" data-bs-dismiss="modal" aria-label="Close"><span class="fas fa-times fs-9"></span></button> -->
<!--       </div> -->
<!--       <div class="modal-body"> -->
<!--         <div class="row p-1"> -->
<!--             <label class="col" style="font-size: 17px;"><b>물품번호</b></label> -->
<!--         </div> -->
<!--         <div class="row p-1"> -->
<!--             <input class="col form-control" type="text" readonly> -->
<!--         </div> -->
<!--         <div class="row p-1"> -->
<!--             <label class="col" style="font-size: 17px;"><b>신고일시</b></label> -->
<!--             <label class="col" style="font-size: 17px;"><b>신고자</b></label> -->
<!--         </div> -->
<!--         <div class="row p-1"> -->
<!--             <input class="col form-control" type="text" readonly> -->
<!--             <input class="col form-control" type="text" readonly> -->
<!--         </div> -->
<!--         <div class="row p-1"> -->
<!--             <label class="col" style="font-size: 17px;"><b>상세 내용</b></label> -->
<!--         </div> -->
<!--         <div class="row p-1"> -->
<!-- 		  <textarea class="form-control" style="height: 100px" readonly></textarea> -->
<!-- 		</div> -->
<!--       </div> -->
<!--       <div class="modal-footer"> -->
<!--         <button class="btn btn-outline-primary" type="button" data-bs-dismiss="modal">닫기</button> -->
<!--       </div> -->
<!--     </div> -->
<!--   </div> -->
<!-- </div> -->
<!-- <!-- ################################################# 모달 끝 ################################################# --> -->