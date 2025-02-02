<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script type="text/javascript" src="/resources/js/jquery.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<c:set var="userDet" value="${userDet}" />
<c:set var="firstItem" value="${userDet[0]}" />
<style>
.form-group1 {
	margin: 10px;
	font-size: 23px;
}

.filebox .upload-name {
	display: inline-block;
	height: 40px;
	padding: 0 10px;
	vertical-align: middle;
	border: 1px solid #dddddd;
	width: 230px;
	color: #999999;
}

.filebox label {
	display: inline-block;
	padding: 10px 20px;
	color: #fff;
	vertical-align: middle;
	background-color: #999999;
	cursor: pointer;
	height: 40px;
	margin-left: 10px;
}

.filebox input[type="file"] {
	position: absolute;
	width: 0;
	height: 0;
	padding: 0;
	overflow: hidden;
	border: 0;
}
</style>
<script>
function shFormAjax() {
    let fileInput = document.getElementById('profilePicInput');
    let file = fileInput.files[0];

    if (!file) {
        console.log("파일을 선택하세요.");
        alert("파일을 선택하세요.");
        return;
    }

    let formData = new FormData();
    formData.append("uploadFile", file);

    $.ajax({
        type: "POST",
        url: "/cbs/cstbrkr/profileUpd",
        data: formData,
        processData: false,
        contentType: false,
        dataType: "json",
        success: function(result) {
            console.log("결과", result);
            if (result == "0") {
                swal({
                    title: "프로필 변경 완료",
                    text: "프로필 사진이 변경되었습니다.",
                    icon: "success"
                }).then(function() {
                    location.href = "/cbs/cstbrkr/detailsForm";
                });
            }
        },
        error: function(xhr, status, error) {
            console.log("code: " + xhr.status);
            console.log("error: " + error);
        }
    });
}


var username; // 전역 변수로 사용자 이름 설정
	
// 서버로부터 사용자 정보를 가져오는 함수
function getUserInfo() {
    $.ajax({
        url: '/cbs/cstbrkr/getUserInfo',  
        method: 'GET',
        dataType: 'json',  
        success: function(response) {
            username = response.username; // 사용자 이름 설정
            $('#userInfo').text('로그인된 사용자 아이디: ' + username);
            console.log("사용자 정보 가져옴: " + username);
        },
        error: function(xhr, status, error) {
            console.error('서버에서 사용자 정보를 가져오는 데 실패했습니다.');
        }
    });
}

$("#file").on('change',function(){
	  var fileName = $("#file").val();
	  $(".upload-name").val(fileName);
	});
    
// 페이지 로드 시 사용자 정보 가져오기
    $(document).ready(function() {
    	
        getUserInfo();
        
        $(document).on("focusout", "#telno", function(){
            var telno = document.getElementById('telno').value;
            var regExp = /^\d{3}-\d{3,4}-\d{4}$/;
            console.log("telno: " + telno);
            if(!regExp.test(telno)){
            	swal({
                    title: "올바른 번호를 적어 주세요",
                    icon: "error",
            	});
                	$("#telno").val("");
            }
        });
        $(document).on("focusout", "#emailAdres", function(){
            var emailAdres = document.getElementById('emailAdres').value;
            var regExp = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
            console.log("emailAdres: " + telno);
            if(!regExp.test(emailAdres)){
            	swal({
                    title: "올바른 이메일를 적어 주세요",
                    icon: "error"
            	});
                	$("#emailAdres").val("");
            }
        });
    });

  //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function prod1() {
    	new daum.Postcode({
			oncomplete: function(data) {
				$('[id=adres]').val(data.address);
			}
		}).open();
    }
    
    
    
    
    
// $(function() {
    //개인정보수정 버튼
//     $("#rev").on("click", function() {
//         console.log("rev : ");
//         $("#rev").css("display", "none");
//         $("#save").css("display", "block");
//         $("#close").css("display", "block");
//         $("#profile").css("display", "block");
		
//         let text = "";

