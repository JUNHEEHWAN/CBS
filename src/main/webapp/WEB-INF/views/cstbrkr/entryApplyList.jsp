<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>통관 신청 목록</title>
<style>
#ims {
        width: 100%;
        height: auto;
}
.pagination {
    display: flex;
    justify-content: center;
    margin-top: 20px;
}

/* .pagination button { */
/*     background-color: #f2f2f2; */
/*     border: 1px solid #ddd; */
/*     color: black; */
/*     padding: 8px 16px; */
/*     cursor: pointer; */
/*     transition: background-color 0.3s; */
/* } */

.pagination button:hover { 
    background-color: #E3E6ED; 
} 

.pagination button.active {
    background-color: #007bff;
    color: white;
    border: none;
}
.applyBtn{
	background: none;
    border: none;
    padding: 0;
    cursor: pointer;
}
</style>
<script type="text/javascript" src="/resources/js/jquery.min.js"></script>
<script>
console.log("통관신청목록")
var scaleSe = "";
var mfrcRealmSe = "";
var startDateS = "";
var endDateS = "";
var searchText = "";
window.onload = function(){
	entryApplyListSelect();
	window.localStorage.clear();
	
	/*3. 조건이 클릭 될 때마다 조건에 맞추어 검색해서 리스트를 뽑는 함수*/
	document.querySelector("#preProGu").addEventListener('change', function(){
		preProSttus = this.value;
    	console.log("서류진행도 : ", preProSttus);
    	conditionSearch();
    })
	document.querySelector("#scaleSeGu").addEventListener('change', function(){
		scaleSe = this.value;
    	console.log("기업규모 : ", scaleSe);
    	conditionSearch();
    })
	document.querySelector("#mfrcRealmSeGu").addEventListener('change', function(){
		mfrcRealmSe = this.value;
    	console.log("주력분야 : ", mfrcRealmSe);
    	conditionSearch();
    })
	document.querySelector("#startDate").addEventListener('change', function(){
    	startDateS = this.value;
    	console.log("검색시작일 : ", startDateS);
    	conditionSearch();
    })
    document.querySelector("#endDate").addEventListener('change', function(){
    	endDateS = this.value;
    	console.log("검색종료일 : ", endDateS);
    	conditionSearch();
    })
    document.querySelector("#searchText").addEventListener('change', function(){
		searchText = this.value;
		console.log("검색어 : ", searchText);
    	conditionSearch();
	})
	
}

/*로그인 한 관세사 코드 가져오는 함수*/
const userCdGet = function(){
	console.log("로그인 관세사 코드 : ", document.querySelector("#userCd").value);
	return document.querySelector("#userCd").value;
}

/*1. 페이지 불러오자마자 통관 신청 목록 가져오는 함수*/
const entryApplyListSelect = function(){
	var xhr = new XMLHttpRequest();
	var loginUserCd = userCdGet();
	console.log("페이지 불러오자마자 통관 신청 목록의 관세사 CD : ", loginUserCd);
	xhr.open("POST", "/cbs/cstbrkr/entryApplyListSelect", true);
	xhr.setRequestHeader("Content-Type", "text/plain");
	xhr.onreadystatechange = function(){
		if(xhr.readyState == 4 && xhr.status == 200){
			var response = JSON.parse(xhr.responseText);
			console.log("통관 신청 목록 정보 불러오기 결과 값 : ", response);
			getData = response; // 데이터를 가져와서 변수에 할당
            renderTable(); // 테이블 렌더링
            renderPagination(); // 페이지네이션 렌더링
		}
	}
	xhr.send(loginUserCd);
}

/*2.조건 검색 함수*/
const conditionSearch = function(){
	var conditionData = {
			cstbrkrCd : document.querySelector("#userCd").value,
			preProSttus : preProSttus,
			scaleSe : scaleSe,
			mfrcRealmSe : mfrcRealmSe,
			startDateS : startDateS,
			endDateS : endDateS,
			searchText : searchText
	}
	console.log("조건 검색 버튼 클릭 됨.");
	console.log("조건 데이터 집합 : ", conditionData);
	
	var xhr = new XMLHttpRequest();
	xhr.open("POST", "/cbs/cstbrkr/entryApplyListSelectConditionSearch", true);
	xhr.setRequestHeader("Content-Type", "application/json");
	xhr.onreadystatechange = function(){
		if(xhr.readyState == 4 && xhr.status){
			var response = JSON.parse(xhr.responseText);
			console.log("조건 검색 페이지 성공 가져온 값 : ", response);
			getData = response; // 데이터를 가져와서 변수에 할당
            renderTable(); // 테이블 렌더링
            renderPagination(); // 페이지네이션 렌더링
		}
	}
	xhr.send(JSON.stringify(conditionData));
}

