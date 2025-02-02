<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>통관 목록</title>
<link rel="stylesheet" href="/resources/css/sweetalert2.min.css">
<script src="/resources/js/sweetalert2.min.js"></script>
<script type="text/javascript" src="/resources/js/jquery.min.js"></script>
</head>
<style type="text/css">
th, td { text-align: center !important; }
a:active{
	font-weight: bold;
	color: red;
}
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

/* .pagination button:hover { */
/*     background-color: #ddd; */
/* } */

.pagination button.active {
    background-color: #007bff;
    color: white;
    border: none;
}
.downloadBtn{
	background: none;
    border: none;
    padding: 0;
    cursor: pointer;
}
</style>
<script type="text/javascript" src="/resources/js/jquery.min.js"></script>
<script type="text/javascript">

var entrSe = "";
var startDateS = "";
var endDateS = "";
var processSttus = "";
var searchText = "";
/*window.onload*/
window.onload = function() {
	
	entryProcessList();//페이지 불러오자 마자 리스트를 띄워주는 함수
	window.localStorage.clear();	//로컬스토리지 전체 클리어
	
    /*3. 조건이 클릭 될 때마다 조건에 맞추어 검색해서 리스트를 뽑는 함수*/
    document.querySelector("#entrSeGu").addEventListener('change', function(){
    	entrSe = this.value;
    	console.log("의뢰유형 : ", entrSe);
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
    document.querySelector("#processSttusGu").addEventListener('change', function(){
    	processSttus = this.value;
    	console.log("처리상태 : ", processSttus);
    	conditionSearch();
    })
	document.querySelector("#searchText").addEventListener('change', function(){
		searchText = this.value;
		console.log("검색어 : ", searchText);
    	conditionSearch();
	})
	
}

/*초기화 버튼 누르면 나오는 함수*/
const conditionReset = function(){
// 	entryProcessList();
// 	document.querySelector("#entrSeGu").value = "";
// 	document.querySelector("#startDate").value = "";
// 	document.querySelector("#endDateS").value = "";
// 	document.querySelector("#processSttusGu").value = "";
// 	document.querySelector("#searchText").value = "";
	window.location.reload();
}

/*1. 페이지 불러오자 마자 리스트를 띄워주는 함수*/
const entryProcessList = function(){
	var xhr = new XMLHttpRequest();
	xhr.open("POST", "/cbs/cstbrkr/entryProcessList", true);
	xhr.onreadystatechange = function(){
		if(xhr.readyState == 4 && xhr.status == 200){
			var response = JSON.parse(xhr.responseText);
			console.log("페이지 리스트 불러오기 성공 가져온 값 : ", response);
			getData = response; // 데이터를 가져와서 변수에 할당
            renderTable(); // 테이블 렌더링
            renderPagination(); // 페이지네이션 렌더링
		}
	}
	xhr.send();
}

/*2.조건 검색 함수*/
const conditionSearch = function(){
	var conditionData = {
			entrSe : entrSe,
			startDateS : startDateS,
			endDateS : endDateS,
			processSttus : processSttus,
			searchText : searchText
	}
	console.log("조건 검색 버튼 클릭 됨.");
	console.log("조건 데이터 집합 : ", conditionData);
	
	var xhr = new XMLHttpRequest();
	xhr.open("POST", "/cbs/cstbrkr/entryProcessConditionSearchList", true);
	xhr.setRequestHeader("Content-Type", "application/json");
	xhr.onreadystatechange = function(){
		if(xhr.readyState == 4 && xhr.status == 200){
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

/*페이지당 아이템 수에 맞게 데이터를 표에 렌더링*/
const renderTable = function renderTable() {
    var tableBody = document.querySelector('.entryProcesslist');
    tableBody.innerHTML = ''; // 표 초기화

    var startIdx = (currentPage - 1) * itemsPerPage;
    var endIdx = startIdx + itemsPerPage;
    
    for (var i = startIdx; i < endIdx && i < getData.length; i++) {
        var item = getData[i];
	    var row = ""
        row += "<tr>";
        row += 	"<td class='align-middle ps-3 name'>"+(i+1)+"</td>";
        row += 	"<td class='align-middle ps-3 name'>"+entrSeGu(item.entrSe)+"</td>";
        row += 	"<td class='align-middle ps-3 name'><a href='#' onclick='entryStatus(this)' id='emgn'>"+item.entrManageNo+"</a></td>";
        row += 	"<td class='align-middle ps-3 name'>"+item.client+"</td>";
        row += 	"<td class='align-middle ps-3 name'>"+item.expterTelno+"</td>";
        row += 	"<td class='align-middle ps-3 name'>"+item.expterCharger+"</td>";
        row += 	"<td class='align-middle ps-3 name'>"+item.imprTelno+"</td>";
        row += 	"<td class='align-middle ps-3 name'>"+item.imprCharger+"</td>";
        row += 	"<td class='align-middle ps-3 name'>"+item.userNm+"</td>";
        row += 	"<td class='align-middle ps-3 name'>"+item.telno+"</td>";
        row += 	"<td class='align-middle ps-3 name'>"+item.processDe+"</td>";
        row += 	"<td class='align-middle ps-3 name' id='state'>"+processSttusGu(item.processSttus)+"</td>";
        row += 	"<td class='align-middle ps-3 name'><button class='downloadBtn' onclick='downloadBtn(this)'><i class='fa-regular fa-folder-closed'></i></button></td>";
        row += "</tr>";
        tableBody.innerHTML += row;
    }
}

/*페이지네이션 렌더링 함수*/
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

/*의뢰유형 구분하는 함수*/
const entrSeGu = function(GuCd){
	if(GuCd=="EES1"){
		return "수출";
	}else{
		return "수입";
	}
}

/*처리상태 구분하는 함수*/
const processSttusGu = function(GuCd){
	if(GuCd=="EPS1"){return "통관신청";}
	else if(GuCd=="EPS2"){return "접수";}
	else if(GuCd=="EPS3"){return "입고신청";}
	else if(GuCd=="EPS4"){return "입고완료";}
	else if(GuCd=="EPS5"){return "검역신청";}
	else if(GuCd=="EPS6"){return "검역접수";}
	else if(GuCd=="EPS7"){return "검역완료";}
	else if(GuCd=="EPS8"){return "검역승인";}
	else if(GuCd=="EPS9"){return "반려";}
	else if(GuCd=="EPS10"){return "출고신청";}
	else if(GuCd=="EPS11"){return "출고완료";}
	else if(GuCd=="EPS12"){return "수출입승인";}
}

/*통관번호 클릭 함수 : 통관번호로 현재 통관 진행상태 볼 수 있음*/
const entryStatus = function(tr){
   console.log("클릭한 행 값 = ", tr);
   var entrManageNo = tr.text;
   console.log("부모에서 선택한 행의 통관번호 : ", entrManageNo);
   entryNo(entrManageNo);
}

/*통관번호 자식창으로 보내면서 해당 페이지 호출하는 함수*/
const entryNo = function(entrManageNo){
   console.log("통관번호 : ", entrManageNo);
   console.log("부모창에서 자식창으로 보내는 값 : ", entrManageNo);
   document.querySelector("#parents").value = entrManageNo;
   var entryProcessStatusWindow = window.open('/cbs/cstbrkr/entryProcessStatusPopup','_blank','width=1500, height=850, top=70, left=200, scrollbars=no');
}

/*관련서류 조회 버튼 클릭 함수*/
const downloadBtn = function(tr){
	var entrManage = tr.parentElement.parentElement.querySelector("#emgn").text;
	var state = tr.parentElement.parentElement.querySelector("#state").textContent;
	console.log("클릭한 행 통관번호 = ", entrManage);
	console.log("클릭한 행 처리상태 = ", state);
	entryDocuments(entrManage, state);
}

const entryDocuments = function(entrManage, state){
	console.log("통관번호 : ", entrManage);
	console.log("처리상태 : ", state);
	console.log("부모창에서 자식창으로 보내는 값 : ", entrManage, state);
	document.querySelector("#parents").value = "";
	document.querySelector("#parents").value = entrManage;
	document.querySelector("#parents2").value = "";
	document.querySelector("#parents2").value = state;
	
	if(state=="수출입승인" || state=="출고완료"){
		var entryDocumentsWindow = window.open('/cbs/cstbrkr/entryDocumentsPopup','_blank','width=400, height=350, top=70, left=200, scrollbars=no');
	}else{
		Swal.fire({
			  position: "top-center",
			  icon: "error",
			  title: "일정 처리상태 후 조회가 가능합니다.",
			  showConfirmButton: false,
			  timer: 2000
		});
	}
}

</script>
<body>
				<div class="entrManageNoSelect" style="display: none;">
					<input type="text" id="parents" value="">
					<input type="text" id="parents2" value="">
				</div>
	<div class="card">
	<div style="text-align: center; margin=0; max-width: 100%; height: auto;">
        <img id="ims" src="/resources/img/진행3.png">
    </div>
		<div class="card-body">
			<h4>통관 목록</h4>
          	<p>통관이 신청된 목록, 진행상황 및 서류 열람 가능</p>
				<div id="tableExample4"
				data-list="{&quot;valueNames&quot;:[&quot;name&quot;,&quot;email&quot;,&quot;payment&quot;],&quot;page&quot;:5,&quot;pagination&quot;:true,&quot;filter&quot;:{&quot;key&quot;:&quot;payment&quot;}}">
				<div class="input-group mb-3 w-75 ms-auto p-2 bd-highlight" style="padding: 10px;">
    				<select class="form-select" id="entrSeGu">
		            		<option selected value="">의뢰유형</option>
		            		<option value="EES1">수출</option>
		            		<option value="EES2">수입</option>
		        	</select>
		        	
    				<input type="date" id="startDate" class="form-control" placeholder="시작일" aria-label="" aria-describedby="button-addon2">
    				
    				<input type="date" id="endDate" class="form-control" placeholder="종료일" aria-label="" aria-describedby="button-addon2">
    				
					<select class="form-select" id="processSttusGu">
	            		<option selected value="">처리상태</option>
	            		<option value="EPS1">통관신청</option>
	            		<option value="EPS2">접수</option>
	            		<option value="EPS3">입고신청</option>
	            		<option value="EPS4">입고완료</option>
	            		<option value="EPS5">검역신청</option>
	            		<option value="EPS6">검역접수</option>
	            		<option value="EPS7">검역완료</option>
	            		<option value="EPS8">검역승인</option>
	            		<option value="EPS9">반려</option>
	            		<option value="EPS10">출고신청</option>
	            		<option value="EPS11">출고완료</option>
	            		<option value="EPS12">수출입승인</option>
		        	</select>
    				<input type="text" id="searchText" class="form-control" placeholder="검색어를 입력하세요." aria-label="" aria-describedby="button-addon2" style="flex: 1;">
    				<button class="btn btn-primary btn-sm" type="button" id="search" onclick="conditionSearch()">검색</button>
    				<button class="btn btn-phoenix-primary btn-sm px-3 me-1" type="button" id="resetBtn" onclick="conditionReset()">초기화</button>
				</div>
				<div class="table-responsive">
					<table class="table table-sm fs-9 mb-0" id="applyTable">
						<thead>
							<tr class="bg-body-highlight">
								<th class="sort border-top border-translucent ps-3">No</th>
								<th class="sort border-top border-translucent ps-3">의뢰유형</th>
								<th class="sort border-top border-translucent ps-3">통관관리번호</th>
								<th class="sort border-top border-translucent ps-3">의뢰인</th>
								<th class="sort border-top border-translucent ps-3">수출자 번호</th>
								<th class="sort border-top border-translucent ps-3">수출자 담당자</th>
								<th class="sort border-top border-translucent ps-3">수입자 번호</th>
								<th class="sort border-top border-translucent ps-3">수입자 담당자</th>
								<th class="sort border-top border-translucent ps-3">처리자</th>
								<th class="sort border-top border-translucent ps-3">처리자 연락처</th>
								<th class="sort border-top border-translucent ps-3">통관처리일자</th>
								<th class="sort border-top border-translucent ps-3">처리상태</th>
								<th class="sort border-top border-translucent ps-3">관련문서</th>
							</tr>
						</thead>
						<tbody class="entryProcesslist">
							
						</tbody>
					</table>
				</div>
				
				<!-- 페이지네이션 시작 -->
				<div class="pagination" id="pagination">
        
    			</div>
				<!-- 페이지네이션 종료 -->
				
			</div>
		</div>
	</div>
</body>
</html>