//         text += `<c:forEach var="userDet" items="${userDet}">
// 		<div class="form-group1" >
// 		연락처<input class="form-control mb-3" id="telno" type="text" value="${userDet.telno}" required placeholder="연락처형식 : 010-0000-0000"> 
// 		</div>
// 		<div class="form-group1" >
// 		이메일<input class="form-control mb-3" id="emailAdres" type="text" value="${userDet.emailAdres}" required placeholder="이메일 형식 : employee@example.com or employee@example.co.kr"> 
// 		</div>
// 		<div class="form-group1" >
// 		주소<input class="form-control mb-3" id="adres" type="text" value="${userDet.adres}" required placeholder="주소 입력" onclick="prod1()"> 
// 		</div>
// 		<div class="form-group1" >
// 		상세주소<input class="form-control mb-3" id="detailAdres" type="text" value="${userDet.detailAdres}" required placeholder="상세주소 입력"> 
// 		</div>
// 		</c:forEach>
//         	<div id="form">
// 			<div class="form-group1" id="edit">
// 			비밀번호<input class="form-control mb-3" type="password" id="pw1" placeholder="비밀번호 변경시 입력"> 
// 			</div><div class="form-group1" id="edit">
// 			비밀번호 확인<input class="form-control mb-3" type="password" id="pw2" placeholder="비밀번호 변경시 확인"> 
// 			</div>
// 			</div>`;

//         $("#form").html(text);
// });

		// 취소 버튼
// 		$("#close").on("click", function() {
// 			console.log("close : ");
// 						$("#rev").css("display", "block");
// 						$("#save").css("display", "none");
// 						$("#close").css("display", "none");
// 				        $("#profile").css("display", "none");

						
// 		var text = "";
// 		text += `<c:forEach var="userDet" items="${userDet}">
// 			<div id="form">
// 			<div class="form-group1">
// 				<label id="id">아이디 : ${userDet.userCd}</label>
// 			</div>
// 			<div class="form-group1">
// 				<label>주민번호 : ${userDet.ihidnum}</label>
// 			</div>
// 			<div class="form-group1" id="telno">
// 				<label>연락처 : ${userDet.telno}</label>
// 			</div>
// 			<div class="form-group1" id="edit">
// 				<label>이메일 : ${userDet.emailAdres}</label>
// 			</div>
// 			<div class="form-group1" id="edit">
// 				<label>주소 : ${userDet.adres}</label>
// 			</div>
// 			<div class="form-group1" id="detailAdres">
// 			<label>상세주소 : ${userDet.detailAdres}</label>
// 		</div>
// 		</div>
// 	</c:forEach>`;
// 		$("#form").html(text);
						
// 		});
		// 저장
		

