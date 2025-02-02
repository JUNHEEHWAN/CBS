<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
	table{ 
		text-align: center; 
		font-size: 14px;
	}
	.card{
		padding: 10px;
		max-height: 730px;
		display: inline-block;
	}
	.pagination {
	    display: flex;
	    justify-content: center;
	    margin-top: 10px;
	    margin-bottom: 10px;
	}
	.shipPagination {
	    display: flex;
	    justify-content: center;
	    margin-top: 10px;
	    margin-bottom: 10px;
	}
	.vehiPagination {
	    display: flex;
	    justify-content: center;
	    margin-top: 10px;
	    margin-bottom: 10px;
	}
	.pagination button{
		border: none;
	}
	.shipPagination button{
		border: none;
	}
	.vehiPagination button{
		border: none;
	}
	.pagination button:hover{
		border: none;
		background-color: #E3E6ED;
	}
	.shipPagination button:hover{
		border: none;
		 background-color: #E3E6ED;
	}
	.vehiPagination button:hover{
		border: none;
		 background-color: #E3E6ED;
	}
	.input-group-text{
		display:inline-block;
		text-align: center;
	}
	.num{
		text-align: right;
	}
	.card.table{
		border: none;
	}
</style>

<script src="/resources/js/jquery.min.js"></script>
<script type="text/javascript">

// 검색을 위한 검색 전역 변수 선언 시작 ///////////////////
	let trnsprtGu = "";
	let cmpnyCd = "";
	let cmpnyNm = "";
	let cmpnyTelno = "";
	let rprsntvNm = "";
	
	let searchData = {
			trnsprtGu : trnsprtGu,
			cmpnyCd : cmpnyCd,
			cmpnyNm : cmpnyNm,
			cmpnyTelno : cmpnyTelno,
			rprsntvNm : rprsntvNm
	} 
// 검색을 위한 검색 전역 변수 선언 끝 ///////////////////

// 브라우저 load되자 마자 회사 리스트 출력 시작 및 구분 선택 이벤트 추가 시작 /////////////////
	window.onload = ()=>{
		selCompany(searchData);
		
		let selectElement = document.querySelector('#searchTrnsprtgu')
		selectElement.addEventListener('change',function() {
			selTrnsprtgu();
		});
	}
// 브라우저 load되자 마자 회사 리스트 출력 시작 및 구분 선택 이벤트 추가 끝 /////////////////
	
	
// 리셋 버튼 함수 시작(검색쪽 전부 초기화 및 화면 초기화) //////////////////////////////////
	const reset = ()=>{
		searchData.trnsprtGu = "";
		searchData.cmpnyCd = "";
		searchData.cmpnyNm = "";
		searchData.cmpnyTelno = "";
		searchData.rprsntvNm = 	"";
		
		document.querySelector('#searchTrnsprtgu').value = "";
		document.querySelector('#searchOption').value = "";
		document.querySelector('#searchComText').value = "";
		
		selCompany();
	}
// 리셋 버튼 함수 끝(검색쪽 전부 초기화 및 화면 초기화) //////////////////////////////////
	
// 운송 구분 함수 시작 ///////////////////////////////////////////////////////////////
	const selTrnsprtgu = (event)=> {
		let searchTrnsprtGu = document.querySelector('#searchTrnsprtgu').value;
		//console.log("trnsprtGu : ",searchTrnsprtGu);
		
		searchData.trnsprtGu = searchTrnsprtGu;
		selCompany(searchData);
	}
// 운송 구분 함수 끝 ///////////////////////////////////////////////////////////////

// 테이블 검색 함수 시작 ////////////////////////////////////////
	const searchCompany = ()=> {
		let searchOption = document.querySelector("#searchOption").value;
		let searchComText = document.querySelector("#searchComText").value;
		
		if(searchOption == "cmpnyCd"){searchData.cmpnyCd = searchComText}
		else if(searchOption == "cmpnyNm"){searchData.cmpnyNm = searchComText}
		else if(searchOption == "cmpnyTelno"){searchData.cmpnyTelno = searchComText}
		else if(searchOption == "rprsntvNm"){searchData.rprsntvNm = searchComText}
		
		selCompany(searchData);
	}
// 테이블 검색 함수 끝 ////////////////////////////////////////
	
