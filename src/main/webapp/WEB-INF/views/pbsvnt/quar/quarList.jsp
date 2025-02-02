<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="/resources/js/jquery.min.js"></script>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<style>
.det { width: 1350px; height:770px; !important; left: -300px; }
    #ims {
        max-width: 100%;
        height: auto;
    }
.input-group.aa-1.w-100 {
    padding-top: 40px;
}
</style>
<script type="text/javascript">

	$(function() {
		
		
		////////////////////////////////////모달 컨트롤/////////////////////////////////////
		$('.modal').on('hidden.bs.modal', function () {
		    console.log('modal close');
		});
		var qSe ="";
///////////////////////////////////////////////////////////////////////////검역 실행 클릭/////////////////////////////////////////////////////////
		$(document).on("click", "#quarTag", function() {
			
			$('#myTab').empty();
			var checkBtn = $(this);
			var tr = checkBtn.parent().parent();    
			var td = tr.children();
			
// 			console.log("클릭한 Row의 모든 데이터 : "+tr.text());
			
			var no = td.eq(2).text();
 			console.log("클릭한 Row의 데이터 : "+no);
			
/* 			let qrantRequestCd = $(this).document.querySelector("#qrantRequestCd").text;
			console.log("qrantRequestCd: ",qrantRequestCd); */
			let data = {
					qrantRequestCd : no
			};//아작스로 보낼때 문자로 보내지 않고 제이슨으로 보내기 때문에 
			$.ajax({
				url : "/cbs/quar/quarReady",
				type : "post",
				data : JSON.stringify(data),
				contentType : "application/json",
				dataType : "json",
				success : function(result) {
 					console.log("검역 실행 눌렀을때 result", result);

// 					console.log("qrantRequestCd: ", data.qrantRequestCd);
// 					console.log("qrantRequestCd: ", result.qrantRequestCd);
// 					console.log("requstPlace: ", result.requstPlace);
// 					console.log("entrManageNo: ", result.entrManageNo);

					var qCode = result.qrantRequestCd;
					var qPlace = result.requstPlace;
					var eCode = result.entrManageNo;
					var cstmrCode = result.cstmrCd;
					var gosNo = result.goodsNo;
					var qDate = result.requstDe;
					qSe = result.qrantSe;
					var tDetailedTab = document.getElementById("tDetailed");
					var tSensualityTab = document.getElementById("tSensuality");
					var tClinicalTab = document.getElementById("tClinical");
                    var navUl = document.getElementById("myTab");
                    $('#tab-detailed').removeClass('active');    
                    $('#tab-sensuality').removeClass('active');    
                    $('#tab-clinical').removeClass('active');    
					
                    // 검사 항목 확인
                    if (qSe=="1") { //1, 12, 123
                    	console.log("1만 있다");
                        // HTML 코드 문자열 생성
                        
                        var htmlCode = '<li class="nav-item" role="presentation" id="tDetailed">' +
                                       '<a class="nav-link ml-2 active" id="detailed" data-bs-toggle="tab" href="#tab-detailed" role="tab" aria-controls="tab-detailed" aria-selected="true">정밀검사</a>' +
                                       '</li>';
                        // HTML 코드를 ul 요소에 추가
                        navUl.innerHTML = htmlCode;
                        document.getElementById("tab-detailed").classList.add('active');
                    }
                    if (qSe=="2") { //1, 12, 123
                    	console.log("2만 있다");
                        // HTML 코드 문자열 생성
                        var htmlCode = '<li class="nav-item" role="presentation" id="tSensuality">' +
                                       '<a class="nav-link ml-2 active" id="sensuality" data-bs-toggle="tab" href="#tab-sensuality" role="tab" aria-controls="tab-sensuality" aria-selected="true">관능검사</a>' +
                                       '</li>';
                        // HTML 코드를 ul 요소에 추가
                        navUl.innerHTML = htmlCode;
                        document.getElementById("tab-sensuality").classList.add('active');
                    }
                    if (qSe=="3") { //1, 12, 123
                    	console.log("3만 있다");
                    
                        // HTML 코드 문자열 생성
                        var htmlCode = '<li class="nav-item" role="presentation" id="tClinical">' +
                                       '<a class="nav-link ml-2 active" id="clinical" data-bs-toggle="tab" href="#tab-clinical" role="tab" aria-controls="tab-clinical" aria-selected="true">임상검사</a>' +
                                       '</li>';
                        // HTML 코드를 ul 요소에 추가
                        navUl.innerHTML = htmlCode;
                        document.getElementById("tab-clinical").classList.add('active');
                    }
                    if (qSe=="12") { //1, 12
                    	console.log("12 있다");
                        // HTML 코드 문자열 생성
                        var htmlCode = '<li class="nav-item" role="presentation" id="tDetailed">' +
                                       '<a class="nav-link ml-2 active" id="detailed" data-bs-toggle="tab" href="#tab-detailed" role="tab" aria-controls="tab-detailed" aria-selected="true">정밀검사</a>' +
                                       '</li>' +
                                       '<li class="nav-item" role="presentation" id="tSensuality">' +
                                       '<a class="nav-link ml-2" id="sensuality" data-bs-toggle="tab" href="#tab-sensuality" role="tab" aria-controls="tab-sensuality aria-selected="true">관능검사</a>' +
                                       '</li>';
                        // HTML 코드를 ul 요소에 추가
                        navUl.innerHTML = htmlCode;
                        document.getElementById("tab-detailed").classList.add('active');
                    }
                    if (qSe=="13") { //1, 12
                    	console.log("13 있다");
                        // HTML 코드 문자열 생성
                        var htmlCode = '<li class="nav-item" role="presentation" id="tDetailed">' +
                                       '<a class="nav-link ml-2 active" id="detailed" data-bs-toggle="tab" href="#tab-detailed" role="tab" aria-controls="tab-detailed" aria-selected="true">정밀검사</a>' +
                                       '</li>' +
                                       '<li class="nav-item" role="presentation" id="tClinical">' +
                                       '<a class="nav-link ml-2" id="clinical" data-bs-toggle="tab" href="#tab-clinical" role="tab" aria-controls="tab-clinical aria-selected="true">임상검사</a>' +
                                       '</li>';
                        // HTML 코드를 ul 요소에 추가
                        navUl.innerHTML = htmlCode;
                        document.getElementById("tab-detailed").classList.add('active');
                    }
                    if (qSe=="23") { //1, 12
                    	console.log("23 있다");
                        // HTML 코드 문자열 생성
                        var htmlCode = '<li class="nav-item" role="presentation" id="tSensuality">' +
                                       '<a class="nav-link ml-2 active" id="sensuality" data-bs-toggle="tab" href="#tab-sensuality" role="tab" aria-controls="tab-sensuality" aria-selected="true">관능검사</a>' +
                                       '</li>' +
                                       '<li class="nav-item" role="presentation" id="tClinical">' +
                                       '<a class="nav-link ml-2" id="clinical" data-bs-toggle="tab" href="#tab-clinical" role="tab" aria-controls="tab-clinical aria-selected="true">임상검사</a>' +
                                       '</li>';
                        // HTML 코드를 ul 요소에 추가
                        navUl.innerHTML = htmlCode;
                        document.getElementById("tab-sensuality").classList.add('active');
                    }
                    if (qSe=="123") { //1, 12
                    	console.log("123 있다");
                        // HTML 코드 문자열 생성
                        var htmlCode = '<li class="nav-item" role="presentation" id="tDetailed">' +
                                       '<a class="nav-link ml-2 active" id="detailed" data-bs-toggle="tab" href="#tab-detailed" role="tab" aria-controls="tab-detailed" aria-selected="true">정밀검사</a>' +
                                       '</li>' +
                                       '<li class="nav-item" role="presentation" id="tSensuality">' +
                                       '<a class="nav-link ml-2" id="sensuality" data-bs-toggle="tab" href="#tab-sensuality" role="tab" aria-controls="tab-sensuality aria-selected="true">관능검사</a>' +
                                       '</li>'+
                                       '<li class="nav-item" role="presentation" id="tClinical">' +
                                       '<a class="nav-link ml-2" id="clinical" data-bs-toggle="tab" href="#tab-clinical" role="tab" aria-controls="tab-clinical aria-selected="true">임상검사</a>' +
                                       '</li>';
                        // HTML 코드를 ul 요소에 추가
                        navUl.innerHTML = htmlCode;
                        document.getElementById("tab-detailed").classList.add('active');
                    }

					$('input[id=qrantRequestCd]').attr('value', qCode);
					$('input[id=requstPlace]').attr('value', qPlace);
					$('input[id=requstDate]').attr('value', qDate);
					$('input[id=entrManageNo]').attr('value', eCode);
					$('input[id=cstmrCode]').attr('value', cstmrCode);
					$('input[id=goodsNo]').attr('value', gosNo);

				}
			});
			
		});
		//////////////////////////////////////////////////////////////////////검사검역 저장////////////////////////////////////////////////////
		$(document).on("click", "#qInsert", function() {
			console.log("11111111: ",document.querySelector("input[id=qrantRequestCd]").value);
			
	        let familyArr = [];
	        let famElement = $("#myTabContent #fam");
	        let quarN = "부적합";
	        let quarY = "적합";
			console.log("famElement.length: ",famElement.length);
	        let isNullDetected = false;
	        let asd = document.querySelector("#koreanIndictMatter").value;
	        console.log("qSe: ",qSe);
	        
	        if (
	                document.querySelector("#qrantRequestCd").value === "" ||
	                document.querySelector("#entrManageNo").value === "" ||
	                document.querySelector("#cstmrCode").value === "" ||
	                document.querySelector("#packCondt").value === "" ||
	                document.querySelector("#itmAmo").value === "" 
	                	
	            ) {
	        	console.log("저장실패");
	        	swal('저장 실패', "입력되지 않은 항목이 있습니다.", 'warning');
	                isNullDetected = true;
	                return;
	            } else {
	            	console.log("222222: ",document.querySelector("input[id=qrantRequestCd]").value);
	                // null이 감지되지 않은 경우 familyArr에 추가
	                for (let i = 1; i < famElement.length + 1; i++) {
	                    let family = {
	                    	qrantRequestCd: document.querySelector("[id=qrantRequestCd]").value,
	                        entrManageNo: document.querySelector("[id=entrManageNo]").value,
	                        goodsNo: document.querySelector("[id=goodsNo]").value,
	                        cstmrCd: document.querySelector("[id=cstmrCode]").value,
	                        qrantSe: qSe,
	                        
                    		packCondt: document.querySelector("[id=packCondt]").value,
	                        itmAmo: document.querySelector("[id=itmAmo]").value,
	                        koreanIndictMatter: document.querySelector("[id=koreanIndictMatter]").value,
	                        cstdyCondt: document.querySelector("[id=cstdyCondt]").value,
	                        visualAbnorWhet: document.querySelector("[id=visualAbnorWhet]").value,
	                        decayDeteriWhet: document.querySelector("[id=decayDeteriWhet]").value,
	                        impurWhet: document.querySelector("[id=impurWhet]").value,
	                        inspctNote: document.querySelector("[id=inspctNote]").value,
	                        actAbnorWhet: document.querySelector("[id=actAbnorWhet]").value,
	                        etpSymp: document.querySelector("[id=etpSymp]").value,
	                        anatoSymp: document.querySelector("[id=anatoSymp]").value,
	                        detailCn: document.querySelector("[id=detailCn]").value,
	                        inspctAgen: document.querySelector("[id=requstPlace]").value,
	                        inspctDate: document.querySelector("[id=requstDate]").value,
	                        
	                        qrantIemNm: document.querySelector("[id=qrantIemNm" + i + "]").value,
	                        inspctSpcfct: document.querySelector("[id=inspctSpcfct" + i + "]").value,
	                        iemResult: document.querySelector("[id=iemResult" + i + "]").value,
	                        iemJudg: document.querySelector("[id=iemJudg" + i + "]").value
	                    };
	                    console.log("family.iemJudg",family.iemJudg);
	                    if(qSe.includes("1")){
	 	                    if (
	 	                    	family.qrantIemNm=="" || family.inspctSpcfct=="" ||
	 	                    	family.iemResult=="" || family.iemJudg=="선택"
	 	                    ) {
		        	        	console.log("저장실패");
		        	        	swal('저장 실패', "입력되지 않은 항목이 있습니다.", 'warning');
		        	            return;
		                    };
	                    };
	                    if(qSe.includes("2")){
	 	                    if (
	 	                    	family.packCondt=="선택" || family.itmAmo=="선택" ||
	 	                    	family.koreanIndictMatter=="선택" || family.cstdyCondt=="선택" ||
	 	                    	family.visualAbnorWhet=="선택" || family.decayDeteriWhet=="선택" ||
	 	                    	family.impurWhet=="선택" || family.inspctNote==""
	 	                    ) {
		        	        	console.log("저장실패");
		        	        	swal('저장 실패', "입력되지 않은 항목이 있습니다.", 'warning');
		        	            return;
		                    };
	                    };
	                    if(qSe.includes("3")){
	 	                    if (
	 	                    	family.actAbnorWhet=="선택" || family.etpSymp=="선택" ||
	 	                    	family.anatoSymp=="선택" || family.detailCn==""
	 	                    ) {
		        	        	console.log("저장실패");
		        	        	swal('저장 실패', "입력되지 않은 항목이 있습니다.", 'warning');
		        	            return;
		                    };
	                    };
	                    // 부적합이 있는지 확인
	                    if (Object.values(family).includes("부적합")) {
	                    	family.allQrantJudg = quarN;
	                    }else{
	                    	family.allQrantJudg = quarY;
	                    }
	                    //console.log("family: ", family);
	                    //console.log("family값 확인", family.inspctDate);
	                    familyArr.push(family);
	                    
	                }
	                //console.log("familyArr: ", familyArr);
	            }
		
	        
	            // null이 감지되지 않았으면 AJAX 호출
	            if (!isNullDetected) {
	                $.ajax({
	                    url: "/cbs/quar/quarInsert",
	                    type: "post",
	                    data: JSON.stringify(familyArr),
	                    contentType: "application/json",
	                    dataType: "text",
	                    success: function (result) {
	                        console.log("quarInsert result: ", result);
				            swal('저장 성공', "저장을 성공했습니다.", 'success')
 				            .then(function() {
				                location.reload(); // swal 창이 닫히면 페이지 새로고침
				            });
	                    },
	                });
	            }
	            
	            let qrantRequestCd = document.querySelector("#qrantRequestCd").value;
	            let entrManageNo = document.querySelector("#entrManageNo").value;
	            let userID = $('#userID').val();
	            console.log("goodsNo: ",goodsNo);
/* 	            console.log("cstmrCd: ",cstmrCd);
 */	            let data = {
	            		qrantRequestCd: qrantRequestCd,
	            		entrManageNo: entrManageNo,
	            		id: userID
	            };
	            console.log(data);
	            $.ajax({
	            	url: "/cbs/quar/quarUpdate",
	            	type: "post",
	            	data: JSON.stringify(data),
	            	contentType: "application/json",
	            	dataType: "json",
	            	success: function(result){
	            		console.log("업데이트 완료");
	            		console.log("여부 확인: ", result);
	            	}
	            })
	            		console.log("통관관리번호 확인",entrManageNo);
	            
	            	$.ajax({
	            	url: "/cbs/quar/quarStuUpdate",
	            	type: "post",
	            	data: JSON.stringify(data),
	            	contentType: "application/json",
	            	dataType: "json",
	            	success: function(result){
	            		console.log("처리상태 업데이트 완료");
	            	}
	            })
	            
	        });

		///////////////////////////////////////////////////////////////////////////상세 모달 기능/////////////////////////////////////////////////////////
		$(document).on("click", "#AqrantRequestCd", function() {
			$('#myTabDe').empty();
			
			var checkBtn = $(this);
			var tr = checkBtn.parent().parent();    
			var td = tr.children();
			
 			console.log("클릭한 Row의 모든 데이터 : "+tr.text());
			
			var no = td.eq(2).text();
// 			console.log("클릭한 Row의 데이터 : "+no);
			let data = {
					qrantRequestCd : no
			};
 			console.log("모달상세창 들어갈 코드" , data);
// 			console.log("ddd" , no);
			$.ajax({
				url : "/cbs/quar/quarReady",
				type : "post",
				data : JSON.stringify(data),
				contentType : "application/json",
				dataType : "json",
				success : function(result) {
 					console.log("모달상세창 체울 값", result);

// 					console.log("qrantRequestCd: ", data.qrantRequestCd);
// 					console.log("qrantRequestCd: ", result.qrantRequestCd);
// 					console.log("requstPlace: ", result.requstPlace);
// 					console.log("entrManageNo: ", result.entrManageNo);

					var qCode = result.qrantRequestCd;
					var qPlace = result.requstPlace;
					var eCode = result.entrManageNo;
					var cstmrCode = result.cstmrCd;
					var gosNo = result.goodsNo;
					var qDate = result.requstDe;

// 					console.log(qCode);
// 					console.log(qPlace);
// 					console.log(eCode);

					$('input[id=qrantRequestCd]').attr('value', qCode);
					$('input[id=requstPlace]').attr('value', qPlace);
					$('input[id=requstDate]').attr('value', qDate);
					$('input[id=entrManageNo]').attr('value', eCode);
					$('input[id=cstmrCode]').attr('value', cstmrCode);
					$('input[id=goodsNo]').attr('value', gosNo);

				}
			});
		});
		/////////////////////////////////////////////검색버튼 클릭////////////////////////////////////////////////
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

			    //json 오브젝트
			    let data = {
			        "searchList":searchList,
			        "keyword": keyword,
			        "id": userID,
			        "currentPage":currentPage
			    };
			    console.log("검색조건 확인",data);
			    
			    $.ajax({
			        url: "/cbs/quar/quarList",
			        contentType: "application/json;charset=utf-8",
			        data: JSON.stringify(data),
			        type: "post",
			        dataType: "json",
			        success: function (result) {
			            console.log("result : ", result);
		 		        let str = "";
		 		        $.each(result.content, function(idx, quarantineRequestVO) {
		 		            //console.log("quarantineRequestVO[" + idx + "]", quarantineRequestVO.qrantRequestCd);
		 		            str += "<tr>";
		 		            if (quarantineRequestVO.allQrantJudg == null) {
		 		                str += "<td><span class='badge badge-phoenix badge-phoenix-secondary'>시행전</span></td>";
		 		            } else if(quarantineRequestVO.allQrantJudg == "적합"){
		 		                str += "<td><span class='badge bg-success'>" + quarantineRequestVO.allQrantJudg + "</span></td>";
		 		            } else if(quarantineRequestVO.allQrantJudg == "부적합"){
		 		            	str += "<td><span class='badge bg-danger'>" + quarantineRequestVO.allQrantJudg + "</span></td>";
		 		            }
		 		            str += "<td scope='row'>" + quarantineRequestVO.entrManageNo + "</td>";
		 		            str += "<td><a href='#' class='detailNo' id='AqrantRequestCd' data-bs-toggle='modal' data-bs-target='#QuarDetailModal'>" + quarantineRequestVO.qrantRequestCd + "</td>";
		 		            str += "<td>" + quarantineRequestVO.goodsNo + "</td>";
		 		            str += "<td>" + quarantineRequestVO.thingNm + "</td>";
		 		            str += "<td>" + quarantineRequestVO.requstPlace + "</td>";
		 		            str += "<td>" + quarantineRequestVO.requstDe + "</td>";
		 		            if (quarantineRequestVO.qrantResultAt == "N") {
		 		        	    str += "<td><span class='badge badge-phoenix badge-phoenix-secondary'>" + quarantineRequestVO.qrantResultAt + "</span></td>";
		 		        	    str += "<td><button type='button' class='btn btn-sm btn-outline-primary' data-bs-toggle='modal' data-bs-target='#QuarModal' autocomplete='off' id='quarTag'>검역 실행</button></td>";
		 		        	} else if(quarantineRequestVO.qrantResultAt == "Y"){
		 		        	    str += "<td><span class='badge badge-phoenix badge-phoenix-success'>" + quarantineRequestVO.qrantResultAt + "</span></td>";
		 		        	    str += "<td><button type='button' class='btn btn-sm btn-secondary' disabled data-bs-toggle='modal' data-bs-target='#QuarModal' autocomplete='off' id='quarTag'>검역 완료</button></td>";
		 		        	}
		 		            
		 		            str += "</tr>";
		 		        });
//		 	            console.log("str : " + str);
			            // 기존 리스트 삭제
			            $('#quartable').empty();
			            // 데이터 추가
			            $("#quartable").append(str);
			            // 페이징 영역 업데이트
			            $('#divPaging').html(result.pagingArea);
			        }
			    });
			}
		
	////////////////////////////////////////////////////////기본 리스트 출력/////////////////////////////////////////////////	
	
 		let currentPage = "${param.currentPage}";
		let keyword = $(this).val();
		let userID = $('#userID').val();

	    
	    if(currentPage ==""){
	  	  currentPage = "1";
	    } 
	    
	    let data = {
	 	       "keyword":keyword,
	 	       "currentPage":currentPage,
		        "id": userID
	 	    };
	 	    console.log(data);

	 	   $.ajax({
	 		    url: "/cbs/quar/quarList",
	 		    contentType: "application/json;charset=utf-8",
	 		    data: JSON.stringify(data),
	 		    type: "post",
	 		    dataType: "json",
	 		    success: function(result) {
	 		        console.log("List 체크: ", result);
	 		        console.log("result.content 체크: ", result.content);

	 		        let str = "";
	 		        $.each(result.content, function(idx, quarantineRequestVO) {
	 		            //console.log("quarantineRequestVO[" + idx + "]", quarantineRequestVO.qrantRequestCd);
	 		            str += "<tr>";
	 		            if (quarantineRequestVO.allQrantJudg == null) {
	 		                str += "<td class='align-middle'><span class='badge badge-phoenix badge-phoenix-secondary'>시행전</span></td>";
	 		            } else if(quarantineRequestVO.allQrantJudg == "적합"){
	 		                str += "<td class='align-middle'><span class='badge bg-success'>" + quarantineRequestVO.allQrantJudg + "</span></td>";
	 		            } else if(quarantineRequestVO.allQrantJudg == "부적합"){
	 		            	str += "<td class='align-middle'><span class='badge bg-danger'>" + quarantineRequestVO.allQrantJudg + "</span></td>";
	 		            }
	 		            str += "<td scope='row' class='align-middle'>" + quarantineRequestVO.entrManageNo + "</td>";
	 		            str += "<td class='align-middle'><a href='#' class='detailNo' id='AqrantRequestCd' data-bs-toggle='modal' data-bs-target='#QuarDetailModal'>" + quarantineRequestVO.qrantRequestCd + "</td>";
	 		            str += "<td class='align-middle'>" + quarantineRequestVO.goodsNo + "</td>";
	 		            str += "<td class='align-middle'>" + quarantineRequestVO.thingNm + "</td>";
	 		            str += "<td class='align-middle'>" + quarantineRequestVO.requstPlace + "</td>";
	 		            str += "<td class='align-middle'>" + quarantineRequestVO.requstDe + "</td>";
	 		            if (quarantineRequestVO.qrantResultAt == "N") {
	 		        	    str += "<td class='align-middle'><span class='badge badge-phoenix badge-phoenix-secondary'>" + quarantineRequestVO.qrantResultAt + "</span></td>";
	 		        	    str += "<td class='align-middle'><button type='button' class='btn btn-sm btn-outline-primary' data-bs-toggle='modal' data-bs-target='#QuarModal' autocomplete='off' id='quarTag'>검역 실행</button></td>";
	 		        	} else if(quarantineRequestVO.qrantResultAt == "Y"){
	 		        	    str += "<td class='align-middle'><span class='badge badge-phoenix badge-phoenix-success'>" + quarantineRequestVO.qrantResultAt + "</span></td>";
	 		        	    str += "<td class='align-middle'><button type='button' class='btn btn-sm btn-secondary' disabled data-bs-toggle='modal' data-bs-target='#QuarModal' autocomplete='off' id='quarTag'>검역 완료</button></td>";
	 		        	}
	 		            
	 		            str += "</tr>";
	 		        });
	 		        $("#quartable").append(str);
	 		       $('#divPaging').html(result.pagingArea);
	 		    }
	 		});
				

//############################################################quarDetailList########################################################################################
				$(document).on("click", ".detailNo", function() {
				$('#quarDetailTable').empty(); // 세 번째 테이블 초기화
				$('#myTabDe').empty();
				
       			var tr = $(this);        
				let qrantRequestCd = tr.text();
				console.log("현재 누른 값: ", qrantRequestCd);
				console.log("상세 qSe: ", qSe);
				var navUl = document.getElementById("myTabDe");
				
				let data = {
						qrantRequestCd : qrantRequestCd
				};
				console.log("data: ", data);
				
				$.ajax({
					url : "/cbs/quar/quarDetailList",
					data : JSON.stringify(data),
					contentType : "application/json",
					type : "post",
					async: false,
					dataType : "json",
					success : function(result) {
						document.getElementById("tab-Dedetailed").classList.remove('active');
                        document.getElementById("tab-Desensuality").classList.remove('active');
                        document.getElementById("tab-Declinical").classList.remove('active');
						console.log("상세모달 result: ", result);
						var se = result[0].qrantSe;
						console.log("상세모달 result.qrantSe: ", se);
						let str = "";
						if(se.includes("1")){
							
						$.each(result,function(idx, quarantineItemVO) {
											console.log("quarantineItemVO["+ idx + "]", quarantineItemVO.qrantRequestCd);
											str += "<tr>";
											str += "<td>"+ quarantineItemVO.qrantIemNm + "</td>";
											str += "<td>" + quarantineItemVO.inspctSpcfct + "</td>";
											str += "<td>"+ quarantineItemVO.iemResult + "</td>";
											str += "<td>" + quarantineItemVO.iemJudg + "</td>";
											str += "</tr>";
										});
						$("#quarDetailTable").html(str);
						}
						
						if(se.includes("2")){
							
						let desensuality = "<tr><td>"+result[0].packCondt+"</td><td>"
											+ result[0].itmAmo + "</td><td>"
											+ result[0].koreanIndictMatter + "</td><td>" 
											+ result[0].cstdyCondt + "</td><td>" 
											+ result[0].visualAbnorWhet + "</td><td>" 
											+ result[0].decayDeteriWhet + "</td><td>" 
											+ result[0].impurWhet + "</td><td>" 
											+ result[0].inspctNote + "</td><td>" 
						$("#quarDesensualityTable").html(desensuality);
						}
						
						console.log("상세에 넣기위한 값 체크: ", result[0].actAbnorWhet);
						
						if(se.includes("3")){
							
						let declinical = "<tr><td>"+result[0].actAbnorWhet+"</td><td>"
											+ result[0].etpSymp + "</td><td>"
											+ result[0].anatoSymp + "</td><td>" 
											+ result[0].detailCn + "</td></tr>";
						$("#quarDeclinicalTable").html(declinical);
						}
						
	                    // 검사 항목 확인
	                    if (se=="1") { //1, 12, 123
	                    	console.log("1만 있다");
	                        // HTML 코드 문자열 생성
	                        var htmlCode = '<li class="nav-item" role="presentation">' +
	                                       '<a class="nav-link active ml-2" id="Dedetailed" data-bs-toggle="tab" href="#tab-Dedetailed" role="tab" aria-controls="tab-Dedetailed" aria-selected="true">정밀검사</a>' +
	                                       '</li>';
	                        // HTML 코드를 ul 요소에 추가
	                        navUl.innerHTML += htmlCode;
	                        document.getElementById("tab-Dedetailed").classList.add('active');

	                    }
	                    if (se=="2") { //1, 12, 123
	                    	console.log("2만 있다");
	                        // HTML 코드 문자열 생성
	                        var htmlCode = '<li class="nav-item" role="presentation">' +
	                                       '<a class="nav-link ml-2 active" id="Desensuality" data-bs-toggle="tab" href="#tab-Desensuality" role="tab" aria-controls="tab-Desensuality" aria-selected="true">관능검사</a>' +
	                                       '</li>';
	                        // HTML 코드를 ul 요소에 추가
	                        navUl.innerHTML += htmlCode;
	                        document.getElementById("tab-Desensuality").classList.add('active');
	                    }
	                    if (se=="3") { //1, 12, 123
	                    	console.log("3만 있다");
	                        // HTML 코드 문자열 생성
	                        var htmlCode = '<li class="nav-item" role="presentation">' +
	                                       '<a class="nav-link ml-2 active" id="Declinical" data-bs-toggle="tab" href="#tab-Declinical" role="tab" aria-controls="tab-Declinical" aria-selected="true">임상검사</a>' +
	                                       '</li>';
	                        // HTML 코드를 ul 요소에 추가
	                        navUl.innerHTML += htmlCode;
	                        document.getElementById("tab-Declinical").classList.add('active');
	                    }
	                    if (se=="12") { //1, 12
	                    	console.log("12 있다");
	                        // HTML 코드 문자열 생성
	                        var htmlCode = '<li class="nav-item" role="presentation">' +
	                                       '<a class="nav-link active ml-2" id="Dedetailed" data-bs-toggle="tab" href="#tab-Dedetailed" role="tab" aria-controls="tab-Dedetailed" aria-selected="true">정밀검사</a>' +
	                                       '</li>' +
	                                       '<li class="nav-item" role="presentation">' +
	                                       '<a class="nav-link ml-2" id="Desensuality" data-bs-toggle="tab" href="#tab-Desensuality" role="tab" aria-controls="tab-Desensuality aria-selected="true">관능검사</a>' +
	                                       '</li>';
	                        // HTML 코드를 ul 요소에 추가
	                        navUl.innerHTML += htmlCode;
	                        document.getElementById("tab-Dedetailed").classList.add('active');
	                    }
	                    if (se=="13") { //1, 12
	                    	console.log("13 있다");
	                        // HTML 코드 문자열 생성
	                        var htmlCode = '<li class="nav-item" role="presentation">' +
	                                       '<a class="nav-link active ml-2" id="Dedetailed" data-bs-toggle="tab" href="#tab-Dedetailed" role="tab" aria-controls="tab-Dedetailed" aria-selected="true">정밀검사</a>' +
	                                       '</li>' +
	                                       '<li class="nav-item" role="presentation">' +
	                                       '<a class="nav-link ml-2" id="Declinical" data-bs-toggle="tab" href="#tab-Declinical" role="tab" aria-controls="tab-Declinical aria-selected="true">임상검사</a>' +
	                                       '</li>';
	                        // HTML 코드를 ul 요소에 추가
	                        navUl.innerHTML += htmlCode;
	                        document.getElementById("tab-Dedetailed").classList.add('active');
	                    }
	                    if (se=="23") { //1, 12
	                    	console.log("23 있다");
	                        // HTML 코드 문자열 생성
	                        var htmlCode = '<li class="nav-item" role="presentation">' +
	                                       '<a class="nav-link ml-2 active" id="Desensuality" data-bs-toggle="tab" href="#tab-Desensuality" role="tab" aria-controls="tab-Desensuality" aria-selected="true">관능검사</a>' +
	                                       '</li>' +
	                                       '<li class="nav-item" role="presentation">' +
	                                       '<a class="nav-link ml-2" id="Declinical" data-bs-toggle="tab" href="#tab-Declinical" role="tab" aria-controls="tab-Declinical aria-selected="true">임상검사</a>' +
	                                       '</li>';
	                        // HTML 코드를 ul 요소에 추가
	                        navUl.innerHTML += htmlCode;
	                        document.getElementById("tab-Desensuality").classList.add('active');
	                    }
	                    if (se=="123") { //1, 12
	                    	console.log("123 있다");
	                        // HTML 코드 문자열 생성
	                        var htmlCode = '<li class="nav-item" role="presentation">' +
	                                       '<a class="nav-link active ml-2" id="Dedetailed" data-bs-toggle="tab" href="#tab-Dedetailed" role="tab" aria-controls="tab-Dedetailed" aria-selected="true">정밀검사</a>' +
	                                       '</li>' +
	                                       '<li class="nav-item" role="presentation">' +
	                                       '<a class="nav-link ml-2" id="Desensuality" data-bs-toggle="tab" href="#tab-Desensuality" role="tab" aria-controls="tab-Desensuality aria-selected="true">관능검사</a>' +
	                                       '</li>'+
	                                       '<li class="nav-item" role="presentation">' +
	                                       '<a class="nav-link ml-2" id="Declinical" data-bs-toggle="tab" href="#tab-Declinical" role="tab" aria-controls="tab-Declinical aria-selected="true">임상검사</a>' +
	                                       '</li>';
	                        // HTML 코드를 ul 요소에 추가
	                        navUl.innerHTML += htmlCode;
	                        document.getElementById("tab-Dedetailed").classList.add('active');
	                    }
					}
				})
				});
				
	});