$(function(){
	$("#profilePicInput").on("change",handleImg);
	
	//e : onchange 이벤트 객체
	function handleImg(e){
		console.log("개똥이1");
		//e.target : <input type="file"..
		let files = e.target.files;
		//이미지 오브젝트 배열		
		let fileArr = Array.prototype.slice.call(files);
		//초기화
		$("#tdImage").html("");
		//fileArr : {"개똥이.jpg객체","홍길동.jpg객체"}
		//f : 각각의 이미지 파일
		fileArr.forEach(function(f){
			///f.type : MIME타입
			if(!f.type.match("image.*")){
				alert("이미지 확장자만 가능합니다.");
				//함수종료
				return;
			}
			
			//이미지를 읽어보자
			let reader = new FileReader();
			
			//e : reader가 이미지를 읽을 때 그 이벤트
			reader.onload = function(e){
				//e.target : 이미지 객체
				let img = "<img src="+e.target.result+" style='width:200px;' />";
				$("#tdImage").append(img);
			}
			
			reader.readAsDataURL(f); 
		});
	}
	
	$("#save").on("click", function() {
	    let pw1 = $("#pw1").val(); // 첫 번째 비밀번호 입력란의 값
	    let pw2 = $("#pw2").val(); // 두 번째 비밀번호 입력란의 값
	    let telno = $("#telno").val(); // 전화번호 입력란의 값
	    let emailAdres = $("#emailAdres").val(); // 이메일 입력란의 값
	    let adres = $("#adres").val(); // 주소 입력란의 값
	    let detailAdres = $("#detailAdres").val(); // 주소 입력란의 값
	    console.log("save : ", pw1);

	    if (pw1 == "") {
	        let data = {telno: telno, emailAdres: emailAdres, adres: adres, detailAdres: detailAdres, userCd: username};
	        console.log("data 체크:", data);
	        $.ajax({
	            method: "post",
	            url: "/cbs/cstbrkr/perUpd",
	            data: JSON.stringify(data),
	            contentType: "application/json",
	            dataType: "json",
	            success: function(result) {
	                swal({
	                    title: "비밀번호를 제외한 개인정보를 저장합니다.",
	                    icon: "success"
	                }).then(function() {
	                    location.href = "/cbs/cstbrkr/detailsForm";
	                });
	            },
	            error: function(e) {
	        		swal("실패", "작업이 정상적으로 처리되지 않았습니다.", "error");
	        	  }, timeout: 100000
	        });
	    } else if (pw1 !== pw2) {
	        alert('비밀번호가 일치하지 않습니다.');
	    } else {
	        let data = {password: pw1, telno: telno, emailAdres: emailAdres, adres: adres, detailAdres: detailAdres, userCd: username};
	        console.log("data 체크:", data);
	        $.ajax({
	            method: "post",
	            url: "/cbs/cstbrkr/perUpd2",
	            data: JSON.stringify(data),
	            contentType: "application/json",
	            dataType: "json",
	            success: function(result) {
	                swal({
	                    title: "비밀번호를 포함한 개인정보를 저장합니다.",
	                    icon: "success"
	                }).then(function() {
	                    location.href = "/cbs/cstbrkr/detailsForm";
	                });
	            }
	        });
	    }
	});
});
</script>
<!-- <h1>마이페이지</h1> -->
<%-- <p></p> 
<p></p> 
<div class="row" style="border: 5px; margin: 20px 0px 0px 300px;"> 
	<div class="col-6 order-last">
		<div class="card"> 
			<div class="card-body"> 
				<div class="col-12 col-sm-auto flex-1"> 
					<c:forEach var="userDet" items="${userDet}" varStatus="stat">
						<h3 class="fw-bolder mb-2" style="font-size: 45px;">${userDet.userNm}</h3> 
						<p class="mb-1" style="font-size: 20px;">직급(${userDet.clsf})</p> 
				</c:forEach> 
				</div> 
				<p></p> 
				<p></p> 
			<c:forEach var="userDet" items="${userDet}">
					<div id="form"> 
						<div class="form-group1"> 
							<label id="id">아이디 : ${userDet.userCd}</label> -
						</div> -->
						<div class="form-group1"> 
							<label>주민번호 : ${userDet.ihidnum}</label> 
						</div> 
						<div class="form-group1" id="telno"> 
							<label>연락처 : ${userDet.telno}</label> 
						</div> 
						<div class="form-group1" id="emailAdres"> 
							<label>이메일 : ${userDet.emailAdres}</label> 
						</div>
						<div class="form-group1" id="adres"> 
							<label>주소 : ${userDet.adres}</label> 
						</div> 
						<div class="form-group1" id="detailAdres"> 
							<label>상세주소 : ${userDet.detailAdres}</label> 
						</div> 
					</div> 
			</c:forEach>
			</div> 
		</div> 
	</div> 


	<div class="col-5" style="width: 340px; height: 50px;"> 
		<div class="card"> 
			<div class="card-body"> 
				<div class="text-center d-flex align-items-center justify-content-center" id="tdImage" style="width: 260px;"> 
					<img class="rounded-circle" src="${firstItem.customsBrokerVO.profileFile}" alt="" style="width: 200px;"> -
				</div> 
			</div> 
		</div> 
 		<div class="input-group-text" id="inputImgs" style="width:306px; display: none;">프로필사진&emsp; 
 			<input class="form-control" type="file" id="uploadFile"  name="uploadFile" placeholder="프로필 사진" /> 
 		</div> 
		<div class="card" style="text-align: center;"> 

			<div class="form-group"> 

				<label>자격 취득 일자 : <fmt:formatDate pattern="yyyy-MM-dd"
 						value="${firstItem.customsBrokerVO.qualfAcqsDe}" />
				</label>
			</div>
			<div class="form-group">
				<label>자격번호 : ${firstItem.customsBrokerVO.qualfNo}</label>
			</div>
			<div class="form-group"> -->
				<label>최종학력 : ${firstItem.customsBrokerVO.lastAcdmcr}</label> 
 			</div> 

