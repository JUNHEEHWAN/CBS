<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<style>
.nav-item { font-size: 15px; }
</style>
<script>
var navbarStyle = window.config.config.phoenixNavbarStyle;
if (navbarStyle && navbarStyle !== 'transparent') {
	document.querySelector('body').classList.add(`navbar-${navbarStyle}`);
}
</script>
<nav class="navbar navbar-vertical navbar-expand-lg">
	<div class="collapse navbar-collapse" id="navbarVerticalCollapse">
		<div class="navbar-vertical-content">
			<ul class="navbar-nav flex-column" id="navbarVerticalNav">
			
				<div class="my-1"><li class="nav-item"><a class="nav-link" href="/cbs/trnsprt/notice">
					<div class="d-flex align-items-center"><span class="nav-link-text">공지사항</span></div></a></li>
				</div>
				<hr>
				<p class="navbar-vertical-label" style="color: black; !important">운송 관리자</p>
				<div class="my-1"><li class="nav-item"><a class="nav-link" href="/cbs/trnsprt/store">
					<div class="d-flex align-items-center"><span class="nav-link-text">입고 요청 목록</span></div></a></li>
				</div>
				<div class="my-1"><li class="nav-item"><a class="nav-link" href="/cbs/trnsprt/delivery">
					<div class="d-flex align-items-center"><span class="nav-link-text">출고 요청 목록</span></div></a></li>
				</div>
				<div class="my-1"><li class="nav-item"><a class="nav-link" href="/cbs/trnsprt/company">
					<div class="d-flex align-items-center"><span class="nav-link-text">운송 회사 관리</span></div></a></li>
				</div>
				<div class="my-1"><li class="nav-item"><a class="nav-link" href="/cbs/trnsprt/diary">
					<div class="d-flex align-items-center"><span class="nav-link-text">운송 일지 목록</span></div></a></li>
				</div>
				<div class="my-1"><li class="nav-item"><a class="nav-link" href="/cbs/trnsprt/createIc">
					<div class="d-flex align-items-center"><span class="nav-link-text">IC카드 등록</span></div></a></li>
				</div>
				<div class="my-1"><li class="nav-item"><a class="nav-link" href="/cbs/pdf/pdfFile">
					<div class="d-flex align-items-center"><span class="nav-link-text">PDF파일 작업(삭제 예정)</span></div></a></li>
				</div>
			</ul>
		</div>
	</div>
</nav>
              
