<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<script src="/resources/js/jquery.min.js"></script>
<style type="text/css">
th, td { text-align: center !important; }
.modal-content { width: 1200px; height:800px; !important; left: -300px; }
</style>
<script type="text/javascript">
$(function(){
/////////	옵션 선택시 공무원구분 출력 시작////////	
	$("#selOption1").on("change",function(){
	//	let keyword = $(this).val();
		let keyword = this.value;
		
		let currentPage = "1";
		
		if(currentPage ==""){
	    	  currentPage = "1";
	      }
		//json 오브젝트
	      let data = {
	         "keyword":keyword,
	         "currentPage":currentPage
	      };
	     
	      
	      $.ajax({
	  		url : "/cbs/admin/pbsvntlist",
	  		contentType : "application/json;charset=utf-8",
	  		data:JSON.stringify(data),
	  		type : "post",
	  		dataType : "json",
	  		success : function(result){
	  			let str = "";
	  			let pbsvntJobCd = "";
	  			$("#pbsvntlist").html("");
	  			$.each(result.content,function(idx,userVO){
	  				str += "<tr>";
	  				str += "<td>"+userVO.userCd+"</td>";				
	  				str += "<td>"+userVO.userNm+"</td>";
	  				str += "<td>"+userVO.telno+"</td>";
	  				str += "<td>"+userVO.emailAdres+"</td>";
	  				if(userVO.publicServantVO.pbsvntJobCd == "PPJC1"){
	  					pbsvntJobCd = "행정공무원";
	  				}else if(userVO.publicServantVO.pbsvntJobCd == "PPJC2"){
	  					pbsvntJobCd = "검역공무원";
	  				}else {
	  					pbsvntJobCd = "보세창고공무원";
	  				}
	  				str += "<td>"+pbsvntJobCd+"</td>";
	  				str += "</tr>";
	  				
	  			});
	  			$("#pbsvntlist").append(str);
	  			$('#divPaging').html(result.pagingArea);
	  			
	  		}
	  	}); 
	  });
/////	옵션 선택시 공무원구분 출력 끝////////	      

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
	      
	      $.ajax({
		  		url : "/cbs/admin/pbsvntlist",
		  		contentType : "application/json;charset=utf-8",
		  		data:JSON.stringify(data),
		  		type : "post",
		  		dataType : "json",
		  		success : function(result){
		  			let str = "";
		  			let pbsvntJobCd = "";
		  			$("#pbsvntlist").html("");
		  			$.each(result.content,function(idx,userVO){
		  				console.log("!userVO확인!",userVO);
		  				str += "<tr>";
		  				str += "<td>"+userVO.userCd+"</td>";				
		  				str += "<td>"+userVO.userNm+"</td>";
		  				str += "<td>"+userVO.telno+"</td>";
		  				str += "<td>"+userVO.emailAdres+"</td>";
		  				if(userVO.publicServantVO.pbsvntJobCd == "PPJC1"){
		  					pbsvntJobCd = "행정공무원";
		  				}else if(userVO.publicServantVO.pbsvntJobCd == "PPJC2"){
		  					pbsvntJobCd = "검역공무원";
		  				}else {
		  					pbsvntJobCd = "보세창고공무원";
		  				}
		  				str += "<td>"+pbsvntJobCd+"</td>";
		  				str += "</tr>";
		  				
		  			});
		  			$("#pbsvntlist").append(str);
		  			$('#divPaging').html(result.pagingArea);
		  			
		  		}
		  	}); 
	});
//////키워드 검색 , 페이징 끝///////		

	
/////	기본 리스트 출력////////	
	let currentPage = "${param.currentPage}";
	let keyword = $(this).val();
    console.log("keyword : " + keyword);
    
    if(currentPage ==""){
  	  currentPage = "1";
    }
	
  //json 오브젝트
  let data = {
	       "keyword":keyword,
	       "currentPage":currentPage
	    };
	    console.log(data);
  
	$.ajax({
		url : "/cbs/admin/pbsvntlist",
		contentType : "application/json;charset=utf-8",
		data:JSON.stringify(data),
		type : "post",
		dataType : "json",
		success : function(result){
			let str = "";
			let pbsvntJobCd = "";
			$.each(result.content,function(idx,userVO){
				console.log("!userVO확인!",userVO);
				str += `<tr>
				           <td>\${userVO.userCd}</td>				
				           <td>\${userVO.userNm}</td>
				           <td>\${userVO.telno}</td>
				           <td>\${userVO.emailAdres}</td>`;
				if(userVO.publicServantVO.pbsvntJobCd == "PPJC1"){
					pbsvntJobCd = "행정공무원";
				}else if(userVO.publicServantVO.pbsvntJobCd == "PPJC2"){
					pbsvntJobCd = "검역공무원";
				}else {
					pbsvntJobCd = "보세창고공무원";
				}
				str += `<td>\${pbsvntJobCd}</td>
				      </tr>`;
				
			});
			$("#pbsvntlist").append(str);
			$('#divPaging').html(result.pagingArea);
			
		}
	}); 
});
</script>
<body>
<div class="card h-50">
	<div class="card-body">
		<h3>공무원 조회</h3>
		<div id="tableExample4">
		<!-- ///검색 시작 /// -->
			<div class="input-group mb-3 w-25 ms-auto p-2 bd-highlight ">
			<div class="col-auto" style="width: 200px; position: relative; right: 220px; top: 51px;">
    				<select class="form-select form-select-sm mb-3" id="selOption1">
        				<option selected value="">전체</option>
	        				<option value="PPJC1">행정공무원</option>
	        				<option value="PPJC2">검역공무원</option>
	        				<option value="PPJC3">보세창고공무원</option>
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
	                  <th scope="col">공무원코드</th>
	                  <th scope="col">이름</th>
	                  <th scope="col">전화번호</th>
	                  <th scope="col">이메일주소</th>
	                  <th scope="col">담당</th>
	                </tr>
				</thead>
	            <tbody id="pbsvntlist">
	            <%-- ajax 사용 List 채워짐 --%>
				</tbody>
			</table>
		<div class="col-auto px-3" id="divPaging"></div>
	</div>
	</div>
</div>
</div>
</body>