var getData = []; // JSON 데이터를 저장할 배열
var itemsPerPage = 15; // 페이지당 보여줄 아이템 수
var currentPage = 1; // 현재 페이지 번호

//페이지당 아이템 수에 맞게 데이터를 표에 렌더링
const renderTable = function renderTable() {
    var tableBody = document.querySelector('.customerAppplylist');
    tableBody.innerHTML = ''; // 표 초기화

    var startIdx = (currentPage - 1) * itemsPerPage;
    var endIdx = startIdx + itemsPerPage;
    
    for (var i = startIdx; i < endIdx && i < getData.length; i++) {
        var item = getData[i];
	    var row = ""
        row += "<tr>";
        row += 		"<td class='align-middle ps-3 name' id='stat' style='text-align: center;'>"+(i+1)+"</td>";
		row += 		"<td class='align-middle ps-3 name' id='cstmrCd' style='display: none;'>"+item.cstmrCd+"</td>";
		row += 		"<td class='align-middle ps-3 name' id='presentnPapersNo' style='text-align: center;'>"+item.presentnPapersNo+"</td>";
		row += 		"<td class='align-middle ps-3 name' id='entrprsNm' style='text-align: center;'>"+item.entrprsNm+"</td>";
		row += 		"<td class='align-middle ps-3 name' id='userNm' style='text-align: center;'>"+item.userNm+"</td>";
		row += 		"<td class='align-middle ps-3 name' id='reprsntTelno' style='text-align: center;'>"+item.reprsntTelno+"</td>";
		row += 		"<td class='align-middle ps-3 name' id='reprsntEmail' style='text-align: center;'>"+item.reprsntEmail+"</td>";
		row += 		"<td class='align-middle ps-3 name' id='ectmrk' style='text-align: center;'>"+item.ectmrk+"</td>";
		row += 		"<td class='align-middle ps-3 name' id='bizrno' style='text-align: center;'>"+item.bizrno+"</td>";
		row += 		"<td class='align-middle ps-3 name' id='cprNo' style='text-align: center;'>"+item.cprNo+"</td>";
		row += 		"<td class='align-middle ps-3 name' id='scaleSe' style='text-align: center;'>"+scaleSeGu(item.scaleSe)+"</td>";
		row += 		"<td class='align-middle ps-3 name' id='mfrcRealmSe' style='text-align: center;'>"+mfrcRealmSeGu(item.mfrcRealmSe)+"</td>";
		row += 		"<td class='align-middle ps-3 name' id='processSttus' style='text-align: center;'>"+customerProcessSttus(item.processSttus)+"</td>";
		row += 		"<td class='align-middle ps-3 name' id='processDe' style='text-align: center;'>"+item.processDe+"</td>";
		row += 		"<td class='align-middle ps-3 name' id='preProSttus' style='text-align: center;'>"+preProSttusGu(item.preProSttus)+"</td>";
// 		row += 		"<td class='align-middle ps-3 name'><input type='button' id='entryApplyBtn' onclick='entryApplyBtn(this)' value='신청'/></td>";
	    if (item.preProSttus === "PPS1") {
// 	        row += "<td class='align-middle ps-3 name'><input class='btn btn-outline-primary me-1 mb-1 btn-sm' type='button' id='entryApplyBtn' onclick='entryApplyBtn(this)' value='신청'/></td>";
	        row += "<td class='align-middle ps-3 name' style='text-align: center;'><button class='applyBtn' id='entryApplyBtn' onclick='entryApplyBtn(this)'><h5><span class='badge badge-phoenix badge-phoenix-primary'>신청</span></h5></button></td>";
	    } else if (item.preProSttus === "PPS2") {
// 	        row += "<td class='align-middle ps-3 name'><input class='btn btn-outline-primary me-1 mb-1 btn-sm' type='button' id='progressBtn' onclick='progressBtn(this)' value='진행'/></td>";
	        row += "<td class='align-middle ps-3 name' style='text-align: center;'><button class='applyBtn' id='progressBtn' onclick='progressBtn(this)'><h5><span class='badge badge-phoenix badge-phoenix-success'>진행</span></h5></button></td>";
	    } else if (item.preProSttus === "PPS3") {
// 	        row += "<td class='align-middle ps-3 name'><input class='btn btn-outline-primary me-1 mb-1 btn-sm' type='button' id='completeBtn' onclick='completeBtn(this)' value='완료' disabled/></td>";
	        row += "<td class='align-middle ps-3 name' style='text-align: center;'><button class='applyBtn' id='completeBtn' onclick='completeBtn(this)' disabled='disabled'><h5><span class='badge badge-phoenix badge-phoenix-secondary'>완료</span></h5></button></td>";
	    } else {
	        // 아무 버튼도 추가하지 않을 경우
	        row += "<td></td>";
	    }
        row += "</tr>";
        tableBody.innerHTML += row;
    }
}