</script>
<script>
			$(document).ready(function () {
			    // 행 추가
			    var rowNum = 2;
			    $("#addRowBtn").click(function () {
			        var newRowHtml =
			            '<div class="container">'+
			            '<div class="form-check">'+
			            '<input class="form-check-input" type="checkbox" value="" id="selectAll">'+
			            '<label class="form-check-label" for="selectAll">선택</label></div>'+
			            '<div id="fam" class="row">' +
			            '<div class="col-md-3 mb-3">' +
			            '<div class="input-group">' +
			            '<div class="input-group-text">검역 항목명</div>' +
			            '<input class="form-control" id="qrantIemNm'+ rowNum +'" type="text">' +
			            '</div>' +
			            '</div>' +
			            '<div class="col-md-3 mb-3">' +
			            '<div class="input-group">' +
			            '<div class="input-group-text">검사 규격</div>' +
			            '<input class="form-control" id="inspctSpcfct'+ rowNum +'" type="text">' +
			            '</div>' +
			            '</div>' +
			            '<div class="col-md-3 mb-3">' +
			            '<div class="input-group">' +
			            '<div class="input-group-text">항목 결과</div>' +
			            '<input class="form-control" id="iemResult'+ rowNum +'" type="text">' +
			            '</div>' +
			            '</div>' +
			            '<div class="col-md-3 mb-3">' +
			            '<div class="input-group">' +
			            '<div class="input-group-text">항목 판정</div>' +
			            '<select class="form-select" id="iemJudg'+ rowNum +'">' +
			            '<option selected>선택</option>' +
			            '<option value="적합">적합</option>' +
			            '<option value="부적합">부적합</option>' +
			            '</select>' +
			            '</div>' +
			            '</div>' +
			            '</div>' +
			            '</div>';
			
			        $("#dynamicRows").append(newRowHtml);
			        rowNum++;
			    });
			
			    // - 행 삭제 버튼 클릭 시
			    $("#removeRowBtn").click(function () {
			        var checkedRows = $("#dynamicRows input:checked").closest('.container');
			        if (checkedRows.length > 0) {
			            checkedRows.remove();
			        } else {
			            swal('삭제 실패', "삭제할 행을 선택해주세요.", 'warning');
			        }
			    });
			});

