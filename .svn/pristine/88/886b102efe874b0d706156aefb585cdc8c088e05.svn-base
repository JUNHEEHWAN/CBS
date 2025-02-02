<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<script src="https://cdn.jsdelivr.net/npm/exceljs@4.3.0/dist/exceljs.min.js"></script>

<style>
table{
font-size: 0.9rem;
}
.card {
    max-width: 53%; /* 최대 너비를 원하는 값으로 설정 */
    height: 730px;
    overflow: auto; /* 세로 및 가로 스크롤이 내용이 넘칠 때만 표시되도록 설정 */
}

.card .p-3 {
    max-width: 100%; /* 내부 요소의 최대 너비를 100%로 설정하여 최대 너비를 넘어가도록 함 */
    white-space: nowrap; /* 테이블 셀이 자동으로 줄 바꿈되지 않도록 설정 */
}

.card-title {
    float: left;
    line-height: 38px;
}

.btn-primary {
    height: 30px;
    float: right;
}

.input-group {
    margin-top: 10px;
    margin-bottom: 15px;
    font-size: 
}

.input-group-text {
    display: inline-block;
    width: 100px;
}

.form-control {
    width: 150px;
}

.modal-body {
    display: flex;
    flex-wrap: wrap;
    text-align: center;
    padding-top: 3%;
    padding-left: 3%;
    padding-right: 3%;
}

th, td {
    text-align: center !important;
}

.btnPage {
    width: 30px;
    border: none;
    text-align: center;
}

.iMoInput::placeholder {
    text-align: center;
}

.modal-dialog {
    max-width: 70%;
    height: auto;
}

.modal-body .col-lg-6 {
    flex: 0 0 calc(60% - 15px);
    margin-right: 15px;
}

.modal-body .col-lg-5 {
    flex: 0 0 calc(40% - 15px);
}
.btn-sm{
 height: auto;
}
.form-select{
	width: 40px;
}
#searchText{
	width: 100px;
}
.SDpagination, .VDpagination {
	    display: flex;
	    justify-content: center;
	    margin-top: 10px;
	    margin-bottom: 10px;
}
.SDpagination button{
		border: none;
	}
	.VIpagination button{
		border: none;
	}
	.SDpagination button:hover{
		border: none;
		background-color: #E3E6ED;
	}
	.VIpagination button:hover{
		border: none;
		 background-color: #E3E6ED;
	}
.icTex{
	width: 125px;
}
</style>

<script>
// 요소 가져오는 함수 정의(QS) 시작 /////////////////////////////////
  	const QS = function (pVal) {
    	return document.querySelector(pVal).value;
  	};
	const qs = (pVal) => {
	  return document.querySelector(pVal);
	};
// 요소 가져오는 함수 정의(QS) 시작 /////////////////////////////////
	
// 요소에 값 넣는 함수 정의(InsQS) 시작 /////////////////////////////////
	const InsQS = function (pVal, pText) {
	  return (document.querySelector(pVal).value = pText)
	};
// 요소에 값 넣는 함수 정의(InsQS) 시작 /////////////////////////////////

// 선박 운항, 차량 운항 일지 SELECT함수 호출 시작 //////////////////////////////////////
	window.onload = ()=>{
		SDSel();
		VDSel();
		let selectElement = document.querySelector('#storeStatus');
		selectElement.addEventListener('change',function(event) {
			let selectedValue = event.target.value;
			let data = { stodelSe : selectedValue}
			VDSel(data);
		});
	}
// 선박 운항,차량 운항 일지 SELECT함수 호출 끝 / //////////////////////////////////////
	
