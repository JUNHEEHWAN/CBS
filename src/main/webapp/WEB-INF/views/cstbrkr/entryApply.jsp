<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>통관신청</title>
<link rel="stylesheet" href="/resources/css/sweetalert2.min.css">
<script src="/resources/js/sweetalert2.min.js"></script>
<script type="text/javascript" src="/resources/js/jquery.min.js"></script>
<style>
.row{
	height: 50px;
}
#entryTab{
	background-color: white;
}
#goodsTab{
	background-color: white;
}
/* 탭 및 탭 컨텐츠 스타일 */
.tab {
	overflow: hidden;
	border-bottom: 1px solid #ccc;
	background-color: #F5F7FA;
}
.tab button {
	background-color: inherit;
	float: left;
	border: none;
	outline: none;
	cursor: pointer;
	padding: 14px 16px;
	transition: 0.3s;
}

.tab button.active {
	background-color: #C3D5FF;
}

.tabcontent {
	display: none;
	padding: 6px 12px;
	border: 1px solid #ccc;
	border-top: none;
}

.input-group {
    margin-top: 5px;	
    margin-bottom: 5px;
}

.input-group-text {
    display: inline-block;
    width: 115px;
}

.table-responsive {
  display: block;
  max-height: 250px;
  min-height: 200px;
  overflow-y: scroll;
}
.card{
	border: none;
}
.card-body{
	height: 700px;
}
.unitDiv{
    position: relative; display: flex;
}
.input-explain>input{
	direction: rtl;
}
.unitInput{
    padding: 0 30px 0 0;
    text-align: right;
}
.unitSpan{ 
    position: absolute;
    right: 10px;
    top: 50%;
    transform: translateY(-50%);
    z-index: 9999;
}
.deleteBtn{
	background: none;
    border: none;
    padding: 0;
    cursor: pointer;
    width: 1px;
}
.unitDiv::after {
    content: attr(data-placeholder);
    position: absolute;
    top: 50%;
    right: 10px; /* placeholder의 오른쪽 여백 조절 */
    transform: translateY(-50%);
    pointer-events: none;
    color: #6c757d; /* placeholder 색상 조절 */
}
</style>

<script>
/*공통 시작*/

/*통괕 신청에서 신청 버튼 누른 행값 가져오기*/
var localData;
var localEntryData;
if(localStorage.getItem("applyEntryInfo")){
	localData = JSON.parse(localStorage.getItem("applyEntryInfo"));
}
if(localStorage.getItem("progressEntryInfo")){
	localEntryData = JSON.parse(localStorage.getItem("progressEntryInfo"));
}

console.log("통관신청 행 불러오는 값 : ", localData);

/*위에 탭 버튼을 눌렀을 때 바뀌는 동작.*/
function openTab(evt, tabName) {
	var i, tabcontent, tablinks;
	tabcontent = document.getElementsByClassName("tabcontent");
	for (i = 0; i < tabcontent.length; i++) {
		tabcontent[i].style.display = "none";
	}
	tablinks = document.getElementsByClassName("tablinks");
	for (i = 0; i < tablinks.length; i++) {
		tablinks[i].className = tablinks[i].className
				.replace(" active", "");
	}
	document.getElementById(tabName).style.display = "block";
	evt.currentTarget.className += " active";
}

/*공통 querySelector value값*/
const qsV = function(pVal){
	return document.querySelector(pVal).value;
}

/*공통 querySelector 요소 선택*/
const qsE = function(pVal){
	return document.querySelector(pVal);
}
	
/*Dom 읽고 실행*/
window.onload = function(){
	// 페이지 로드 시 통관신청 탭 활성화
    document.getElementById('entryTab').style.display = "block";
    document.querySelector('.tablinks').classList.add("active");
	qsE("#client").value = localData.entrprsNm;
	cstbrkrName();
	setClientType(localData.cprNo);
	if(localEntryData!=null){
		localDataGet(localEntryData);
		document.querySelector("#autoComplate").disabled = true;
		document.querySelector("#diarySelect").disabled = true;
	}
    var tbody = document.querySelector('.goodsList');
    var entryApplyBtn = document.querySelector("#entryApplyBtn");
    if (tbody.innerHTML.trim() === '') {
    	entryApplyBtn.disabled = true;
    } else {
    	entryApplyBtn.disabled = false;
    }
}
	
