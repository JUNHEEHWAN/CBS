<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<style>
    .container {
        display: flex;
        flex-wrap: wrap;
        justify-content: space-between;
        margin: 0 5px;
    }
    .card.In{
        width: calc(35% - 5px);
        margin-bottom: 10px;
        min-height: 500px;
        margin-right: 5px;
        padding: 0 5px;
    }
    .card.total {
        width: 97%;
        min-height: 200px;
    }
    .col-auto.m-2{
    	float: left;
/*     	width: 50%; */
    }
    .input-group.mb-2.p-1.bd-highlight{
    	padding: 10px;
    	width: 100%; 
    	float: right;
    }
    .card.table {
    	padding: 10px;
    	overflow-x: auto; /* 가로 스크롤을 허용 */
    	overflow-y: auto; /* 세로 스크롤을 허용 */
    	border: none;
	}
	.card.inpBody {
		margin-top : 10px;
		min-height: 400px;
		padding : 10px;
		border: none;
	}
	.input-group{
		margin-bottom: 10px;
	}
	.input-group-text{
		width: 96px;
	}
	table{
		text-align: center;
		font-size: 0.9rem;
	}
	.SDpagination, .VIpagination, .VDripagination{
	    display: flex;
	    justify-content: center;
	    margin-top: 5px;
	    margin-bottom: 10px;
	}
	.SDpagination button{
		border: none;
	}
	.VIpagination button{
		border: none;
	}
	.VDripagination button{
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
	.VDripagination button:hover{
		border: none;
		 background-color: #E3E6ED;
	}
</style>

<script>
	
	window.onload = ()=> {
		selComp();
		
	}
	<%-- 회사 정보 sel 함수 시작 //////////// --%>
	
	const compSearch = ()=>{
		let searchCompWord = document.querySelector("#searchCompWord").value;
		let searchCompText = document.querySelector("#searchCompText").value;
		
		let data = {
				searchCompWord : searchCompWord,
				searchCompText : searchCompText
		}
		console.log("검색 값 확인 : ",data);
		selComp(data);
	}
	const compReset = ()=>{
		cmpnyCd = "";
		document.querySelector("#searchCompWord").value = "";
		document.querySelector("#searchCompText").value = "";
		selComp();
	}
	const selComp = (pVal)=>{
		var xhr = new XMLHttpRequest();
		xhr.open("POST","/cbs/trnsprt/selComInfo",true);
		xhr.setRequestHeader("Content-Type","application/json");
		xhr.onload = ()=>{
// 			console.log("넘어온값체크 {} ",xhr.responseText);
			let res = JSON.parse(xhr.responseText);
// 			console.log("정제된 회사 정보 체크 {}",res);
			getSDData = [];
	    	getSDData = res; // 데이터를 가져와서 변수에 할당
	    	renderSDTable(); // 테이블 렌더링
            renderSDPagination(); // 페이지네이션 렌더링
		}
		xhr.send(JSON.stringify(pVal));
	}
	var getSDData = [];
	var SDPerPage = 5; // 페이지당 보여줄 아이템 수
	var SDcurrentPage = 1; // 현재 페이지 번호
	
	const renderSDTable = ()=> {
		var tableBody = document.querySelector('#companyTBody');
	    tableBody.innerHTML = ''; // 표 초기화
	    
	    var startIdx = (SDcurrentPage - 1) * SDPerPage;
	    var endIdx = startIdx + SDPerPage;
	    
	    for (var i = startIdx; i < endIdx && i < getSDData.length; i++) {
	    	var item = getSDData[i];
// 			console.log("item에 담긴 값 확인",item);
	    	var pageStr = ""
	    	pageStr += "<tr>";
		    pageStr += "<td><a href='#' onclick='selVehiDrivInfo(this)'>" + item.cmpnyCd + "</td>";
		    pageStr += "<td>" + item.cmpnyNm + "</td>";
		    pageStr += "<td>" + item.cmpnyTelno + "</td>";
		    pageStr += "<td>" + item.rprsntvNm + "</td>";
	    	pageStr += "</tr>";
			tableBody.innerHTML += pageStr;
		}
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
	<%-- 회사 정보 sel 함수 시작 //////////// --%>
	
	<%-- 회사 코드로 차량 정보 운전자 정보 가져오기 --%>
	let cmpnyCd = "";
	const selVehiDrivInfo = (element)=>{
		cmpnyCd = element.textContent;
		console.log("클릭된 회사코드",cmpnyCd);
		var xhr = new XMLHttpRequest();
		xhr.open("POST","/cbs/trnsprt/selVehiDriver",true);
		xhr.setRequestHeader("Content-Type","text/plain");
		xhr.onload = ()=>{
// 			console.log("넘어온값체크 {} ",xhr.responseText);
			let res = JSON.parse(xhr.responseText);
			if(res != null){
				openVehiTab(res[0].vehiInfoList);
				openDriverTab(res[0].vehiDriverList);
			}
		}
		xhr.send(cmpnyCd);
	}
	
	<%-- 차량 정보 sel 함수 시작 //////////// --%>
	const selVehi = (pVal)=>{
		var xhr = new XMLHttpRequest();
		xhr.open("POST","/cbs/trnsprt/selVehiInfo",true);
		xhr.setRequestHeader("Content-Type","application/json");
		xhr.onload = ()=>{
// 			console.log("넘어온값체크 {} ",xhr.responseText);
			let res = JSON.parse(xhr.responseText);
			console.log("정제된 차량 정보 체크 {}",res);
			getVIData = [];
			getVIData = res;
			renderVITable(); // 테이블 렌더링
	        renderVIPagination(); // 페이지네이션 렌더링
		}
		xhr.send(JSON.stringify(pVal));
	}
	<%-- 차량 정보 sel 함수 끝 //////////// --%>
	const vehiSearch = ()=>{
		let searchVehiWord = document.querySelector("#searchVehiWord").value;
		let searchVehiText = document.querySelector("#searchVehiText").value;
		let data = {
				cmpnyCd : cmpnyCd,
				searchVehiWord : searchVehiWord,
				searchVehiText : searchVehiText
		}
		selVehi(data);
	}
	const vehiReset = ()=>{
		document.querySelector("#searchVehiWord").value = "";
		document.querySelector("#searchVehiText").value = "";
		selVehiDrivInfo(cmpnyCd);
	}
	const openVehiTab = (res)=>{
		getVIData = res;
		renderVITable(); // 테이블 렌더링
        renderVIPagination(); // 페이지네이션 렌더링
	}
	
	var getVIData = [];
	var VIPerPage = 5; // 페이지당 보여줄 아이템 수
	var VIcurrentPage = 1; // 현재 페이지 번호
	
	const renderVITable = ()=> {
		var tableBody = document.querySelector('#vehiTBody');
	    tableBody.innerHTML = ''; // 표 초기화
	    
	    var startIdx = (VIcurrentPage - 1) * VIPerPage;
	    var endIdx = startIdx + VIPerPage;
	    
	    for (var i = startIdx; i < endIdx && i < getVIData.length; i++) {
	    	var item = getVIData[i];
// 			console.log("item에 담긴 값 확인",item);
	    	var pageStr = ""
	    	pageStr += "<tr>";
	    	pageStr += "<td><input name='checked1' onclick='onlyOneClick1(this)' class='form-check-input vehiInfoChkBox' type='checkbox'></td>";
		    pageStr += "<td id='vehiCd'>" + item.vhcleCd + "</td>";
		    pageStr += "<td id='vehiNo'>" + item.vhcleNo + "</td>";
		    pageStr += "<td id='vehiNm'>" + item.mdlNm + "</td>";
		    pageStr += "<td>" + item.ldadngWt + "</td>";
		    pageStr += "<td>" + item.ldadngHg + "</td>";
	    	pageStr += "</tr>";
			tableBody.innerHTML += pageStr;
		}
	}
	const onlyOneClick1 = (element)=>{
		let checkName = document.getElementsByName("checked1");
		checkName.forEach((cb) => {
		    cb.checked = false;
		});
		element.checked = true;
	}
	const renderVIPagination = function() {
	    var pagination = document.getElementById('VIpagination');
	    pagination.innerHTML = ''; // 페이지네이션 초기화

	    var pageCount = Math.ceil(getVIData.length / VIPerPage);
	    var totalPageCount = 5;    // 보여지는 페이지 개수

	    // 현재 페이지가 몇 번째 그룹에 속하는지 계산
	    var currentPageGroup = Math.ceil(VIcurrentPage / totalPageCount);

	    // 시작 페이지와 끝 페이지를 계산
	    var startPage = (currentPageGroup - 1) * totalPageCount + 1;
	    var endPage = Math.min(startPage + (totalPageCount - 1), pageCount);

	    // 처음 버튼
	    var prevButton = document.createElement('button');
	    prevButton.textContent = '처음';
	    prevButton.className = 'btn btn-subtle-secondary btn-sm';
	    prevButton.style.marginRight = "10px";
	    prevButton.addEventListener('click', function() {
	    	VIcurrentPage = 1;
	    	renderVITable();
	    	renderVIPagination();
	    	highlightVIButton();
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
	        if (VIcurrentPage > 1) {
	        	VIcurrentPage--;
	        	renderVITable();
	            renderVIPagination();
	            highlightVIButton();
	        }
	    });
	    pagination.appendChild(prevButton2);

	    for (var i = startPage; i <= endPage; i++) {
	        var button = document.createElement('button');
	        button.textContent = i;
	        button.className = "btn btn-outline-primary btn-sm";
	        button.style.marginRight = "5px";
	        button.addEventListener('click', function() {
	        	VIcurrentPage = parseInt(this.textContent);
	        	renderVITable();
	            renderVIPagination();
	            highlightVIButton();
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
	        if (VIcurrentPage < pageCount) {
	        	VIcurrentPage++;
	        	renderVITable();
	            renderVIPagination();
	            highlightVIButton();
	        }
	    });
	    pagination.appendChild(nextButton);
	    
	    // 마지막 버튼
	    var nextButton2 = document.createElement('button');
	    nextButton2.textContent = '마지막';
	    nextButton2.className = 'btn btn-subtle-secondary btn-sm';
	    nextButton2.addEventListener('click', function() {
	        VIcurrentPage = pageCount;
	        renderVITable();
	        renderVIPagination();
	        highlightVIButton();
	    });
	    pagination.appendChild(nextButton2);

	    highlightVIButton();
	}

	// 현재 페이지 버튼을 강조 표시
	const highlightVIButton = function() {
	    var buttons = document.querySelectorAll('.VIpagination button');
	    buttons.forEach(function(button) {
	        button.classList.remove('active');
	        if (parseInt(button.textContent) === VIcurrentPage) {
	            button.classList.add('active');
	        }
	    });
	}
// 회사 코드 일치하는 차량 정보 출력 끝///////////////



	<%-- 운전자 정보 sel 함수 시작 //////////// --%>
	const selDriver = (pVal)=>{
		var xhr = new XMLHttpRequest();
		xhr.open("POST","/cbs/trnsprt/selDiriverInfo",true);
		xhr.setRequestHeader("Content-Type","application/json");
		xhr.onload = ()=>{
// 			console.log("넘어온값체크 {} ",xhr.responseText);
			let res = JSON.parse(xhr.responseText);
			openDriverTab(res);
		}
		xhr.send(JSON.stringify(pVal));
	}
	<%-- 운전자 정보 sel 함수 끝 //////////// --%>
	const dirvSearch = ()=>{
		let searchDriverWord = document.querySelector("#searchDriverWord").value;
		let searchDriverText = document.querySelector("#searchDriverText").value;
		let data = {
				cmpnyCd : cmpnyCd,
				searchDriverWord : searchDriverWord,
				searchDriverText : searchDriverText
		}
		selDriver(data);
	}
	const drivReset = ()=>{
		document.querySelector("#searchDriverWord").value = "";
		document.querySelector("#searchDriverText").value = "";
		selVehiDrivInfo(cmpnyCd);
	}

// 회사 코드 일치하는 운전자 정보 출력 시작///////////////
	const openDriverTab = (res)=>{
		getDriverData = [];
		getDriverData = res;
		renderDriverTable(); // 테이블 렌더링
        renderDriPagination(); // 페이지네이션 렌더링
	}
// 	driverTBody VDripagination
	var getDriverData = [];
	var DriPerPage = 5; // 페이지당 보여줄 아이템 수
	var DricurrentPage = 1; // 현재 페이지 번호
	
	const renderDriverTable = ()=> {
		var tableBody = document.querySelector('#driverTBody');
	    tableBody.innerHTML = ''; // 표 초기화
	    
	    var startIdx = (DricurrentPage - 1) * DriPerPage;
	    var endIdx = startIdx + DriPerPage;
	    
	    for (var i = startIdx; i < endIdx && i < getDriverData.length; i++) {
	    	var item = getDriverData[i];
// 			console.log("item에 담긴 값 확인",item);
	    	var pageStr = ""
	    	pageStr += "<tr>";
	    	pageStr += "<td><input name='checked2' onclick='onlyOneClick2(this)' class='form-check-input driverInfoChkBox' type='checkbox'></td>";
		    pageStr += "<td id='drverCd'>" + item.drverCd + "</td>";
		    pageStr += "<td id='drverNm'>" + item.drverNm + "</td>";
		    pageStr += "<td id='telno'>" + item.telno + "</td>";
		    pageStr += "<td>" + item.encpn + "</td>";
	    	pageStr += "</tr>";
			tableBody.innerHTML += pageStr;
		}
	}
	const onlyOneClick2 = (element)=>{
		let checkName = document.getElementsByName("checked2");
		checkName.forEach((cb) => {
		    cb.checked = false;
		});
		element.checked = true;
	}
	
	const renderDriPagination = function() {
	    var pagination = document.getElementById('VDripagination');
	    pagination.innerHTML = ''; // 페이지네이션 초기화

	    var pageCount = Math.ceil(getDriverData.length / DriPerPage);
	    var totalPageCount = 5;    // 보여지는 페이지 개수

	    // 현재 페이지가 몇 번째 그룹에 속하는지 계산
	    var currentPageGroup = Math.ceil(DricurrentPage / totalPageCount);

	    // 시작 페이지와 끝 페이지를 계산
	    var startPage = (currentPageGroup - 1) * totalPageCount + 1;
	    var endPage = Math.min(startPage + (totalPageCount - 1), pageCount);

	    // 처음 버튼
	    var prevButton = document.createElement('button');
	    prevButton.textContent = '처음';
	    prevButton.className = 'btn btn-subtle-secondary btn-sm';
	    prevButton.style.marginRight = "10px";
	    prevButton.addEventListener('click', function() {
	    	DricurrentPage = 1;
	    	renderDriverTable();
	    	renderDriPagination();
	    	highlightDriButton();
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
	        if (DricurrentPage > 1) {
	        	DricurrentPage--;
	        	renderDriverTable();
	        	renderDriPagination();
	        	highlightDriButton();
	        }
	    });
	    pagination.appendChild(prevButton2);

	    for (var i = startPage; i <= endPage; i++) {
	        var button = document.createElement('button');
	        button.textContent = i;
	        button.className = "btn btn-outline-primary btn-sm";
	        button.style.marginRight = "5px";
	        button.addEventListener('click', function() {
	        	DricurrentPage = parseInt(this.textContent);
	        	renderDriverTable();
	        	renderDriPagination();
	        	highlightDriButton();
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
	        if (DricurrentPage < pageCount) {
	        	DricurrentPage++;
	        	renderDriverTable();
	        	renderDriPagination();
	        	highlightDriButton();
	        }
	    });
	    pagination.appendChild(nextButton);
	    
	    // 마지막 버튼
	    var nextButton2 = document.createElement('button');
	    nextButton2.textContent = '마지막';
	    nextButton2.className = 'btn btn-subtle-secondary btn-sm';
	    nextButton2.addEventListener('click', function() {
	    	DricurrentPage = pageCount;
	    	renderDriverTable();
	    	renderDriPagination();
	    	highlightDriButton();
	    });
	    pagination.appendChild(nextButton2);

	    highlightDriButton();
	}

	// 현재 페이지 버튼을 강조 표시
	const highlightDriButton = function() {
	    var buttons = document.querySelectorAll('.VDripagination button');
	    buttons.forEach(function(button) {
	        button.classList.remove('active');
	        if (parseInt(button.textContent) === DricurrentPage) {
	            button.classList.add('active');
	        }
	    });
	}
// 회사 코드 일치하는 운전자 정보 출력 끝///////////////
	
	
	
	const dq = (pVal)=>{
		return document.querySelector(pVal).value = "";
	}
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
	const inputIC = ()=>{
		let icCardNo = ranNum();
		
		let vehiCd = "";
		let vehiNo = "";
		let vehiNm = "";
		let vehiInfo = document.querySelectorAll(".vehiInfoChkBox:checked");
		vehiInfo.forEach((checkbox) => {
		    let vehiInfoRow = checkbox.parentNode.parentNode;
		    console.log("값체크1 : ", vehiInfoRow);
		    vehiCd = vehiInfoRow.querySelector("#vehiCd").textContent;
		    vehiNo = vehiInfoRow.querySelector("#vehiNo").textContent;
		    vehiNm = vehiInfoRow.querySelector("#vehiNm").textContent;
		});
		
		let drivCd = "";
		let drivNm = "";
		let drivTel = "";
		let driverInfo = document.querySelectorAll(".driverInfoChkBox:checked");
		driverInfo.forEach((checkbox) => {
		    let driverInfoRow = checkbox.parentNode.parentNode;
		    
		    console.log("값체크2 : ", driverInfoRow);
		    drivCd = driverInfoRow.querySelector("#drverCd").textContent;
		    drivNm = driverInfoRow.querySelector("#drverNm").textContent; 
		    drivTel = driverInfoRow.querySelector("#telno").textContent;
		});
		
		document.querySelector("#IicCardNo").value = icCardNo;
		document.querySelector("#IvehiCd").value = vehiCd;
		document.querySelector("#IvehiNo").value = vehiNo;
		document.querySelector("#IvehiNm").value = vehiNm;
		document.querySelector("#IdrivCd").value = drivCd;
		document.querySelector("#IdrivNm").value = drivNm;
		document.querySelector("#IdrivTel").value = drivTel;
	}
	<%-- IC카드 등록  함수 시작	/////////////// --%>
	const insertIC = ()=>{
		
		let icCardNo = document.querySelector("#IicCardNo").value;
		let validBeginDe = document.querySelector("#IstartDe").value;
		let validEndDe = document.querySelector("#IendDe").value;
		let vhcleCd  = document.querySelector("#IvehiCd").value;
		let drverCd = document.querySelector("#IdrivCd").value;
		
		let data = {
				icCardNo : icCardNo,
				validBeginDe : validBeginDe,
				validEndDe : validEndDe,
				vhcleCd : vhcleCd,
				drverCd : drverCd
		}
		console.log(data)
		
		var xhr = new XMLHttpRequest();
		xhr.open("POST","/cbs/trnsprt/insertIcCard",true);
		xhr.setRequestHeader("Content-Type","application/json");
		xhr.onload = ()=>{
			console.log("넘어온값체크 {} ",xhr.responseText);
			if(xhr.responseText == 1){
				resetIC();
				window.loaction.reload();
			}
		}
		xhr.send(JSON.stringify(data));
	}
	<%-- IC카드 초기화 함수 끝	/////////////// --%>
	const resetIC = ()=>{
		dq("#IicCardNo");
		dq("#IstartDe");
		dq("#IendDe");
		dq("#IvehiCd");
		dq("#IvehiNo");
		dq("#IvehiNm");
		dq("#IdrivCd");
		dq("#IdrivNm");
		dq("#IdrivTel");
	}
	
</script>


<div class="container">

	<%-- IC카드 div 시작 ////////////// --%>
    <div class="card In" style="float: left; width: 33%; ">
    	<div class="col-auto m-2" style="width: 90%">
			<h3 style="margin-left: 20px; margin-top: 10px; width: 34%; float: left;" >회사 목록</h3>
<!-- 				<button class="btn btn-primary btn-sm" type="button" id="btnInsert" onclick="insertIC()" style="float: right; width: 14%">등록</button> -->
		</div>
    	<div class="input-group mb-2 p-1 bd-highlight">
			<input type="text" style="width: 10px; border: none; background: transparent;" disabled="disabled">
			<div class="input-group-text" style="width: 70px; padding: 10px;">검색조건</div>
			<select class="form-select" id="searchCompWord" style="width: 50px;">
				<option selected value="">검색조건</option>
				<option value="CMPNY_CD">회사코드</option>
				<option value="CMPNY_NM">회사명</option>
				<option value="CMPNY_TELNO">전화번호</option>
				<option value="RPRSNTV_NM">대표자명</option>
			</select>
			<input type="text" id="searchCompText" class="form-control" placeholder="검색어를 입력하세요." style="width: 110px;">
			<button class="btn btn-primary btn-sm" type="button" id="search" onclick="compSearch()">검색</button>
			<button class="btn btn-primary btn-sm" type="button" id="reset" onclick="compReset()">초기화</button>
		</div>
		<div class="card table">
			<table class="table table-hover">
				<thead>
					<tr class="bg-body-highlight">
						<th colspan="1">회사코드</th>
						<th colspan="1">회사명</th>
						<th colspan="1">전화번호</th>
						<th colspan="1">대표자명</th>
					</tr>
				</thead>
				<tbody id="companyTBody">
					<%-- 회사 정보 값 들어갈 곳 --%>
				</tbody>
			</table>
		</div>
		<div class="SDpagination" id="SDpagination">
			
		</div>
    </div>
    <%-- IC카드 div 끝 ////////////// --%>
	
	<%-- 차량 정보 div 시작 /////////////--%>
    <div class="card In" style="float: left; width: 33%; margin-right: 5px;">
    	<div class="col-auto m-2">
       		<h3 style="margin-left: 20px; margin-top: 10px; width: 34%; float: left;">차량 정보</h3>
<!-- 			<button class="btn btn-primary btn-sm" type="button" id="reset" onclick="inputVehi()" style="float: right; width: ">입력</button>  -->
    	</div>
    	<div class="input-group mb-2 p-1 bd-highlight" style="min-height: 50px;">
			<!-- <input type="text" style="width: 10px; border: none; background: transparent;" disabled="disabled">
			<div class="input-group-text" style="width: 70px; padding: 10px;">검색조건</div>
			<select class="form-select" id="searchVehiWord" style="width: 50px;">
				<option selected value="">검색조건</option>
				<option value="VHCLE_CD">차량코드</option>
				<option value="VHCLE_NO">차량번호</option>
				<option value="MDL_NM">모델 명</option>
				<option value="LDADNG_WT">적재 중량</option>
			</select>
			<input type="text" id="searchVehiText" class="form-control" placeholder="검색어를 입력하세요." style="width: 110px;">
			<button class="btn btn-primary btn-sm" type="button" id="search" onclick="vehiSearch()">검색</button>
			<button class="btn btn-primary btn-sm" type="button" id="reset" onclick="vehiReset()">초기화</button> -->
		</div>
		<div class="card table">
			<table class="table table-hover">
				<thead>
					<tr class="bg-body-highlight">
						<th colspan="1"><input class='form-check-input driver' name='checkbox1' type='checkbox' onclick='selVehiAll(this)'></th>
						<th colspan="1">차량코드</th>
						<th colspan="1">차량번호</th>
						<th colspan="1">모델명</th>
						<th colspan="1">적재중량</th>
						<th colspan="1">총 높이</th>
					</tr>
				</thead>
				<tbody id="vehiTBody">
					<%-- 자동차 정보 값 들어갈 곳 --%>
				</tbody>
			</table>
		</div>
		<div class="VIpagination" id="VIpagination">
			
		</div>
    </div>
    <%-- 차량 정보 div 끝 /////////////--%>
    
    <%-- 운전자 정보 div 시작 /////////////--%>
    <div class="card In" style="float: left; width: 33%; margin-right: 5px;">
    	<div class="col-auto m-2">
       		<h3 style="margin-left: 20px; margin-top: 10px; width: 34%; float: left;">운전자 정보</h3>
    		<button class="btn btn-primary btn-sm" type="button" id="reset" onclick="inputIC()" style="float: right; width: ">입력</button>
    	</div>
    	<div class="input-group mb-2 p-1 bd-highlight" style="min-height: 50px;">
			<!-- <input type="text" style="width: 10px; border: none; background: transparent;" disabled="disabled">
			<div class="input-group-text" style="width: 70px; padding: 10px;">검색조건</div>
			<select class="form-select" id="searchDriverWord" style="width: 50px;">
				<option selected value="">검색조건</option>
				<option value="DRVER_NM">운전자명</option>
				<option value="TELNO">전화번호</option>
			</select>
			<input type="text" id="searchDriverText" class="form-control" placeholder="검색어를 입력하세요." style="width: 110px;">
			<button class="btn btn-primary btn-sm" type="button" id="search" onclick="dirvSearch()">검색</button>
			<button class="btn btn-primary btn-sm" type="button" id="reset" onclick="drivReset()">초기화</button> -->
		</div>
		<div class="card table">
			<table class="table table-hover">
				<thead>
					<tr class="bg-body-highlight">
						<th colspan="1"><input class='form-check-input driver' name='checkbox1' type='checkbox' onclick='selDrivAll(this)'></th>
						<th colspan="1">운전자코드</th>
						<th colspan="1">운전자명</th>
						<th colspan="1">전화번호</th>
						<th colspan="1">입사일</th>
					</tr>
				</thead>
				<tbody id="driverTBody">
					<%-- 운전자 정보 값 들어갈 곳 --%>
				</tbody>
			</table>
		</div>
		<div class="VDripagination" id="VDripagination">
			
		</div>
    </div>
    <%-- 운전자 정보 div 끝 /////////////--%>
</div>

<%-- 등록 IC카드 테이블 비동기 div 시작 /////////////--%>
<div class="card total" style="margin-left: 23px;">
	<div class="p-3">
		<div class="input-group"> 
			<div class="input-group-text">IC카드 번호</div>
			<input class="form-control" id="IicCardNo" type="text" style="margin-right: 10px;"/>
			<div class="input-group-text">시작일자</div>
			<input class="form-control" id="IstartDe" type="date" style="margin-right: 10px;"/>
			<div class="input-group-text">종료일자</div>
			<input class="form-control" id="IendDe" type="date" />
		</div>
		<div class="input-group">
			<div class="input-group-text">차량 코드</div>
			<input class="form-control" id="IvehiCd" type="text" style="margin-right: 10px;"/>
			<div class="input-group-text">차량 번호</div>
			<input class="form-control" id="IvehiNo" type="text" style="margin-right: 10px;"/>
			<div class="input-group-text">모델 명</div>
			<input class="form-control" id="IvehiNm" type="text" />
		</div>
		<div class="input-group">
			<div class="input-group-text">운전자 코드</div>
			<input class="form-control" id="IdrivCd" type="text" style="margin-right: 10px;"/>
			<div class="input-group-text">운전자 명</div>
			<input class="form-control" id="IdrivNm" type="text" style="margin-right: 10px;"/>
			<div class="input-group-text">전화 번호</div>
			<input class="form-control" id="IdrivTel" type="text" />
		</div>
		<button class="btn btn-primary btn-sm" type="button" id="btnInsertIC" onclick="insertIC()" style="float: right; width: 6%">등록</button>
		<button class="btn btn-primary btn-sm" type="button" id="btnresetIC" onclick="resetIC()" style="float: right; width: 6%; margin-right: 10px;">초기화</button>
	</div>
</div>

<!-- ############################################ 선박 상세정보 모달 ############################################ -->
<div class="modal fade" id="insICModal" tabindex="-1" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered modal-dialog-scrollable" style="max-width: 37%;">
	    <div class="modal-content h-80 w-100">
			<div class="modal-header bg-primary">
			<h3 class="modal-title text-white dark__text-gray-1100" id="edTitle">IC카드 등록</h3>
			<button class="btn p-1" type="button" data-bs-dismiss="modal" aria-label="Close">
				<span class="fas fa-times fs-9 text-white dark__text-gray-1100"></span>
			</button>
			</div>
			<div class="modal-body" style="">
			<div class="card inpBody">
			<div class="input-group">
				<div class="input-group-text">IC카드 번호</div>
				<input class="form-control" id="shipNm" type="text" />
			</div>
			<div class="input-group">
				<div class="input-group-text">시작일자</div>
				<input class="form-control" id="shipNm" type="date" />
				<input class="form-control" id="shipNm" type="time" />
			</div>
			<div class="input-group">
				<div class="input-group-text">종료일자</div>
				<input class="form-control" id="shipNm" type="date" />
				<input class="form-control" id="shipNm" type="time" />
			</div>
			<div class="input-group">
				<div class="input-group-text">차량 코드</div>
				<input class="form-control" id="shipNm" type="text" />
			</div>
			<div class="input-group">
				<div class="input-group-text">차량 번호</div>
				<input class="form-control" id="shipNm" type="text" />
			</div>
			<div class="input-group">
				<div class="input-group-text">모델 명</div>
				<input class="form-control" id="shipNm" type="text" />
			</div>
			<div class="input-group">
				<div class="input-group-text">운전자 코드</div>
				<input class="form-control" id="shipNm" type="text" />
			</div>
			<div class="input-group">
				<div class="input-group-text">운전자 명</div>
				<input class="form-control" id="shipNm" type="text" />
			</div>
			<div class="input-group">
				<div class="input-group-text">전화 번호</div>
				<input class="form-control" id="shipNm" type="text" />
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