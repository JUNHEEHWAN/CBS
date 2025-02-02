<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<link rel="icon" type="image/png" sizes="32x32" href="https://prium.github.io/phoenix/v1.14.0/assets/img/favicons/favicon-32x32.png">
<link rel="icon" type="image/png" sizes="16x16" href="https://prium.github.io/phoenix/v1.14.0/assets/img/favicons/favicon-16x16.png">
<link rel="shortcut icon" type="image/x-icon" href="https://prium.github.io/phoenix/v1.14.0/assets/img/favicons/favicon.ico">
<link rel="manifest" href="https://prium.github.io/phoenix/v1.14.0/assets/img/favicons/manifest.json">
<link href="/resources/font-awesome/css/font-awesome.min.css" rel="stylesheet">
<meta name="msapplication-TileImage" content="../assets/img/favicons/mstile-150x150.png">
<meta name="theme-color" content="#ffffff">
<script src="/resources/js/imagesloaded.pkgd.min.js"></script>
<script src="/resources/js/simplebar.min.js"></script>
<script src="/resources/js/config.js"></script>
<link rel="stylesheet" href="/resources/css/sweetalert2.min.css">
<script src="/resources/js/sweetalert2.min.js"></script>
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
<link href="/resources/css/theme-rtl.min.css" type="text/css" rel="stylesheet" id="style-rtl" disabled="true">
<link href="/resources/css/theme.min.css" type="text/css" rel="stylesheet" id="style-default">
<link href="/resources/css/user-rtl.min.css" type="text/css" rel="stylesheet" id="user-style-rtl" disabled="true">
<link href="/resources/css/user.min.css" type="text/css" rel="stylesheet" id="user-style-default">
    
<style>
 body{ width:100%; height: 700px; margin-top: 20px; margin-left: 10px;}
.card {
    max-width: 45%; /* 최대 너비를 원하는 값으로 설정 */
    overflow: auto; /* 세로 및 가로 스크롤이 내용이 넘칠 때만 표시되도록 설정 */
}

.card .p-3 {
    max-width: 100%; /* 내부 요소의 최대 너비를 100%로 설정하여 최대 너비를 넘어가도록 함 */
    white-space: nowrap; /* 테이블 셀이 자동으로 줄 바꿈되지 않도록 설정 */
}
</style>

<script type="text/javascript">
//요소 가져오는 함수 정의(QS) 시작 /////////////////////////////////
const QS = function (pVal) {
	return document.querySelector(pVal).value;
};
const qs = (pVal) => {
  return document.querySelector(pVal);
};
//요소 가져오는 함수 정의(QS) 시작 /////////////////////////////////

//요소에 값 넣는 함수 정의(InsQS) 시작 /////////////////////////////////
const InsQS = function (pVal, pText) {
  return (document.querySelector(pVal).value = pText);
};
//요소에 값 넣는 함수 정의(InsQS) 시작 /////////////////////////////////



// jsp 실행시 선박일지 리스트 SELECT 함수 시작 ////////////////////
window.onload = ()=>{
	SDSel();
}
//jsp 실행시 선박일지 리스트 SELECT 함수 끝 ////////////////////

// 체크 박스 중복 선택 불가 함수 시작 ////////////////////////////
const selectRow = (row) => {
    const checkbox = row.querySelector('.chkBox');
    if (checkbox) {
        checkbox.checked = !checkbox.checked; // 체크박스의 상태를 변경
    }
};
// 체크 박스 중복 선택 불가 함수 끝 ////////////////////////////


// 선박 일지 리스트 SELECT 함수 시작 ///////////////////////////////
var shipDiaryCd;
const SDSel = (pVal) => {
	var xhr = new XMLHttpRequest();
	xhr.open("POST", "/cbs/trnsprt/shipDiary", true);
	xhr.setRequestHeader("Content-Type","application/json");
	xhr.onload = () => {
   	console.log("넘어온값 체크 : ", xhr.responseText);
    	var response = JSON.parse(xhr.responseText);
    	shipDiaryTbodyAdd(response);
    	shipDiaryClick(response);
	};
	xhr.send(JSON.stringify(pVal));
};

