<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>	
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<% pageContext.setAttribute("replaceChar", "\n"); %>


<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="/resources/js/jquery.min.js"></script>
<script src="vendors/tinymce/tinymce.min.js"></script>
<script type="text/javascript">
$(function() {
		
		
	});
</script>
<style>
th{
	width: 80px;
}

</style>

<body>
	<div class="card h-50">
		<div class="card-body">
		<div id="tableExample4">
			<div class="table-responsive">
			<c:forEach var="noticeList" items="${noticeList}" varStatus="stat">
			<table class="table">
				<tr>
					<th>제목</th>
					<td><p style="width:250%;">${noticeList.titl}</p></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<th>작성자</th>
					<td style="width:300px;">관리자</td>
					<th>등록일</th>
					<td><fmt:formatDate pattern="yyyy-MM-dd" value="${noticeList.rgsde}"/></td>
					<td></td>
				</tr>
		</table>
				<div>${fn:replace(noticeList.cn, replaceChar, "<br/>")}</div>
				 <hr>
				
				<tr>
					<th>첨부파일</th>
					<c:if test="${noticeList.fileUrl != null}" >
					<td>
					<a href="${noticeList.fileUrl}" id="jsh${stat.count}" download="${noticeList.getFname()}">"${noticeList.getFname()}"</a>
					</td>
					</c:if>
					<c:if test="${noticeList.fileUrl == null}" >
					<td>없음</td>
					</c:if>
					<th></th>
					<td></td>
				</tr>
				 
				 </c:forEach>
				 
			<div class="modal-footer">
				<a class="btn btn-outline-primary" href="javascript:history.back()">목록</a>
			</div>
			</div>
			</div>
		</div>
	</div>
</body>