// 선박 운항 일지 SELECT함수 시작/////////////////////////////////////
	const SDSel = (pVal) => {
 		//console.log("SDSel함수 호출 성공");
		var xhr = new XMLHttpRequest();
		xhr.open("POST", "/cbs/trnsprt/shipDiary", true);
		xhr.setRequestHeader("Content-Type","application/json");
		xhr.onload = () => {
	   	// console.log("넘어온값 체크 : ", xhr.responseText);
	    	var res = JSON.parse(xhr.responseText);
	    	getSDData = [];
	    	getSDData = res; // 데이터를 가져와서 변수에 할당
	    	renderSDTable(); // 테이블 렌더링
            renderSDPagination(); // 페이지네이션 렌더링
		};
		xhr.send(JSON.stringify(pVal));
	};
	
	var getSDData = [];
	var SDPerPage = 8; // 페이지당 보여줄 아이템 수
	var SDcurrentPage = 1; // 현재 페이지 번호
	
	const renderSDTable = ()=> {
		var tableBody = document.querySelector('.SDTable');
	    tableBody.innerHTML = ''; // 표 초기화
	    
	    var startIdx = (SDcurrentPage - 1) * SDPerPage;
	    var endIdx = startIdx + SDPerPage;
	    
	    for (var i = startIdx; i < endIdx && i < getSDData.length; i++) {
	    	var item = getSDData[i];

	    	var pageStr = ""
	    	pageStr += "<tr>";
		    pageStr += "<td>" + item.blNo + "</td>";
		    pageStr += "<td><a href='#' onclick='openShipModal(this)'>" + item.imoNo + "</td>";
		    pageStr += "<td>" + item.startPrt + "</td>";
		    pageStr += "<td>" + item.shipStartDe + "</td>";
		    pageStr += "<td>" + item.arvlPrt + "</td>";
		    pageStr += "<td>" + item.shipEndDe + "</td>";
	    	pageStr += "</tr>";
			tableBody.innerHTML += pageStr;
		}
	}
	
	const checkThis = ()=>{
		console.log("규상이형 됬지?");
	}
	
	const renderSDPagination = function() {
	    var pagination = document.getElementById('SDpagination');
	    pagination.innerHTML = ''; // 페이지네이션 초기화

	    var pageCount = Math.ceil(getSDData.length / SDPerPage);
	    var totalPageCount = 5;    // 보여지는 페이지 개수

	    // 현재 페이지가 몇 번째 그룹에 속하는지 계산
	    var currentPageGroup = Math.ceil(SDcurrentPage / totalPageCount);

	    // 시작 페이지와 끝 페이지를 계산
	    var startPage = (currentPageGroup - 1) * totalPageCount + 1;
	    var endPage = Math.min(startPage + (totalPageCount - 1), pageCount);

	    // 처음 버튼
	    var prevButton = document.createElement('button');
	    prevButton.textContent = '처음';
	    prevButton.className = 'btn btn-subtle-secondary btn-sm';
	    prevButton.style.marginRight = "10px";
	    prevButton.addEventListener('click', function() {
	    	SDcurrentPage = 1;
	    	renderSDTable();
	        renderSDPagination();
	        highlightSDButton();
	    });
	    pagination.appendChild(prevButton);

	    // 이전 버튼
	    var prevButton2 = document.createElement('button');
	    prevButton2.className = 'btn btn-subtle-secondary btn-sm';
	    prevButton2.style.marginRight = "10px";

	    // 버튼에 아이콘 추가
	    var icon = document.createElement('i');
	    icon.classList.add('fa-solid', 'fa-angles-left');
	    prevButton2.appendChild(icon);
	    
	    prevButton2.addEventListener('click', function() {
	        if (SDcurrentPage > 1) {
	        	SDcurrentPage--;
	        	renderSDTable();
	            renderSDPagination();
	            highlightSDButton();
	        }
	    });
	    pagination.appendChild(prevButton2);

	    for (var i = startPage; i <= endPage; i++) {
	        var button = document.createElement('button');
	        button.textContent = i;
	        button.className = "btn btn-outline-primary btn-sm";
	        button.style.marginRight = "5px";

	        button.addEventListener('click', function() {
	        	SDcurrentPage = parseInt(this.textContent);
	        	renderSDTable();
	            renderSDPagination();
	            highlightSDButton();
	        });
	        pagination.appendChild(button);
	    }

	    // 다음 버튼
	    var nextButton = document.createElement('button');
	    nextButton.className = 'btn btn-subtle-secondary btn-sm';
	    nextButton.style.marginLeft = "5px";
	    nextButton.style.marginRight = "10px";

	    // 버튼에 아이콘 추가
	    var icon = document.createElement('i');
	    icon.classList.add('fa-solid', 'fa-angles-right');
	    nextButton.appendChild(icon);
	    
	    nextButton.addEventListener('click', function() {
	        if (SDcurrentPage < pageCount) {
	        	SDcurrentPage++;
	        	renderSDTable();
	            renderSDPagination();
	            highlightSDButton();
	        }
	    });
	    pagination.appendChild(nextButton);
	    
	    // 마지막 버튼
	    var nextButton2 = document.createElement('button');
	    nextButton2.textContent = '마지막';
	    nextButton2.className = 'btn btn-subtle-secondary btn-sm';
	    nextButton2.addEventListener('click', function() {
	        SDcurrentPage = pageCount;
	        renderSDTable();
	        renderSDPagination();
	        highlightSDButton();
	    });
	    pagination.appendChild(nextButton2);

	    highlightSDButton();
	}

	// 현재 페이지 버튼을 강조 표시
	const highlightSDButton = function() {
	    var buttons = document.querySelectorAll('.SDpagination button');
	    buttons.forEach(function(button) {
	        button.classList.remove('active');
	        if (parseInt(button.textContent) === SDcurrentPage) {
	            button.classList.add('active');
	        }
	    });
	}
	
	const shipSearch = ()=> {
		let searchShipWord = document.querySelector("#searchShipWord").value;
		let inputVal = document.querySelector("#searchShipText").value;
		let shipDateWord = document.querySelector("#shipDateWord").value;
		let strtTime = document.querySelector("#shipSearchtSDate").value;
		let arvlTime = document.querySelector("#shipSearchtEDate").value;
		
		let data = {
				searchShipWord : searchShipWord,
				inputVal : inputVal,
				shipDateWord : shipDateWord,
				strtTime : strtTime,
				arvlTime : arvlTime
		}
		console.log("검색 값 체크 :",data);
		SDSel(data);
	}
	
	const shipReset = ()=>{
		document.querySelector("#shipDateWord").value = "";
		document.querySelector("#searchShipWord").value = "";
		document.querySelector("#shipSearchtSDate").value = "";
		document.querySelector("#shipSearchtEDate").value = "";
		document.querySelector("#searchShipText").value = "";
		SDSel();
	}
	
// 선박 운항 일지 SELECT함수 끝/////////////////////////////////////