const shipDiaryTbodyAdd = function(response){
	var str = "";
	response.forEach(function(item, idx){
		str += "<tr>";
		str += "<td><input type='checkbox' id='checkbox1"+idx+"' onclick='shipDiaryHandleCheckboxClick("+idx+")'/></td>";
		str += "<td>"+(idx+1)+"</td>";
		str += "<td>"+item.blNo+"</td>";
		str += "<td>"+item.imoNo+"</td>";
		str += "<td>"+item.shipNm+"</td>";
		str += "<td>"+item.startPrt+"</td>";
		str += "<td>"+item.arvlPrt+"</td>";
		str += "<td>"+item.shipStartDe+"</td>";
		str += "<td>"+item.shipEndDe+"</td>";
		str += "<td>"+item.shipDest+"</td>";
		str += "<td>"+item.shipDiaryCd+"</td>";
		str += "</tr>";
	});
	document.querySelector("#SDTable").innerHTML = str;
}

const shipDiaryHandleCheckboxClick = function(idx) {
    var checkboxes = document.querySelectorAll('.shipDiaryList input[type="checkbox"]');
    checkboxes.forEach(function(checkbox, index) {
        if (index !== idx) {
            checkbox.checked = false;
        }
    });
};

var selectedShipDiary ={};
const shipDiaryClick = function(response){		
// 	console.log("선박일지 클릭되고 받아오는 response 값 : ", response);
	document.querySelectorAll('.shipDiaryList tr').forEach(function(row, idx) {
	    row.addEventListener('click', function() {
	        // 모든 체크박스 해제.
	        document.querySelectorAll('.shipDiaryList input[type="checkbox"]').forEach(function(checkbox) {
	            checkbox.checked = false;
	        });
	        // 클릭한 행의 체크박스 체크
	        var checkbox = document.getElementById('checkbox1' + idx);
	        if (checkbox) {
	            checkbox.checked = true;
	        }
	        // 클릭한 행의 정보
	        var selectedRowData = response[idx];
	        
// 	        console.log("선박일지 클릭한 행의 정보 :", selectedRowData);
	        
	        selectedShipDiary = {
	        		blNo: selectedRowData.blNo,
	        		imoNo: selectedRowData.imoNo,
	        		shipNm: selectedRowData.shipNm,
	        		startPrt: selectedRowData.startPrt,
	        		arvlPrt: selectedRowData.arvlPrt,
	        		shipStartDe: selectedRowData.shipStartDe,
	        		shipEndDe: selectedRowData.shipEndDe,
	        		shipDest: selectedRowData.shipDest,
	        		shipDiaryCd: selectedRowData.shipDiaryCd
	        };
	        console.log("선박일지 클릭한 행의 정보 포장한 JSON : ", selectedShipDiary);
	        Aimo(selectedRowData.imoNo);
	    });
	});
}
//선박 일지 리스트 SELECT 함수 시작 ///////////////////////////////

// 컨테이너 리스트 SELECT 함수 시작 ////////////////////////////////
var aImo = "";
const Aimo = function(aImo){
	qs("#SCTable").innerHTML = "";
	let data = {
		imoNo:aImo
	}
	var xhr = new XMLHttpRequest();
	xhr.open("POST","/cbs/trnsprt/shipContain",true);
	xhr.setRequestHeader("Content-Type","application/json");
	xhr.onload = ()=>{
		//console.log("넘어온값 체크 ",xhr.responseText);
		var response = JSON.parse(xhr.responseText);
		containerTbodyAdd(response);
		containerClick(response);
	}
    xhr.send(JSON.stringify(data));
};

const containerTbodyAdd = function(response){
	var str = "";
	response.forEach(function(item, idx){
		str += "<tr>";
		str += "<td><input type='checkbox' id='checkbox2"+idx+"' onclick='containerHandleCheckboxClick("+idx+")'/></td>";
		str += "<td>"+(idx+1)+"</td>";
		str += "<td>"+item.imoNo+"</td>";
		str += "<td>"+item.cntanrInnb+"</td>";
		str += "<td>"+item.cntanrStndrd+"</td>";
		str += "<td>"+item.cntanrMtrqlt+"</td>";
		str += "</tr>";
	});
	document.querySelector("#SCTable").innerHTML = str;
}