</div>  --%>
<div class="g-3 mb-3 row justify-content-center">
	<div class="col-lg-6 col-12">
		<div class="h-100 card">
			<div class="card-body">
				<div class="border-bottom border-dashed border-300 pb-4">
					<div
						class="align-items-center g-3 g-sm-5 text-center text-sm-start row">
						<div class="col-sm-auto col-12">
							<div class="d-inline-flex">
								<input class="d-none" id="avatarFile" type="file"
									accept="image/*">
									
									
				<div class="d-flex flex-column align-items-center justify-content-center">
				    <!-- 이미지 요소 -->
				    <div class="text-center d-flex align-items-center justify-content-center" id="tdImage" style="width: 260px;"> 
				        <img class="rounded-circle" src="${firstItem.customsBrokerVO.profileFile}" alt="" style="width: 200px;"> 
				    </div> 
				    
				    <!-- 버튼 요소 -->
				    <div class="col mt-3" id="profile" style="width: 304.5px;">
				        <input class="form-control" type="file" id="profilePicInput" value="첨부파일" placeholder="첨부파일">
				        <button onclick="shFormAjax()" class="btn btn-phoenix-primary mt-1" style="width: 100%;">프로필 사진 수정</button>
				    </div>
				</div>
											</div>
						</div>
						<div class="flex-1 col-sm-auto col-12">
						<c:forEach var="userDet" items="${userDet}" varStatus="stat">
							<h3>${userDet.userNm}</h3>
							<p class="text-800">${userDet.userCd}</p>
							</c:forEach>
							<div>
								</div>
						</div>
					</div>
				</div>
				<div class="d-flex flex-between-center pt-4">
					<div>
						<h6 class="mb-2 text-800">자격취득일자</h6>
						<h4 class="fs-7 text-1000 mb-0"><fmt:formatDate pattern="yyyy-MM-dd"
 						value="${firstItem.customsBrokerVO.qualfAcqsDe}" /></h4>
					</div>
					<div class="text-start">
						<h6 class="mb-2 text-800">자격번호</h6>
						<h4 class="fs-7 text-1000 mb-0">${firstItem.customsBrokerVO.qualfNo}</h4>
					</div>
					<div class="text-end">
						<h6 class="mb-2 text-800">최종학력</h6>
						<h4 class="fs-7 text-1000 mb-0">${firstItem.customsBrokerVO.lastAcdmcr}</h4>
					</div>
				</div>
			</div>
		</div>
	</div>