const localDataGet = function(){
	console.log("localDataGet 진행 실행 됨.");
	console.log("임시저장 된 통관 정보 : ", localEntryData);
	
	document.querySelector("#client").value = ""            ;
    document.querySelector("#notifyInfo").value = ""        ;
    document.querySelector("#expterCmpnm").value = ""       ;
    document.querySelector("#expterAdres").value = ""       ;
    document.querySelector("#expterTelno").value = ""       ;
    document.querySelector("#expterCharger").value = ""     ;
    document.querySelector("#imprCmpnm").value = ""         ;
    document.querySelector("#imprAdres").value = ""         ;
    document.querySelector("#imprTelno").value = ""         ;
    document.querySelector("#imprCharger").value = ""       ;
    document.querySelector("#manctmKwa").value = ""         ;
    document.querySelector("#manctmKwaCharger").value = ""  ;
    document.querySelector("#trnsprtStle").value = ""       ;
    document.querySelector("#waybilNo").value = ""          ;
    document.querySelector("#startPrt").value = ""          ;
    document.querySelector("#arvlPrt").value = ""           ;
    document.querySelector("#shipStartDe").value = ""       ;
    document.querySelector("#shipEndDe").value = ""         ;
    document.querySelector("#shipNm").value = ""            ;
    document.querySelector("#coudes").value = ""            ;
	
	qsE("#client").value = localEntryData.entryVO.client                       ; 
	qsE("#notifyInfo").value = localEntryData.entryVO.notifyInfo               ; 
	qsE("#expterCmpnm").value = localEntryData.entryVO.expterCmpnm             ; 
	qsE("#expterAdres").value = localEntryData.entryVO.expterAdres             ; 
	qsE("#expterTelno").value = localEntryData.entryVO.expterTelno             ; 
	qsE("#expterCharger").value = localEntryData.entryVO.expterCharger         ; 
	qsE("#imprCmpnm").value = localEntryData.entryVO.imprCmpnm                 ; 
	qsE("#imprAdres").value = localEntryData.entryVO.imprAdres                 ; 
	qsE("#imprTelno").value = localEntryData.entryVO.imprTelno                 ; 
	qsE("#imprCharger").value = localEntryData.entryVO.imprCharger             ; 
	qsE("#manctmKwa").value = localEntryData.entryVO.manctmKwa                 ; 
	qsE("#manctmKwaCharger").value = localEntryData.entryVO.manctmKwaCharger   ; 
	qsE("#trnsprtStle").value = localEntryData.entryVO.trnsprtStle             ; 
	qsE("#waybilNo").value = localEntryData.entryVO.waybilNo                   ; 
	qsE("#startPrt").value = localEntryData.entryVO.startPrt                   ; 
	qsE("#arvlPrt").value = localEntryData.entryVO.arvlPrt                     ; 
	qsE("#shipStartDe").value = localEntryData.entryVO.shipStartDe             ; 
	qsE("#shipEndDe").value = localEntryData.entryVO.shipEndDe                 ; 
	qsE("#shipNm").value = localEntryData.entryVO.shipNm                       ; 
	qsE("#coudes").value = localEntryData.entryVO.coudes                       ; 
	qsE("#entrManageNo").value = localEntryData.entryVO.entrManageNo           ; 
	qsE("#cstmrCd").value = localEntryData.entryVO.cstmrCd                     ;
	qsE("#shipDiaryCd").value = localEntryData.shipOperateContainerVO.shipDiaryCd;
	qsE("#imoNo").value = localEntryData.shipOperateContainerVO.imoNo          ;
	qsE("#cntanrInnb").value = localEntryData.shipOperateContainerVO.cntanrInnb;
	qsE("#cntanrStndrd").value = localEntryData.containerVO.cntanrStndrd;
	qsE("#cntanrMtrqlt").value = localEntryData.containerVO.cntanrMtrqlt;

	setRequestType(localEntryData.entryVO.entrSe); // 수출로 설정
	document.getElementById("tempStorageBtn").disabled = true;
	inputReadonly();	//input readonly 함수
	disabledRadioBtn();	//radio disabled 함수
	openTab(event, 'goodsTab');
	disableButtonClick();
}
	
/*클릭 이벤트를 비활성화하는 함수*/
const disableButtonClick = function() {
    document.getElementById('diarySelect').onclick = function() {
        return false;
    };
}
	
// 의뢰인 유형을 설정하는 함수
const setClientType = function(type) {
    if (type === null) {
        document.getElementById('person').checked = true;
    } else {
        document.getElementById('legal').checked = true;
    }
}

// 의뢰 유형을 설정하는 함수
const setRequestType = function(type) {
    if (type === 'EES1') {
        document.getElementById('export').checked = true;
    } else if (type === 'EES2') {
        document.getElementById('import').checked = true;
    }
}
	
/*알러트 1값받으면 완료 2값 받으면 실패 띄우는 함수*/
const sweetAlertGu = function(num){
	if(num == 1){
		Swal.fire({
			  position: "top-center",
			  icon: "success",
			  title: "임시저장이 완료되었습니다.",
			  showConfirmButton: false,
			  timer: 2000
			});
	}else if(num == 2){
		Swal.fire({
			  position: "top-center",
			  icon: "error",
			  title: "임시저장이 실패되었습니다.",
			  showConfirmButton: false,
			  timer: 2000
			});
	}
}
	
/*공통 종료*/

/*통관신청 시작*/
	
/*관세사 이름 불러오기*/
const cstbrkrName = function(){
	var data = {
			cstbrkrCd: localData.cstbrkrCd
	}
	var xhr = new XMLHttpRequest();
	xhr.open("POST", "/cbs/cstbrkr/entryApplyCstbk", true);
	xhr.setRequestHeader("Content-Type", "application/json");
	xhr.onreadystatechange = function(){
		if(xhr.readyState == 4 && xhr.status == 200){
			var response = JSON.parse(xhr.responseText);
			console.log("관세사 이름 찾아오기 성공 :", response.userNm);
			qsE("#userNm").value = response.userNm;
		}
	}
	xhr.send(JSON.stringify(data));
}
	
/*수입 수출 라디오 버튼 클릭 이벤트*/
document.addEventListener("DOMContentLoaded", function() {
    // 라디오 버튼 클릭 시 이벤트 처리
    document.querySelectorAll('input[name="entrSe"]').forEach(function(radio) {
        radio.addEventListener('click', function() {
            var data = {
                cstmrCd: localData.cstmrCd
            };

            var xhr = new XMLHttpRequest();
            xhr.open("POST", this.value === "export" ? "/cbs/cstbrkr/entryExportInfo" : "/cbs/cstbrkr/entryImportInfo", true);
            xhr.setRequestHeader("Content-Type", "application/json");
            xhr.onreadystatechange = function() {
                if (xhr.readyState == 4 && xhr.status == 200) {
                    console.log("전송완료");
                    var response = xhr.responseText;
                    console.log("받은 데이터 :", response);

                    // JSON 형식의 문자열을 JavaScript 객체로 파싱
                    var responseData = JSON.parse(response);

                    // 라디오 버튼에 따라 다른 동작 수행
                    if (radio.id === "export") {
                        // 수출 라디오 버튼 클릭 시
                        // 수출자에 데이터 입력
                        qsE("#imprCmpnm").value = "";
                        qsE("#imprAdres").value = "";
                        qsE("#imprTelno").value = "";
                        qsE("#imprCharger").value = "";
                        qsE("#expterCmpnm").value = responseData.entrprsNm;
                        qsE("#expterAdres").value = responseData.reprsntAdres;
                        qsE("#expterTelno").value = responseData.reprsntTelno;
                        qsE("#expterCharger").value = responseData.charger;
                    } else {
                        // 수입 라디오 버튼 클릭 시
                        // 수입자에 데이터 입력
                        qsE("#expterCmpnm").value = "";
                        qsE("#expterAdres").value = "";
                        qsE("#expterTelno").value = "";
                        qsE("#expterCharger").value = "";
                        qsE("#imprCmpnm").value = responseData.entrprsNm;
                        qsE("#imprAdres").value = responseData.reprsntAdres;
                        qsE("#imprTelno").value = responseData.reprsntTelno;
                        qsE("#imprCharger").value = responseData.charger;
                    }
                }
            };
            xhr.send(JSON.stringify(data));
        });
    });
});
	
