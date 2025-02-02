<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>



<style>
.main {
	background: url('/resources/img/메인영상2.gif');
	background-size: cover;
}


.col-xl-5 {
	margin: 50 auto;
	width: 100%;
}

#mainLoginImg {
	width: 200px;
	height: auto;
}
</style>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>	
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="/resources/js/jquery.min.js"></script>
<script src="/resources/css/imagesloaded.pkgd.min.js"></script>
<script src="/resources/css/simplebar.min.js"></script>
<script src="/resources/css/config.js"></script>
<script type="text/javascript" src="/resources/js/jquery.min.js"></script>

<!-- ===============================================-->
<!--    Stylesheets-->
<!-- ===============================================-->
<link href="/resources/css/choices.min.css" rel="stylesheet">
<link href="/resources/css/dhtmlxgantt.css" rel="stylesheet">
<link href="/resources/css/flatpickr.min.css" rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com/">
<link rel="preconnect" href="https://fonts.gstatic.com/" crossorigin="">
<link href="/resources/css/css2" rel="stylesheet">
<link href="/resources/css/simplebar.min.css" rel="stylesheet">
<link rel="stylesheet" href="/resources/css/line.css">
<link href="/resources/css/theme-rtl.min.css" type="text/css"
	rel="stylesheet" id="style-rtl" disabled="true">
<link href="/resources/css/theme.min.css" type="text/css"
	rel="stylesheet" id="style-default">
<link href="/resources/css/user-rtl.min.css" type="text/css"
	rel="stylesheet" id="user-style-rtl" disabled="true">
<link href="/resources/css/user.min.css" type="text/css"
	rel="stylesheet" id="user-style-default">

<script type="text/javascript">
$(function(){
	//idFind
	$("#idFind").on("click",function(){

		let userVO ={
			userNm : document.getElementById('userNm').value,
			ihidnum : document.getElementById('ihidnum').value
		};
		$.ajax({
			url : "/cbs/find",
			contentType : "application/json;charset=utf-8",
			data : JSON.stringify(userVO),
			type : "post",
			dataType : "text",
			success : function(result){
				if(result != 'false'){
				$("#idFind").css("display","none");
				$("#divuserNm").css("display","none");
				$("#divihidnum").css("display","none");
				$("#btnAuto1").css("display","none");
				$("#idResult").css("display","inline-block");
				$("#btLogin").css("display","inline-block");
				$("#ID").val(result);
				}else if(result === 'false'){
					$("#idFind").css("display","none");
					$("#divuserNm").css("display","none");
					$("#divihidnum").css("display","none");
					$("#btnAuto1").css("display","none");
					$("#aBack").css("display","inline-block");
					$("#idFalse").css("display","inline-block");
					
					
				}
			}
		});
		
		
	});
	//pwFind
	let shUserCd="";
	$("#pwFind").on("click",function(){
		shUserCd = document.getElementById('userCd2').value;  // 딴데서도 쓰겡 전역변수
		let userVO ={
				userCd : shUserCd,
				ihidnum : document.getElementById('ihidnum2').value,
				telno : document.getElementById('telno2').value
			};
			$.ajax({
				url : "/cbs/find2",
				contentType : "application/json;charset=utf-8",
				data : JSON.stringify(userVO),
				type : "post",
				dataType : "text",
				success : function(result){
					if(result != null){
					$("#pwFind").css("display","none");
					$("#divID").css("display","none");
					$("#divihidnum2").css("display","none");
					$("#divtelno2").css("display","none");
					$("#btnAuto2").css("display","none");
					$("#divPwNew1").css("display","inline-block");
					$("#divPwNew2").css("display","inline-block");
					$("#btChange").css("display","inline-block");
					$("#btnAuto3").css("display","inline-block");
					
					}else if(result == null){
						$("#pwFind").css("display","none");
						$("#divID").css("display","none");
						$("#divihidnum2").css("display","none");
						$("#divtelno2").css("display","none");
						$("#btnAuto2").css("display","none");
						$("#aBack2").css("display","inline-block");
						$("#pwFalse").css("display","inline-block");
						
						
					}
				}
			});
		
	});
	
	$("#pwNew2").on("focusout", function(){
		var password = document.getElementById('pwNew').value;
		var password2 = document.getElementById('pwNew2').value;
		if(password != password2){
			$("#label3").css("color", "red").text("비밀번호가 일치하지 않습니다.");
			$("#pwNew2").val('');
		}else{
			$("#label3").css("color", "red").text("");
		}
	});
	
	
	$("#btChange").on("click",function(){
		let userVO ={
				userCd:shUserCd,
				password:document.getElementById('pwNew').value
			};
		
		$.ajax({
			type : "post",
			url : "/cbs/pwUpdate",
			contentType : "application/json;charset=utf-8",
      		data: JSON.stringify(userVO),
      		dataType : "text",
      		success : function(result){
      			if(result == "OK"){
      				swal({
      					title: "비밀번호가 변경되었습니다.",
      					icon: "success"
      					}).then(function() {
      					location.href = "/cbs/login";
      					});
      					

      				}
      		},
      		error: function (xhr, status, error) {
    			console.log("code: " + xhr.status)
    			console.log("message: " + xhr.responseText)
    			console.log("error: " + error);
    		}
			
		}); 
		
		
	});
	
	//자동 입력
	$("#btnAuto1").on("click", function() {
		$("#userNm").val("하지원");
		$("#ihidnum").val("941005-2553945");
		
		
	});
	
	$("#btnAuto2").on("click", function() {
		$("#userCd2").val("CUST0001");
		$("#ihidnum2").val("941005-2553945");
		$("#telno2").val("010-2343-4121");
	});
	$("#btnAuto3").on("click", function() {
		$("#pwNew").val("java");
		$("#pwNew2").val("java");
	});
	
	
	
	
	
	
});
	