const containerHandleCheckboxClick = function(idx) {
    var checkboxes = document.querySelectorAll('.containerList input[type="checkbox"]');
    checkboxes.forEach(function(checkbox, index) {
        if (index !== idx) {
            checkbox.checked = false;
        }
    });
};

var selectedContainer ={};
const containerClick = function(response){		
// 	console.log("컨테이너 클릭되고 받아오는 response 값 : ", response);
	document.querySelectorAll('.containerList tr').forEach(function(row, idx) {
	    row.addEventListener('click', function() {
	        // 모든 체크박스 해제.
	        document.querySelectorAll('.containerList input[type="checkbox"]').forEach(function(checkbox) {
	            checkbox.checked = false;
	        });
	        // 클릭한 행의 체크박스 체크
	        var checkbox = document.getElementById('checkbox2' + idx);
	        if (checkbox) {
	            checkbox.checked = true;
	        }
	        // 클릭한 행의 정보
	        var selectedRowData = response[idx];
	        
// 	        console.log("컨테이너 클릭한 행의 정보 :", selectedRowData);
	        
	        selectedContainer = {
	        		imoNo: selectedRowData.imoNo,
	        		cntanrInnb: selectedRowData.cntanrInnb,
	        		cntanrStndrd: selectedRowData.cntanrStndrd,
	        		cntanrMtrqlt: selectedRowData.cntanrMtrqlt
	        };
	        console.log("컨테이너 클릭한 행의 정보 포장한 JSON : ", selectedContainer);
	    });
	});
}

// 컨테이너 리스트 SELECT 함수 끝 ////////////////////////////////

// 선박일지 + 컨테이너 선택후 통관신청 함수 시작 //////////////////////////
const shipChoice = function(){
	
   	console.log("imoNo",selectedContainer.imoNo);
	
    if (selectedContainer.imoNo==null) {
        // 입력값이 모두 채워지지 않은 경우 SweetAlert로 실패 메시지 표시
        Swal.fire({
            position: "top-center",
            icon: "error",
            title: "선박일지와 컨테이너를 선택해주세요.",
            showConfirmButton: false,
            timer: 2000
        });
        return;
    }
	
	//window.opener : 부모창
	window.opener.document.getElementById("trnsprtStle").value = "해상운송";							//운송형태
	window.opener.document.getElementById("waybilNo").value = selectedShipDiary.blNo;	        	//운송장번호
	window.opener.document.getElementById("startPrt").value = selectedShipDiary.startPrt;	    	//출발항구
	window.opener.document.getElementById("arvlPrt").value = selectedShipDiary.arvlPrt;	        	//입항항구
	window.opener.document.getElementById("shipStartDe").value = selectedShipDiary.shipStartDe;		//출항일자
	window.opener.document.getElementById("shipEndDe").value = selectedShipDiary.shipEndDe;	    	//입항일자
	window.opener.document.getElementById("shipNm").value = selectedShipDiary.shipNm;	        	//선박 명
	window.opener.document.getElementById("coudes").value = selectedShipDiary.shipDest;	        	//목적국가
	window.opener.document.getElementById("shipDiaryCd").value = selectedShipDiary.shipDiaryCd;	    //선박일지
	window.opener.document.getElementById("imoNo").value = selectedContainer.imoNo;	        		//IMO번호
	window.opener.document.getElementById("cntanrInnb").value = selectedContainer.cntanrInnb;		//컨테이너 번호
	window.opener.document.getElementById("cntanrStndrd").value = selectedContainer.cntanrStndrd;	//규격(CBM)
	window.opener.document.getElementById("cntanrMtrqlt").value = selectedContainer.cntanrMtrqlt;	//재질
	
	window.close(); 
}
	

//선박일지 + 컨테이너 선택후 통관신청 함수 끝 //////////////////////////

</script>