/*자동완성 버튼 기능*/
const autoComplate = function(){
	qsE("#legal").checked = true;
	qsE("#manctmKwa").value = "부산";
	qsE("#manctmKwaCharger").value = "장보고";
	qsE("#expterCmpnm").value = "중국 베이징 자금성";
	qsE("#expterAdres").value = "중국 베이징 자금성 정문 왼쪽 나무아래";
	qsE("#expterTelno").value = "555-555-555";
	qsE("#expterCharger").value = "주";
}
	
/*일지선택 버튼 기능*/
const diarySelectBtn = function() {
	console.log("선박일지 클릭됨");
	window.open('/cbs/trnsprt/cstbrkrContain','_blank','width=1300, height=750, top=50, left=50, scrollbars=no');
}

/*통관 임시저장 함수*/
const tempStorage = function() {

	// 필수 입력값이 모두 채워져 있는지 확인
    if (!checkInput()) {
        // 입력값이 모두 채워지지 않은 경우 SweetAlert로 실패 메시지 표시
        Swal.fire({
            position: "top-center",
            icon: "error",
            title: "임시저장에 실패했습니다. 필수 입력값을 모두 입력해주세요.",
            showConfirmButton: false,
            timer: 2000
        });
        return;
    }

    
	var radioGroup = document.getElementsByName('entrSe');
	var selectedValue;
	for (var i = 0; i < radioGroup.length; i++) {
		if (radioGroup[i].checked) {
			selectedValue = radioGroup[i].value;
			break;
		}
	}

	data = [ 
		{
			cstbrkrCd : localData.cstbrkrCd,
			cstmrCd : localData.cstmrCd,
			client : qsE("#client").value,
			notifyInfo : qsE("#notifyInfo").value,
			entrSe : selectedValue,
			expterCmpnm : qsE("#expterCmpnm").value,
			expterAdres : qsE("#expterAdres").value,
			expterTelno : qsE("#expterTelno").value,
			expterCharger : qsE("#expterCharger").value,
			imprCmpnm : qsE("#imprCmpnm").value,
			imprAdres : qsE("#imprAdres").value,
			imprTelno : qsE("#imprTelno").value,
			imprCharger : qsE("#imprCharger").value,
			manctmKwa : qsE("#manctmKwa").value,
			manctmKwaCharger : qsE("#manctmKwaCharger").value,
			trnsprtStle : qsE("#trnsprtStle").value,
			waybilNo : qsE("#waybilNo").value,       
			startPrt : qsE("#startPrt").value,     
			arvlPrt : qsE("#arvlPrt").value,       
			shipStartDe : qsE("#shipStartDe").value,
			shipEndDe : qsE("#shipEndDe").value,     
			shipNm : qsE("#shipNm").value,        
			coudes : qsE("#coudes").value        
		},
		{
			presentnPapersNo : localData.presentnPapersNo
		},
		{
			shipDiaryCd : qsE("#shipDiaryCd").value,
			imoNo : qsE("#imoNo").value,
			cntanrInnb : qsE("#cntanrInnb").value
		}
	]
	
	var xhr = new XMLHttpRequest();
	xhr.open("POST", "/cbs/cstbrkr/insertEntry", true);
	xhr.setRequestHeader("Content-Type", "application/json");
	xhr.onreadystatechange = function() {
		if (xhr.readyState == 4 && xhr.status == 200) {
			console.log("통관 데이터 전송 완료");
			var response = xhr.responseText;
			console.log("받은 데이터 :", response);
			
			if(response != 3){
				sweetAlertGu(2);	//실패 알러트 함수
			}else{
				sweetAlertGu(1);	//성공 알러트 함수
			}
			
			document.getElementById("tempStorageBtn").disabled = true;
			inputReadonly();	//input readonly 함수
			disabledRadioBtn();	//radio disabled 함수
			selectEntryNo();	//통관관리번호, 고객번호 호출 함수
			openTab(event, 'goodsTab');
		}
	};
	xhr.send(JSON.stringify(data));
	
	document.querySelector("#diarySelect").disabled = true;
	document.querySelector("#autoComplate").disabled = true;
}

/*통관 신청 input 값들 readonly로 변경하는 함수*/
const inputReadonly = function(){
	var elementsA = document.querySelectorAll('.a input');
	var elementsB = document.querySelectorAll('.b input');
	var elementsC = document.querySelectorAll('.c input');

	elementsA.forEach(function(element) {
	    element.readOnly = true;
	});
	elementsB.forEach(function(element) {
	    element.readOnly = true;
	});
	elementsC.forEach(function(element) {
	    element.readOnly = true;
	});
}

/*임시저장 버튼 클릭하는 동시에 radio버튼 사용 못하게 하는 함수*/
const disabledRadioBtn = function(){
	//radio버튼 전부 사용못하게 바꾸기
	var radiosA = document.querySelectorAll('.a input[type="radio"]');
	var radiosB = document.querySelectorAll('.b input[type="radio"]');
	
    //클래스 이름 a 라디오 버튼 사용못하게 하기
	radiosA.forEach(function(radio) {
        radio.disabled = true;
    });

    //클래스 이름 b 라디오 버튼 사용못하게 하기
    radiosB.forEach(function(radio) {
        radio.disabled = true;
    });
}

