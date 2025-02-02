<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="/resources/js/sweetalert2.min.js"></script>
<link rel="stylesheet" href="/resources/css/sweetalert2.min.css">
<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>

<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<script src="/resources/js/jquery.min.js"></script>
<style type="text/css">
th, td { text-align: center !important; }

.modal-dialog-center {
    display: flex;
    align-items: center;
    min-height: 100vh;
}
    #ims {
        max-width: 100%;
        height: auto;
    }

    
.input-group.aa-1.w-100 {
    padding-top: 40px;
}
.guide_box {
    border: 1px solid #d3d3d3;
    background-color: #f7f7f7;
    padding: 25px;
    margin-bottom: 25px;
    position: relative;
    color: #6b6b6b;
}
h1 span {
    font-size: 24px;
    font-weight: 500;
    color: #333;
    display: inline-block;
    padding: 10px 15px;
}
h1 {
    display: block;
    font-size: 2em;
    margin-block-start: 0.67em;
    margin-block-end: 0.67em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
    font-weight: bold;
    unicode-bidi: isolate;
}
 h1 {
    text-align: left;
    margin-top: 10px;
    margin-bottom: 20px;
    position: relative;
    border-bottom: 2px solid #333333;
}
</style>
<script>
$(document).ready(function() {
    $("#pick").click(function() {
        let selectedData = [];
        let userID = $('#userID').val();
        console.log(userID);
        let checkedBoxes = $("input[name='chkBox']:checked");
        
        if (checkedBoxes.length === 0) {
        	Swal.fire("선택된 항목이 없습니다.", "", "warning");
            return;
        }
        $("input[name='chkBox']:checked").each(function() {
            let entrManageNo = $(this).closest("tr").find("#entrManageNo").text();
            let qrantRequestCd = $(this).closest("tr").find("#qrantRequestCd").text();
            selectedData.push({ entrManageNo: entrManageNo, qrantRequestCd: qrantRequestCd, id : userID });
        });
        console.log("selectedData", selectedData);
		Swal.fire({
			title: "항목 배정",
			text: '선택한 항목을 배정하시겠습니까?',
			icon: 'question',
			showCancelButton: true,
			confirmButtonText: "완료",
			confirmButtonColor: '#3085d6',
			cancelButtonText: "닫기"
		}).then((result) => {
			if(result.isConfirmed){
				
			////////////////////////////////통관 처리상태 update//////////////////////////////
			 $.ajax({
                url: "/cbs/quar/entAssignUpdate",
                type: "post",
                data: JSON.stringify(selectedData),
                contentType: "application/json",
                dataType: "text",
                success: function(result) {
                    console.log("entAssignUpdate result확인");

                },
            });
			////////////////////////////검사검역 배정////////////////////////////
            $.ajax({
                url: "/cbs/quar/quarAssignUpdate",
                type: "post",
                data: JSON.stringify(selectedData),
                contentType: "application/json",
                dataType: "text",
                success: function(result) {
                    console.log("quarAssignUpdate result확인");
                    console.log("quarAssignUpdate result: ", result);
                    swal('배정 성공', "선택된 항목들이 배정되었습니다.", 'success');
                },
            });
			if (result.isConfirmed) {
				Swal.fire({
				    title: "배정되었습니다.",
				    icon: "success",
				    confirmButtonColor: '#3085d6',
				    showConfirmButton: true
				}).then(function(result) {
					if (result.isConfirmed){
						
					location.href = "/cbs/quar/qlist";
					}
				});
				
			}
			};
    });
    });
});
    
    
    
    
/* function fillModal(data) {
    var modalBody = $("#QuarAssignModal").find(".modal-body");
    modalBody.empty();
    var table = $("<table class='table'></table>");
    var thead = "<thead><tr><th>통관관리번호</th><th>검역요청코드</th><th>상품번호</th><th>물품명</th><th>검역요청장소</th><th>검역요청일</th></tr></thead>";
    table.append(thead);
    var tbody = $("<tbody></tbody>");
    for (var i = 0; i < data.length; i++) {
        var row = $("<tr></tr>");
        row.append("<td>" + data[i][2] + "</td>"); // 통관관리번호
        row.append("<td>" + data[i][3] + "</td>"); // 검역요청코드
        row.append("<td>" + data[i][4] + "</td>"); // 상품번호
        row.append("<td>" + data[i][5] + "</td>"); // 물품명
        row.append("<td>" + data[i][6] + "</td>"); // 검역요청장소
        row.append("<td>" + data[i][7] + "</td>"); // 검역요청일
        tbody.append(row);
    }
    table.append(tbody);
    modalBody.append(table);
} */
	
	$(function(){
///////////////////////////////////////////검색 리스트/////////////////////////////////////////////
		$("#searchBtn").on("click", function () {
			searchBtn();
		});
		function searchBtn (){
			keyword = $("#keyword").val();
			searchList = $("#searchList").val();
			let userID = $('#userID').val();
			
			 let currentPage = "${param.currentPage}";

			    if (currentPage == "") {
			        currentPage = "1";
			    }else {
			        currentPage = "1";
						}
			    
			    
			    let data = {
			    		"searchList":searchList,
				 	       "keyword":keyword,
				 	       "currentPage":currentPage
				 	    };
				 	    //console.log(data);

				 	   $.ajax({
				 		    url: "/cbs/quar/quarStartList",
				 		    contentType: "application/json;charset=utf-8",
				 		    data: JSON.stringify(data),
				 		    type: "post",
				 		    dataType: "json",
				 		    success: function(result) {
				 		        //console.log("List 체크: ", result);
				 		        console.log("result.content 체크: ", result.content);

				 		        let str = "";
				 		        $.each(result.content, function(idx, quarantineRequestVO) {
				 		            //console.log("quarantineRequestVO[" + idx + "]", quarantineRequestVO.qrantRequestCd);
				 		            str += "<tr>";
									str += "<td class='align-middle'><input class='form-check-input' name='chkBox' id='chkBox' type='checkbox'/></td>";
				 		            if (quarantineRequestVO.userNm == null) {
				 		        	    str += "<td class='align-middle'><span class='badge badge-phoenix badge-phoenix-secondary'>배정 대기</span></td>";
				 		        	} else{
				 		        		str += "<td class='align-middle'><span class='badge badge-phoenix badge-phoenix-success'>" + quarantineRequestVO.userNm + "</span></td>";
				 		        	}
				 		            str += "<td scope='row' id='entrManageNo' class='align-middle'>" + quarantineRequestVO.entrManageNo + "</td>";
				 		            str += "<td id='qrantRequestCd' class='align-middle'>" + quarantineRequestVO.qrantRequestCd + "</td>";
				 		            str += "<td class='align-middle'>" + quarantineRequestVO.goodsNo + "</td>";
				 		            str += "<td class='align-middle'>" + quarantineRequestVO.thingNm + "</td>";
				 		            str += "<td class='align-middle'>" + quarantineRequestVO.requstPlace + "</td>";
				 		            str += "<td class='align-middle'>" + quarantineRequestVO.requstDe + "</td>";
				 		            if (quarantineRequestVO.qrantResultAt == "N") {
				 		        	    str += "<td class='align-middle'><span class='badge badge-phoenix badge-phoenix-secondary'>" + quarantineRequestVO.qrantResultAt + "</span></td>";
				 		        	} else if(quarantineRequestVO.qrantResultAt == "Y"){
				 		        	    str += "<td class='align-middle'><span class='badge badge-phoenix badge-phoenix-success'>" + quarantineRequestVO.qrantResultAt + "</span></td>";
				 		        	}
				 		            
				 		            str += "</tr>";
				 		        });
				 		       $('#quartable').empty();
				 		        $("#quartable").append(str);
				 		       $('#divPaging').html(result.pagingArea);
				 		    }
				 		});
		}
		
		
		
		
////////////////////////////////////////////기본리스트///////////////////////////////////
		let currentPage = "${param.currentPage}";
		let keyword = $(this).val();
		let userCd = "";
	    
	    if(currentPage ==""){
	  	  currentPage = "1";
	    } 
	    
	    let data = {
	 	       "keyword":keyword,
	 	       "currentPage":currentPage
	 	    };
	 	    //console.log(data);

	 	   $.ajax({
	 		    url: "/cbs/quar/quarStartList",
	 		    contentType: "application/json;charset=utf-8",
	 		    data: JSON.stringify(data),
	 		    type: "post",
	 		    dataType: "json",
	 		    success: function(result) {
	 		        //console.log("List 체크: ", result);
	 		        console.log("result.content 체크: ", result.content);

	 		        let str = "";
	 		        $.each(result.content, function(idx, quarantineRequestVO) {
	 		            //console.log("quarantineRequestVO[" + idx + "]", quarantineRequestVO.qrantRequestCd);
	 		            str += "<tr>";
						str += "<td class='align-middle'><input class='form-check-input' name='chkBox' id='chkBox' type='checkbox'/></td>";
	 		            if (quarantineRequestVO.userNm == null) {
	 		        	    str += "<td class='align-middle'><span class='badge badge-phoenix badge-phoenix-secondary'>배정 대기</span></td>";
	 		        	} else{
	 		        		str += "<td class='align-middle'><span class='badge badge-phoenix badge-phoenix-success'>" + quarantineRequestVO.userNm + "</span></td>";
	 		        	}
	 		            str += "<td scope='row' id='entrManageNo' class='align-middle'>" + quarantineRequestVO.entrManageNo + "</td>";
	 		            str += "<td id='qrantRequestCd' class='align-middle'>" + quarantineRequestVO.qrantRequestCd + "</td>";
	 		            str += "<td class='align-middle'>" + quarantineRequestVO.goodsNo + "</td>";
	 		            str += "<td class='align-middle'>" + quarantineRequestVO.thingNm + "</td>";
	 		            str += "<td class='align-middle'>" + quarantineRequestVO.requstPlace + "</td>";
	 		            str += "<td class='align-middle'>" + quarantineRequestVO.requstDe + "</td>";
	 		            if (quarantineRequestVO.qrantResultAt == "N") {
	 		        	    str += "<td class='align-middle'><span class='badge badge-phoenix badge-phoenix-secondary'>" + quarantineRequestVO.qrantResultAt + "</span></td>";
	 		        	} else if(quarantineRequestVO.qrantResultAt == "Y"){
	 		        	    str += "<td class='align-middle'><span class='badge badge-phoenix badge-phoenix-success'>" + quarantineRequestVO.qrantResultAt + "</span></td>";
	 		        	}
	 		            
	 		            str += "</tr>";
	 		        });
	 		        $("#quartable").append(str);
	 		       $('#divPaging').html(result.pagingArea);
	 		    }
	 		});
	})
	function selectAll(selectAll) {
	//console.log("나 눌렀엉?");
	const checkboxes = document.getElementsByName("chkBox");
	checkboxes.forEach((checkbox) => {
		if(checkbox.disabled) return;
		checkbox.checked = selectAll.checked; 
	});
}