</script>
<script>

    


    
</script>
<style>
a:hover, a:active {
	cursor: pointer;
}


</style>

                    

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
               <h3 class="fs18 pc_black">검사/검역</h3>
               <p>이 페이지는 <span style="color:#155eb6;"><b>배정된 물품을 검사/검역</b></span>하는 페이지입니다.<br>기타 궁금하신 점은 관세청 콜센터 125번으로 문의하시기 바랍니다.</p>
           </div>
           <div style="clear:both;"></div>
       </div>
   </div>
	<div class="card-body">
	<!-- ####################################검색 조건################################################ -->
	<div class="input-group aa-1 w-100" style="display: flex; justify-content: space-between;">
			<div style="flex: 0.8;"></div>
			<div style="flex: 0.15;">
				<select class="form-select1 form-select-sm h-100 form-select" id="searchList" style="width: 100%;">
					<option value="" selected>전체검색</option>
					<option value="I.ALL_QRANT_JUDG">검역판정</option>
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
							<button class="btn btn-primary btn-sm w-5" type="button" id="searchBtn">검색</button>
					</div>
		</div>
	<!-- ####################################검색 조건################################################ -->
	<br>
	 <sec:authorize access="isAuthenticated()">
        <sec:authentication property="principal.userVO" var="user" />
        	<input type="hidden" id="userID" value="<sec:authentication property='principal.username'/>">
     </sec:authorize>
		<div id="tableExample4"data-list='{"valueNames":["검역전","검역완료"],"filter":{"key":"payment"}}'>
		<!-- ===========================선택==================================== -->


			<div class="table-responsive">
				<table class="table table-sm fs-9 mb-0" style="text-align: center;">
					<thead>
						<tr class="bg-body-highlight">
							<th>검역판정</th>
							<th>통관관리번호</th>
							<th>검역요청코드</th>
							<th>상품번호</th>
							<th>물품명</th>
							<th>검역요청장소</th>
							<th>검역요청일</th>
							<th>검사검역여부</th>
							<th>비고</th>
						</tr>
					</thead>
					<tbody id="quartable" class="list">
						<%-- ajax 사용 List 채워짐 --%>
					</tbody>
				</table>
			</div>
			<br>
			<div id="divPaging"></div>
		</div>

	</div>