/*임시저장 버튼 클릭하는 동시에 통관 물품에 필요한 통관 관리번호와 고객 코드를 불러오는 함수*/
var emgn = "";
const selectEntryNo = function(){
	console.log("통관관리번호 불러오기");
	var xhr = new XMLHttpRequest();
	xhr.open("GET", "/cbs/cstbrkr/selectEntryNo");
	xhr.onreadystatechange = function(){
		if(xhr.readyState==4 && xhr.status==200){
			console.log("통관 및 고객 번호 검색완료");
			var data = JSON.parse(xhr.response);
			console.log(data);
			emgn = data.entrManageNo;
			console.log(emgn);
			document.querySelector("#entrManageNo").value = emgn;
			document.querySelector("#cstmrCd").value = localData.cstmrCd;
// 			entryBtnActiv();
		}else{ 	
			//오류처리
		}
	}
	xhr.send();
}
	
const checkInput = function() {											// 통관 신청 부분 필수 입력 값 모두 검사하여 누락된 경우 false 반환하는 함수
    // 필수 입력값을 모두 검사하여 누락된 경우 false 반환
    return (
        document.querySelector("#client").value !== "" &&
        document.querySelector("#notifyInfo").value !== "" &&
        document.querySelector("#expterCmpnm").value !== "" &&
        document.querySelector("#expterAdres").value !== "" &&
        document.querySelector("#expterTelno").value !== "" &&
        document.querySelector("#expterCharger").value !== "" &&
        document.querySelector("#imprCmpnm").value !== "" &&
        document.querySelector("#imprAdres").value !== "" &&
        document.querySelector("#imprTelno").value !== "" &&
        document.querySelector("#imprCharger").value !== "" &&
        document.querySelector("#manctmKwa").value !== "" &&
        document.querySelector("#manctmKwaCharger").value !== "" &&
        document.querySelector("#trnsprtStle").value !== "" &&
        document.querySelector("#waybilNo").value !== "" &&
        document.querySelector("#startPrt").value !== "" &&
        document.querySelector("#arvlPrt").value !== "" &&
        document.querySelector("#shipStartDe").value !== "" &&
        document.querySelector("#shipEndDe").value !== "" &&
        document.querySelector("#shipNm").value !== "" &&
        document.querySelector("#coudes").value !== "" &&
        document.querySelector("#imoNo").value !== null &&
        document.querySelector("#cntanrInnb").value !== null &&
        document.querySelector("#cntanrStndrd").value !== null &&
        document.querySelector("#cntanrMtrqlt").value !== null
    );
}

/*통관신청 종료*/

/*통관물품 시작*/
	
/*물품 추가 버튼 기능*/
var entryApplyData = [];
function thingsAdd() {
	
	// 필수 입력값이 모두 채워져 있는지 확인
    if (!checkThingsInput()) {
        // 입력값이 모두 채워지지 않은 경우 SweetAlert로 실패 메시지 표시
        Swal.fire({
            position: "top-center",
            icon: "error",
            title: "필수 입력값을 모두 입력해주세요.",
            showConfirmButton: false,
            timer: 2000
        });
        return;
    }
	
    // 새로운 행 생성
    var addThingsRow = document.createElement('tr');
	
    // 행에 들어갈 셀 생성하고 데이터 설정
    addThingsRow.innerHTML = `
        <td class="ps-3">`+qsV("#cstmrCd")		+`</td>
        <td class="ps-3">`+getThingTypeDescription(qsV("#thingTy")) +`</td>
        <td class="ps-3">`+qsV("#hsCd")			+`</td>
        <td class="ps-3">`+qsV("#goodsNo")		+`</td>
        <td class="ps-3">`+qsV("#goodsNm")		+`</td>
        <td class="ps-3">`+qsV("#thingNm")		+`</td>
        <td class="ps-3">`+qsV("#delngPrdnm")	+`</td>
        <td class="ps-3">`+qsV("#baggTnpakg")	+`</td>
        <td class="ps-3">`+qsV("#netwght")		+`</td>
        <td class="ps-3">`+qsV("#totWt")		+`</td>
        <td class="ps-3">`+qsV("#qy")			+`</td>
        <td class="ps-3">`+qsV("#amount")		+`</td>
        <td class="ps-3">`+qsV("#totAmount")	+`</td>
        <td class="ps-3">`+qsV("#untpc")		+`</td>
        <td class="ps-2"><button type="button" class="deleteBtn" onclick="deleteRow(this)"><h5><span class='badge badge-phoenix badge-phoenix-danger'>삭제</span></h5></button></td>
    `;
	
    var entryThingVO = {
    		entrManageNo : qsV("#entrManageNo"),
    		goodsNo : qsV("#goodsNo"),
    		cstmrCd : qsV("#cstmrCd"),
    		thingTy : qsV("#thingTy"),
    		goodsNm : qsV("#goodsNm"),
    		qy : parseInt(qsV("#qy")),
    		untpc : parseInt(qsV("#untpc")),
    		amount : parseInt(qsV("#amount")),
    		totAmount : parseInt(qsV("#totAmount")),
    		netwght : parseInt(qsV("#netwght")),
    		totWt : parseInt(qsV("#totWt")),
    		baggTnpakg : parseInt(qsV("#baggTnpakg")),
    		thingNm : qsV("#thingNm"),
    		delngPrdnm : qsV("#delngPrdnm")
    }
    console.log("entryThingVO : ", entryThingVO);
    
    entryApplyData.push(entryThingVO);
    console.log("entryApplyData", entryApplyData);
    
    // 생성한 행을 테이블에 추가.
    var tableBody = document.querySelector('.goodsList');
    tableBody.appendChild(addThingsRow);

    // 행 번호 다시 설정
    setRowNumbers();
    
    // input 비워주기
    thingsInputClear();
    
    //추가 눌러서 tbody에 물품이 추가 되어 있으면 통관신청 버튼 살리기
    var tbody = document.querySelector('.goodsList');
    var entryApplyBtn = document.querySelector("#entryApplyBtn");
    if (tbody.innerHTML.trim() === '') {
    	entryApplyBtn.disabled = true;
    } else {
    	entryApplyBtn.disabled = false;
    }
}
	
	const parseIntt = function(val){
	    var number = parseInt(val.replace(/,/g, ''), 38);
	    return number;
	}
	
	/*thingTy 값에 따라 동식물 또는 일반을 결정하는 함수*/
	function getThingTypeDescription(thingTyValue) {
	    if (thingTyValue === 'ETT1') {
	        return '동식물';
	    } else if (thingTyValue === 'ETT2') {
	        return '일반';
	    } else {
	        return ''; // 다른 경우에는 빈 문자열 반환
	    }
	}
	
	/*물품 행 번호 매기기*/
	function setRowNumbers() {
	    var rows = document.querySelectorAll('.goodsList tr');
	    rows.forEach(function(row, index) {
	        row.querySelector('td:nth-child(1)').textContent = index + 1; // 첫 째 열은 번호 열
	    });
	}
	
	/*삭제 버튼*/
	function deleteRow(button) {
		console.log(button);
	    var row = button.closest('tr');
	    console.log(row);
	    var index = row.querySelector("tr td.ps-3").innerText;
	    console.log("index", index);
	    row.remove();
	    entryApplyData.splice(index-1, 1);
	    setRowNumbers();
	    console.log("entryApplyData", entryApplyData);
	    
	 	//삭제 눌러서 tbody에 물품이 추가 되어 있으면 통관신청 버튼 살리기
	    var tbody = document.querySelector('.goodsList');
	    var entryApplyBtn = document.querySelector("#entryApplyBtn");
	    if (tbody.innerHTML.trim() === '') {
	    	entryApplyBtn.disabled = true;
	    } else {
	    	entryApplyBtn.disabled = false;
	    }
	}
	