// 페이지네이션을 렌더링
const renderPagination = function() {
    var pagination = document.getElementById('pagination');
    pagination.innerHTML = ''; // 페이지네이션 초기화

    var pageCount = Math.ceil(getData.length / itemsPerPage);
    var totalPageCount = 5;    // 보여지는 페이지 개수

    // 현재 페이지가 몇 번째 그룹에 속하는지 계산
    var currentPageGroup = Math.ceil(currentPage / totalPageCount);

    // 시작 페이지와 끝 페이지를 계산
    var startPage = (currentPageGroup - 1) * totalPageCount + 1;
    var endPage = Math.min(startPage + (totalPageCount - 1), pageCount);

    // 처음 버튼
    var prevButton = document.createElement('button');
    prevButton.textContent = '처음';
    prevButton.className = 'btn btn-subtle-secondary btn-sm';
    prevButton.style.marginRight = "10px";
    prevButton.addEventListener('click', function() {
        currentPage = 1;
        renderTable();
        renderPagination();
        highlightButton();
    });
    pagination.appendChild(prevButton);

    // 이전 버튼
    var prevButton2 = document.createElement('button');
    prevButton2.textContent = '이전';
    prevButton2.className = 'btn btn-subtle-secondary btn-sm';
    prevButton2.style.marginRight = "10px";
    prevButton2.addEventListener('click', function() {
        if (currentPage > 1) {
            currentPage--;
            renderTable();
            renderPagination();
            highlightButton();
        }
    });
    pagination.appendChild(prevButton2);

    //숫자 버튼
    for (var i = startPage; i <= endPage; i++) {
        var button = document.createElement('button');
        button.textContent = i;
        button.className = "btn btn-outline-primary btn-sm";
        button.style.marginRight = "5px";
        button.style.border = "none";
        button.addEventListener('click', function() {
            currentPage = parseInt(this.textContent);
            renderTable();
            renderPagination();
            highlightButton();
        });
        pagination.appendChild(button);
    }

    // 다음 버튼
    var nextButton = document.createElement('button');
    nextButton.textContent = '다음';
    nextButton.className = 'btn btn-subtle-secondary btn-sm';
    nextButton.style.marginLeft = "5px";
    nextButton.style.marginRight = "10px";
    nextButton.addEventListener('click', function() {
        if (currentPage < pageCount) {
            currentPage++;
            renderTable();
            renderPagination();
            highlightButton();
        }
    });
    pagination.appendChild(nextButton);
    
    // 마지막 버튼
    var nextButton2 = document.createElement('button');
    nextButton2.textContent = '마지막';
    nextButton2.className = 'btn btn-subtle-secondary btn-sm';

    nextButton2.addEventListener('click', function() {
        currentPage = pageCount;
        renderTable();
        renderPagination();
        highlightButton();
    });
    pagination.appendChild(nextButton2);

    highlightButton();
}

/*현재 페이지 버튼을 강조 표시*/
const highlightButton = function() {
    var buttons = document.querySelectorAll('.pagination button');
    buttons.forEach(function(button) {
        button.classList.remove('active');
        if (parseInt(button.textContent) === currentPage) {
            button.classList.add('active');
        }
    });
}

