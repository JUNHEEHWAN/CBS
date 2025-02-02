<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="/resources/js/jquery.min.js"></script>
<style type="text/css">
th, td { text-align: center !important; }
.modal-content { width: 1000px; height:600px; !important; left: -300px; }

</style>
<script type="text/javascript">
$(function() {
	//모달다루기
	$(document).on("click",".detBtn",function(){
		//data-user-cd
		let userCd = $(this).data("userCd");
		
		let data = {
			"userCd":userCd	
		};
		console.log("data : ",data);
		
		//관세사 테이블에서 1행 검색
		/*
		요청URI : /cbs/admin/brkrlistOne
		요청파라미터(json) : {"userCd":"CUST0006"}
		요청방식 : post
		*/
		 $.ajax({
			url : "/cbs/admin/brkrlistOne",
			contentType : "application/json;charset=utf-8",
			data:JSON.stringify(data),
			type : "post",
			dataType : "json",
			success : function(result) {
				if(result.customsBrokerVO.confmAt === 'T'){
					$("#confirm").css("display","none");
				}else if(result.customsBrokerVO.confmAt === 'F'){
					$("#confirm").css("display","block");
				}
				
				$("#profileFile").attr("src",result.customsBrokerVO.profileFile);
				$("#userCd").val(result.userCd);
				$("#userNm").val(result.userNm);
				$("#clsf").val(result.clsf);
				$("#encpn").val(result.encpn);
				$("#lastAcdmcr").val(result.customsBrokerVO.lastAcdmcr);
				$("#qualfNo").val(result.customsBrokerVO.qualfNo);
				$("#qualfAcqsDe").val(result.customsBrokerVO.qualfAcqsDe);
				$("#emailAdres").val(result.emailAdres);
				$("#telno").val(result.telno);
				$("#adres").val(result.adres);
				
				
			}
				
		});
	});
	
	/////옵션선택 및 페이지//////
		$("#selOption2").on("change",function(){
			console.log("this",this);
			//	let keyword = $(this).val();
				let keyword = this.value;
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
					url : "/cbs/admin/brkrlist",
					contentType : "application/json;charset=utf-8",
					data:JSON.stringify(data),
					type : "post",
					dataType : "json",
					success : function(result) {
						let str = "";
						$("#cstbrkrList").html("");
						$.each(result.content,function(idx, userVO){
							console.log("!userVO확인!", userVO);
							str += "<tr>";
							str += "<th scope='row'><a href='#quarDet' data-bs-toggle='modal' class='detBtn' data-user-cd='"+userVO.userCd+"'>"
									+ userVO.userCd
									+ "</a></th>";
							str += "<td>" + userVO.userNm+ "</td>";
							str += "<td>" + userVO.telno+ "</td>";
							str += "<td>" + userVO.emailAdres+ "</td>";
							str += "<td>" + userVO.encpn+ "</td>";
							str += "<td>" + (userVO.customsBrokerVO.confmAt === 'F' ? '<span class="badge badge-phoenix badge-phoenix-secondary">대기</span>' :
								(userVO.customsBrokerVO.confmAt === 'T' ? '<span class="badge badge-phoenix badge-phoenix-success">승인</span>' : '-')) + "</td>";
							str += "</tr>";
						});
							$("#cstbrkrList").append(str);
							$('#divPaging').html(result.pagingArea);

						}
					});
		});		
	
	
	
	
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
				url : "/cbs/admin/brkrlist",
				contentType : "application/json;charset=utf-8",
				data:JSON.stringify(data),
				type : "post",
				dataType : "json",
				success : function(result) {
					let str = "";
					$("#cstbrkrList").html("");
					$.each(result.content,function(idx, userVO){
						console.log("!userVO확인!", userVO);
						str += "<tr>";
						str += "<th scope='row'><a href='#quarDet' data-bs-toggle='modal' class='detBtn' data-user-cd='"+userVO.userCd+"'>"
								+ userVO.userCd
								+ "</a></th>";
						str += "<td>" + userVO.userNm+ "</td>";
						str += "<td>" + userVO.telno+ "</td>";
						str += "<td>" + userVO.emailAdres+ "</td>";
						str += "<td>" + userVO.encpn+ "</td>";
						str += "<td>" + (userVO.customsBrokerVO.confmAt === 'F' ? '<span class="badge badge-phoenix badge-phoenix-secondary">대기</span>' :
							(userVO.customsBrokerVO.confmAt === 'T' ? '<span class="badge badge-phoenix badge-phoenix-success">승인</span>' : '-')) + "</td>";
						str += "</tr>";
					});
						$("#cstbrkrList").append(str);
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
				url : "/cbs/admin/brkrlist",
				contentType : "application/json;charset=utf-8",
				data:JSON.stringify(data),
				type : "post",
				dataType : "json",
				success : function(result) {
					let str = "";
						$.each(result.content,function(idx, userVO){
								str += "<tr>";
								str += "<th scope='row'><a href='#quarDet' data-bs-toggle='modal' class='detBtn' data-user-cd='"+userVO.userCd+"'>"
										+ userVO.userCd
										+ "</a></th>";
								str += "<td>" + userVO.userNm+ "</td>";
								str += "<td>" + userVO.telno+ "</td>";
								str += "<td>" + userVO.emailAdres+ "</td>";
								str += "<td>" + userVO.encpn+ "</td>";
								str += "<td>" + (userVO.customsBrokerVO.confmAt === 'F' ? '<span class="badge badge-phoenix badge-phoenix-secondary">대기</span>' :
									(userVO.customsBrokerVO.confmAt === 'T' ? '<span class="badge badge-phoenix badge-phoenix-success">승인</span>' : '-')) + "</td>";
								str += "</tr>";
							});
						$("#cstbrkrList").append(str);
						$('#divPaging').html(result.pagingArea);
						
					}
				});
		
		//관세사 승인
		$("#confirm").on("click",function(){
			let userCd = document.getElementById("userCd").value;
			console.log("userCd : " + userCd);
			
			let data = {
				"userCd":userCd
			};
			console.log("data",data);
			
			$.ajax({
				url : "/cbs/admin/brkrUpdate",
				contentType : "application/json;charset=utf-8",
				data:JSON.stringify(data),
				type : "post",
				dataType : "text",
				success : function(result) {
					swal({
			    		  title: "승인 완료되었습니다.",
			    		  icon: "success"
			    		}).then(function() {
			    		  	location.reload();
			    		});
					},
					error: function(e) {
			    		swal("실패", "작업이 정상적으로 처리되지 않았습니다.", "error");
			    	  }, timeout: 100000
			});	
		});
		
	});