</script>
</head>
<body>
	<div class="card h-50">
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
               <h3 class="fs18 pc_black">검사/검역 배정</h3>
               <p>이 페이지는 <span style="color:#155eb6;"><b>검사검역을 진행할 물품을 배정</b></span>하는 페이지입니다.<br>기타 궁금하신 점은 관세청 콜센터 125번으로 문의하시기 바랍니다.</p>
           </div>
           <div style="clear:both;"></div>
       </div>
   </div>
		<div class="card-body">
			<!-- ####################################검색 조건################################################ -->
<div class="input-group aa-1 w-100" style="display: flex; justify-content: space-between;">
    <div style="flex: 0.8;"></div> <!-- 여백 -->
    <div style="flex: 0.15;">
        <select class="form-select1 form-select-sm h-100 form-select" id="searchList" style="width: 100%;">
            <option value="" selected>전체검색</option>
            <option value="Q.ENTR_MANAGE_NO">통관관리번호</option>
            <option value="Q.QRANT_REQUEST_CD">검역요청코드</option>
            <option value="Q.GOODS_NO">상품번호</option>
            <option value="E.THING_NM">물품명</option>
            <option value="Q.REQUST_PLACE">검역요청장소</option>
            <option value="Q.REQUST_DE">검역요청일</option>
            <option value="Q.QRANT_RESULT_AT">검역검사여부</option>
        </select>
    </div>
    <div class="input-group" style="flex: 0.4;">
        <input class="form-control" id="keyword" type="text">
        <button class="btn btn-primary btn-sm" type="button" id="searchBtn">검색</button>
    </div>
