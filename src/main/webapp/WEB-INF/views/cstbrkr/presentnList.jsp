<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<style type="text/css">
th, td { text-align: center !important; }
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
<script type="text/javascript">

var startDateS = "";
var endDateS = "";
var bsnAt = "";
var crmnlHist = "";
var taxNpymHist = "";
var processSttus = "";
var searchText = "";

//비동기
window.onload = function() {
	presentnPapersList();//페이지 불러오자마자 리스트 띄워주는 함수

/*4. 조건이 클릭 될 때마다 조건에 맞추어 검색해서 리스트를 뽑는 함수*/
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
document.querySelector("#bsnAtGu").addEventListener('change', function(){
	bsnAt = this.value;
   	console.log("영업여부 : ", bsnAt);
   	conditionSearch();
	})
document.querySelector("#crmnlHistGu").addEventListener('change', function(){
	crmnlHist = this.value;
   	console.log("범죄이력 : ", crmnlHist);
   	conditionSearch();
	})
document.querySelector("#taxNpymHistGu").addEventListener('change', function(){
	taxNpymHist = this.value;
   	console.log("세금체납이력 : ", taxNpymHist);
   	conditionSearch();
	})
document.querySelector("#processSttusGu").addEventListener('change', function(){
	processSttus = this.value;
   	console.log("고객상태 승인여부 : ", processSttus);
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
	presentnPapersList();
	document.querySelector("#startDate").value = "";
	document.querySelector("#endDate").value = "";
	document.querySelector("#bsnAtGu").value = "";
	document.querySelector("#crmnlHistGu").value = "";
	document.querySelector("#taxNpymHistGu").value = "";
	document.querySelector("#processSttusGu").value = "";
}


/*1. 페이지 불러오자 마자 리스트를 띄워주는 함수*/
const presentnPapersList = function(){
	var xhr = new XMLHttpRequest();
	xhr.open("POST", "/cbs/cstbrkr/presentnPapersList", true);
	//xhr.setRequestHeader("Content-Type", "text/plain");
	xhr.onreadystatechange = function(){
		if(xhr.readyState == 4 && xhr.status == 200){
			var response = JSON.parse(xhr.responseText);
			console.log("페이지 리스트 불러오기 성공 가져온 값 : ", response);
			//presentnPapersListAdd(response);
			getData = response; //데이터를 가져와서 변수에 할당
			renderTable(); //테이블 렌더링
			renderPagination(); //페이지네이션 렌더링
		}
	}
	xhr.send();
}
	
	
/*2.조건 검색 함수*/
const conditionSearch = function(){
	var conditionDatas = {
			startDateS : startDateS,
			endDateS : endDateS,
			bsnAt : bsnAt,
			crmnlHist : crmnlHist,
			taxNpymHist : taxNpymHist,
			processSttus : processSttus,
			searchText : searchText
	}
	console.log("조건 검색 버튼 클릭 됨.");
	console.log("조건 데이터 집합 : ", conditionDatas);
	
	var xhr = new XMLHttpRequest();
	xhr.open("POST", "/cbs/cstbrkr/presentnPapersConditionSearchList", true);
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
	xhr.send(JSON.stringify(conditionDatas));
}
//================================================================================	
	/*1. 페이지 불러오자 마자 리스트를 띄워주는 함수*/
	/*
	const presentnPapersList = function(){
		var xhr = new XMLHttpRequest();
		xhr.open("POST", "/cbs/cstbrkr/presentnPapersList", true);
		xhr.onreadystatechange = function(){
			if(xhr.readyState == 4 && xhr.status == 200){
				var response = JSON.parse(xhr.responseText);
				console.log("페이지 리스트 불러오기 성공 가져온 값 : ", response);
				presentnPapersListAdd(response);
			}
		}
		xhr.send();
	}
	/*
	/*2. 리스트 출력하는 함수*/
	/*
	const presentnPapersListAdd = function(response){
		var str = "";
		var arraylength = response.length;
		
		for(var i=0; i<arraylength; i++){
			str += "<tr>";
			str += 		"<td class='align-middle ps-3 name'>"+(i+1)+"</td>";
			str += 		"<td class='align-middle ps-3 name' style='display: none;'>"+response[i].presentnPapersNo+"</td>";
			str += 		"<td class='align-middle ps-3 name'>"+response[i].entrprsNm+"</td>";
			str += 		"<td class='align-middle ps-3 name'>"+response[i].bizrno+"</td>";
			str += 		"<td class='align-middle ps-3 name'>"+response[i].papersPresentnDe+"</td>";
			str += 		"<td class='align-middle ps-3 name'>"+bsnAt(response[i].bsnAt)+"</td>";
			str += 		"<td class='align-middle ps-3 name'>"+crmnlHist(response[i].crmnlHist)+"</td>";
			str += 		"<td class='align-middle ps-3 name'>"+taxNpymHist(response[i].taxNpymHist)+"</td>";
			str += 		"<td class='align-middle ps-3 name'>"+processSttusGu(response[i].processSttus)+"</td>";
			str += 		"<td class='align-middle ps-3 name'>" +
		       				"<input type='button' class='btn btn-secondary px-1 me-1 btnPapersDetail' value='상세보기' data-presentnPapers-No='" + response[i].presentnPapersNo + "' onclick='papersDetail(\"" + response[i].presentnPapersNo + "\")'>" +
		       			"</td>";
			str += "</tr>";
		}
		document.querySelector(".presentnPaperslist").innerHTML = str;
  }
	*/
//목록 및 페이징 처리================================================================================	
var getData = []; // JSON 데이터를 저장할 배열
var itemsPerPage = 10; // 페이지당 보여줄 아이템 수
var currentPage = 1; // 현재 페이지 번호

//페이지당 아이템 수에 맞게 데이터를 표에 렌더링
const renderTable = function renderTable () {
	var tableBody = document.querySelector('.presentnPaperslist');
	tableBody.innerHTML = ''; //표 초기화
	
	var startIdx = (currentPage - 1) * itemsPerPage;
	var endIdx = startIdx + itemsPerPage;
	
	for(var i = startIdx; i < endIdx && i < getData.length; i++ ){
		var item = getData[i];
		var row = ""
		row += "<tr>";
		row += 		"<td class='align-middle ps-3 name'>"+(i+1)+"</td>";
		row += 		"<td class='align-middle ps-3 name' style='display: none;'>"+item.presentnPapersNo+"</td>";
		row += 		"<td class='align-middle ps-3 name'>"+item.entrprsNm+"</td>";
		row += 		"<td class='align-middle ps-3 name'>"+item.bizrno+"</td>";
		row += 		"<td class='align-middle ps-3 name'>"+item.papersPresentnDe+"</td>";
		row += 		"<td class='align-middle ps-3 name'>" + (item.bsnAt ? bsnAtGu(item.bsnAt) : "-") + "</td>";
		row += 		"<td class='align-middle ps-3 name'>" + (item.crmnlHist ? crmnlHistGu(item.crmnlHist) : "-") + "</td>";
		row += 		"<td class='align-middle ps-3 name'>" + (item.taxNpymHist ? taxNpymHistGu(item.taxNpymHist) : "-") + "</td>";
	 /* row += 		"<td class='align-middle ps-3 name'>"+processSttusGu(item.processSttus)+"</td>"; */
		row += 		"<td class='align-middle ps-3 name'>" + (item.processSttus === 'CPS1' ? "신청전" :
                    										(item.processSttus === 'CPS2' ? "처리중" :
										                    (item.processSttus === 'CPS3' ? "승	인" :
										                    (item.processSttus === 'CPS4' ? "미승인" : '-')))) + "</td>";
		/* row += 		"<td class='align-middle ps-3 name'>" +
	       				"<input type='button' class='btn btn-secondary px-1 me-1 btnPapersDetail' value='상세보기' data-presentnPapers-No='" + item.presentnPapersNo + "' onclick='papersDetail(\"" + item.presentnPapersNo + "\")'>" +
	       			"</td>";
		row += "</tr>"; */
		 row += "<td class='align-middle ps-3 name'>" +
			        "<button class='applyBtn' id='papersDetailBtn' onclick='papersDetail(\"" + item.presentnPapersNo + "\")'>" +
		        		"<h5><span class='badge badge-phoenix badge-phoenix-secondary'>상세보기</span></h5>" +
			        "</button>" +
		        "</td>";
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

    for (var i = startPage; i <= endPage; i++) {
        var button = document.createElement('button');
        button.textContent = i;
        button.className = "btn btn-outline-primary btn-sm";
        button.style.marginRight = "5px"
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

// 현재 페이지 버튼을 강조 표시
const highlightButton = function() {
    var buttons = document.querySelectorAll('.pagination button');
    buttons.forEach(function(button) {
        button.classList.remove('active');
        if (parseInt(button.textContent) === currentPage) {
            button.classList.add('active');
        }
    });
}
	
//================================================================================	
	
/*영업여부 구분하는 함수*/
const bsnAtGu = function(GuCd){
    if(GuCd=="T"){return "영업중";}
    else if(GuCd=="F"){return "폐업";}
    else if(GuCd=="/"){return "-";}
    }

/*범죄이력 구분하는 함수*/
const crmnlHistGu = function(GuCd){
    if(GuCd=="T"){return "이력 있음";}
    else if(GuCd=="F"){return "이력 없음";}
    else if(GuCd=="/"){return "-";}
    }

/*세금체납이력 구분하는 함수*/
const taxNpymHistGu = function(GuCd){
	if(GuCd=="T"){return "이력 있음";}
	else if(GuCd=="F"){return "이력 없음";}
	else if(GuCd=="/"){return "-";}
	}
  
/*처리상태 구분하는 함수*/
const processSttusGu = function(GuCd){
	if(GuCd=="CPS1"){return "신청전";}
	else if(GuCd=="CPS2"){return "처리중";}
	else if(GuCd=="CPS3"){return "승 인";}
	else if(GuCd=="CPS4"){return "반 려";}
}


const papersDetail = function(presentnPapersNo){ // 클릭 함수
    console.log("클릭한 버튼의 값: ", presentnPapersNo);
    papersNo(presentnPapersNo);
    console.log("상세보기 클릭한 버튼의 제출서류번호ㅎㅎ: ", presentnPapersNo);
}

const papersNo = function(presentnPapersNo){      //제출서류번호 자식창으로 보내면서 해당 페이지 호출하는 함수
   console.log("제출서류번호 : ", presentnPapersNo);
   document.querySelector("#parents").value = presentnPapersNo;
   console.log("부모창에서 자식창으로 보내는 값ㅎㅎ : ", presentnPapersNo);
   var papersWindow = window.open('/cbs/cstbrkr/presentnPapersWindow','_blank','width=1000, height=600, top=50, left=50, scrollbars=no, location=no');
}
	

	</script>
<!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@의뢰 목록@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@   -->
      <div class="presentnpapersNoSelect" style="display: none">
		<input type="text" id="parents" value="">
	</div>
      <div class="card h-50">
      	<div style="text-align: left; margin=0; max-width: 100%; height: auto;">
           <img id="ims" src="/resources/img/진행1.png">
           
           <div class="box_st5">
          <div class="box_st_ico">
             <div class="my-3"></div>
              <div class="ico_boxImg">
                  <img src="/resources/img/titlelogo.png" style="width:100px;height:100px; float:left; margin-right: 20px;">
              </div>
              <div style="float:left;">
                 <div class="my-3"></div>
                  <h3 class="fs18 pc_black">의뢰  목록</h3>
                  <p>이 페이지는 <span style="color:#155eb6;"><b>고객의 수출입 통관 의뢰 목록 확인과 고객 검사를 요청</b></span>하는 페이지입니다.<br>기타 궁금하신 점은 관세청 콜센터 125번으로 문의하시기 바랍니다.</p>
              </div>
              <div style="clear:both;"></div>
          </div>
      </div>
           
      	</div>
        <div class="card-body">
	          <div id="tableExample4" data-list="{&quot;valueNames&quot;:[&quot;name&quot;,&quot;email&quot;,&quot;payment&quot;],&quot;page&quot;:5,&quot;pagination&quot;:true,&quot;filter&quot;:{&quot;key&quot;:&quot;payment&quot;}}">
            <div class="input-group mb-3 w-75 ms-auto p-2 bd-highlight" style="padding: 10px;">

    				<input type="date" id="startDate" class="form-control" placeholder="시작일" aria-label="" aria-describedby="button-addon2">
    				<input type="date" id="endDate" class="form-control" placeholder="종료일" aria-label="" aria-describedby="button-addon2">

    				<select class="form-select" id="bsnAtGu">
		            		<option selected value="">영업여부</option>
		            		<option value="T">영업중</option>
		            		<option value="F">폐업</option>
		        	</select>
    				<select class="form-select" id="crmnlHistGu">
		            		<option selected value="">범죄이력</option>
		            		<option value="T">이력 있음</option>
		            		<option value="F">이력 없음</option>
		        	</select>
    				<select class="form-select" id="taxNpymHistGu">
		            		<option selected value="">세금체납이력</option>
		            		<option value="T">이력 있음</option>
		            		<option value="F">이력 없음</option>
		        	</select>
					<select class="form-select" id="processSttusGu">
	            		<option selected value="">고객상태 승인여부</option>
	            		<option value="CPS1">신청전</option>
	            		<option value="CPS2">처리중</option>
	            		<option value="CPS3">승 인</option>
	            		<option value="CPS4">반 려</option>
		        	</select>
		        	
    				<input type="text" id="searchText" class="form-control" placeholder="검색어를 입력하세요." aria-label="" aria-describedby="button-addon2" style="flex: 1;">
    				<button class="btn btn-primary btn-sm" type="button" id="search" onclick="conditionSearch()">검색</button>
    				<button class="btn btn-phoenix-primary btn-sm px-3 me-1" type="button" id="resetBtn" onclick="conditionReset()">초기화</button>
				</div>
            <div class="table-responsive" style="text-align: center;">
              <table class="table table-sm fs-9 mb-0">
                <thead>
                  <tr class="bg-body-highlight">
                    <th class="sort border-top border-translucent ps-3">No</th>
                    <th class="sort border-top border-translucent ps-3">기업명</th>
                    <th class="sort border-top border-translucent ps-3">사업자등록번호</th>
                    <th class="sort border-top border-translucent ps-3">제출일자</th>
                    <th class="sort border-top border-translucent ps-3">영업여부</th>
                    <th class="sort border-top border-translucent ps-3">범죄이력</th>
                    <th class="sort border-top border-translucent ps-3">세금체납이력</th>
                    <th class="sort border-top border-translucent ps-3">고객상태 승인여부</th>
                    <th class="sort border-top border-translucent ps-3">상세</th>
                  </tr>
                </thead>
                <tbody class="presentnPaperslist">
                </tbody>
              </table>
            </div>
            
            <!-- 페이지네이션 시작 -->
				<div class="pagination" id="pagination"></div>
			<!-- 페이지네이션 종료 -->
            
          </div>
        </div>
      </div>
<!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
