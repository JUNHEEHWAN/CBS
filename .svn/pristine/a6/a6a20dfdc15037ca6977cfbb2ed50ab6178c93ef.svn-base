<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<style>
	.banner{
  image-rendering: -moz-crisp-edges; /* firefox */
  image-rendering: -o-crisp-edges; /* opera */
  image-rendering: -webkit-optimize-contrast; /* chrome(비표준) */
  image-rendering: crisp-edges;
}
</style>
<script>
<!-- 	-------------환율 스크립트 시작----------------- -->
	const next = function() {
		console.log("결과 체크:next");
		First = First + 4;
		Last = Last + 4;
		console.log("First : ", First);
		console.log("Last : ", Last);
		const prevdi = document.getElementById('prev');
		prevdi.disabled = false;
		if (Last > 23) {
			First = 18;
			Last = 22;
			const nextdi = document.getElementById('next');
			nextdi.disabled = true;
		}
		updateData();
	}
	const prev = function() {
		console.log("결과 체크:prev");
		// 이전 페이지로 이동할 때 처리
		if (First <= 5 || Last <= 0) {
			const prevdi = document.getElementById('prev');
			prevdi.disabled = true;
			First = 0;
			Last = 4;
		} else {
			First = First - 4;
			Last = Last - 4;
			console.log("First : ", First);
			console.log("Last : ", Last);
			const nextdi = document.getElementById('next');
			nextdi.disabled = false;
		}
		updateData();
	}

	let First = 0;
	let Last = 4;
	let authkey = "Rb5gNIVrjtJhAxBzrB9r3XbGqAEuvnbw";
	let data = "AP01"; // AP01 : 환율, AP02 : 대출금리, AP03 : 국제금리
	// 파라미터로 보낼 현재 시점의 날짜 구하기
	let today = new Date();
	let dayOfWeek = today.getDay(); // 현재 요일을 가져옵니다. (0: 일요일, 1: 월요일, ..., 6: 토요일)

	// 만약 오늘이 토요일(6)이면 날짜를 하루 전으로 변경합니다.
	if (dayOfWeek === 6) {
		today.setDate(today.getDate() - 1);
	}
	// 만약 오늘이 일요일(0)이면 날짜를 이틀 전으로 변경합니다.
	else if (dayOfWeek === 0) {
		today.setDate(today.getDate() - 2);
	}

	// 변경된 날짜를 이용하여 년, 월, 일을 구합니다.
	let year = today.getFullYear();
	let month = ("0" + (today.getMonth() + 1)).slice(-2);
	let day = ("0" + today.getDate()).slice(-2);
	let searchdate = year + "" + month + "" + day;

// 	console.log(authkey);
// 	console.log(data);
// 	console.log(searchdate);
// 	console.log(day);
	let url = "https://www.koreaexim.go.kr/site/program/financial/exchangeJSON?authkey="
			+ authkey + "&searchdate=" + searchdate + "&data=" + data + "";