<div style="display:flex;">
	 <div class="card" style="width:55%; max-width: 55%; height: 700px; overflow: auto; margin-right: 10px;">
        <div class="input-group mb-3 ms-auto p-2 bd-highlight" style="padding: 10px; width: 95%">
				<input type="date" id="shipStartDe" class="form-control" placeholder="출항날짜" aria-label="" aria-describedby="button-addon2">
				<input type="date" id="shipEndDe" class="form-control" placeholder="입항날짜" aria-label="" aria-describedby="button-addon2">
				<select class="form-select" id="shipKeyword">
					<option selected value="">검색조건</option>
					<option value="BL_NO">BL번호</option>
					<option value="IMO_NO">IMO번호</option>
					<option value="SHIP_NM">선박명</option>
					<option value="START_PRT">출항</option>
					<option value="ARVL_PRT">입항</option>
				</select>
				<input type="text" id="searchShipText" class="form-control" placeholder="검색어를 입력하세요." aria-label="" aria-describedby="button-addon2" style="">
				<button class="btn btn-primary btn-sm" type="button" id="search" onclick="shipSearch()">검색</button>
				<button class="btn btn-primary btn-sm" type="reset" id="reset" onclick="reset()">초기화</button>
		</div>
        <div class="card p-3">
            <table class="table table-sm fs-9 mb-0" style="text-align: center; font-size: 0.9rem; white-space: nowrap;">
                <thead>
                    <tr class="bg-body-highlight">
				    <th class="text-center"><input class='form-check-input chkBox' type='checkbox'></th>
					    <th colspan="1" class="col-md-1">NO</th>
					    <th colspan="1" class="">BL번호</th>
					    <th colspan="1" class="">IMO번호</th>
					    <th colspan="1" class="">선박명</th>
					    <th colspan="1" class="">출항</th>
					    <th colspan="1" class="">입항</th>
					    <th colspan="1" class="">출항 시간</th>
					    <th colspan="1" class="">입항 시간</th>
					    <th colspan="1" class="">목적 국가</th>
					    <th colspan="1" class="">선박일지코드</th>
					</tr>
		    	</thead>
                <tbody class="shipDiaryList" id="SDTable">
                    <!-- 테이블 내용 -->
                </tbody>
            </table>
        </div>
    </div>
		
	<div class="card" style="width:40%; max-width: 40%; height: 700px; overflow: auto; ">
       <div class="input-group mb-3 ms-auto p-2 bd-highlight" style="padding: 10px; width: 78%">
<!-- 		<button type="button" class="btn btn-phoenix-secondary btn-sm" style="height: auto; float: left;" onclick="downExcel()">excel다운</button> -->
				<select class="form-select" id="contKeyword">
					<option selected value="">검색조건</option>
					<option value="CNTANR_INNB">컨테이너 코드</option>
					<option value="CNTANR_STNDRD">규격</option>
					<option value="CNTANR_MTRQLT">재질</option>
				</select>
				<input type="text" id="searchContText" class="form-control" placeholder="검색어를 입력하세요." aria-label="" aria-describedby="button-addon2" style="width: 130px;">
				<button class="btn btn-primary btn-sm" type="button" id="search" onclick="contSearch()">검색</button>
				<button class="btn btn-primary btn-sm" type="reset" id="reset" onclick="reset()">초기화</button>
		</div>
        <div class="card p-3">
            <table class="table table-sm fs-9 mb-0" style="text-align: center; font-size: 0.9rem; white-space: nowrap;">
                <thead>
                    <tr class="bg-body-highlight">
				    <th class="text-center"><input class='form-check-input chkBox' type='checkbox'></th>
					    <th colspan="1" class="col-md-1">NO</th>
					    <th colspan="1" class="">IMO번호</th>
					    <th colspan="1" class="">컨테이너 번호</th>
					    <th colspan="1" class="">규격(CBM)</th>
					    <th colspan="1" class="">재질</th>
					</tr>
		    	</thead>
                <tbody class="containerList" id="SCTable">
                    <!-- 테이블 내용 -->
                </tbody>
            </table>
        </div>
        <button class="btn btn-primary btn-sm" id="btnSelect" onclick="shipChoice()" style="float: right; margin-top: 10px;">선택</button>
    </div>
</div>		



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
