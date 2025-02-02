<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
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
			
				<div class="my-1"><li class="nav-item"><a class="nav-link" href="/cbs/pbsvnt/notice">
					<div class="d-flex align-items-center"><span class="nav-link-text">공지사항</span></div></a></li>
				</div>
				<hr>
				<sec:authorize access="hasRole('PUBL1')">
				<p class="navbar-vertical-label" style="color: black; !important">행정 공무원</p>
				<div class="my-1"><li class="nav-item"><a class="nav-link" href="/cbs/svntAdmin/cstCheck">
					<div class="d-flex align-items-center"><span class="nav-link-text">고객 검사</span></div></a></li>
				</div>
				<div class="my-1"><li class="nav-item"><a class="nav-link" href="/cbs/svntAdmin/entryList">
					<div class="d-flex align-items-center"><span class="nav-link-text">통관 접수</span></div></a></li>
				</div>
				<div class="my-1"><li class="nav-item"><a class="nav-link" href="/cbs/svntAdmin/entryJudge">
					<div class="d-flex align-items-center"><span class="nav-link-text">통관 심사</span></div></a></li>
				</div>
				</sec:authorize>
				<sec:authorize access="hasRole('PUBL2')">
				<p class="navbar-vertical-label" style="color: black; !important">검역 공무원</p>
				<div class="my-1"><li class="nav-item"><a class="nav-link" href="/cbs/quar/qstart">
					<div class="d-flex align-items-center"><span class="nav-link-text">검사 검역 배정</span></div></a></li>
				</div>
				<div class="my-1"><li class="nav-item"><a class="nav-link" href="/cbs/quar/qlist">
					<div class="d-flex align-items-center"><span class="nav-link-text">검사 검역</span></div></a></li>
				</div>
				<div class="my-1"><li class="nav-item"><a class="nav-link" href="/cbs/quar/quarPaperList">
					<div class="d-flex align-items-center"><span class="nav-link-text">검사 검역 문서</span></div></a></li>
				</div>
				</sec:authorize>
<!-- 				<p class="navbar-vertical-label" style="color: black; !important">창고 공무원</p> -->
<!-- 				<div class="my-1"><li class="nav-item"><a class="nav-link" href="/cbs/bounded/warehouse"> -->
<!-- 					<div class="d-flex align-items-center"><span class="nav-link-text">입고 관리</span></div></a></li> -->
<!-- 				</div> -->
<!-- 				<div class="my-1"><li class="nav-item"><a class="nav-link" href="#"> -->
<!-- 					<div class="d-flex align-items-center"><span class="nav-link-text">출고 관리</span></div></a></li> -->
<!-- 				</div> -->
				
			</ul>
		</div>
	</div>
</nav>
              