/*초기화 버튼 누르면 나오는 함수*/
const conditionReset = function(){
// 	entryApplyListSelect();
// 	document.querySelector("#scaleSeGu").value = "";
// 	document.querySelector("#mfrcRealmSeGu").value = "";
// 	document.querySelector("#startDate").value = "";
// 	document.querySelector("#endDateS").value = "";
// 	document.querySelector("#searchText").value = "";
	window.location.reload();
}

const preProSttusGu = function(val){
	if(val == "PPS1" ){return "접수";}
	if(val == "PPS2" ){return "임시저장";}
	if(val == "PPS3" ){return "신청완료";}
}

const scaleSeGu = function(val){
	if(val == "SSE1" ){return "대기업";}
	if(val == "SSE2" ){return "중소기업";}
	if(val == "SSE3" ){return "소상공인";}
	if(val == "SSE4" ){return "자영업자";}
}

const customerProcessSttus = function(val){
	if(val == "CPS1" ){return "신청전";}
	if(val == "CPS2" ){return "처리중";}
	if(val == "CPS3" ){return "승인";}
	if(val == "CPS4" ){return "미승인";}
}

const mfrcRealmSeGu = function(val){
	if(val == "CMRS1"){return "수출"}
	if(val == "CMRS2"){return "수입"}
}

const entryApplyBtn = function(button){
	//선택행
	var row = button.closest("tr");
	console.log("신청버튼 선택행",row);
	//선택행 번호
	var stat = row.querySelector("#stat").innerText;
	console.log("선택 index : ", stat);

	var cstmrCd = row.querySelector("#cstmrCd").innerText;				//고객코드
	var entrprsNm = row.querySelector("#entrprsNm").innerText;			//기업 명
	var cstbrkrCd = document.querySelector("#userCd").value;			//관세사 코드
	var cprNo = row.querySelector("#cprNo").innerText;					//법인번호
	
	var sendData = [];
	sendData = getData[stat-1];
	console.log("sendData", sendData);
	var presentnPapersNo = sendData.presentnPapersNo;
	console.log("presentnPapersNo", presentnPapersNo);
	var data = {
		        cstmrCd : cstmrCd,
		        cstbrkrCd : cstbrkrCd,
		        entrprsNm : entrprsNm,
		        presentnPapersNo : presentnPapersNo,
		        cprNo : cprNo
		    };
	console.log("통관신청 할 데이터 : ", data);
	localStorage.setItem("applyEntryInfo",JSON.stringify(data));
    location.href = "/cbs/cstbrkr/entryApply";
}


const progressBtn = function(button){
	//선택행
	var row = button.closest("tr");
	console.log("진행버튼 선택행", row);
	var stat = row.querySelector("#stat").innerText;
	console.log("선택 index : ", stat);
	
	console.log("행 데이터 : ", getData[stat-1]);
	console.log("행 해당 제출서류번호 : ", getData[stat-1].presentnPapersNo);
	
	var presentnPapersNo = getData[stat-1].presentnPapersNo;
	console.log("presentnPapersNo", presentnPapersNo);
	
	var cstmrCd = row.querySelector("#cstmrCd").innerText;				//고객코드
	var entrprsNm = row.querySelector("#entrprsNm").innerText;			//기업 명
	var cstbrkrCd = document.querySelector("#userCd").value;			//관세사 코드
	var cprNo = row.querySelector("#cprNo").innerText;
	
	var data = {
	        cstmrCd : cstmrCd,
	        cstbrkrCd : cstbrkrCd,
	        entrprsNm : entrprsNm,
	        presentnPapersNo : presentnPapersNo,
	        cprNo : cprNo
	    };
	localStorage.setItem("applyEntryInfo",JSON.stringify(data));
	var xhr = new XMLHttpRequest();
	xhr.open("POST", "/cbs/cstbrkr/progressBtn", true);
	xhr.setRequestHeader("Content-Type", "text/plain");
	xhr.onreadystatechange = function(){
		if(xhr.readyState == 4 && xhr.status == 200){
			var response = JSON.parse(xhr.responseText);
			console.log("서류번호로 가져온 통관정보 : ", response);
			
			localStorage.setItem("progressEntryInfo",JSON.stringify(response));
		    location.href = "/cbs/cstbrkr/entryApply";
		}
	}
	xhr.send(presentnPapersNo);
}
</script>