</div>
			<!-- ####################################검색 조건################################################ -->
			<br>
			 <sec:authorize access="isAuthenticated()">
        <sec:authentication property="principal.userVO" var="user" />
        	<input type="hidden" id="userID" value="<sec:authentication property='principal.username'/>">
     </sec:authorize>

			<div id="tableExample4"
				data-list='{"valueNames":["검역전","검역완료"],"filter":{"key":"payment"}}'>
	
				<!-- ===========================검색==================================== -->

				<div class="table-responsive">
					<table class="table table-sm fs-9 mb-0" style="text-align: center;">
						<thead>
							<tr class="bg-body-highlight">
								<th><input class='form-check-input' name='checkbox1' type='checkbox' onclick='selectAll(this)'/></th>
								<th>배정 상태</th>
								<th>통관관리번호</th>
								<th>검역요청코드</th>
								<th>상품번호</th>
								<th>물품명</th>
								<th>검역요청장소</th>
								<th>검역요청일</th>
								<th>검사검역여부</th>
							</tr>
						</thead>
						<tbody id="quartable" class="list">
							<%-- ajax 사용 List 채워짐 --%>
						</tbody>
					</table>
				</div>
				<br>
				<div id="divPaging"></div>
				<div class="d-flex justify-content-end"> <!-- 버튼을 테이블 오른쪽 아래로 이동시킴 -->
					<button class="btn btn-primary px-5 me-2" type="button" id="pick">배정</button>
				</div>
			</div>
		</div>
	</div>
</body>
<!-- ////////////////////////////////////////////////배정 모달//////////////////////////////////////////// -->
<div class="modal fade" id="QuarAssignModal" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog modal-dialog-center modal-dialog-scrollable">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">검사 검역 배정</h5>
                <button class="btn p-1" type="button" data-bs-dismiss="modal" aria-label="Close">
                    <span class="fas fa-times fs-9"></span>
                </button>
            </div>

            <div class="modal-body text-center"">
				<h5>선택된 항목을 배정하겠습니까?</h5>
            </div>
            <div class="modal-footer">
                <button class="btn btn-primary" type="button" data-bs-dismiss="modal" id="QuarAssign" >확인</button>
                <button class="btn btn-outline-primary" type="button" data-bs-dismiss="modal">닫기</button>
            </div>
        </div>
    </div>
</div>