// 차량 일지 SELECT함수 시작 ///////////////////////////////////////
	const search = ()=> {
		let searchWord = document.querySelector("#searchWord").value;
		let inputVal = document.querySelector("#searchText").value;
		let data = {
				searchWord:searchWord,
				inputVal:inputVal
		}
		console.log("검색 값 체크 :",data);
		VDSel(data);
	}

	const VDSel = (pVal)=> {
		console.log("입출고 구분 선택값 체크 : pVal",pVal);
		var xhr = new XMLHttpRequest();
		xhr.open("POST","/cbs/trnsprt/selectVD",true);
		xhr.setRequestHeader("Content-Type", "application/json");
		xhr.onload= ()=>{
			//console.log("컨트롤러에서 받은값 체크 : ",xhr.responseText)
			let res = JSON.parse(xhr.responseText);
			getVDData = [];
	    	getVDData = res; // 데이터를 가져와서 변수에 할당
	    	renderVDTable(); // 테이블 렌더링
            renderVDPagination(); // 페이지네이션 렌더링
		}
		xhr.send(JSON.stringify(pVal));
	}
	
	var getVDData = [];
	var VDPerPage = 8; // 페이지당 보여줄 아이템 수
	var VDcurrentPage = 1; // 현재 페이지 번호
	
	const renderVDTable = ()=> {
		var tableBody = document.querySelector('.VDTable');
	    tableBody.innerHTML = ''; // 표 초기화
	    
	    var startIdx = (VDcurrentPage - 1) * VDPerPage;
	    var endIdx = startIdx + VDPerPage;
	    
	    let stodelSe = "";
	    for (var i = startIdx; i < endIdx && i < getVDData.length; i++) {
	    	var item = getVDData[i];

	    	var pageStr = ""
	    	pageStr += "<tr>";
		    pageStr += "<td>"+item.vhcleDiaryCd+"</td>";
		    pageStr += "<td><a href='#' onclick='openIcModal(this)'>"+item.icCardNo+"</td>";
		    pageStr += "<td>"+item.entrManageNo+"</a></td>";
		    if(item.stodelSe == 1){
		    	stodelSe = "입고"
		    }else{ stodelSe = "출고"}
		    pageStr += "<td>"+stodelSe+"</a></td>";
		    pageStr += "<td>"+item.strtPnt+"</td>";
		    pageStr += "<td>"+item.arvlPnt+"</td>";
		    pageStr += "<td>"+item.strtTime+"</td>";
		    pageStr += "<td>"+item.arvlTime+"</td>";
		    pageStr += "</tr>";
			tableBody.innerHTML += pageStr;
		}
	}
	
	const renderVDPagination = function() {
	    var pagination = document.getElementById('VDpagination');
	    pagination.innerHTML = ''; // 페이지네이션 초기화

	    var pageCount = Math.ceil(getVDData.length / VDPerPage);
	    var totalPageCount = 5;    // 보여지는 페이지 개수

	    // 현재 페이지가 몇 번째 그룹에 속하는지 계산
	    var currentPageGroup = Math.ceil(VDcurrentPage / totalPageCount);

	    // 시작 페이지와 끝 페이지를 계산
	    var startPage = (currentPageGroup - 1) * totalPageCount + 1;
	    var endPage = Math.min(startPage + (totalPageCount - 1), pageCount);

	    // 처음 버튼
	    var prevButton = document.createElement('button');
	    prevButton.textContent = '처음';
	    prevButton.className = 'btn btn-subtle-secondary btn-sm';
	    prevButton.style.marginRight = "10px";
	    prevButton.addEventListener('click', function() {
	    	VDcurrentPage = 1;
	    	renderVDTable();
	        renderVDPagination();
	        highlightVDButton();
	    });
	    pagination.appendChild(prevButton);

	    // 이전 버튼
	    var prevButton2 = document.createElement('button');
	    prevButton2.className = 'btn btn-subtle-secondary btn-sm';
	    prevButton2.style.marginRight = "10px";

	    // 버튼에 아이콘 추가
	    var icon = document.createElement('i');
	    icon.classList.add('fa-solid', 'fa-angles-left');
	    prevButton2.appendChild(icon);
	    
	    prevButton2.addEventListener('click', function() {
	        if (VDcurrentPage > 1) {
	        	VDcurrentPage--;
	        	renderVDTable();
	            renderVDPagination();
	            highlightVDButton();
	        }
	    });
	    pagination.appendChild(prevButton2);

	    for (var i = startPage; i <= endPage; i++) {
	        var button = document.createElement('button');
	        button.textContent = i;
	        button.className = "btn btn-outline-primary btn-sm";
	        button.style.marginRight = "5px";

	        button.addEventListener('click', function() {
	        	VDcurrentPage = parseInt(this.textContent);
	        	renderVDTable();
	            renderVDPagination();
	            highlightVDButton();
	        });
	        pagination.appendChild(button);
	    }

	    // 다음 버튼
	    var nextButton = document.createElement('button');
	    nextButton.className = 'btn btn-subtle-secondary btn-sm';
	    nextButton.style.marginLeft = "5px";
	    nextButton.style.marginRight = "10px";

	    // 버튼에 아이콘 추가
	    var icon = document.createElement('i');
	    icon.classList.add('fa-solid', 'fa-angles-right');
	    nextButton.appendChild(icon);
	    
	    nextButton.addEventListener('click', function() {
	        if (VDcurrentPage < pageCount) {
	        	VDcurrentPage++;
	        	renderVDTable();
	            renderVDPagination();
	            highlightVDButton();
	        }
	    });
	    pagination.appendChild(nextButton);
	    
	    // 마지막 버튼
	    var nextButton2 = document.createElement('button');
	    nextButton2.textContent = '마지막';
	    nextButton2.className = 'btn btn-subtle-secondary btn-sm';
	    nextButton2.addEventListener('click', function() {
	        VDcurrentPage = pageCount;
	        renderVDTable();
	        renderVDPagination();
	        highlightVDButton();
	    });
	    pagination.appendChild(nextButton2);

	    highlightVDButton();
	}

	// 현재 페이지 버튼을 강조 표시
	const highlightVDButton = function() {
	    var buttons = document.querySelectorAll('.VDpagination button');
	    buttons.forEach(function(button) {
	        button.classList.remove('active');
	        if (parseInt(button.textContent) === VDcurrentPage) {
	            button.classList.add('active');
	        }
	    });
	}
	
	// 차량 검색,초기화 버튼 함수 시작 /////////////////////////////////////////////////////////
	
	const reset = ()=>{
		document.querySelector("#storeStatus").value = "";
		document.querySelector("#searchWord").value = "";
		document.querySelector("#searchText").value = "";
		VDSel();
	}
	// 차량 검색,초기화 버튼 함수 끝 ///////////////////////////////////////
// 차량 일지 SELECT함수 끝 ///////////////////////////////////////

// 4자리 랜덤 숫자 생성(IC카드 번호 랜덤 생성)함수 /////////////////////////////
	const ranNum = ()=> {
	  	var icCardNo = "";
		for(let i=1; i<=4; i++){
	  		var randomNumber = String(Math.floor(Math.random() * 10000)).padStart(4, '0');
	  		icCardNo += randomNumber;
	  		if (i < 4) { // 마지막 번째 숫자일 때는 "-"를 추가하지 않음
	            icCardNo += "-";
	        }
	  	}
		return icCardNo;
	}
// 4자리 랜덤 숫자 생성(IC카드 번호 랜덤 생성)함수 /////////////////////////////

// IC카드 자동완성 맹글기 ////////////////////
	const autoVD = ()=>{
		qs("#icCardNo").value = ranNum();
		qs("#validBeginDate").value = "2023-01-26";
    	qs("#validEndDate").value = "2023-02-11";
    	qs("#vhcleCd").value = "VEHI0012";
    	qs("#drverCd").value = "DRIV0187";
	}

// 자동완성 맹글기 ////////////////////


// 선박 운행 일지 등록 함수 시작 //////////////////////////////////////////////////
	//################### 모달 함수 시작 #############################
 	// 선박 일지 모달 함수 시작 ///////////////////////////
	const insertShip = function () {
	// 	console.log("함수 체크");
		var modal = document.getElementById("shipInsertModal");
		modal.classList.add("show"); // 모달을 보이도록 설정
		modal.style.display = "block";
	
		shipInfo();
	};
	// 선박 일지 모달 함수 끝 ///////////////////////////
	// ################### 모달 함수 끝 #################################
	
	//  BL-번호 생성 ////////////////////////////////////////////
	const engs="ABCDEFGHIJKLMNOPQRSTUVWXYZ";
	const creatId = function(){
	    let ranSu = Math.round(Math.random()) + 4;
	    let ranId="";
	    for(let i=0; i< ranSu; i++){
	        ranId += engs.charAt(Math.floor(Math.random()*engs.length));
	    }
	    for(let i=0; i<100; i++){
	    	var ranNum = Math.floor(Math.random() * 10000).toString().padStart(4, '0');
	    }
	    
		let	BlNo = ranId + "-" + ranNum;
	    return BlNo;
	}
	//  BL-번호 생성 ////////////////////////////////////////////
	
	// 선박 항해 자동 입력 버튼 시작 ////////////////////////////////////////////////////////////
	const autoIns = function () {
    	InsQS("#blNo", creatId());
    	//InsQS("#imoNo", "10052013");
    	//InsQS("#shipNm", "야나세207");
//     	InsQS("#startPrt", "상하이");
// 		InsQS("#arvlPrt", "싱가포르");
//     	InsQS("#shipStartDe", "2023-01-26");
//     	InsQS("#shipEndDe", "2023-02-11");
	};
	// 선박 항해 자동 입력 버튼 끝 ////////////////////////////////////////////////////////////
	
		
			
	const insertShipDiary = function () {
		var shipStartDate = QS("#shipStartDate");
		var shipStartTime = QS("#shipStartTime");
		var shipEndDate = QS("#shipEndDate");
		var shipEndTime = QS("#shipEndTime");
		
		const startPointList = [];
		const endPointList = [];
		
		document.querySelectorAll('.form-select.start').forEach(select => {
		    if (getComputedStyle(select).display === 'block') {
		        const startPoint = select.querySelector('option:checked');
		        if (startPoint) { startPointList.push(startPoint.value); }
		    }
		});
		document.querySelectorAll('.form-select.end').forEach(select => {
		    if (getComputedStyle(select).display === 'block') {
		        const endPoint = select.querySelector('option:checked');
		        if (endPoint) { endPointList.push(endPoint.value); }
		    }
		});
		const strtPnt = startPointList[0];
		const arvlPnt = endPointList[0];
		
    // console.log("선박 일지 등록 함수 체크");
    	var blNo = QS("#blNo");
    	var imoNo = QS("#imoNo");
    	var shipNm = QS("#shipNm");
    	
    	
//     	var startPrt = QS("#startPrt");
//     	var arvlPrt = QS("#arvlPrt");
    	var shipDest = QS("#shipDest");
    	
   		var shipStartDe = shipStartDate + " " + shipStartTime;
    	var shipEndDe = shipEndDate + " " + shipEndTime;

    	let data = {
      		startPrt: strtPnt,
      		arvlPrt: arvlPnt,
      		shipDest:shipDest,
      		shipStartDe: shipStartDe,
      		shipNm: shipNm,
      		blNo: blNo,
      		imoNo: imoNo,
      		shipEndDe: shipEndDe,
    	};
    	console.log("받은 값 체크 : {}", data);

    	var xhr = new XMLHttpRequest();
    	xhr.open("POST", "/cbs/trnsprt/insertSD", true);
    	xhr.setRequestHeader("Content-Type", "application/json");
    	xhr.onreadystatechange = function () {
      		if (xhr.readyState == 4 && xhr.status == 200) {
        // console.log("선박일지 Insert메소드 실행 성공");
        // console.log("Insert성공 확인 : {}", xhr.responseText);
      		}
    	};
    	xhr.send(JSON.stringify(data));
	};
 