</head>
<body>

	<div class="card h-50">
	<div style="text-align: center; margin=0; max-width: 100%; height: auto;">
        <img id="ims" src="/resources/img/진행2.png">
    </div>
		<div class="card-body">
			<h4>통관 신청 목록</h4>
          	<p>고객 검사가 승인된 신청 목록 조회 및 대상 통관 신청</p>
			<div style="display: none;">
				<sec:authorize access="isAuthenticated()">
					<sec:authentication property="principal.userVO" var="user" />
					<input id="userCd" type="text" value="${user.userCd}">
				</sec:authorize>
			</div>
			<div id="tableExample4"
				data-list="{&quot;valueNames&quot;:[&quot;name&quot;,&quot;email&quot;,&quot;payment&quot;],&quot;page&quot;:5,&quot;pagination&quot;:true,&quot;filter&quot;:{&quot;key&quot;:&quot;payment&quot;}}">
				<div class="input-group mb-3 w-75 ms-auto p-2 bd-highlight" style="padding: 10px;">
		        	<select class="form-select" id="preProGu">
		            		<option selected value="">서류진행도</option>
		            		<option value="PPS1">접수중</option>
		            		<option value="PPS2">임시저장</option>
		            		<option value="PPS3">신청완료</option>
		        	</select>
		        	<select class="form-select" id="scaleSeGu">
		            		<option selected value="">기업규모</option>
		            		<option value="SSE1">대기업</option>
		            		<option value="SSE2">중소기업</option>
		            		<option value="SSE3">소상공인</option>
		            		<option value="SSE4">자영업자</option>
		        	</select>
		        	<select class="form-select" id="mfrcRealmSeGu">
		            		<option selected value="">주력분야</option>
		            		<option value="CMRS1">수출</option>
		            		<option value="CMRS2">수입</option>
		        	</select>
    				<input type="date" id="startDate" class="form-control" placeholder="시작일" aria-label="" aria-describedby="button-addon2">
    				
    				<input type="date" id="endDate" class="form-control" placeholder="종료일" aria-label="" aria-describedby="button-addon2">
    				
    				<input type="text" id="searchText" class="form-control" placeholder="검색어를 입력하세요." aria-label="" aria-describedby="button-addon2" style="flex: 1;">
    				<button class="btn btn-primary btn-sm" type="button" id="search" onclick="conditionSearch()">검색</button>
    				<button class="btn btn-phoenix-primary btn-sm px-3 me-1" type="button" id="resetBtn" onclick="conditionReset()">초기화</button>
				</div>
				<div class="table-responsive">
					<table class="table table-sm fs-9 mb-0" id="applyTable">
						<thead>
							<tr class="bg-body-highlight">
								<th class="sort border-top border-translucent ps-3">No</th>
								<th class="sort border-top border-translucent ps-3" style="display: none;">고객코드</th>
								<th class="sort border-top border-translucent ps-3" style="text-align: center;">제출서류번호</th>
								<th class="sort border-top border-translucent ps-3" style="text-align: center;">기업명</th>
								<th class="sort border-top border-translucent ps-3" style="text-align: center;">담당자</th>
								<th class="sort border-top border-translucent ps-3" style="text-align: center;">대표전화번호</th>
								<th class="sort border-top border-translucent ps-3" style="text-align: center;">대표이메일</th>
								<th class="sort border-top border-translucent ps-3" style="text-align: center;">통관고유부호</th>
								<th class="sort border-top border-translucent ps-3" style="text-align: center;">사업자등록번호</th>
								<th class="sort border-top border-translucent ps-3" style="text-align: center;">법인번호</th>
								<th class="sort border-top border-translucent ps-3" style="text-align: center;">기업규모</th>
								<th class="sort border-top border-translucent ps-3" style="text-align: center;">주력분야</th>
								<th class="sort border-top border-translucent ps-3" style="text-align: center;">고객검사</th>
								<th class="sort border-top border-translucent ps-3" style="text-align: center;">승인날짜</th>
								<th class="sort border-top border-translucent ps-3" style="text-align: center;">서류진행도</th>
								<th class="sort border-top border-translucent ps-3" style="text-align: center;">신청</th>
							</tr>
						</thead>
						<tbody class="customerAppplylist">
						
						</tbody>
					</table>
				</div>
				<!-- 페이지네이션 영역 시작 -->
				<div class="pagination" id="pagination">
        
    			</div>
				<!-- 페이지네이션 영역 종료 -->
			</div>
		</div>
	</div>
</body>
</html>