</div>
<div class="g-3 mb-6 row justify-content-center">
    <div class="col-lg-6 col-12">
        <div class="h-100 card">
            <div class="card-body">
                <div class="row">

                    <!-- 첫 번째 폼 (왼쪽 열) -->
                    <c:forEach var="userDet" items="${userDet}">
                    <div class="col-lg-6 mb-2">
                        <form>
                            <div class="mb-3">
                                <label for="form1Input" class="form-label">아이디</label>
                                <input type="text" class="form-control" id="form1Input" value="${userDet.userCd}" readonly>
                            </div>
                            <!-- 추가 필드 및 버튼을 원한다면 이어서 추가 -->
                        </form>
                    </div>

                    <!-- 두 번째 폼 (오른쪽 열) -->
                    <div class="col-lg-6 mb-2">
                        <form>
                            <div class="mb-3">
                                <label for="form2Input" class="form-label">주민등록번호</label>
                                <input type="text" class="form-control" id="form2Input" value="${userDet.ihidnum}" readonly>
                            </div>
                            <!-- 추가 필드 및 버튼을 원한다면 이어서 추가 -->
                        </form>
                    </div>

                    <!-- 세 번째 폼 (왼쪽 열) -->
                    <div class="col-lg-6 mb-2">
                        <form>
                            <div class="mb-3">
                                <label for="form3Input" class="form-label">전화번호</label>
                                <input type="text" class="form-control" id="telno" value="${userDet.telno}">
                            </div>
                            <!-- 추가 필드 및 버튼을 원한다면 이어서 추가 -->
                        </form>
                    </div>

                    <!-- 네 번째 폼 (오른쪽 열) -->
                    <div class="col-lg-6 mb-2">
                        <form>
                            <div class="mb-3">
                                <label for="form4Input" class="form-label">이메일</label>
                                <input type="text" class="form-control" id="emailAdres" value="${userDet.emailAdres}">
                            </div>
                            <!-- 추가 필드 및 버튼을 원한다면 이어서 추가 -->
                        </form>
                    </div>

                    <!-- 다섯 번째 폼 (왼쪽 열) -->
                    <div class="col-lg-6 mb-2">
                        <form>
                            <div class="mb-3">
                                <label for="form5Input" class="form-label">주소</label>
                                <input type="text" class="form-control" id="adres" value="${userDet.adres}" onclick="prod1()">
                            </div>
                            <!-- 추가 필드 및 버튼을 원한다면 이어서 추가 -->
                        </form>
                    </div>

                    <!-- 여섯 번째 폼 (오른쪽 열) -->
                    <div class="col-lg-6 mb-2">
                        <form>
                            <div class="mb-3">
                                <label for="form6Input" class="form-label">상세주소</label>
                                <input type="text" class="form-control" id="detailAdres" value="${userDet.detailAdres}">
                            </div>
                            <!-- 추가 필드 및 버튼을 원한다면 이어서 추가 -->
                        </form>
                    </div>
                    <div class="col-lg-6 mb-2" id="edit">
                        <form>
                            <div class="mb-3">
                                <label for="form6Input" class="form-label">비밀번호</label>
                                <input type="text" class="form-control" type="password" id="pw1">
                            </div>
                            <!-- 추가 필드 및 버튼을 원한다면 이어서 추가 -->
                        </form>
                    </div>
                    <div class="col-lg-6 mb-2"id="edit">
                        <form>
                            <div class="mb-3">
                                <label for="form6Input" class="form-label">비밀번호 확인</label>
                                <input type="text" class="form-control"  type="password" id="pw2">
                            </div>
                            <!-- 추가 필드 및 버튼을 원한다면 이어서 추가 -->
                        </form>
                    </div>
				</c:forEach>
                </div>
                    <div class="col-12 mt-4" >
                        <div class="row justify-content-end">
                                <input type="button" class="btn btn-info me-1 mb-1" id="save" style="width: 130px;" value="저장">
<!--                                 <input type="button" class="btn btn-danger me-1 mb-1" id="close" style="width: 130px;" value="취소"> -->
                        </div>
                    </div>
            </div>
        </div>
    </div>
</div>
<!-- <div class="form-group center"> -->
<!-- 	<div class="row"> -->
<!-- 		<div class="row mt-3"> -->
<!-- 			<div class="col" id="profile" style="display: none;"> -->
<!-- 				<input class="form-control" type="file" id="profilePicInput" -->
<!-- 					value="첨부파일" placeholder="첨부파일" style="width: 304.5px"> -->
<!-- 				<button onclick="shFormAjax()" -->
<!-- 					class="btn btn-phoenix-primary me-1 mb-1" style="width: 304px;">프로필 -->
<!-- 					사진 수정</button> -->
<!-- 			</div> -->
<!-- 			<div class="col"> -->
<!-- 				<input type="button" class="btn btn-primary" id="rev" -->
<!-- 					style="width: 300px;" value="개인정보 수정"> -->
<!-- 			</div> -->
<!-- 		</div> -->
<!-- 		<div class="col"> -->
<!-- 			<input type="button" class="btn btn-info me-1 mb-1" id="save" -->
<!-- 				style="width: 130px; display: none;" value="저장"> -->
<!-- 		</div> -->
<!-- 		<div class="col"> -->
<!-- 			<input type="button" class="btn btn-danger me-1 mb-1" id="close" -->
<!-- 				style="width: 130px; display: none;" value="취소"> -->
<!-- 		</div> -->
<!-- 	</div> -->
<!-- </div> -->

</div>
</div>