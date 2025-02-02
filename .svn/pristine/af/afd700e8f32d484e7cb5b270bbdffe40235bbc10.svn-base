<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<% pageContext.setAttribute("replaceChar", "\n"); %>

<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>	
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="/resources/js/jquery.min.js"></script>
<script src="vendors/tinymce/tinymce.min.js"></script>
<script src="https://cdn.ckeditor.com/ckeditor5/41.2.1/classic/ckeditor.js"></script>

<script type="text/javascript">
let editor;

$(function(){
	shTxt = document.querySelector("[name=shTxt]");
	titl =  document.querySelector("[name=titl]");
});

function fedit(){
	//alert("수정")

	$("#spn1").css("display","none");
	$("#confirm").css("display","block");
	$("#cancel").css("display","block");
	$("#file").css("display","inline-block");
	$("#cn1").css("display","none");
	$("#readeditor").css("display","block");
	$("#titl").removeAttr("readonly");
	editor.setData($("#cn1").html())

};

function fdelete(){
	//alert("삭제")
	
	let noticeNo = "${param.noticeNo}";
	
	Swal.fire({
		  title: '삭제하시겠습니까?',
		  text: "삭제하시면 다시 복구시킬 수 없습니다.",
		  icon: 'warning',
		  showCancelButton: true,
		  confirmButtonColor: '#3085d6',
		  cancelButtonColor: '#d33',
		  confirmButtonText: '삭제',
		  cancelButtonText: '취소'
		}).then((result) => {
		  if (result.value) {
              $.ajax({
            	type : "post",
          		url : "/cbs/admin/noticeDelete",
          		contentType : "application/json;charset=utf-8",
          		data: noticeNo,
          		dataType : "text",  // json이라 쓰면 JSON.parse(결과)
          		success : function(result){
          			if(result == "OK"){
          				swal({
          					title: "삭제되었습니다.",
          					icon: "success"
          					}).then(function() {
          					location.href = "/cbs/admin/notice";
          					});
          					

          				}
          		},
          		error: function (xhr, status, error) {
        			console.log("code: " + xhr.status)
        			console.log("message: " + xhr.responseText)
        			console.log("error: " + error);
        		} 
            	  
            	  
              });
			  
			  
		  }
		})
	
	
	
	
}

function fconfirm(){
	//alert("확인")
	
	let inputImgs = $("#file");//파일객체
	//이미지 파일들을 꺼내오자
	let files = inputImgs[0].files;
	
	shTxt.value  = editor.getData();
	let noticeNo = "${param.noticeNo}";
	
	let noticeVO ={
		"noticeNo":noticeNo,	
		titl:titl.value,
		cn:shTxt.value
	}
	let formData = new FormData();
	formData.append("noticeVO", new Blob([JSON.stringify(noticeVO)], {type: "application/json"}));
	for(let i=0; i<files.length; i++){
			formData.append("uploadFile",files[i])
		}
	
	$.ajax({
		type : "post",
		url : "/cbs/admin/noticeUpdate",
		processData:false,
    	contentType:false,
		data: formData,
		dataType : "json",
		success : function(result){
			console.log("결과",result);
				swal({
				title: "수정이 완료되었습니다.",
				icon: "success"
				}).then(function() {
				location.href = "/cbs/admin/noticeDetail?noticeNo="+(result.noticeNo);
				});
			
		},
		error: function (xhr, status, error) {
			console.log("code: " + xhr.status)
			console.log("message: " + xhr.responseText)
			console.log("error: " + error);
		}
	});
	
	
}; 


function fcancel(){
	//alert("취소")
	let noticeNo = "${param.noticeNo}";
	
	location.href="/cbs/admin/noticeDetail?noticeNo="+noticeNo;
	
};


	
	
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
			<c:forEach var="noticeVO" items="${noticeList}" varStatus="stat">
			<table class="table">
				<tr>
					<th>제목</th>
					<td><input type="text" name="titl" value="${noticeVO.titl}" id="titl"
					placeholder="제목" required readonly style="width: 700px;" /></td>
					<th></th>
					<td></td>
				</tr>
				<tr>
					<th>작성자</th>
					<td style="width:300px;">관리자</td>
					<th>등록일</th>
					<td><fmt:formatDate pattern="yyyy-MM-dd" value="${noticeVO.rgsde}"/></td>
				</tr>
		</table>
				<div id="cn1">${fn:replace(noticeVO.cn, replaceChar, "<br/>")}</div>
				<textarea name="shTxt" style="display: none;" id="shTxt" cols="30" rows="10"></textarea>
				<div id="readeditor" style="display: none;"><div id="editor" >
           					 </div></div><hr>
           					 
           		<tr>
					<th>첨부파일</th>
					<c:if test="${noticeVO.fileUrl != null}" >
					<td>
					<a href="${noticeVO.fileUrl}" id="jsh${stat.count}" download="${noticeVO.getFname()}">"${noticeVO.getFname()}"</a><br>
					</td>
					</c:if>
					<td><input id="file" type="file" style="display: none;"></td>
					<c:if test="${noticeVO.fileUrl == null}" >
					<td></td>
					</c:if>
					<script>
					// 이거슨 임시방편 편법 -> 대신 java 와 javascript가 어떤 순서로 동작하는지를 안다는 증빙!
					//   let fileUrl  = "${noticeVO.fileUrl}";
					//   let slashArr = fileUrl.split("/");
					//  let fileName = slashArr[slashArr.length -1];
					//   document.querySelector("#jsh${stat.count}").download=fileName;
					</script>
					<th></th>
					<td></td>
				</tr>			 
				 </c:forEach>
				 
			<!--일반모드 시작 -->	 
			<div id="spn1" class="modal-footer">
				<button type="button" id="edit" class="btn btn-outline-primary" onclick="fedit()">수정</button>&emsp;
				<button type="button" id="delete" class="btn btn-outline-primary" onclick="fdelete()">삭제</button>
			</div>
			<!--일반모드 끝  -->
			<!--수정모드 시작 -->	 
			<div id="spn2" class="modal-footer" " >
				<button style="display:none; type="button" id="confirm" class="btn btn-outline-primary" onclick="fconfirm()">확인</button>&emsp;
				<button style="display:none; type="button" id="cancel" class="btn btn-outline-primary" onclick="fcancel()">취소</button>
			</div>
			<!--수정모드 끝  -->
			</div>
			</div>
		</div>
	</div>
	
<script type="text/javascript">


ClassicEditor
.create( document.querySelector( '#editor' ) )
.then( function(nEditor){
    editor = nEditor;
})
.catch( error => {
    console.error( error );
} );

</script>	
</body>