</div>


<!-- ############################################ 검사검역모달 ############################################ -->
<div class="modal fade" id="QuarModal" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-xl">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">검사검역 시행</h5>
                <button class="btn p-1" type="button" data-bs-dismiss="modal" aria-label="Close">
                    <span class="fas fa-times fs-9"></span>
                </button>
            </div>

            <div class="modal-body">
	            <div class="ml-auto ">
				    <ul class="nav nav-underline fs-9" id="myTab" role="tablist">

				    </ul>
				</div>
				<!-- ############################################ 정밀모달 시작 ############################################ -->
				<div class="tab-content mt-3" id="myTabContent">
				<div class="row">
                        <div class="col-md-6 mb-3 mt-2">
                            <div class="input-group">
                                <div class="input-group-text">검역요청코드</div>
                                <input class="form-control" id="qrantRequestCd" type="text">
                            </div>
                        </div>
                        <div class="col-md-6 mb-3  mt-2">
                            <div class="input-group">
                                <div class="input-group-text">통관관리번호</div>
                                <input class="form-control" id="entrManageNo" type="text">
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6 mb-3">
                            <div class="input-group">
                                <div class="input-group-text">고객코드</div>
                                <input class="form-control" id="cstmrCode" type="text">
                            </div>
                        </div>
                        <div class="col-md-6 ">
                            <div class="input-group">
                                <div class="input-group-text">상품번호</div>
                                <input class="form-control" id="goodsNo" type="text">
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6 mb-3">
                            <div class="input-group">
                                <div class="input-group-text">검사기관</div>
                                <input class="form-control" id="requstPlace" type="text">
                            </div>
                        </div>
                        <div class="col-md-6 ">
                            <div class="input-group">
                                <div class="input-group-text">검사일자</div>
                                <input class="form-control" id="requstDate" type="date">
                            </div>
                        </div>
                    </div>
                <div class="tab-pane" id="tab-detailed" role="tabpanel">
                <div class="w-100" id="detailed">
					<div class="row">
					    <div class="col-md-12 text-end my-3">
					        <button class="btn btn-primary btn-sm me-2" id="addRowBtn">+ 행 추가</button>
					        <button class="btn btn-danger btn-sm" id="removeRowBtn">- 행 삭제</button>
					    </div>
					</div>
					<div class="container">
					    <div class="form-check">
					        <input class="form-check-input" type="checkbox" value="" id="selectAll">
					        <label class="form-check-label" for="selectAll">
					            선택
					        </label>
					    </div>
					    <div class="row" id="dynamicRows">
					        <div class="row" id="fam"> 
					            <div class="col-md-3 mb-3">
					                <div class="input-group">
					                    <div class="input-group-text">검역 항목명</div>
					                    <input class="form-control" id="qrantIemNm1" type="text">
					                </div>
					            </div>
					            <div class="col-md-3 mb-3">
					                <div class="input-group">
					                    <div class="input-group-text">검사 규격</div>
					                    <input class="form-control" id="inspctSpcfct1" type="text">
					                </div>
					            </div>
					            <div class="col-md-3 mb-3">
					                <div class="input-group">
					                    <div class="input-group-text">항목 결과</div>
					                    <input class="form-control" id="iemResult1" type="text">
					                </div>
					            </div>
					            <div class="col-md-3 mb-3">
					                <div class="input-group">
					                    <div class="input-group-text">항목 판정</div>
					                    <select class="form-select" id="iemJudg1">
					                        <option selected disabled>선택</option>
					                        <option value="적합">적합</option>
					                        <option value="부적합">부적합</option>
					                    </select>
					                </div>
					            </div>
					        </div>
					    </div>
					</div>
                </div>
                </div>
				<!-- ############################################ 정밀모달끝 ############################################ -->
				<!-- ############################################ 관능모달시작 ############################################ -->
                <div class="tab-pane " id="tab-sensuality" role="tabpanel">
                <div class="w-100" id="sensuality">
                    
                   <div class="row " id="dynamicRows">
    					<div class="col-md-4 mb-3">
		                    <div class="input-group ">
								<div class="input-group-text">포장상태</div>
									<select class="form-select" id="packCondt">
							            <option selected disabled>선택</option>
							            <option value="적합">적합</option>
							            <option value="부적합">부적합</option>
							        </select>
							</div>
						</div>
    					<div class="col-md-4 mb-3">
		                    <div class="input-group ">
								<div class="input-group-text">물품 수량</div>
									<select class="form-select" id="itmAmo">
							            <option selected disabled>선택</option>
							            <option value="적합">적합</option>
							            <option value="부적합">부적합</option>
							        </select>
							</div>
						</div>
    					<div class="col-md-4 mb-3">
		                    <div class="input-group ">
								<div class="input-group-text">한글표시사항</div>
									<select class="form-select" id="koreanIndictMatter">
							            <option selected disabled>선택</option>
							            <option value="적합">적합</option>
							            <option value="부적합">부적합</option>
							        </select>
							</div>
						</div>
					</div>
                   <div class="row " id="dynamicRows">
    					<div class="col-md-4 mb-3">
		                    <div class="input-group ">
								<div class="input-group-text">보존/보관상태</div>
									<select class="form-select" id="cstdyCondt">
							            <option selected disabled>선택</option>
							            <option value="적합">적합</option>
							            <option value="부적합">부적합</option>
							        </select>
							</div>
						</div>
    					<div class="col-md-4 mb-3">
		                    <div class="input-group ">
								<div class="input-group-text">육안검사 이상 여부</div>
									<select class="form-select" id="visualAbnorWhet">
							            <option selected disabled>선택</option>
							            <option value="적합">적합</option>
							            <option value="부적합">부적합</option>
							        </select>
							</div>
						</div>
    					<div class="col-md-4 mb-3">
		                    <div class="input-group ">
								<div class="input-group-text">부패/변질 여부</div>
									<select class="form-select" id="decayDeteriWhet">
							            <option selected disabled>선택</option>
							            <option value="적합">적합</option>
							            <option value="부적합">부적합</option>
							        </select>
							</div>
						</div>
					</div>
					<div class="row " id="dynamicRows">
    					<div class="col-md-4 mb-3">
		                    <div class="input-group ">
								<div class="input-group-text">이물 존재여부</div>
									<select class="form-select" id="impurWhet">
							            <option selected disabled>선택</option>
							            <option value="적합">적합</option>
							            <option value="부적합">부적합</option>
							        </select>
							</div>
						</div>
						<div class="col-md-8 mb-3">
		                    <div class="input-group ">
								<div class="input-group-text ">비고</div>
								<input class="form-control" id="inspctNote" type="text">
							</div>
						</div>
					</div>
                </div>
                </div>
				<!-- ############################################ 관능모달끝 ############################################ -->
				<!-- ############################################ 임상모달시작 ############################################ -->
                <div class="tab-pane " id="tab-clinical" role="tabpanel">
                <div class="w-100" id="clinical">
                    
                    <div class="row " id="dynamicRows">
    					<div class="col-md-4 mb-3">
		                    <div class="input-group ">
								<div class="input-group-text">행동 정상여부</div>
									<select class="form-select" id="actAbnorWhet">
							            <option selected disabled>선택</option>
							            <option value="적합">적합</option>
							            <option value="부적합">부적합</option>
							        </select>
							</div>
						</div>
    					<div class="col-md-4 mb-3">
		                    <div class="input-group ">
								<div class="input-group-text">외부증상</div>
									<select class="form-select" id="etpSymp">
							            <option selected disabled>선택</option>
							            <option value="적합">적합</option>
							            <option value="부적합">부적합</option>
							        </select>
							</div>
						</div>
						<div class="col-md-4 mb-3">
		                    <div class="input-group ">
								<div class="input-group-text">해부학적 증상</div>
									<select class="form-select" id="anatoSymp">
							            <option selected disabled>선택</option>
							            <option value="적합">적합</option>
							            <option value="부적합">부적합</option>
							        </select>
							</div>
						</div>
					</div>
                    <div class="row " id="dynamicRows">
						<div class="w-100">
		                    <div class="input-group ">
								<div class="input-group-text ">상세</div>
								<input class="form-control" id="detailCn" type="text">
							</div>
						</div>
					</div>
                </div>
                </div>
				<!-- ############################################ 임상모달끝 ############################################ -->
            
            </div>
            </div>
            <div class="modal-footer">
                <button class="btn btn-primary" type="button" data-bs-dismiss="modal" id="qInsert" >완료</button>
                <button class="btn btn-outline-primary" type="button" data-bs-dismiss="modal">닫기</button>
            </div>
        </div>
    </div>