// 회사 관련 함수 끝(페이징 / 검색) 시작	////////////////////////////////////////////////	
	const selCompany = (pVal)=> {
		//console.log(pVal)
		 
		var xhr = new XMLHttpRequest();
		xhr.open("POST","/cbs/trnsprt/trnsCompany",true);
		xhr.setRequestHeader("Content-Type","application/json");
		xhr.onload = ()=>{
// 			console.log("회사 리스트 출력 체크 : ",xhr.responseText);
			let res = JSON.parse(xhr.responseText);
			
			getData = res; // 데이터를 가져와서 변수에 할당
            renderTable(); // 테이블 렌더링
            renderPagination(); // 페이지네이션 렌더링
// 			console.log("정제된 res값 : ",res);
		}
		
		xhr.send(JSON.stringify(pVal));
	}

	var getData = []; // JSON 데이터를 저장할 배열
	var itemsPerPage = 10; // 페이지당 보여줄 아이템 수
	var currentPage = 1; // 현재 페이지 번호
	
	//페이지당 아이템 수에 맞게 데이터를 표에 렌더링
	const renderTable = ()=> {
		var tableBody = document.querySelector('.trnsList');
	    tableBody.innerHTML = ''; // 표 초기화

	    var startIdx = (currentPage - 1) * itemsPerPage;
	    var endIdx = startIdx + itemsPerPage;
	    
	    for (var i = startIdx; i < endIdx && i < getData.length; i++) {
	    	var item = getData[i];
	    	var str = ""
	    	str += "<tr>";
			str += "<td scope='row'><a href='javascript:void(0)' id='aTag' value='"+item.CMPNY_CD+"' onclick='comCd(this)'>"+item.CMPNY_CD+"</a></td>";
			str += "<td>"+item.CMPNY_NM+"</td>";
			str += "<td>"+item.CMPNY_TELNO+"</td>";
			str += "<td>"+item.RPRSNTV_NM+"</td>";
			
			if(item.TRNSPRT_GU =="1"){
					trnsprtGu = "육상";
			}else if(item.TRNSPRT_GU =="2"){
				trnsprtGu = "해상";
			}
			str += "<td id='trnsGu'>"+trnsprtGu+"</td>";
			str += "</tr>";
			tableBody.innerHTML += str;
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
	    prevButton2.className = 'btn btn-subtle-secondary btn-sm';
	    prevButton2.style.marginRight = "10px";
	    // 버튼에 아이콘 추가
	    var icon = document.createElement('i');
	    icon.classList.add('fa-solid', 'fa-angles-left');
	    prevButton2.appendChild(icon);
	    
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
	        button.style.marginRight = "5px";

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
	    nextButton.className = 'btn btn-subtle-secondary btn-sm';
	    nextButton.style.marginLeft = "5px";
	    nextButton.style.marginRight = "10px";

	    // 버튼에 아이콘 추가
	    var icon = document.createElement('i');
	    icon.classList.add('fa-solid', 'fa-angles-right');
	    nextButton.appendChild(icon);
	    
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
// 회사 관련 함수 끝(페이징 / 검색) 끝	////////////////////////////////////////////////	

// a태그의 값의 운송 구분에 따라서 선박,차량 SELECT함수 호출 시작 ////////////////////////		
	const comCd = (element)=>{
		let aTrnsprtGu = "";
		//a태그의 값 가져옴(회사코드)
		let aVal = element.innerText;
		
		// 클릭된 회사 코드와 같은 행에 있는 운송 구분값 가져옴
		let aParents = element.parentNode.parentNode;
		let pTd = aParents.querySelector('#trnsGu').textContent;
		
		if(pTd == "육상"){ 
	        document.querySelector('#shipPagination').innerHTML = "";
	        getvehiData = [];
	        vehiCurrentPage = 1;
	        
	        let shipTab = document.querySelector('#vehiTab');
	        shipTab.style.display = '';
	        
	        let vehiTab = document.querySelector('#shipTab');
	        vehiTab.style.display = 'none';
			
	        
			selVehi(aVal);
		}
		else if(pTd == "해상"){ 
	        document.querySelector('#vehiPagination').innerHTML = "";
	        getshipData = [];
	        shipCurrentPage = 1;
	        
	        let shipTab = document.querySelector('#shipTab');
	        shipTab.style.display = '';
	        
	        let vehiTab = document.querySelector('#vehiTab');
	        vehiTab.style.display = 'none';
			
			selShip(aVal); 
		}
		
	}
// a태그의 값의 운송 구분에 따라서 선박,차량 SELECT함수 호출 끝 ////////////////////////	
	
// 선박 조회 관련 함수(페이징 / 검색 ) 시작 ////////////////////////////////////////
	const selShip = (pVal)=> {
		//console.log(pVal)
		 let data = {
			cmpnyCd : pVal
		}
		var xhr = new XMLHttpRequest();
		xhr.open("POST","/cbs/trnsprt/shiplist",true);
		xhr.setRequestHeader("Content-Type","application/json");
		xhr.onload = ()=>{
// 			console.log("회사 리스트 출력 체크 : ",xhr.responseText);
			let res = JSON.parse(xhr.responseText);
			
			getshipData = res; // 데이터를 가져와서 변수에 할당
			renderShipTable(); // 테이블 렌더링
            shipPagination(); // 페이지네이션 렌더링
// 			console.log("정제된 res값 : ",res);
		}
		
		xhr.send(JSON.stringify(data));
	}
	
	var getshipData = []; // JSON 데이터를 저장할 배열
	var shipPerPage = 3; // 페이지당 보여줄 아이템 수
	var shipCurrentPage = 1; // 현재 페이지 번호
	
	// 선박 페이지당 아이템 수에 맞게 데이터를 표에 렌더링
	const renderShipTable = ()=> {
		var tableBody = document.querySelector('#tBody2');
	    tableBody.innerHTML = ''; // 표 초기화

	    var startIdx = (shipCurrentPage - 1) * shipPerPage;
	    var endIdx = startIdx + shipPerPage;
	    
	    for (var i = startIdx; i < endIdx && i < getshipData.length; i++) {
	    	var item = getshipData[i];
// 	    	console.log(item);
	    	var str = ""
	    	str += "<tr>";
			str += "<td>"+item.imoNo+"</td>";
			str += "<td>"+item.shipNm+"</td>";
			str += "<td>"+item.cbstrDate+"</td>";
			str += "<td>"+item.clsgn+"</td>";
			str += "<td class='num'>"+item.grtg+"</td>";
			str += "<td class='num'>"+item.shipLt+"</td>";
			str += "<td class='num'>"+item.shipBt+"</td>";
			str += "<td class='num'>"+item.shipDp+"</td>";
			str += "<td class='num'>"+item.shipNo+"</td>";
			str += "</tr>";
 			tableBody.innerHTML += str;
	    }
	}
	
	// 선박 페이지네이션을 렌더링
	const shipPagination = function() {
	    var pagination = document.getElementById('shipPagination');
	    pagination.innerHTML = ''; // 페이지네이션 초기화

	    var pageCount = Math.ceil(getshipData.length / shipPerPage);
	    var totalPageCount = 5;    // 보여지는 페이지 개수

	    // 현재 페이지가 몇 번째 그룹에 속하는지 계산
	    var currentPageGroup = Math.ceil(shipCurrentPage / totalPageCount);

	    // 시작 페이지와 끝 페이지를 계산
	    var startPage = (currentPageGroup - 1) * totalPageCount + 1;
	    var endPage = Math.min(startPage + (totalPageCount - 1), pageCount);

	    // 처음 버튼
	    var prevButton = document.createElement('button');
	    prevButton.textContent = '처음';
	    prevButton.className = 'btn btn-subtle-secondary btn-sm';
	    prevButton.style.marginRight = "10px";

	    prevButton.addEventListener('click', function() {
	    	shipCurrentPage = 1;
	        renderShipTable();
	        shipPagination();
	        highlightButton();
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
	        if (shipCurrentPage > 1) {
	        	shipCurrentPage--;
	            renderShipTable();
	            shipPagination();
	            highlightButton();
	        }
	    });
	    pagination.appendChild(prevButton2);

	    for (var i = startPage; i <= endPage; i++) {
	        var button = document.createElement('button');
	        button.textContent = i;
	        button.className = "btn btn-outline-primary btn-sm";
	        button.style.marginRight = "5px";
	        button.addEventListener('click', function() {
	        	shipCurrentPage = parseInt(this.textContent);
	            renderShipTable();
	            shipPagination();
	            highlightShipButton();
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
	        if (shipCurrentPage < pageCount) {
	        	shipCurrentPage++;
	            renderShipTable();
	            shipPagination();
	            highlightShipButton();
	        }
	    });
	    pagination.appendChild(nextButton);
	    
	    // 마지막 버튼
	    var nextButton2 = document.createElement('button');
	    nextButton2.textContent = '마지막';
	    nextButton2.className = 'btn btn-subtle-secondary btn-sm';
	    nextButton2.addEventListener('click', function() {
	    	shipCurrentPage = pageCount;
	        renderShipTable();
	        shipPagination();
	        highlightShipButton();
	    });
	    pagination.appendChild(nextButton2);

	    highlightShipButton();
	}

	// 현재 페이지 버튼을 강조 표시
	const highlightShipButton = function() {
	    var buttons = document.querySelectorAll('.shipPagination button');
	    buttons.forEach(function(button) {
	        button.classList.remove('active');
	        if (parseInt(button.textContent) === shipCurrentPage) {
	            button.classList.add('active');
	        }
	    });
	}
// 선박 조회 관련 함수(페이징 / 검색 ) 끝 ////////////////////////////////////////
	
// 차량 조회 관련 함수(페이징 / 검색 ) 시작 /////////////////////////////////////////
	const selVehi = (pVal)=> {
		console.log(pVal)
		
		let data = {
			cmpnyCd : pVal
		}
		
		var xhr = new XMLHttpRequest();
		xhr.open("POST","/cbs/trnsprt/vehilist",true);
		xhr.setRequestHeader("Content-Type","application/json");
		xhr.onload = ()=>{
// 			console.log("회사 리스트 출력 체크 : ",xhr.responseText);
			let res = JSON.parse(xhr.responseText);
			
			getvehiData = res; // 데이터를 가져와서 변수에 할당
			renderVehiTable(); // 테이블 렌더링
			renderVehiPagination(); // 페이지네이션 렌더링
// 			console.log("정제된 res값 : ",res);
		}
		
		xhr.send(JSON.stringify(data));
	}
	
	var getvehiData = []; // JSON 데이터를 저장할 배열
	var vehiPerPage = 3; // 페이지당 보여줄 아이템 수
	var vehiCurrentPage = 1; // 현재 페이지 번호
	
	const renderVehiTable = ()=> {
		var tableBody = document.querySelector('#tBody3');
	    tableBody.innerHTML = ''; // 표 초기화

	    var startIdx = (vehiCurrentPage - 1) * vehiPerPage;
	    var endIdx = startIdx + vehiPerPage;
	    
	    for (var i = startIdx; i < endIdx && i < getvehiData.length; i++) {
	    	var item = getvehiData[i];
	    	var str = ""
	    	str += "<tr>";
			//str += "<td>"+item.vhcleCd+"</td>";
			str += "<td>"+item.vhcleCmpnyCd+"</td>";
			str += "<td>"+item.vhcleNo+"</td>";
			str += "<td>"+item.mdlNm+"</td>";
			str += "<td>"+item.ldadngVl+"</td>";
			str += "<td>"+item.ldadngWt+"</td>";
			str += "<td>"+item.ldadngLt+"</td>";
			str += "<td>"+item.ldadngHg+"</td>";
			str += "</tr>";
			tableBody.innerHTML += str;
	    }
	}
	
	// 차량 페이지네이션을 렌더링
	const renderVehiPagination = function() {
	    var pagination = document.getElementById('vehiPagination');
	    pagination.innerHTML = ''; // 페이지네이션 초기화

	    var pageCount = Math.ceil(getvehiData.length / vehiPerPage);
	    var totalPageCount = 5;    // 보여지는 페이지 개수

	    // 현재 페이지가 몇 번째 그룹에 속하는지 계산
	    var currentPageGroup = Math.ceil(vehiCurrentPage / totalPageCount);

	    // 시작 페이지와 끝 페이지를 계산
	    var startPage = (currentPageGroup - 1) * totalPageCount + 1;
	    var endPage = Math.min(startPage + (totalPageCount - 1), pageCount);

	    // 처음 버튼
	    var prevButton = document.createElement('button');
	    prevButton.textContent = '처음';
	    prevButton.className = 'btn btn-subtle-secondary btn-sm';
	    prevButton.style.marginRight = "10px";
	    prevButton.addEventListener('click', function() {
	    	vehiCurrentPage = 1;
	    	renderVehiTable();
	        renderVehiPagination();
	        highlightVehiButton();
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
	        if (vehiCurrentPage > 1) {
	        	vehiCurrentPage--;
	        	renderVehiTable();
	            renderVehiPagination();
	            highlightVehiButton();
	        }
	    });
	    pagination.appendChild(prevButton2);

	    for (var i = startPage; i <= endPage; i++) {
	        var button = document.createElement('button');
	        button.textContent = i;
	        button.className = "btn btn-outline-primary btn-sm";
	        button.style.marginRight = "5px";
	        button.addEventListener('click', function() {
	        	vehiCurrentPage = parseInt(this.textContent);
	        	renderVehiTable();
	            renderVehiPagination();
	            highlightVehiButton();
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
	        if (vehiCurrentPage < pageCount) {
	        	vehiCurrentPage++;
	        	renderVehiTable();
	            renderVehiPagination();
	            highlightVehiButton();
	        }
	    });
	    pagination.appendChild(nextButton);
	    
	    // 마지막 버튼
	    var nextButton2 = document.createElement('button');
	    nextButton2.textContent = '마지막';
	    nextButton2.className = 'btn btn-subtle-secondary btn-sm';
	    nextButton2.addEventListener('click', function() {
	    	vehiCurrentPage = pageCount;
	    	renderVehiTable();
	        renderVehiPagination();
	        highlightVehiButton();
	    });
	    pagination.appendChild(nextButton2);

	    highlightVehiButton();
	}

	// 현재 페이지 버튼을 강조 표시
	const highlightVehiButton = function() {
	    var buttons = document.querySelectorAll('.vehiPagination button');
	    buttons.forEach(function(button) {
	        button.classList.remove('active');
	        if (parseInt(button.textContent) === vehiCurrentPage) {
	            button.classList.add('active');
	        }
	    });
	}
// 차량 조회 관련 함수(페이징 / 검색 ) 끝 /////////////////////////////////////////
</script>
<div class="card" style="float: left; width: 45%; margin-right: 10px; ">
	<div class="input-group mb-3 p-1 bd-highlight" style="padding: 10px; width: 100%; float: right;">
			<div class="input-group-text" style="width: 70px; padding: 10px;">운송 구분</div>
			<select class="form-select" id="searchTrnsprtgu" style="width: 60px;">
				<option selected value="">운송구분</option>
				<option value="1">육상</option>
				<option value="2">해상</option>
			</select>
			<input type="text" style="width: 10px; border: none; background: transparent;" disabled="disabled">
			<div class="input-group-text" style="width: 70px; padding: 10px;">검색 조건</div>
			<select class="form-select" id="searchOption" style="width: 60px;">
				<option selected value="">검색조건</option>
				<option value="cmpnyCd">회사코드</option>
				<option value="cmpnyNm">회사명</option>
				<option value="cmpnyTelno">전화번호</option>
				<option value="rprsntvNm">대표자명</option>
			</select>
			<input type="text" id="searchComText" class="form-control" placeholder="검색어를 입력하세요." style="width: 110px;">
			<input type="text" style="width: 10px; border: none; background: transparent;" disabled="disabled">
			<button class="btn btn-primary btn-sm" type="button" id="search" onclick="searchCompany()">검색</button>
			<button class="btn btn-primary btn-sm" type="reset" id="reset" onclick="reset()">초기화</button>
	</div>
	<div class="card-body p-1" >
		<table class='table table-hover' style='text-align: center;' id="totalTable">
			<thead>
				<tr class='bg-body-highlight'>
					<th scope='col'>회사 코드</th>
					<th scope='col'>회사 명</th>
					<th scope='col'>전화번호</th>
					<th scope='col'>대표자명</th>
					<th scope='col'>운송 구분</th>
				</tr>
			</thead>
			<tbody class="trnsList" id="trnsList">
		
			</tbody>
		</table>
		<!-- 페이지네이션 시작 -->
		<div class="pagination" id="pagination">
		
		</div>
		<!-- 페이지네이션 종료 -->
	</div>
</div>
<div class="row">
	<div class="card" id="shipDiv" style="float: left; width: 95%; min-height: 355px;">
		<div class="col-auto m-2">
       		<h3 style="margin-left: 20px; margin-top: 10px; width: 34%; float: left;">선박 정보</h3>
<!--     		<button class="btn btn-primary btn-sm" type="button" id="reset" onclick="inputIC()" style="float: right; width: ">입력</button> -->
    	</div>
		<div class="card table">
	      	<table class="table table-hover fs-9 mb-0" id="shipTab" style="text-align: center; min-width: 550px;">
				<thead>
					<tr class='bg-body-highlight'>                       
						<th scope='col'>IMO번호</th>
						<th scope='col'>선박명</th>    
						<th scope='col'>건조 일자</th>  
						<th scope='col'>호출 부호</th>
						<th scope='col'>총 톤수(t)</th>   
						<th scope='col'>총 길이(m)</th> 
						<th scope='col'>너비(m)</th>
						<th scope='col'>깊이(m)</th>
						<th scope='col'>선박 번호</th>
					</tr>                      
				</thead>
				<tbody id="tBody2" >
					
				</tbody>
			</table>
		</div>
		<div class="shipPagination" id="shipPagination">
		
		</div>
		</div>
	<div class="card" id="vehiDiv" style="float: left; width: 95%; min-height: 355px; margin-top: 15px;">
		<div class="col-auto m-2">
       		<h3 style="margin-left: 20px; margin-top: 10px; width: 34%; float: left;">차량 정보</h3>
<!--     		<button class="btn btn-primary btn-sm" type="button" id="reset" onclick="inputIC()" style="float: right; width: ">입력</button> -->
    	</div>
		<div class="card table">
			<table class="table table-hover fs-9 mb-0" id="vehiTab" style="text-align: center; min-width: 550px;">
				<thead>
					<tr class='bg-body-highlight'>                       
						<th scope='col'>차량 코드</th>
							<th scope='col'>차량 번호</th>
							<th scope='col'>모델 명</th>    
							<th scope='col'>부피(CBM)</th>  
							<th scope='col'>적재 중량(t)</th>
							<th scope='col'>적재함 길이(m)</th>   
							<th scope='col'>적재 가능 높이(m)</th>   
						</tr>                      
					</thead>
					<tbody id="tBody3">
						
					</tbody>
			</table>
		</div>
			<div class="vehiPagination" id="vehiPagination">
					
			</div>
	</div>
</div>




<!-- //////////////// 등록 모달 시작 ////////////////// -->

<div class="modal fade" id="detailModal" tabindex="-1"
	aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-xl">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">회사 등록</h5>
                <button class="btn p-1" type="button" data-bs-dismiss="modal" aria-label="Close">
                    <span class="fas fa-times fs-9"></span>
                </button>
            </div>
			<div class="modal-body">
				<div class="tab-content mt-3" id="myTabContent">
	                <div class="tab-pane fade active show" id="tab-detailed" role="tabpanel">
		                <div class="w-100" id="detailed">
		                    <div class="row">
		                        <div class="col-md-6 mb-3 mt-2">
		                            <div class="input-group">
		                                <div class="input-group-text">회사 명</div>
		                                <input class="form-control" id="cmpnyNm" type="text">
		                            </div>
		                        </div>
		                        <div class="col-md-6 mb-3  mt-2">
		                            <div class="input-group">
		                                <div class="input-group-text">전화번호</div>
		                                <input class="form-control" id="cmpnyTelno" type="text">
		                            </div>
		                        </div>
		                    </div>
		                    <div class="row">
		                        <div class="col-md-6 mb-3">
		                            <div class="input-group">
		                                <div class="input-group-text">주소</div>
		                                <input class="form-control" id="cmpnyAdres" type="text">
		                            </div>
		                        </div>
		                        <div class="col-md-6 ">
		                            <div class="input-group">
		                                <div class="input-group-text">대표자 명</div>
		                                <input class="form-control" id="rprsntvNm" type="text">
		                            </div>
		                        </div>
								<div class="col-md-6">
				                    <div class="input-group ">
										<div class="input-group-text">사업자 등록 번호 </div>
										<input class="form-control" id="bizrno" type="text">
									</div>
								</div>
		    					<div class="col-md-3 mb-3">
				                    <div class="input-group ">
										<div class="input-group-text">운송 방식</div>
											<select class="form-select" id="trnsprtGu">
									            <option selected>선택</option>
									            <option value="1">육상</option>
									            <option value="2">해상</option>
									        </select>
									</div>
								</div>
		                    </div>
		                </div>
	                </div>
            	</div>
            </div>
            <div class="modal-footer">
                <button class="btn btn-primary" type="button" data-bs-dismiss="modal" onclick="insertCom()">등록</button>
                <button class="btn btn-primary" type="button"  onclick="autoInsert()">자동 입력</button>
                <button class="btn btn-outline-primary" type="button" data-bs-dismiss="modal">닫기</button>
            </div>
        </div>
    </div>
</div>
<!-- //////////////// 등록 모달 끝 ////////////////// -->