/*물품 검색 기능*/
const goodsSearch = function(){
	window.open('/cbs/cstbrkr/mainGoods','_blank','width=800, height=500, top=50, left=50, scrollbars=no');
}
	
/*input체크*/
const checkThingsInput = function(){
	// 필수 입력값을 모두 검사하여 누락된 경우 false 반환
    return (
        document.querySelector("#entrManageNo").value !== "" &&
        document.querySelector("#cstmrCd").value !== "" &&
        document.querySelector("#hsCd").value !== "" &&
        document.querySelector("#goodsNo").value !== "" &&
        document.querySelector("#goodsNm").value !== "" &&
        document.querySelector("#thingTy").value !== "" &&
        document.querySelector("#thingNm").value !== "" &&
        document.querySelector("#delngPrdnm").value !== "" &&
        document.querySelector("#baggTnpakg").value !== "" &&
        document.querySelector("#netwght").value !== "" &&
        document.querySelector("#totWt").value !== "" &&
        document.querySelector("#qy").value !== "" &&
        document.querySelector("#amount").value !== "" &&
        document.querySelector("#totAmount").value !== "" &&
        document.querySelector("#untpc").value !== ""
    );
}
	
const thingsInputClear = function(){
	document.querySelector("#hsCd").value = "";
	document.querySelector("#goodsNo").value = "";
	document.querySelector("#goodsNm").value = "";
	document.querySelector("#thingNm").value = "";
	document.querySelector("#thingTy").value = "";
	document.querySelector("#delngPrdnm").value = "";
	document.querySelector("#baggTnpakg").value = "";
	document.querySelector("#netwght").value = "";
	document.querySelector("#totWt").value = "";
	document.querySelector("#qy").value = "";
	document.querySelector("#amount").value = "";
	document.querySelector("#totAmount").value = "";
	document.querySelector("#untpc").value = "";
}
	
	
const entryApply = function(){
	console.log("통관 신청 버튼 클릭 했음.");
	entryProcessStatusInsert();
}
	
/*통관 물품 서버에 전달 및 결과값 받아오는 함수*/
const entryApplyServer = function(){
	console.log("통관 물품 건 수 = ", entryApplyData.length);
	
	var xhr = new XMLHttpRequest();
	xhr.open("POST", "/cbs/cstbrkr/insertEntryThings", true);
	xhr.setRequestHeader("Content-Type", "application/json");
	xhr.onreadystatechange = function(){
		if(xhr.readyState == 4 && xhr.status == 200){
			var response = JSON.parse(xhr.responseText);
			console.log("통관 물품 신청 완료 건 수 = ", response);
			if (entryApplyData.length == response) {
				console.log("통관신청성공임");
				Swal.fire({
					  position: "center",
					  icon: "success",
					  title: "통관 신청 완료",
					  showConfirmButton: true,
					  timer: 2000
					}).then(function(result){
						if(result.isConfirmed){
							location.href = "/cbs/cstbrkr/entryList";
						}
					});
			}else{
				Swal.fire({
					  position: "top-center",
					  icon: "error",
					  title: "통관 신청 실패",
					  text : "다시 한 번 확인해주세요.",
					  showConfirmButton: false,
					  timer: 2000
					});
				console.log("error");
			}
		}
	}
	xhr.send(JSON.stringify(entryApplyData));
}
	
/*통관 처리상태 테이블에 해당 통관 건 insert해주는 함수*/
const entryProcessStatusInsert = function(){
	var entryProcessData = [{
		entrManageNo : document.querySelector("#entrManageNo").value,
		userCd : localData.cstbrkrCd,
		processSttus : "EPS1"
	}]
	console.log("entryProcessData", entryProcessData);
	
	var xhr = new XMLHttpRequest();
	xhr.open("POST", "/cbs/cstbrkr/entryProcessStatusInsert", true);
	xhr.setRequestHeader("Content-Type", "application/json");
	xhr.onreadystatechange = function(){
		if(xhr.readyState == 4 && xhr.status == 200){
			var response = JSON.parse(xhr.responseText);
			console.log("통관 처리 상태 추가 건 수 = ", response);

			if(response == 2){
				entryApplyServer();
			}else{
				Swal.fire({
					  position: "top-center",
					  icon: "error",
					  title: "통관 신청 실패",
					  text : "다시 한 번 확인해주세요.",
					  showConfirmButton: false,
					  timer: 2000
					});
			}
		}
	}
	xhr.send(JSON.stringify(entryProcessData));
}
/*통관물품 종료---------------------------------------------------------------------------------------------------------------------------*/

</script>