// 	console.log("url : ", url);
	
	function updateData() {

		let xhr = new XMLHttpRequest();
		xhr.open("get", url, true);
		xhr.onreadystatechange = function() {
			if (xhr.readyState == 4 && xhr.status == 200) {
				var rows = JSON.parse(xhr.responseText)
				total = rows.length;
				console.log("rows", rows);
				var tbStr = "";
				tbStr += " <thead>";
				tbStr += "<td>" + year + "년 " + month + "월 " + day
						+ "일 기준</td>";
				tbStr += "<tr>";
				tbStr += "<th class='border-top border-translucent ps-0 align-middle' scope='col' data-sort='country' style='width:32%'>통화코드</th>";
				tbStr += "<th class='border-top border-translucent align-middle' scope='col' data-sort='users' style='width:17%'>국가/통화명</th>";
				tbStr += "<th class='border-top border-translucent text-end align-middle' scope='col' data-sort='transactions' style='width:16%'>전신환(송금)받으실때</th>";
				tbStr += "<th class='border-top border-translucent text-end align-middle' scope='col' data-sort='revenue' style='width:20%'>전신환(송금)보내실때</th>";
				tbStr += "</tr></thead>";

				for (var i = First; i <= Last; i++) {
					// CUR_UNIT : 통화코드, CUR_NM :  국가/통화명, TTB : 전신환(송금)받으실때, TTS : 전신환(송금)보내실때

					tbStr += "<tbody class='list' id='table-regions-by-revenue'>";
					tbStr += "<tr><td class='white-space-nowrap ps-0 country' style='width:32%'>";
					tbStr += "<div class='d-flex align-items-center'>";
					tbStr += "<img src='/resources/img/flag/" + rows[i].cur_unit + ".gif' alt='' width='24'>";
					tbStr += "<p class='mb-0 ps-3 text-primary fw-bold fs-9'>"
							+ rows[i].cur_unit + "</p>";
					tbStr += "</div></td>";
					tbStr += "<td class='align-middle users' style='width:17%'>";
					tbStr += "<h6 class='mb-0'>" + rows[i].cur_nm
							+ "</h6></td>";
					tbStr += "<td class='align-middle text-end transactions' style='width:17%'>";
					tbStr += "<h6 class='mb-0'>" + rows[i].ttb + "</h6></td>";
					tbStr += "<td class='align-middle text-end revenue' style='width:17%'>";
					tbStr += "<h6 class='mb-0'>" + rows[i].tts
							+ "</h6></td></tr>";
				}
				tbStr += "</tbody>";
				document.getElementById("tb").innerHTML = tbStr;
			}
		}
		xhr.send();
	}
<!-- 	-------------환율 스크립트 끝----------------- -->

</script>
<style>
li {
	list-style: none;
	left: 1417px;
}
</style>
<nav class="navbar navbar-top fixed-top navbar-expand"
	id="navbarDefault">
	<form action="/logout" method="post">
		<sec:authorize access="isAuthenticated()">
			<sec:authentication property="principal.userVO" var="user" />
			<div class="collapse navbar-collapse justify-content-between">
				<div class="navbar-logo">
					<button
						class="btn navbar-toggler navbar-toggler-humburger-icon hover-bg-transparent"
						type="button" data-bs-toggle="collapse"
						data-bs-target="#navbarVerticalCollapse"
						aria-controls="navbarVerticalCollapse" aria-expanded="false"
						aria-label="Toggle Navigation">
						<span class="navbar-toggle-icon"><span class="toggle-line"></span></span>
					</button>

					<sec:authorize access="hasRole('ADMIN')">
						<a class="navbar-brand me-1 me-sm-3" href="/cbs/admin/brkrlist">
					</sec:authorize>
					<sec:authorize access="hasRole('CUST')">
						<a class="navbar-brand me-1 me-sm-3"
							href="/cbs/cstbrkr/cstbrkrHome">
					</sec:authorize>
					<sec:authorize access="hasRole('PUBL1')">
						<a class="navbar-brand me-1 me-sm-3"
							href="/cbs/svntAdmin/cstCheck">
					</sec:authorize>
					<sec:authorize access="hasRole('PUBL2')">
						<a class="navbar-brand me-1 me-sm-3" href="/cbs/quar/qstart">
					</sec:authorize>
					<sec:authorize access="hasRole('PUBL3')">
						<a class="navbar-brand me-1 me-sm-3" href="/cbs/bounded/warehouse">
					</sec:authorize>
					<sec:authorize access="hasRole('TRAN')">
						<a class="navbar-brand me-1 me-sm-3"
							href="/cbs/trnsprt/store">
					</sec:authorize>
					<div class="d-flex align-items-center">
						<div class="d-flex align-items-center banner">