</script>

<body>
	
		<!-- JSTL -->
		
		<!-- ===============================================-->
		<!--    Main Content-->
		<!-- ===============================================-->
		<main class="main" id="top">
			<div class="container">
				<div class="row flex-center min-vh-100 py-5">
					<div class="card border border-translucent auth-card" style=" width: 500;">
						<div class="col-xl-5" style="width: 300px;">
							<a class="d-flex flex-center text-decoration-none mb-4">
								<div
									class="d-flex align-items-center fw-bolder fs-3 d-inline-block">
									<img id="mainLoginImg" src="/resources/img/mainLogo.png"
										alt="CBS" width="10%">
								</div>
							</a>
		<!--////////////////////////탭  시작 ////////////////////////////////////////  -->
								<ul class="nav nav-underline fs-9" id="myTab" role="tablist" style="position: relative; left: 75px;">
									<li class="nav-item"><a class="nav-link active" id="home-tab" data-bs-toggle="tab" href="#tab-home" role="tab" aria-controls="tab-home" aria-selected="true">아이디찾기</a></li>
									<li class="nav-item"><a class="nav-link" id="home-tab2" data-bs-toggle="tab" href="#tab-home2" role="tab" aria-controls="tab-home2" aria-selected="false">비밀번호찾기</a></li>
								</ul>
							<div class="tab-content mt-3" id="myTabContent"> 
							 <div class="tab-pane fade show active" id="tab-home" role="tabpanel" aria-labelledby="home-tab">
							  <div id="divuserNm" class="col-md-15 mb-3  mt-2">
                            <div class="input-group">
                                <div class="input-group-text" style="width: 90px;">이름</div>
                                <input class="form-control" id="userNm" name="userNm" type="text" >
                            </div>
                        </div>
							 <div id="divihidnum" class="col-md-15 mb-3  mt-2">
                            <div class="input-group">
                                <div class="input-group-text" style="width: 90px;">주민번호</div>
                                <input class="form-control" id="ihidnum" name="ihidnum" type="text" placeholder="-포함">
                            </div>
                        </div>
							 <div id="idResult" class="col-md-15 mb-3  mt-2" style="display: none;">
                            <div class="input-group">
                                <div class="input-group-text">아이디</div>
                                <input class="form-control" id="ID" name="ID" type="text" readonly>
                            </div>
                        </div>
							 <div id="idFalse" class="col-md-15 mb-3  mt-2" style="display: none;">
                                <div class="input-group-text" style=" position: relative; left: 55;">존재하지 않는 사용자입니다.</div>
                        </div>
							<button id="idFind" class="btn btn-primary w-100 mb-3">
								<font style="vertical-align: inherit;"><font
									style="vertical-align: inherit;">아이디찾기</font></font>
							</button>
							
							<a id="aBack" href="/cbs/find" class="btn btn-primary w-100 mb-3" style="display: none;">
								<font style="vertical-align: inherit;"><font
									style="vertical-align: inherit;">돌아가기</font></font>
							</a>
							<a id="btLogin" class="fs-9 fw-semibold" href="/cbs/login" style=" position: relative; right: -120px;"><font style="vertical-align: inherit; position: relative; right: -110;">
								<font style="vertical-align: inherit; color:black;">로그인하기</font></font></a>
							<a class="btn btn-primary" id="btnAuto1" style="position: relative;left: -68;">자동입력</a>
							</div>
							 <div class="tab-pane fade" id="tab-home2" role="tabpanel" aria-labelledby="home-tab2">
							  <div id="divID" class="col-md-15 mb-3  mt-2">
                            <div class="input-group">
                                <div class="input-group-text" style="width: 85px;">아이디</div>
                                <input class="form-control" id="userCd2" name="userCd2" type="text" >
                            </div>
                        </div>
							 <div id="divihidnum2" class="col-md-15 mb-3  mt-2">
                            <div class="input-group">
                                <div class="input-group-text">주민번호</div>
                                <input class="form-control" id="ihidnum2" name="ihidnum2" type="text" placeholder="-포함">
                            </div>
                        </div>
							 <div id="divtelno2" class="col-md-15 mb-3  mt-2">
                            <div class="input-group">
                                <div class="input-group-text">전화번호</div>
                                <input class="form-control" id="telno2" name="telno2" type="text" placeholder="-포함">
                            </div>
                        </div>
							 <div id="divPwNew1" class="col-md-15 mb-3  mt-2" style="display: none;">
                            <div class="input-group" style="width: 300px;">
                                <div class="input-group-text" style="width: 140px;">새로운비밀번호</div>
                                <input class="form-control" id="pwNew" name="pwNew" type="password" >
                            </div>
                        </div>
							 <div id="divPwNew2" class="col-md-15 mb-3  mt-2" style="display: none;">
                            <div class="input-group" style="width: 300px;">
                                <div class="input-group-text" style="width: 140px;">새로운비밀번호 확인</div>
                                <input class="form-control" id="pwNew2" name="pwNew2" type="password">
                            </div>
                            <label id="label3" style="position: relative; color: black; top: 8;"></label>
                        </div>
                        <div id="pwFalse" class="col-md-15 mb-3  mt-2" style="display: none;">
                                <div class="input-group-text" style=" position: relative; left: 30;">정보오류! 다시 입력해주세요.</div>
                        </div>
							<button id="pwFind" class="btn btn-primary w-100 mb-3">
								<font style="vertical-align: inherit;"><font
									style="vertical-align: inherit;">비밀번호 찾기</font></font>
							</button>
							<button id="btChange" class="btn btn-primary w-100 mb-3" style="display: none;">
								<font style="vertical-align: inherit;"><font
									style="vertical-align: inherit;">변경하기</font></font>
							</button>
							<a class="btn btn-primary" id="btnAuto3" style="display: none;">자동입력</a>
							<a id="aBack2" href="/cbs/find" class="btn btn-primary w-100 mb-3" style="display: none;">
								<font style="vertical-align: inherit;"><font
									style="vertical-align: inherit;">돌아가기</font></font>
							</a>
							<a class="btn btn-primary" id="btnAuto2" style="width:110px">자동입력</a>
							<a id="btLogin" class="fs-9 fw-semibold" href="/cbs/login" style=" position: relative; right: -120px;"><font style="vertical-align: inherit;">
								<font style="vertical-align: inherit; color:black;">로그인하기</font></font></a>
							</div>
							</div>
	<!--////////////////////////탭  끝 ////////////////////////////////////////  -->	
						
						</div>
						
					</div>
				</div>
			</div>
		</main>
	
</body>
<script src="/resources/js/popper.min.js"></script>
<script src="/resources/js/bootstrap.min.js"></script>
<script src="/resources/js/anchor.min.js"></script>
<script src="/resources/js/is.min.js"></script>
<script src="/resources/js/all.min.js"></script>
<script src="/resources/js/lodash.min.js"></script>
<script src="/resources/js/polyfill.min.js"></script>
<script src="/resources/js/list.min.js"></script>
<script src="/resources/js/feather.min.js"></script>
<script src="/resources/js/dayjs.min.js"></script>
<script src="/resources/js/choices.min.js"></script>
<script src="/resources/js/echarts.min.js"></script>
<script src="/resources/js/dhtmlxgantt.js"></script>
<script src="/resources/js/phoenix.js"></script>
<script src="/resources/js/projectmanagement-dashboard.js"></script>