</head>
<body>
	<div class="tab">
		<button class="tablinks active" onclick="openTab(event, 'entryTab')">통관신청</button>
		<button class="tablinks" onclick="openTab(event, 'goodsTab')">통관물품</button>
	</div>

	<!-- 통관신청 탭 -->
	<div id="entryTab" class="tabcontent tab-pane fade show action">
		<div class="card">
			<div class="card-body">
				<h5>통관신청</h5>
				<div class="container">
					<div class="row">
						<!-- 통관신청 탭 왼쪽 시작-->
						<div class="col-lg-4">
							<div class="a">
								<form>
									<label class="col-form-label">*의뢰인</label>
									<div class="col-auto">
										<div class="input-group">
											<div class="input-group-text">상호(기업명)</div>
											<input class="form-control" id="client" type="text" value="" />
										</div>
									</div>
									<!-- 의뢰인 유형 -->
									<div class="row">
									<div class="col-auto">
									    <div class="input-group">
									        <div class="input-group-text">의뢰인 유형</div>
											<div class="col-auto">
											    <label class="form-check-label" for="person">
											        <input class="form-check-input" id="person" name="ex" type="radio" value="개인">개인
											    </label>
											</div>
											<div class="col-auto">
											    <label class="form-check-label" for="legal">
											        <input class="form-check-input" id="legal" name="ex" type="radio" value="법인">법인
											    </label>
											</div>
									    </div>
									</div>
									
									<!-- 의뢰 유형 -->
									<div class="col-auto">
									    <div class="input-group">
									        <div class="input-group-text">의뢰 유형</div>
											<div class="col-auto">
											    <label class="form-check-label" for="export">
											        <input class="form-check-input" id="export" name="entrSe" type="radio" value="EES1">수출
											    </label>
											</div>
											<div class="col-auto">
											    <label class="form-check-label" for="import">
											        <input class="form-check-input" id="import" name="entrSe" type="radio" value="EES2">수입
											    </label>
											</div>
									    </div>
									</div>
									</div>
									<label class="col-form-label">*수출입 대행자</label>
									<div>
										<div class="col-auto">
											<div class="input-group">
												<div class="input-group-text">상호</div>
												<input class="form-control" id="notifyInfo" type="text"
													value="(주)CBS">
											</div>
										</div>
									</div>
									<div>
										<div class="col-auto">
											<div class="input-group">
												<div class="input-group-text">대행자 구분</div>
												<input class="form-control" id="" type="text" value="관세사">
											</div>
										</div>
									</div>
									<div>
										<div class="col-auto">
											<div class="input-group">
												<div class="input-group-text">대행자 이름</div>
												<input class="form-control" id="userNm" type="text">
											</div>
										</div>
									</div>
									<label class="col-form-label">*관할세관 정보</label>
									<div class="col-auto">
										<div class="input-group">
											<div class="input-group-text">관할세관</div>
										<select class="form-select" id="manctmKwa">
											<option selected="selected">선택</option>
											<option value="부산">부산</option>
											<option value="울산">울산</option>
											<option value="인천">인천</option>
											<option value="대전">대전</option>
										</select>
										</div>
									</div>
									<div class="col-auto">
										<div class="input-group">
											<div class="input-group-text">세관 담당자</div>
											<input class="form-control" id="manctmKwaCharger"
												name="manctmKwaCharger" type="text">
										</div>
									</div>
								</form>
							</div>
						</div>
						<!-- 통관신청 탭 왼쪽 끝-->

						<!-- 통관신청 탭 가운데  시작-->
						<div class="col-lg-4">
							<div class="b">
								<form>
									<label class="col-form-label">*수출자</label>
										<div class="col-auto">
											<div class="input-group">
												<div class="input-group-text">상호</div>
												<input class="form-control" id="expterCmpnm"
													name="expterCmpnm" type="text">
											</div>
										</div>
									<div></div>
									<div class="col-auto">
										<div class="input-group">
											<div class="input-group-text">주소</div>
											<input class="form-control" id="expterAdres"
												name="expterAdres" type="text">
										</div>
									</div>
									<div></div>
									<div class="col-auto">
										<div class="input-group">
											<div class="input-group-text">전화번호</div>
											<input class="form-control" id="expterTelno"
												name="expterTelno" type="text">
										</div>
									</div>
									<div></div>
									<div class="col-auto">
										<div class="input-group">
											<div class="input-group-text">담당자</div>
											<input class="form-control" id="expterCharger"
												name="expterCharger" type="text">
										</div>
									</div>
									<label class="col-form-label">*수입자</label>
									<div class="col-auto">
										<div class="input-group">
											<div class="input-group-text">상호</div>
											<input class="form-control" id="imprCmpnm" name="imprCmpnm"
												type="text">
										</div>
									</div>
									<div></div>
									<div class="col-auto">
										<div class="input-group">
											<div class="input-group-text">주소</div>
											<input class="form-control" id="imprAdres" name="imprAdres"
												type="text">
										</div>
									</div>
									<div></div>
									<div class="col-auto">
										<div class="input-group">
											<div class="input-group-text">전화번호</div>
											<input class="form-control" id="imprTelno" name="imprTelno"
												type="text">
										</div>
									</div>
									<div></div>
									<div class="col-auto">
										<div class="input-group">
											<div class="input-group-text">담당자</div>
											<input class="form-control" id="imprCharger" name="imprCharger" type="text" value="">
										</div>
									</div>
								</form>
							</div>
						</div>
						<!-- 통관신청 탭 가운데  끝-->

						<!-- 통관신청 탭 오른쪽 시작 -->
						<div class="col-lg-4">
							<div class="c">
								<form>
									<label class="col-form-label">*선박운송</label>
									<input type="button" id="diarySelect" class="btn btn-phoenix-primary px-5 me-2" value="일지 선택" onclick="diarySelectBtn()"/>
									<div class="col-auto">
										<div class="input-group">
											<div class="input-group-text">운송 형태</div>
											<input class="form-control" id="trnsprtStle"
												name="transportType" type="text">
										</div>
									</div>
									<div></div>
									<div class="col-auto">
										<div class="input-group">
											<div class="input-group-text">운송장 번호</div>
											<input class="form-control" id="waybilNo"
												name="transportNumber" type="text">
										</div>
									</div>
									<div></div>
									<div class="col-auto">
										<div class="input-group">
											<div class="input-group-text">출발 항구</div>
											<input class="form-control" id="startPrt"
												name="departurePort" type="text">
										</div>
									</div>
									<div class="col-auto">
										<div class="input-group">
											<div class="input-group-text">입항 항구</div>
											<input class="form-control" id="arvlPrt"
												name="arrivalPort" type="text">
										</div>
									</div>
									<div class="col-auto">
										<div class="input-group">
											<div class="input-group-text">출항 일자</div>
											<input class="form-control" id="shipStartDe"
												name="departureDate" type="text">
										</div>
									</div>
									<div class="col-auto">
										<div class="input-group">
											<div class="input-group-text">입항 일자</div>
											<input class="form-control" id="shipEndDe"
												name="departureDate" type="text">
										</div>
									</div>
									<div class="col-auto">
										<div class="input-group">
											<div class="input-group-text">선박 명</div>
											<input class="form-control" id="shipNm" name="shipName"
												type="text">
										</div>
									</div>
									<div class="col-auto">
										<div class="input-group">
										<div class="input-group-text">목적국가</div>
											<input class="form-control" id="coudes"
												name="destinationCountry" type="text">
										</div>
									</div>
								</form>
									<div class="col-auto">
										<button class="btn btn-phoenix-primary px-5 me-2" id="autoComplate" onclick="autoComplate()">자동완성</button>	
										<button id="tempStorageBtn" class="btn btn-primary px-5 me-2" onclick="tempStorage()">임시저장</button>
									</div>
							</div>
						</div>
						<!-- 통관신청 탭 오른쪽 끝 -->
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 통관물품 탭 -->
	<div id="goodsTab" class="tabcontent tab-pane fade show action">
		<div class="card">
			<div class="card-body">
				<h5>통관물품</h5>
				<!-- 통관물품 탭 정보 시작-->
					<label class="col-form-label">*통관 정보</label>
				<div class="row">
						<div class="col-md-3">
							<div class="input-group">
								<div class="input-group-text">통관 관리 번호</div>
								<input class="form-control" id="entrManageNo" type="text" readonly>
							</div>
						</div>
						<div class="col-md-3">
							<div class="input-group">
								<div class="input-group-text">고객 코드</div>
								<input class="form-control" id="cstmrCd" type="text" readonly>
							</div>
						</div>
						<div class="col-md-3">
							<div class="input-group">
								<div class="input-group-text">선박 일지</div>
								<input class="form-control" id="shipDiaryCd" type="text" readonly>
							</div>
						</div>
				</div>
				<div class="row">
						<div class="col-md-3">
							<div class="input-group">
								<div class="input-group-text">IMO번호</div>
								<input class="form-control" id="imoNo" type="text" readonly>
							</div>
						</div>
						<div class="col-md-3">
							<div class="input-group">
								<div class="input-group-text">컨테이너 번호</div>
								<input class="form-control" id="cntanrInnb" type="text" readonly>
							</div>
						</div>
						<div class="col-md-3">
							<div class="input-group">
								<div class="input-group-text">규격(CBM)</div>
								<input class="form-control" id="cntanrStndrd" type="text" readonly>
							</div>
						</div>
						<div class="col-md-3">
							<div class="input-group">
								<div class="input-group-text">재질</div>
								<input class="form-control" id="cntanrMtrqlt" type="text" readonly>
							</div>
						</div>
				</div>
				<!-- 통관물품 탭 정보 끝-->
				<hr>
				<!-- 통관물품 탭 등록 시작 -->
				<div class="row">
					<div class="col-md-3">
						<div class="input-group">
							<div class="input-group-text">HS 코드</div>
							<input class="form-control" id="hsCd" type="text" readonly>
						</div>
					</div>
					<div class="col-md-3">
						<div class="input-group">
							<div class="input-group-text">물품번호</div>
							<input class="form-control" id="goodsNo" type="text" readonly>
						</div>
					</div>
					<div class="col-md-3">
						<div class="input-group">
							<div class="input-group-text">물품분류</div>
							<input class="form-control" id="goodsNm" type="text" readonly>
						</div>
					</div>
					<div class="col-md-3">
						<div class="input-group">
							<button type="button" class="btn btn-phoenix-primary px-4 me-2" style="margin: auto 0;" onclick="goodsSearch(this)">물품 검색</button>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-3">
							<div class="input-group">
								<div class="input-group-text">물품명</div>
								<input class="form-control" id="thingNm" type="text">
							</div>
					</div>
					<div class="col-md-3">
							<div class="input-group">
								<div class="input-group-text">거래품명</div>
								<input class="form-control" id="delngPrdnm" type="text">
							</div>
					</div>
					<div class="col-md-3">
							<div class="input-group">
								<div class="input-group-text">물품유형</div>
								<select class="form-select" id="thingTy">
									<option value="">선택</option>
									<option value="ETT1">동식물</option>
									<option value="ETT2">일반</option>
								</select>
							</div>
					</div>
				</div>