</script>

<body>
<div class="card h-50">
	<div class="card-body">
		<h3>관세사 조회</h3>
		<div id="tableExample4">
		<!-- ///검색 시작 /// -->
			<div class="input-group mb-3 w-25 ms-auto p-2 bd-highlight ">
			<div class="col-auto" style="width: 200px; position: relative; right: 220px; top: 51px;">
    				<select class="form-select form-select-sm mb-3" id="selOption2">
        				<option selected value="">전체</option>
        				<option value="F">대기</option>
        				<option value="T">승인</option>
      				</select>
	      		</div>
	      <div class="input-group">		
				<input type="text" name="keyword" id="keyword" class="form-control h-5" placeholder="검색어를 입력하세요." aria-label="" aria-describedby="btnSearch">
            <button class="btn btn-primary btn-sm w-10" type="button" id="btnSearch">검색</button>
			</div>
			</div>
		<!-- ///검색 끝 /// -->

		<div class="table-responsive">
			<table class="table table-hover">
				<thead>
					<tr class="bg-body-highlight">
						<th scope="col">사번</th>
						<th scope="col">이름</th>
						<th scope="col">전화번호</th>
						<th scope="col">이메일주소</th>
						<th scope="col">입사일</th>
						<th scope="col">승인여부</th>
					</tr>
				</thead>
				<tbody id="cstbrkrList">
					<%-- ajax 사용 List 채워짐 --%>
				</tbody>
			</table>
		<div class="col-auto px-3" id="divPaging"></div>
		</div>
	</div>
</div>
</div>
</body>

<!-- ################################################# 모달 시작 ################################################# -->
<div class="modal fade" id="quarDet" tabindex="-1" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">상세프로필</h5>
			</div>
			<div class="modal-body">
				<div class="row p-1" id="one" style="display: flex; margin: 20px; position: relative;left: 30px;">
				  <div class="first" style="width: 30%; margin-right: 5px;">
					<img id="profileFile" src="" alt="프로필사진"
						style="width: 100%; position: center; display: block;"><br>
						<div class="input-group">
					               <div class="input-group-text" style="width: 130px;">관세사코드</div>
					                <input class="form-control" id="userCd" type="text" readonly>
					             </div>
						</div>
						<div class="row p-1" style="width: 600px; height: 373px;">
							<div >
					             <div class="input-group">
					               <div class="input-group-text" style="width: 130px;">이름</div>
					              <input class="form-control" id="userNm" type="text" readonly>
					             </div>
					           </div>
					            <div >
					             <div class="input-group">
					               <div class="input-group-text" style="width: 130px;">직급</div>
					              <input class="form-control" id="clsf" type="text" readonly>
					             </div>
					            </div>
					           
					           
							<div >
					             <div class="input-group">
					               <div class="input-group-text" style="width: 130px;">입사일</div>
					              <input class="form-control" id="encpn" type="text" readonly>
					             </div>
					           </div>
					            <div >
					             <div class="input-group">
					               <div class="input-group-text" style="width: 130px;">최종학력</div>
					              <input class="form-control" id="lastAcdmcr" type="text" readonly>
					             </div>
					            </div>
					          
					            <div >
					             <div class="input-group">
					               <div class="input-group-text" style="width: 130px;">자격번호</div>
					              <input class="form-control" id="qualfNo" type="text" readonly>
					             </div>
					            </div>
					            <div >
					             <div class="input-group">
					               <div class="input-group-text" style="width: 130px;">자격취득일</div>
					              <input class="form-control" id="qualfAcqsDe" type="text" readonly>
					             </div>
					            </div>
					            <div >
					             <div class="input-group">
					               <div class="input-group-text" style="width: 130px;">이메일</div>
					              <input class="form-control" id="emailAdres" type="text" readonly>
					             </div>
					            </div>
					            <div>
					             <div class="input-group">
					               <div class="input-group-text" style="width: 130px;">전화번호</div>
					              <input class="form-control" id="telno" type="text" readonly>
					             </div>
					            </div>
					            <div >
					             <div class="input-group">
					               <div class="input-group-text" style="width: 130px;">주소</div>
					              <input class="form-control" id="adres" type="text" readonly>
					             </div>
					            </div>
					     </div>       
						
				</div>
						<div class="modal-footer">
							<button type="button" id="confirm" class="btn btn-outline-primary"
								type="button" data-bs-dismiss="modal">승인</button>
							<button class="btn btn-outline-primary" type="button"
								data-bs-dismiss="modal">닫기</button>
						</div>
			</div>
		</div>
	</div>
</div>	
	<!-- ################################################# 모달 끝 ################################################# -->