// 모달창 안에서 a클릭시 값 입력 함수 시작 ////////////////////////////////
	const Aimo = (element) => {
    	let imoNo = element.innerText;
    // console.log("클릭된 a 태그의 값:",imoNo);
    
    	let trElement = element.parentNode.parentNode;
    // console.log("tr태그: ",trElement);
    	let tdShipName = trElement.querySelector("#TdShipName");
    // console.log("td태그: ",tdShipName);

    	let shipName = tdShipName.innerText;
   	 	console.log("td태그 값:", shipName);
    	document.querySelector("#imoNo").value = imoNo;
    	document.querySelector("#shipNm").value = shipName;
	};
// 모달창 안에서 a클릭시 값 입력 함수 끝 ////////////////////////////////

// 선박 운행 일지 등록시 필요 정보 가져오는 함수 시작 ////////////////////////////////////
	const shipInfo = (pCom) => {
    	var data = { cmpnyNm: pCom };
    	
    	if(pCom != null){
			qs("#shipTable").innerHTML = "";
    	}
    	var xhr = new XMLHttpRequest();
    	xhr.open("POST", "/cbs/trnsprt/selectSI", true);
    	xhr.setRequestHeader("Content-Type", "application/json");
    	xhr.onreadystatechange = () => {
      		if (xhr.readyState == 4 && xhr.status == 200) {
       	 	// console.log("select 성공 확인 : ", JSON.parse(xhr.responseText));
        	var res = JSON.parse(xhr.responseText);

			var Total = res.length;
			var size = 5;
			var pageSize = Math.ceil(Total / size);
			InsQS("#btnNex",pageSize);
			
        	let str = "";
			for(var i = 0; i<pageSize; i++){
				
				let div = document.createElement("div"); // 새로운 div 생성
	            div.className = "tDiv" + i;
	            div.style.position = "absolute"; // 절대 위치로 설정
				div.style.width = "95%";
	            div.style.zIndex = 1; // z-index 설정
	            div.id = i;
	            
	            if (i > 0) {
	            	div.style.display = "none";
	            }else{
	            	div.style.display = "block";
	            	div.style.zIndex = 99;
	            }
	                let pageStr = "";
	                pageStr += "<table class='table table-hover'>";
	                pageStr += "<thead>";
	                pageStr += "<tr class='bg-body-highlight'>";
	                pageStr += "<th class='col-md-4'>IMO번호</th>";
	                pageStr += "<th class='col-md-4'>선박명</th>";
	                pageStr += "<th class='col-md-4'>회사명</th>";
	                pageStr += "</tr>";
	                pageStr += "</thead>";
	                pageStr += "<tbody class='list'>";
	                
	             // 현재 페이지의 시작 인덱스와 끝 인덱스 계산
	                var startIndex = i * size;
	                var endIndex = Math.min((i + 1) * size, res.length);
	                
	                for (var j = startIndex; j < endIndex; j++) {
	                    pageStr += "<tr>";
	                    pageStr += "<td><a href='#' id='Aimo' onclick='Aimo(this)'>" + res[j].imoNo + "</a></td>";
	                    pageStr += "<td id='TdShipName'>" + res[j].shipNm + "</td>";
	                    pageStr += "<td>" + res[j].cmpnyNm + "</td>";
	                    pageStr += "</tr>";
	                }
	                pageStr += "</tbody>";
	                pageStr += "</table>";

	                div.innerHTML = pageStr; // 새로운 div에 테이블 내용 추가
	               
	               
	                qs("#shipTable").appendChild(div); // shipTable에 새로운 div 추가
			    }
      		}
    	};
    	xhr.send(JSON.stringify(data));
	};

 // 선박 운행 일지 등록시 필요 정보 가져오는 함수 끝 ////////////////////////////////////

// 검색 버튼 클릭시 값 리턴 함수 시작	////////////////////////////////////////////
	const IMOSrc = () => {
		document.querySelector("#btnPre").value = 1;
		var cmpnyNm = QS("#SrcCompany");
		shipInfo(cmpnyNm);
	};
// 검색 버튼 클릭시 값 리턴 함수 끝	//////////////////////////////////////////////


	// 이전 버튼//////////////////////////////////
	const btnPre = () => {
    const nowIndex = parseInt(document.querySelector("#btnPre").value) - 1; // 현재 페이지 인덱스를 가져옴
    if (nowIndex > 0) { // 현재 페이지가 첫 번째 페이지가 아니라면
        const PrevVal = document.querySelector("#shipTable"); // 이전 페이지의 부모 요소를 가져옴
        const children = PrevVal.children; // 이전 페이지의 자식 요소들을 가져옴

        children[nowIndex].style.display = "none"; // 현재 페이지 숨기기
        children[nowIndex].style.zIndex = 1; // 현재 페이지의 z-index 설정
        
        children[nowIndex - 1].style.display = "block"; // 이전 페이지 보이기
        children[nowIndex - 1].style.zIndex = 99; // 이전 페이지의 z-index 설정

        // 이전 페이지 인덱스를 버튼에 표시
        document.querySelector("#btnPre").value = nowIndex;
        currentIndex = nowIndex - 1; // currentIndex 갱신
    }
};

	// 다음 버튼 ////////////////////////////////
	let currentIndex = 0; // 현재 보이는 요소의 인덱스
	const btnNex = () => {
    	const NextVal = document.querySelector("#shipTable");
    	const children = NextVal.children;
    	const numChildren = children.length;

   		if (currentIndex < numChildren - 1) { // 다음 요소가 있다면
    	    children[currentIndex].style.zIndex = 1;
        	children[currentIndex].style.display = "none";
        	currentIndex++; // 다음 요소로 인덱스 이동

        	children[currentIndex].style.display = "block";
    	    children[currentIndex].style.zIndex = 99;
	   		document.querySelector("#btnPre").value = currentIndex + 1;
    	} else if (currentIndex !== numChildren) { // currentIndex가 numChildren과 같지 않으면
            currentIndex = 0; // currentIndex를 0으로 재설정
        }
   		
	};
	
	const closeSD = ()=>{
		currentIndex = 0;
		document.querySelector("#btnPre").value = 1;
		const closeVal = document.querySelector("#shipTable");
		closeVal.innerHTML = "";
	}