<!-- 				<div class="input-explain"> -->
					<div class="row">
						<div class="col-md-3">
								<div class="input-group">
									<div class="input-group unitDiv">
										<div class="input-group-text">수하물 포장개수</div>
										<input class="form-control unitInput" id="baggTnpakg" type="text" placeholder="(단위 : PKG)">
									</div>
								</div>
						</div>
						<div class="col-md-3">
								<div class="input-group">
									<div class="input-group unitDiv">
										<div class="input-group-text">수량</div>
										<input class="form-control unitInput" id="qy" type="text" placeholder="(단위 : PKG 하위 단위)">
									</div>
								</div>
						</div>
						<div class="col-md-3">
								<div class="input-group">
									<div class="input-group unitDiv">
										<div class="input-group-text">순중량</div>
										<input class="form-control unitInput" id="netwght" type="text" placeholder="(단위 : ton)">
									</div>
								</div>
						</div>
						<div class="col-md-3">
								<div class="input-group">
									<div class="input-group unitDiv">
										<div class="input-group-text">총중량</div>
										<input class="form-control unitInput" id="totWt" type="text" placeholder="(단위 : ton)">
									</div>
								</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-3">
								<div class="input-group">
									<div class="input-group unitDiv">
										<div class="input-group-text">금액</div>
										<input class="form-control unitInput" id="amount" type="text" placeholder="(단위 : 천 원)">
									</div>
								</div>
						</div>
						<div class="col-md-3">
								<div class="input-group">
									<div class="input-group unitDiv">
										<div class="input-group-text">총 금액</div>
										<input class="form-control unitInput" id="totAmount" type="text" placeholder="(단위 : 천 원)">
									</div>
								</div>
						</div>
						<div class="col-md-3">
								<div class="input-group">
									<div class="input-group unitDiv">
										<div class="input-group-text">단가</div>
										<input class="form-control unitInput" id="untpc" type="text" placeholder="(단위 : 천 원)">
									</div>
								</div>
						</div>
						<div class="col-md-3">
							<div class="input-group">
							<div class="input-group unitDiv">
								<button type="button" class="btn btn-phoenix-primary px-4 me-2" style="margin: auto 0;" id="thingsAddBtn" onclick="thingsAdd()">물품 추가</button>
							</div>
							</div>
						</div>
					</div>