<!-- 							<img src="/resources/img/mainLogo.png" alt="phoenix" width="80"> -->
<!-- 							<p class="logO-TEXT MS-2 D-NONE D-SM-BLOCK" -->
<!-- 								STYLE="FONt-size: 1.25rem;">관세 업무 시스템</p> -->
							<img src="/resources/img/메인로고.png" height="63px;">
							<img src="${user.customsBrokerVO.profileFile}" style="width:33px;border-radius: 50%;overflow: hidden;position: relative;right: -1230px;">
							<div
								style="font-size: 15px; position: absolute; left: 1580px; color: rgba(0, 0, 0, 0.685);">${user.userNm}님 환영합니다.
							</div>
							<button type="submit" class="btn btn-primary w-90"
								style="position: absolute; right: -1510px;">
								<font style="vertical-align: inherit;"><font
									style="vertical-align: inherit;">로그아웃</font></font>
							</button>
						</div>
					</div>
					</a>
				</div>
			</div>
			<sec:csrfInput />
		</sec:authorize>
	</form>


	<!-- 	-------------메뉴 시작----------------- -->

	<li class="nav-item dropdown" style=" left: 1380px;"><a class="nav-link show"
		id="navbarDropdownNindeDots" href="#" role="button"
		data-bs-toggle="dropdown" aria-haspopup="true"
		data-bs-auto-close="outside" aria-expanded="true"><svg width="16"
				height="16" viewBox="0 0 16 16" fill="none"
				xmlns="http://www.w3.org/2000/svg">
                  <circle cx="2" cy="2" r="2" fill="currentColor"></circle>
                  <circle cx="2" cy="8" r="2" fill="currentColor"></circle>
                  <circle cx="2" cy="14" r="2" fill="currentColor"></circle>
                  <circle cx="8" cy="8" r="2" fill="currentColor"></circle>
                  <circle cx="8" cy="14" r="2" fill="currentColor"></circle>
                  <circle cx="14" cy="8" r="2" fill="currentColor"></circle>
                  <circle cx="14" cy="14" r="2" fill="currentColor"></circle>
                  <circle cx="8" cy="2" r="2" fill="currentColor"></circle>
                  <circle cx="14" cy="2" r="2" fill="currentColor"></circle>
                </svg></a> 
		<div
			class="dropdown-menu dropdown-menu-end navbar-dropdown-caret py-0 dropdown-nine-dots shadow border"
			aria-labelledby="navbarDropdownNindeDots" data-bs-popper="static">
			<div class="card bg-body-emphasis position-relative border-0">
				<div class="card-body pt-3 px-3 pb-0 overflow-auto scrollbar"
					style="height: 20rem;">
					<div class="row text-center align-items-center gx-0 gy-0">
						<div class="col-4">
							<a
								class="d-block bg-body-secondary-hover p-2 rounded-3 text-center text-decoration-none mb-3"
								data-bs-toggle="offcanvas" data-bs-target="#offcanvasScrolling"
								aria-controls="offcanvasScrolling" onclick="updateData()"> <span
								class="far fa-money-bill-alt fs-3"></span>
								<p class="mb-0 text-body-emphasis text-truncate fs-10 mt-1 pt-1">환율</p>
							</a>
						</div>
					</div>
				</div>
			</div>
		</div></li>

	<!-- 	-------------메뉴 끝----------------- -->

	<!-- 	-------------로그인 알림----------------- -->
	<sec:authorize access="!isAuthenticated()">
		<a class="navbar-brand me-1 me-sm-3" href="/cbs/login">로그인해주세요</a>
	</sec:authorize>
</nav>
<!-- 	-------------로그인 알림----------------- -->

<!-- 	-------------환율 틀 시작----------------- -->
<div class="offcanvas offcanvas-end" data-bs-scroll="true"
	data-bs-backdrop="false" tabindex="-1" id="offcanvasScrolling"
	aria-labelledby="offcanvasScrollingLabel">
	<div class="offcanvas-header">
		<h5 class="offcanvas-title" id="offcanvasScrollingLabel">환율</h5>
		<button type="button" class="btn-close text-reset"
			data-bs-dismiss="offcanvas" aria-label="Close"></button>
	</div>
	<div class="offcanvas-body">
		<div>
			<div class="table-responsive scrollbar">
				<table class="table fs-10 mb-0">
					<tbody id="tb"></tbody>
				</table>
			</div>
			<div class="row align-items-center py-1">
				<div class="pagination d-none"></div>
				<div class="col d-flex fs-9"></div>
				<div class="col-auto d-flex">
					<button class="btn btn-link px-1 me-1" id="prev" onclick="prev()"
						type="button" title="Previous" data-list-pagination="prev"
						disabled>
						<span class="fas fa-chevron-left me-2"></span>Prev
					</button>
					<button class="btn btn-link px-1 ms-1" id="next" onclick="next()"
						type="button" title="Next" data-list-pagination="next">
						Next <span class="fas fa-chevron-right ms-2"></span>
					</button>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- 	-------------환율 틀 끝----------------- -->