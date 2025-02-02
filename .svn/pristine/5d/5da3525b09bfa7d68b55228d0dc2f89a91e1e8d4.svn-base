<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>



<style>
.main {
	background: url('/resources/img/최종메인.gif');
	background-size: cover;
}

#test {
	background: white;
	background-color: rgba(255, 255, 255, 0.8);
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
<script src="/resources/js/jquery.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
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
	
$(function() {
	//자동 입력
	$("#btnAuto1").on("click", function() {
		$("#username").val("admin");
		$("#password").val("java");
	});
	//자동 입력
	$("#btnAuto2").on("click", function() {
		$("#username").val("CUST0001");
		$("#password").val("java");
	});
	//자동 입력
	$("#btnAuto3").on("click", function() {
		$("#username").val("PUBL1001");
		$("#password").val("java");
	});
	//자동 입력
	$("#btnAuto4").on("click", function() {
		$("#username").val("PUBL2001");
		$("#password").val("java");
	});
	
	//자동 입력
	$("#btnAuto6").on("click", function() {
		$("#username").val("TRAN0001");
		$("#password").val("java");
	});
	$("#mainLoginImg").on("click", function() {
		location.reload();
	})
	
});//end 달러function

function showAlert(){
    swal({
		  title: "승인되지 않은 사용자입니다.",
		  text: "관리자 승인 후 로그인하실 수 있습니다.",
		  icon: "error"
	}).then(function() {
	});
}
	
</script>
<body>		
<sec:authorize access="isAuthenticated()">
	<!-- ROLE_CUSTNO 값이 auth라는 JSTL 변수에 할당됨 -->
	<sec:authentication property="principal.userVO.userAuthVOList[0].auth" var="auth" />
</sec:authorize>
<c:if test="${auth=='ROLE_CUSTNO'}">
	<script type="text/javascript">showAlert();</script>
</c:if>
		<!-- JSTL -->
		<!-- ===============================================-->
		<!--    Main Content-->
		<!-- ===============================================-->
		<main class="main" id="top">
			<div class="container">
				<div class="row flex-center min-vh-100 py-5">
					<div id="test" class="card border border-translucent auth-card" style=" width: 500;">
						<div class="col-xl-5" style=" width: 300;">
				<form action="/login" method="post">
							<a class="d-flex flex-center text-decoration-none mb-4">
								 <div
									class="d-flex align-items-center fw-bolder fs-3 d-inline-block">
									<img id="mainLoginImg" src="/resources/img/mainLogo.png"
										alt="CBS" width="10%">
								</div> 
							</a>
							<div class="text-center mb-3">
								<h3 class="text-body-highlight">
									<font class="logo-text ms-2 d-none d-sm-block" style="vertical-align: inherit;">Login</font>
								</h3>
		<!--/////////////////////////권한별 탭  시작 ////////////////////////////////////////  -->
								<ul class="nav nav-underline fs-9" id="myTab" role="tablist">
									<li class="nav-item"><a class="nav-link active"
										id="btnAuto2" data-bs-toggle="tab" href="#tab-home" role="tab"
										aria-controls="tab-home" aria-selected="true">관세사</a></li>
									<li class="nav-item"><a class="nav-link" id="btnAuto3"
										data-bs-toggle="tab" href="#tab-profile" role="tab"
										aria-controls="tab-profile" aria-selected="false">행정</a></li>
									<li class="nav-item"><a class="nav-link" id="btnAuto4"
										data-bs-toggle="tab" href="#tab-contact" role="tab"
										aria-controls="tab-contact" aria-selected="false">검역</a></li>
									<li class="nav-item"><a class="nav-link" id="btnAuto6"
										data-bs-toggle="tab" href="#tab-contact" role="tab"
										aria-controls="tab-contact" aria-selected="false">보세운송</a></li>
									<li class="nav-item"><a class="nav-link" 
										data-bs-toggle="tab" href="#tab-contact" role="tab"
										aria-controls="tab-contact" aria-selected="false" id="btnAuto1">admin</a></li>
								</ul>
							</div>
	<!--/////////////////////////권한별 탭  끝 ////////////////////////////////////////  -->	
							<div class="mb-3 text-start">
								<label class="form-label" for="ID"><font
									style="vertical-align: inherit;"><font
										style="vertical-align: inherit;"></font></font></label>
								<div class="form-icon-container">
									<input class="form-control form-icon-input" name="username"
										id="username" type="text" placeholder="ID"> <span
										class="fas fa-user text-body fs-9 form-icon"></span>
								</div>
							</div>
							<div class="mb-3 text-start">
								<label class="form-label" for="password"><font
									style="vertical-align: inherit;"><font
										style="vertical-align: inherit;"></font></font></label>
								<div class="form-icon-container">
									<input class="form-control form-icon-input" name="password"
										id="password" type="password" placeholder="Password"> <span
										class="fas fa-key text-body fs-9 form-icon"></span>
								</div>
							</div>
							<c:if test="${param.error==''}">
			<div class="btn btn-primary w-100 mb-3" style="color: white; background-color: #ff0000c2; vertical-align: inherit;">
				사용자ID 또는 비밀번호를 확인해 주세요.</div>
		</c:if>
							<button class="btn btn-primary w-100 mb-3" id="loginBt">
								<font style="vertical-align: inherit;"><font
									style="vertical-align: inherit;">로그인</font></font>
							</button>
							<div class="row flex-between-center mb-3">
								<div class="col-auto" style="position: relative;left: 50;">
									<a class="fs-9 fw-semibold"
										href="/cbs/find"><font
										style="vertical-align: inherit; color: #3874ff"><font
											style="vertical-align: inherit; color:black;">아이디찾기/비밀번호찾기</font></font>
											</a> 
								<a class="fs-9 fw-semibold" href="/cbs/create"><font style="vertical-align: inherit;">
								<font style="vertical-align: inherit; color:black;">회원가입</font></font></a>
								</div>
							</div>
	</form>
							
							
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