// 선박 운행 일지 등록 함수 끝 //////////////////////////////////////////////////

// 화면에 보이는 테이블 엑셀로 다운로드 함수 시작 //////////////////////////////
	const downExcel = () => {
	    const data = getVDData;
	
	    const workbook = new ExcelJS.Workbook();
	    const worksheet = workbook.addWorksheet('Sheet1');
	
	    const headerCells = ['차량 일지 코드', 'IC카드 번호', '출발지', '도착지', '출발시간', '도착시간', '통관번호'];
	    worksheet.addRow(headerCells);
	    worksheet.getRow(1).eachCell((cell) => {
	        cell.fill = {
	            type: 'pattern',
	            pattern: 'solid',
	            fgColor: { argb: 'FFD9D9D9' }
	        };
	    });
	
	    data.forEach((row) => {
	        const rowData = [
	            row.vhcleDiaryCd,
	            row.icCardNo,
	            row.strtPnt,
	            row.arvlPnt,
	            row.strtTime,
	            row.arvlTime,
	            row.entrManageNo
	        ];
	        worksheet.addRow(rowData);
	    });
	
	    workbook.xlsx.writeBuffer().then(buffer => {
	        const blob = new Blob([buffer], { type: 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet' });
	        const downloadLink = document.createElement('a');
	        downloadLink.href = window.URL.createObjectURL(blob);
	        downloadLink.download = '차량_일지.xlsx';
	        downloadLink.click();
	    });
	};
//화면에 보이는 테이블 엑셀로 다운로드 함수 끝 //////////////////////////////

// 관세사가 보는 화면 시작 ////////////////
	const cstbrkrBtn = ()=>{
		window.open('/cbs/trnsprt/cstbrkrContain','_blank','width=1300, height=750, top=50, left=50, scrollbars=no');
	}
// 관세사가 보는 화면 시작 ////////////////

// 옵션 선택 함수 시작 ////////////////////////
	const StartSel = () => {
	    const FSval = document.querySelector("#startPrt").value;
	    // console.log(FSval);
	    
	    for (let i = 1; i <= 5; i++) {
// 	    	console.log("op",i)
	    	const selectId = "startPrt" + i;
	        const select = document.querySelector("#" + selectId);
			// i가 1~5까지 반복할때 FSval의 값이 op1 ~ op5까지 반복될때 
			// 해당되면 diplay를 block처리 아닐때는 none처리
	        if (FSval == "op"+i) {
	            select.style.display = "block";
	        } else {
	            select.style.display = "none";
	        }
	        
	    }
	}
	const ArvlSel = () => {
		const FSval = document.querySelector("#arvlPrt").value;
// 	    console.log(FSval);
	    
	    for (let i = 1; i <= 5; i++) {
// 	    	console.log("op",i)
	    	const selectId = "arvlPrt" + i;
	        const select = document.querySelector("#" + selectId);
	        if (FSval == "op"+i) {
	            select.style.display = "block";
	        } else {
	            select.style.display = "none";
	        }
	        
	    }
	}
// 옵션 선택 함수 끝 /////////////////////////

// IC카드 상세 정보 모달 함수 시작 ///////////////////////////////
	const openIcModal = (element)=>{
		let icCardNo = element.textContent;
		let data = { icCardNo : icCardNo}
		console.log(data);
		const modal = new bootstrap.Modal(document.querySelector('#vehiModal'));
	    modal.show();
	    selectIcCard(data);
	}
	
	// 모달 실행과 동시에 필요 정보 SELECT 함수 시작 //////////////////////////////
	const selectIcCard = (pVal)=>{
		//console.log("openIcModal()에서 넘어온값 체크 :", pVal);
		var xhr = new XMLHttpRequest();
    	xhr.open("POST", "/cbs/trnsprt/icInfoSel", true);
    	xhr.setRequestHeader("Content-Type", "application/json");
    	xhr.onreadystatechange = function () {
      		if (xhr.readyState == 4 && xhr.status == 200) {
        		//console.log("select성공 확인 : {}", xhr.responseText);
        		let res = JSON.parse(xhr.responseText);
        		inpICRes(res);
      		}
    	};
    	xhr.send(JSON.stringify(pVal));
	}
	// 모달 실행과 동시에 필요 정보 SELECT 함수 끝 ///////////////////////////////
	
	// 결과를 input에 뿌려주는 함수 시작///////////////////
	const inpICRes = (res)=> {
		document.querySelector("#icDate").value = res.validBeginDe + " ~ " + res.validEndDe;
		document.querySelector("#driverNm").value = res.drverNm;
		document.querySelector("#driverTel").value = res.telno;
		document.querySelector("#vehiNo").value = res.vhcleNo;
		document.querySelector("#vehiMo").value = res.mdlNm;
		document.querySelector("#vehiVl").value = res.ldadngVl;
		document.querySelector("#vehiWt").value = res.ldadngWt;
	}
	// 결과를 input에 뿌려주는 함수 끝///////////////////
	
// IC카드 상세 정보 모달 함수 끝 ///////////////////////////////

// 선박 상세 정보 모달 함수 시작 ///////////////////////////////
	const openShipModal = (element)=>{
		let imoNo = element.textContent;
		let data = { imoNo : imoNo}
		console.log(data);
		const modal = new bootstrap.Modal(document.querySelector('#shipModal'));
		// 함수 실행
	    modal.show();
	    selectShipInfo(data);
	}
	
	// 모달 실행과 동시에 필요 정보 SELECT 함수 시작 //////////////////////////////
	const selectShipInfo = (pVal)=>{
		//console.log("openIcModal()에서 넘어온값 체크 :", pVal);
		var xhr = new XMLHttpRequest();
    	xhr.open("POST", "/cbs/trnsprt/shipInfoSel", true);
    	xhr.setRequestHeader("Content-Type", "application/json");
    	xhr.onreadystatechange = function () {
      		if (xhr.readyState == 4 && xhr.status == 200) {
        		//console.log("selectShipInfo성공 확인 : {}", xhr.responseText);
        		let res = JSON.parse(xhr.responseText);
        		console.log(res.sclist);
        		inpShipRes(res);
      		}
    	};
    	xhr.send(JSON.stringify(pVal));
	}
	// 모달 실행과 동시에 필요 정보 SELECT 함수 끝 ///////////////////////////////
	
	// 결과를 input에 뿌려주는 함수 시작///////////////////
	const inpShipRes = (res)=> {
		document.querySelector("#shipDeNm").value = res.shipNm;
		document.querySelector("#shipDetDa").value = res.cbstrDate;
		document.querySelector("#shipToLe").value = res.shipLt;
		document.querySelector("#shipToWt").value = res.grtg;
		document.querySelector("#shipCalBu").value = res.clsgn;
		
		let contain = res.sclist;
		
		let str = "";
		for(let i=0; i<contain.length; i++){
			str += "<tr>"
			str += "<td>"+contain[i].cntanrInnb+"</td>";
			str += "<td>"+contain[i].cntanrMtrqlt+"</td>";
			str += "<td style='text-align: right;'>"+contain[i].cntanrStndrd+"</td>";
			str += "</tr>"
		}
		document.querySelector("#containTab").innerHTML = str;
	}
	// 결과를 input에 뿌려주는 함수 끝///////////////////
	
// 선박 상세 정보 모달 함수 끝 ///////////////////////////////

 // IC카드 인서트 모달 함수 시작/////////////////////////////////
	const openIcInsModal = ()=>{
		console.log("1번 insIcModal함수가 실행됬는지 체크")
	}
	
	const insertICcard = ()=>{
		var validBeginDate = qs("#validBeginDate").value;
		var validBeginTime = qs("#validBeginTime").value;
		var validEndDate = qs("#validEndDate").value;
		var validEndTime = qs("#validEndTime").value;
		
		var icCardNo = qs("#icCardNo").value;
		var validBegin = validBeginDate + " " + validBeginTime;
		var validEnd = validEndDate + " " + validEndTime;
		var vhcleCd = qs("#vhcleCd").value;
		var drverCd = qs("#drverCd").value;
		
		let data = {
			icCardNo:icCardNo,
			validBeginDe:validBegin,
			validEndDe:validEnd,
			vhcleCd:vhcleCd,
			drverCd:drverCd
		}
		console.log("data값 확인 : ",data);
		
		var xhr = new XMLHttpRequest();
		xhr.open("POST","/cbs/trnsprt/insertIcCard",true);
		xhr.setRequestHeader("Content-Type","application/json");
		xhr.onreadystatechange= ()=>{
			if(xhr.readyState == 4 && xhr.status == 200){
				console.log("결과값체크 : ",xhr.responseText);
			}
		}
		xhr.send(JSON.stringify(data));
	}
// IC카드 인서트 모달 함수 시작/////////////////////////////////

</script>

<!-- 좌측 div 시작 /////////////////////////////////////////////////////////////// -->
<div class="card" style="float: left; width: 53%; margin-right: 10px;">
	<div class="col-auto m-2">
		<h3 style="margin-left: 20px; margin-top: 10px; float: left; width: 20%" >차량 일지 목록</h3>
		
<!--        	<button class="btn btn-primary btn-sm" type="button" id="btnInsert" onclick="openIcInsModal()" style="float: right; width: 13%">IC카드 조회</button> -->
		<button type="button" class="btn btn-phoenix-secondary btn-sm" style="height: auto; width:12%; float: right;" onclick="downExcel()">excel다운</button>
    </div>
    <div class="input-group mb-2 p-1 bd-highlight" style="padding: 10px; width: 100%; float: right;">
			<input type="text" style="width: 10px; border: none; background: transparent;" disabled="disabled">
			<div class="input-group-text" style="width: 90px; padding: 10px;">입출고 구분</div>
			<select class="form-select" id="storeStatus" style="width: 60px;">
				<option selected value="">일지 구분</option>
				<option value="1">입고 일지</option>
				<option value="2">출고 일지</option>
			</select>
			
			<input type="text" style="width: 10px; border: none; background: transparent;" disabled="disabled">
			<div class="input-group-text" style="width: 70px; padding: 10px;">검색조건</div>
			<select class="form-select" id="searchWord" style="width: 70px;">
				<option selected value="">검색조건</option>
				<option value="IC_CARD_NO">IC카드 번호</option>
				<option value="ENTR_MANAGE_NO">통관번호</option>
				<option value="VHCLE_DIARY_CD">일지코드</option>
				<option value="STRT_PNT">출발지</option>
				<option value="ARVL_PNT">도착지</option>
			</select>
			<input type="text" id="searchText" class="form-control" placeholder="검색어를 입력하세요." style="width: 110px;">
			<button class="btn btn-primary btn-sm" type="button" id="search" onclick="search()">검색</button>
			<button class="btn btn-primary btn-sm" type="button" id="reset" onclick="reset()">초기화</button>
	</div>
	<div class="card p-3">
      	<table class="table table-hover" id="totalTable">
        	<thead>
          		<tr class="bg-body-highlight">
            		<th class="col-md-2">차량 일지 코드</th>
            		<th class="col-md-2">IC카드 번호</th>
            		<th class="col-md-2">통관 번호</th>
            		<th class="col-md-2">입출고 구분</th>
		            <th class="col-md-2">출발지</th>
		            <th class="col-md-2">도착지</th>
		            <th class="col-md-2">출발 시간</th>
		            <th class="col-md-2">도착 시간</th>
		        </tr>
        	</thead>
	        <tbody class="VDTable" id="VDTable">
	        </tbody>
    	</table>
	</div>
    	<!-- 페이지네이션 시작 -->
			<div class="VDpagination" id="VDpagination">
			
			</div>
		<!-- 페이지네이션 종료 -->
</div>
<div class="card" style="float: left; width: 45%;">
	<div class="col-auto m-2">
       <h3 style="margin-left: 20px; margin-top: 10px; width: 30%; float: left;" >선박 일지 목록</h3>
	    	<button class="btn btn-primary btn-sm" type="button" id="btnInsert" 
	    				data-bs-toggle="modal" data-bs-target="#shipInsertModal" onclick="insertShip()" style="float: right; width: 12%">등록</button>
    </div>
    <div class="input-group mb-2 p-1 bd-highlight" style="padding: 10px; width: 100%; float: right;">
			<input type="text" style="width: 10px; border: none; background: transparent;" disabled="disabled">
			<div class="input-group-text" style="width: 70px; padding: 10px;">날짜검색</div>
			<select class="form-select" id="shipDateWord" style="width: 70px;">
				<option selected value="">검색기준</option>
				<option value="START">출항일자</option>
				<option value="END">입항일자</option>
				<option value="BETWEEN">사이날짜</option>
			</select>
			<input type="date" id="shipSearchtSDate" class="form-control" placeholder="출항날짜">
			<input type="date" id=shipSearchtEDate class="form-control" placeholder="입항날짜">
			
			<input type="text" style="width: 10px; border: none; background: transparent;" disabled="disabled">
			<div class="input-group-text" style="width: 70px; padding: 10px;">검색조건</div>
			<select class="form-select" id="searchShipWord" style="width: 70px;">
				<option selected value="">검색조건</option>
				<option value="BL_NO">BL번호</option>
				<option value="IMO_NO">IMO번호</option>
				<option value="START_PRT">출항지</option>
				<option value="ARVL_PRT">입항지</option>
			</select>
			<input type="text" id="searchShipText" class="form-control" placeholder="검색어를 입력하세요." style="width: 110px;">
			<button class="btn btn-primary btn-sm" type="button" id="search" onclick="shipSearch()">검색</button>
			<button class="btn btn-primary btn-sm" type="button" id="reset" onclick="shipReset()">초기화</button>
	</div>
	<div class="card p-3">
	    <table class="table table-hover">
	    	<thead>
	      		<tr class="bg-body-highlight">
	            <th class="col-md-2">BL번호</th>
	            <th class="col-md-2">IMO번호</th>
	            <th class="col-md-2">출항</th>
	            <th class="col-md-2">출항 시간</th>
	            <th class="col-md-2">입항</th>
	            <th class="col-md-2">입항 시간</th>
		      	</tr>
	    	</thead>
	    	<tbody class="SDTable" id="SDTable"></tbody>
	    </table>
	    <!-- 페이지네이션 시작 -->
			<div class="SDpagination" id="SDpagination">
			
			</div>
		<!-- 페이지네이션 종료 -->
	</div>
</div>
<!-- 좌측 div 끝 /////////////////////////////////////////////////////////////// -->


<!-- ############################################ IC카드 상세정보 모달 ############################################ -->
<div class="modal fade" id="vehiModal" tabindex="-1" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered modal-dialog-scrollable" style="max-width: 37%;">
	    <div class="modal-content h-100 w-100">
			<div class="modal-header bg-primary">
			<h3 class="modal-title text-white dark__text-gray-1100" id="edTitle">IC카드 상세정보</h3>
			<button class="btn p-1" type="button" data-bs-dismiss="modal" aria-label="Close">
				<span class="fas fa-times fs-9 text-white dark__text-gray-1100"></span>
			</button>
			</div>
			<div class="modal-body" style="">
				<div class="col-auto m-1" style="float: right;">
					<div class="input-group">
						<div class="input-group-text icTex">IC카드 유효일자</div>
						<input class="form-control icMo" id="icDate" type="text" style="width: 290px;">
					</div>
				</div>
				<div class="col-auto m-1">
					<div class="input-group">
						<div class="input-group-text icTex">운전자명</div>
						<input class="form-control icMo" id="driverNm" type="text">
						<input type="text" style="width: 30px; border: none; background: transparent;" disabled="disabled">
						<div class="input-group-text icTex">전화번호</div>
						<input class="form-control icMo" id="driverTel" type="text">
					</div>
				</div>
				<div class="col-auto m-1">
					<div class="input-group">
						<div class="input-group-text icTex">차량번호</div>
						<input class="form-control icMo" id="vehiNo" type="text">
						<input type="text" style="width: 30px; border: none; background: transparent;" disabled="disabled">
						<div class="input-group-text icTex">차량모델</div>
						<input class="form-control icMo" id="vehiMo" type="text">
					</div>
				</div>
				<div class="col-auto m-1">
					<div class="input-group">
						<div class="input-group-text icTex">적재부피(CBM)</div>
						<input class="form-control icMo" id="vehiVl" type="text" style="text-align: right;">
						<input type="text" style="width: 30px; border: none; background: transparent;" disabled="disabled">
						<div class="input-group-text icTex">적재중량(KG)</div>
						<input class="form-control icMo" id="vehiWt" type="text" style="text-align: right;">
					</div>
				</div>
				
			</div>
			<div class="modal-footer">
				<button class="btn btn-outline-primary" type="button" data-bs-dismiss="modal">닫기</button>
			</div>
		</div>
	</div>
</div>
<!-- ############################################################################################# -->

<!-- ############################################ 선박 상세정보 모달 ############################################ -->
<div class="modal fade" id="shipModal" tabindex="-1" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered modal-dialog-scrollable" style="max-width: 37%;">
	    <div class="modal-content h-100 w-100">
			<div class="modal-header bg-primary">
			<h3 class="modal-title text-white dark__text-gray-1100" id="edTitle">선박 상세정보</h3>
			<button class="btn p-1" type="button" data-bs-dismiss="modal" aria-label="Close">
				<span class="fas fa-times fs-9 text-white dark__text-gray-1100"></span>
			</button>
			</div>
			<div class="modal-body" style="">
			<div style="float: left; width: 45%;">
				<div class="col-auto m-1" style="height: 57px;">
					<div class="input-group">
						<div class="input-group-text icTex">선박명</div>
						<input class="form-control icMo" id="shipDeNm" type="text">
					</div>
				</div>
				<div class="col-auto m-1" style="height: 57px;">
					<div class="input-group">
						<div class="input-group-text icTex">건조일자</div>
						<input class="form-control icMo" id="shipDetDa" type="text">
					</div>
				</div>
				<div class="col-auto m-1" style="height: 57px;">
					<div class="input-group">
						<div class="input-group-text icTex">총길이(m)</div>
						<input class="form-control icMo" id="shipToLe" type="text" style="text-align: right;">
					</div>
				</div>
				<div class="col-auto m-1" style="height: 57px;">
					<div class="input-group">
						<div class="input-group-text icTex">총톤수(Ton)</div>
						<input class="form-control icMo" id="shipToWt" type="text" style="text-align: right;">
					</div>
				</div>
				<div class="col-auto m-1" >
					<div class="input-group">
						<div class="input-group-text icTex">호출부호</div>
						<input class="form-control icMo" id="shipCalBu" type="text" style="text-align: right;">
					</div>
				</div>
			</div>
			<div style="float: left; width: 55%; padding: 10px;">
				<table class="table table-hover">
					<thead>
						<tr class="bg-body-highlight">
							<th>컨테이너 번호</th>
							<th>재질</th>
							<th>규격(CBM)</th>
						</tr>
					</thead>
					<tbody id="containTab">
						
					</tbody>
				</table>
			</div>
			</div>
			<div class="modal-footer">
				<button class="btn btn-outline-primary" type="button" data-bs-dismiss="modal">닫기</button>
			</div>
		</div>
	</div>
</div>
<!-- ############################################################################################# -->

<!-- ############################################ 선박 일지 입력 모달 ############################################ -->
<div class="modal fade" id="shipInsertModal" tabindex="-1" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-xl">
	    <div class="modal-content h-70 w-100">
		    <div class="modal-header">
		      <h5 class="modal-title" id="exampleModalLabel">선박 운항 일지 등록</h5>
		      <button class="btn p-1" type="button" data-bs-dismiss="modal" aria-label="Close">
		        <span class="fas fa-times fs-9"></span>
		      </button>
		    </div>
		    <div class="modal-body">
		      	<div class="col-lg-6" style="float: left;">
			        <div style="float: left; margin-right: 25px;">
				        <div class="input-group">
				          <input class="iMoInput" id="SrcIMO" type="text" placeholder="IMO 검색" style="width: 150px; border-radius: 5px;"/>
				          <input class="iMoInput" id="SrcShipNm" type="text" placeholder="선박명 검색" style="width: 150px; border-radius: 5px;"/>
				          <input class="iMoInput" id="SrcCompany" type="text" placeholder="회사명 검색" style="width: 150px; margin-right: 5px; border-radius: 5px;"/>
				          <button class="btn btn-subtle-info" id="IMOSrc" onclick="IMOSrc()">검색</button>
				        </div>
					</div>
						<div class="shipTable" id="shipTable" style="position: relative; clear: both;">
				        
						
						</div>
			        </div>
		        	<div class="col-lg-5" style="float: right; margin-right: 10px;">
		          	<div class="input-group">
		            	<div class="input-group-text">BL번호</div>
		            	<input class="form-control" id="blNo" type="text" />
		          	</div>
		         	<div class="input-group">
		            	<div class="input-group-text">IMO번호</div>
		            	<input class="form-control" id="imoNo" type="text" />
		          	</div>
		          	<div class="input-group">
		            	<div class="input-group-text">선박명</div>
		            	<input class="form-control" id="shipNm" type="text" />
		          	</div>
					<div class="input-group" id="selId">
						<div class="input-group-text">출항</div>
						<select class="form-select" id="startPrt" onclick="StartSel()">
							<option value="">대륙 선택</option>
							<option value="op1">아시아</option>
							<option value="op2">아프리카</option>
							<option value="op3">유럽</option>
							<option value="op4">아메리카</option>
						</select>
						<select class="form-select start" id="startPrt1" style="display: block;">
							<option selected>아시아 항구</option>
							<option>톈진</option>
							<option>싱가포르</option>
							<option>인천</option>
							<option>두바이</option>
							<option>부산 </option>
						</select>
						<select class="form-select start" id="startPrt2" style="display: none;">
							<option selected>아프리카 항구</option>
							<option>라고스</option>
							<option>카이로</option>
							<option>쿠사이</option>
							<option>카사블랑카</option>
							<option>마리넬라</option>
						</select>
						<select class="form-select start" id="startPrt3" style="display: none;">
							<option selected>유럽 항구</option>
							<option>바르셀로나</option>
							<option>리스본</option>
							<option>마르세유</option>
							<option>베네치아</option>
							<option>브레멘</option>
						</select>
						<select class="form-select start" id="startPrt4" style="display: none;">
							<option selected>아메리카 항구</option>
							<option>뉴욕</option>
							<option>롱비치</option>
							<option>밴쿠버</option>
							<option>시애틀</option>
							<option>세인트존스</option>
						</select>
					</div>
			        <div class="input-group">
				    	<div class="input-group-text">출항일자</div>
				        <input class="form-control" id="shipStartDate" type="date" />
				        <input class="form-control" id="shipStartTime" type="time" step="2"/>
			        </div>
					<div class="input-group">
					 	<div class="input-group-text">입항</div>
					 	<select class="form-select" id="arvlPrt" onclick="ArvlSel()">
					  		<option value="">대륙 선택</option>
							<option value="op1">아시아</option>
							<option value="op2">아프리카</option>
							<option value="op3">유럽</option>
							<option value="op4">아메리카</option>
					  	</select>
					  	<select class="form-select end" id="arvlPrt1" style="display: block;">
							<option selected>아시아 항구</option>
							<option>톈진</option>
							<option>싱가포르</option>
							<option>인천</option>
							<option>두바이</option>
							<option>부산 </option>
						</select>
						<select class="form-select end" id="arvlPrt2" style="display: none;">
							<option selected>아프리카 항구</option>
							<option>라고스</option>
							<option>카이로</option>
							<option>쿠사이</option>
							<option>카사블랑카</option>
							<option>마리넬라</option>
						</select>
						<select class="form-select end" id="arvlPrt3" style="display: none;">
							<option selected>유럽 항구</option>
							<option>바르셀로나</option>
							<option>리스본</option>
							<option>마르세유</option>
							<option>베네치아</option>
							<option>브레멘</option>
						</select>
						<select class="form-select end" id="arvlPrt4" style="display: none;">
							<option selected>아메리카 항구</option>
							<option>뉴욕</option>
							<option>롱비치</option>
							<option>밴쿠버</option>
							<option>시애틀</option>
							<option>세인트존스</option>
						</select>
					</div>
			        <div class="input-group">
						<div class="input-group-text">입항일자</div>
						<input class="form-control" id="shipEndDate" type="date" />
						<input class="form-control" id="shipEndTime" type="time" step="2"/>
					</div>
					<div class="input-group">
					 	<div class="input-group-text">목적국가</div>
					 	<select class="form-select" id="shipDest">
					  		<option selected>선택</option>
					  		<option value="op1">아시아</option>
							<option value="op4">아메리카</option>
							<option value="op2">아프리카</option>
							<option value="op3">유럽</option>
							<option value="op5">중동</option>
					        <option value="중국">중국</option>
					        <option value="콩고">콩고</option>
					        <option value="한국">한국</option>
					        <option value="독일">독일</option>
					        <option value="태국">태국</option>
					  	</select>
					</div>
		        </div>
		        
		    </div>
		    <div>
		    <!-- z-Index사용 페이징처리 시작/////////////////////// -->
		    <div class="col-lg-4" style="float: left; margin-bottom: 5px; margin-left: 17%" >
		    	<button type='button' class='btn btn-phoenix-info' onclick="btnPre()"><i class='fa-solid fa-angles-left'></i></button>
		    	<input type="text" class="btnPage" value="1" id="btnPre"><span>/</span><input type="text" class="btnPage" value="2" id="btnNex">
				<button type='button' class='btn btn-phoenix-info' onclick="btnNex()"><i class='fa-solid fa-angles-right'></i></button>
		    </div>
		    <!-- z-Index사용 페이징처리  끝/////////////////////// -->
		    </div>
		    <div class="modal-footer">
			    <button class="btn btn-primary" type="button" id="insertSD" onclick="autoIns()">자동입력</button>
			    <button class="btn btn-primary" type="button" data-bs-dismiss="modal" id="insertSD" onclick="insertShipDiary()">입력</button>
			    <button class="btn btn-outline-primary" type="button" data-bs-dismiss="modal" onclick="closeSD()">닫기</button>
			</div>
    	</div>
  	</div>
</div>
<!-- ############################################################################################# -->