<!-- 				</div> -->
<!-- 				<div style="text-align: right;"> -->
<!-- 					<button type="button" class="btn btn-phoenix-primary px-5 me-2" style="margin: auto 0;" id="thingsAddBtn" onclick="thingsAdd()"">물품 추가</button> -->
<!-- 					<input class="btn btn-phoenix-primary px-5 me-2" type="button" id="thingsAddBtn" onclick="thingsAdd()" value="추가"> -->
<!-- 				</div> -->
				<!-- 통관물품 탭 등록 끝 -->
				<hr>
				<!-- 통관물품 탭 목록 시작 -->
				<div class="table-responsive" >
					<table class="table table-sm fs-9 mb-0" id="">
						<thead>
							<tr>
								<th class="sort border-top border-translucent ps-3">No</th>
								<th class="sort border-top border-translucent ps-3">물품유형</th>
								<th class="sort border-top border-translucent ps-3">HS코드</th>
								<th class="sort border-top border-translucent ps-3">물품번호</th>
								<th class="sort border-top border-translucent ps-3">물품분류</th>
								<th class="sort border-top border-translucent ps-3">물품명</th>
								<th class="sort border-top border-translucent ps-3">거래품명</th>
								<th class="sort border-top border-translucent ps-3">수하물 포장개수</th>
								<th class="sort border-top border-translucent ps-3">순중량</th>
								<th class="sort border-top border-translucent ps-3">총중량</th>
								<th class="sort border-top border-translucent ps-3">수량</th>
								<th class="sort border-top border-translucent ps-3">금액</th>
								<th class="sort border-top border-translucent ps-3">총 금액</th>
								<th class="sort border-top border-translucent ps-3">단가</th>
								<th class="sort border-top border-translucent ps-3">삭제</th>
							</tr>
						</thead>
						<tbody class="goodsList">
							
						</tbody>
					</table>
				</div>
				<!-- 통관물품 탭 목록 끝 -->
				<div style="text-align: right;">
					<button id=entryApplyBtn class="btn btn-primary px-4 me-3" onclick="entryApply()">통관신청</button>
				</div>
			</div>
		</div>
	</div>
	
<!-- 선박일지 모달 -->
<div class="modal fade" id="verticallyCentered" tabindex="-1" aria-labelledby="verticallyCenteredModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-xl">
    <div class="modal-content h-70">
      <div class="modal-header">
        <h5 class="modal-title" id="verticallyCenteredModalLabel">선박일지</h5><button class="btn p-1" type="button" data-bs-dismiss="modal" aria-label="Close"><span class="fas fa-times fs-9"></span></button>
      </div>
      <div class="modal-body">
        <table class="table table-hover">
	    	<thead>
	      		<tr class="bg-body-highlight">
	            <th class="col-md-1">No</th>
	            <th class="col-md-1">BL번호</th>
	            <th class="col-md-1">IMO번호</th>
	            <th class="col-md-1">출항</th>
	            <th class="col-md-1">출항 시간</th>
	            <th class="col-md-1">입항</th>
	            <th class="col-md-1">입항 시간</th>
		      	</tr>
	    	</thead>
	    	<tbody class="list" id="SDTab">
	    	
	    	</tbody>
	    </table>
      </div>
      <div class="modal-footer"><button class="btn btn-primary" type="button">Okay</button><button class="btn btn-outline-primary" type="button" data-bs-dismiss="modal">Cancel</button></div>
    </div>
  </div>
</div>
</body>
<script type="text/javascript">
/*input 필드 숫자 외 문자 사용 못하게 하는 함수*/
function restrictInputToNumber(inputElement) {
    inputElement.addEventListener('input', function(event) {
        // 입력값에서 숫자 이외의 문자를 모두 제거합니다.
        var numericValue = this.value.replace(/[^\d]/g, '');

        // 입력값이 최대 38자리를 넘으면 잘라냅니다.
        if (numericValue.length > 38) {
            numericValue = numericValue.slice(0, 38);
        }

        // 입력값이 숫자로 시작하면 숫자로 변환하여 천단위 구분 쉼표를 추가합니다.
        if (/^\d/.test(numericValue)) {
            this.value = Number(numericValue).toLocaleString();
        } else {
            // 숫자로 시작하지 않는 경우, 입력값을 그대로 출력합니다.
            this.value = numericValue;
        }
    });
}

// 각 입력 필드에 대해 함수를 호출하여 숫자만 입력되고 천단위 구분 쉼표가 표시되도록 설정
restrictInputToNumber(document.getElementById('baggTnpakg'));
restrictInputToNumber(document.getElementById('netwght'));
restrictInputToNumber(document.getElementById('totWt'));
restrictInputToNumber(document.getElementById('qy'));
restrictInputToNumber(document.getElementById('amount'));
restrictInputToNumber(document.getElementById('totAmount'));
restrictInputToNumber(document.getElementById('untpc'));
</script>
</html>