</div>
<!-- ############################################################################################# -->

<!-- ############################################ 상세보기 #################################################################################################################### -->
<!-- ############################################ 검사검역모달 ############################################ -->
<div class="modal fade" id="QuarDetailModal" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-xl">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">검사검역 상세</h5>
                <button class="btn p-1" type="button" data-bs-dismiss="modal" aria-label="Close">
                    <span class="fas fa-times fs-9"></span>
                </button>
                

                
            </div>

			<div class="modal-body">
				<div class="d-flex justify-content-between">
				    <ul class="nav nav-underline fs-9" id="myTabDe" role="tablist">
				        <!-- 필요한 내용이 있을 경우 여기에 추가 -->
				    </ul>

				</div>
				<!-- ############################################ 모달 내용시작 ############################################ -->
				<div class="tab-content mt-3" id="myTabContent">
				
				<div class="row">
                        <div class="col-md-6 mb-3 mt-2">
                            <div class="input-group">
                                <div class="input-group-text">검역요청코드</div>
                                <input class="form-control" id="qrantRequestCd" readonly type="text">
                            </div>
                        </div>
                        <div class="col-md-6 mb-3  mt-2">
                            <div class="input-group">
                                <div class="input-group-text">통관관리번호</div>
                                <input class="form-control" id="entrManageNo" readonly type="text">
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6 mb-3">
                            <div class="input-group">
                                <div class="input-group-text">고객코드</div>
                                <input class="form-control" id="cstmrCode" readonly type="text">
                            </div>
                        </div>
                        <div class="col-md-6 ">
                            <div class="input-group">
                                <div class="input-group-text">상품번호</div>
                                <input class="form-control" id="goodsNo" readonly type="text">
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6 mb-3">
                            <div class="input-group">
                                <div class="input-group-text">검사기관</div>
                                <input class="form-control" id="requstPlace" readonly type="text">
                            </div>
                        </div>
                        <div class="col-md-6 ">
                            <div class="input-group">
                                <div class="input-group-text">검사일자</div>
                                <input class="form-control" id="requstDate" readonly type="date">
                            </div>
                        </div>
                    </div>
                 <!-- ############################################ 정밀모달시작 ############################################ -->
                <div class="tab-pane" id="tab-Dedetailed" role="tabpanel">
                <div class="w-100" id="Dedetailed">
                    <div class="row" id="dynamicRows">
						<table class="table table-hover tableRemove" style="text-align: center;">
							<thead>
								<tr class="bg-body-highlight">
									<th>검역 항목명</th>
									<th>검사 규격</th>
									<th>항목 결과</th>
									<th>항목 판정</th>
								</tr>
							</thead>
							<tbody id="quarDetailTable" class="list">
							<!-- 데이터 들어가는곳################################################# -->
							</tbody>
						</table>
					</div>
                </div>
                </div>
				<!-- ############################################ 정밀모달끝 ############################################ -->
				<!-- ############################################ 관능모달시작 ############################################ -->
                <div class="tab-pane" id="tab-Desensuality" role="tabpanel">
                <div class="w-100" id="Desensuality">
                   <div class="row " id="dynamicRows">
						<table class="table table-hover tableRemove" style="text-align: center;">
							<thead>
								<tr class="bg-body-highlight">
									<th>포장상태</th>
									<th>물품 수량</th>
									<th>한글표시사항</th>
									<th>보존/보관상태</th>
									<th>육안검사 이상 여부</th>
									<th>부패/변질 여부</th>
									<th>이물 존재여부</th>
									<th>비고</th>
								</tr>
							</thead>
							<tbody id="quarDesensualityTable" class="list">
							<!-- 데이터 들어가는곳################################################# -->
							</tbody>
						</table>
					</div>
                </div>
                </div>
				<!-- ############################################ 관능모달끝 ############################################ -->
				<!-- ############################################ 임상모달시작 ############################################ -->
                <div class="tab-pane" id="tab-Declinical" role="tabpanel">
                <div class="w-100" id="Declinical">
                    <div class="row " id="dynamicRows">
						<table class="table table-hover tableRemove" style="text-align: center;">
							<thead>
								<tr class="bg-body-highlight">
									<th>행동 정상여부</th>
									<th>외부 증상</th>
									<th>해부학적 증상</th>
									<th>상세</th>
								</tr>
							</thead>
							<tbody id="quarDeclinicalTable" class="list">
							<!-- 데이터 들어가는곳################################################# -->
							</tbody>
						</table>
					</div>
                </div>
                </div>
				<!-- ############################################ 임상모달끝 ############################################ -->
            
            </div>
            </div>
            <div class="modal-footer">
                <button class="btn btn-outline-primary" type="button" data-bs-dismiss="modal">닫기</button>
            </div>
        </div>
    </div>
</div>



