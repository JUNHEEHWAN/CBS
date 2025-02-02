<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="/resources/js/jquery.min.js"></script>
<style type="text/css">
th, td { text-align: center;}
.modal-content { width: 1200px; height:800px; !important; left: -300px; }
</style>
<script type="text/javascript">
$(function() {
		console.log("공지사항 관리..")
		
	
/////키워드 검색 및 페이지//////
	$("#btnSearch").on("click",function(){
		let keyword = $("#keyword").val();
		console.log("keyword : " + keyword);
		
		let currentPage = "1";
		
		if(currentPage==""){
			currentPage = "1";
	}
		//json 오브젝트
	      let data = {
	         "keyword":keyword,
	         "currentPage":currentPage
	      };
	      console.log(data);
	      
	      $.ajax({
				url : "/cbs/admin/noticeList",
				contentType : "application/json;charset=utf-8",
				data:JSON.stringify(data),
				type : "post",
				dataType : "json",
				success : function(result) {
					let str = "";
					$("#noticeList").html("");
					$.each(result.content,function(idx, noticeVO){
						console.log("!noticeVO확인!", noticeVO);
						
						str += `<tr>
					          <td> \${((currentPage-1)*10) + (idx+1)} </td>
					          <th scope='row' style="text-align:left">
					            <a href='/cbs/trnsprt/noticeDetail?noticeNo=\${noticeVO.noticeNo}' class='detBtn' data-notice-titl='\${noticeVO.titl}'>
							       \${noticeVO.titl}
							   </a>
					          </th>
					          <td>관리자</td>
					          <td>\${noticeVO.rgsde}</td>
				          </tr>`;
				          
							});
						$("#noticeList").append(str);
						$('#divPaging').html(result.pagingArea);

					}
				});
	});
//////키워드 검색 , 페이징 끝///////		
		let currentPage = "${param.currentPage}";
	    console.log("keyword : " + keyword);
	    
	    if(currentPage ==""){
	  	  currentPage = "1";
	    }
	    
	    let data = {
	    		"keyword":"${param.keyword}",//검색해서 파라미터로 키워드 받는것
	    		"currentPage":currentPage
	    	};
	    console.log(data);

		$.ajax({
				url : "/cbs/admin/noticeList",
				contentType : "application/json;charset=utf-8",
				data:JSON.stringify(data),
				type : "post",
				dataType : "json",
				success : function(result) {
					let str = "";
						$.each(result.content,function(idx, noticeVO){
								console.log("!noticeVO확인!", noticeVO);
								str += `<tr>
								          <td> \${((currentPage-1)*10) + (idx+1)} </td>
								          <th scope='row' style="text-align:left">
								            <a href='/cbs/trnsprt/noticeDetail?noticeNo=\${noticeVO.noticeNo}' class='detBtn' data-notice-titl='\${noticeVO.titl}'>
										       \${noticeVO.titl}
										   </a>
								          </th>
								          <td>관리자</td>
								          <td>\${noticeVO.rgsde}</td>
							          </tr>`;
							});
						$("#noticeList").append(str);
						$('#divPaging').html(result.pagingArea);

					}
				});
		
		
		
	});
</script>

<body>
<div class="card h-50">
	<div class="card-body">
		<h3>공지사항 관리</h3>
		<div id="tableExample4">
		<!-- ///검색 시작 /// -->
			<div class="input-group mb-3 w-25 ms-auto p-2 bd-highlight ">
				<input type="text" name="keyword" id="keyword" class="form-control h-5" placeholder="검색어를 입력하세요." aria-label="" aria-describedby="btnSearch">
            <button class="btn btn-primary btn-sm w-10" type="button" id="btnSearch">검색</button>
			</div>	
		<!-- ///검색 끝 /// -->

		<div class="table-responsive">
			<table class="table table-hover">
				<thead>
					<tr class="bg-body-highlight">
						<th scope="col">게시번호</th>
						<th scope="col">제목</th>
						<th scope="col">작성자</th>
						<th scope="col">등록일</th>
					</tr>
				</thead>
				<tbody id="noticeList">
					<%-- ajax 사용 List 채워짐 --%>
				</tbody>
			</table>
		<div class="col-auto px-3" id="divPaging"></div>
		</div>
	</div>
</div>
</div>
</body>
