<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<style>

/* a:link {
  color : pink;
}
a:visited {
  color : black;
}
a:hover {
  color : red;
}
a:active {
  color : green;
} */
.num{
	text-align: right;
}
#ims {
        width: 100%;
        height: auto;
    }
#btnInsert{
	float: right;
}
.input-group .input-group-text { width: 120px; display: inline-block;}

.input-group {
	float:right;
    margin-top: 10px;
    margin-bottom: 15px;
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

.btnPage {
    width: 30px;
    border: none;
    text-align: center;
}

.form-control::placeholder {
    text-align: right;
}

.modal-dialog .VD{
    max-width: 70%;
}

.modal-body .col-lg-6 {
    flex: 0 0 calc(60% - 15px);
    margin-right: 10px;
}

.modal-body .col-lg-5 {
    flex: 0 0 calc(40% - 15px);
}
.vehi{
	padding: 0.4rem;
	font-size: 0.9rem;
}
.form-check-inline {
   margin: 5px;
   margin-top: 10px;
}
#vehiDiary {
            max-height: 300px; /* 최대 높이 설정 */
            overflow-y: scroll; /* 세로 스크롤 적용 */
}
@media print {
            body * {
                visibility: hidden;
            }
            #totalTable, #totalTable * {
                visibility: visible;
            }
            #totalTable {
            width: 1100px;
                position: absolute;
                left: 0;
                top: 0;
                margin-left: -300px;
            }
}
.pagination {
	    display: flex;
	    justify-content: center;
	    margin-top: 10px;
	    margin-bottom: 10px;
	}
.pagination button{
		border: none;
	}
	.pagination button:hover{
		border: none;
		background-color: #E3E6ED;
	}
</style>

<script src="/resources/js/sweetalert2.min.js"></script>
<link rel="stylesheet" href="/resources/css/sweetalert2.min.css">

<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.17.4/xlsx.full.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx-style/0.11.19/xlsx.full.min.js"></script> -->
<script src="https://cdn.jsdelivr.net/npm/exceljs@4.3.0/dist/exceljs.min.js"></script>
<scrpt src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.5.1/jspdf.umd.js"></scrpt>

<script>
// 나만의 쿼리 샐렉터 맹글기	//////////
	const QS = (pVal)=>{
		return document.querySelector(pVal);
	}
// 나만의 쿼리 샐렉터 맹글기	//////////
	
// 요소에 값 넣는 함수 정의(InsQS) 시작 /////////////////////////////////
	const InsQS = function (pVal, pText) {
	  return (document.querySelector(pVal).value = pText);
	};
// 요소에 값 넣는 함수 정의(InsQS) 시작 /////////////////////////////////

// 보세운송 일지 자동 입력 함수 시작 ///////////////////////////
	const autoInsVD = ()=> {
		InsQS("#strtpnt","op1");
		InsQS("#strtpnt1","김포보세창고");
		InsQS("#strtDate","2024-03-27");
		InsQS("#strtTime","10:30");
		InsQS("#aloc","op1");
		InsQS("#aloc1","샬롬종합물류 보세창고");
		InsQS("#arvlDate","2024-03-28");
		InsQS("#arvlTime","13:30");
	}
// 보세운송 일지 자동 입력 함수 끝 ///////////////////////////

// 스위트 알러트 호출 함수 시작 /////////////////////////////////
	const sweat = ()=>{
		Swal.fire({
			  icon: "error",
			  title: "Oops...",
			  text: "선택된 통관 관리번호가 없습니다.",
			  timer:2000
		});
	}
	const success = ()=>{
		Swal.fire({
			  position: "center",
			  icon: "success",
			  title: "정상처리 되었습니다.",
			  showConfirmButton: false,
			  timer: 1500
			});
		
		let timerInterval;
		Swal.fire({
			position: "center",
			title: "입고완료 되었습니다.",
			html: "<b></b>",
		  	imageUrl: "/resources/img/입고완료.gif",
		    imageWidth: 300,
		    imageHeight: 300,
		  	timer: 2000,
		  	timerProgressBar: true,
		  	didOpen: () => {
		    	Swal.showLoading();
		    	const timer = Swal.getPopup().querySelector("b");
		    	timerInterval = setInterval(() => {
		      		timer.textContent = `${Swal.getTimerLeft()}`;
		    	}, 100);
		  	},
		  	willClose: () => {
		    	clearInterval(timerInterval);
		  	}
		}).then((result) => {
		  /* Read more about handling dismissals below */
			if (result.dismiss === Swal.DismissReason.timer) {
		    
		  	}
		});
		
	}
// 스위트 알러트 호출 함수 끝 //////////////////////////////////

//	버튼 클릭을 페이징 함수 시작 ///////////////////////////////////

	// 이전 버튼//////////////////////////////////
	const btnPre = () => {
    const nowIndex = parseInt(document.querySelector("#btnPre").value) - 1; // 현재 페이지 인덱스를 가져옴
    if (nowIndex > 0) { // 현재 페이지가 첫 번째 페이지가 아니라면
        const PrevVal = document.querySelector("#vehiTable"); // 이전 페이지의 부모 요소를 가져옴
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
    	const NextVal = document.querySelector("#vehiTable");
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
		const closeVal = document.querySelector("#vehiTable");
		closeVal.innerHTML = "";
	}

// 차량 등록 모달 실행 시작//////////////////////////////////
	const openModal = () => {
		//id가 vehiInsertModal인 함수 찾기
	    const modal = new bootstrap.Modal(document.querySelector('#vehiInsertModal'));
		// 함수 실행
	    modal.show();
		IcCardInfo();
	}
// 차량 등록 모달 실행 끝//////////////////////////////////

// 모달창 안에서 검색 버튼 눌렀을시 검색값 가져와 리스트 함수 호출 //////////////////////
	const icCardSrc = ()=>{  
		const icCardNo = QS("#SrcIcNo").value;
		const mdlNm =  QS("#SrcVehiMd").value;
		const drverNm = QS("#SrcDrver").value;
		let data = {
				icCardNo:icCardNo,
				mdlNm:mdlNm,
				drverNm:drverNm
		}
		console.log(data);
		IcCardInfo(data);
	}
// 모달창 안에서 검색 버튼 눌렀을시 검색값 가져와 리스트 함수 호출 //////////////////////

// 모달 실행 됬을때 IC카드 리스트 출력하는 함수 시작 /////////////////////////
	const IcCardInfo = (pData) => {
		console.log(pData);
		
    	if(pData != null){
    		QS("#vehiTable").innerHTML = "";
    	}
    	var xhr = new XMLHttpRequest();
    	xhr.open("POST", "/cbs/trnsprt/selectIcCard", true);
    	xhr.setRequestHeader("Content-Type", "application/json");
    	xhr.onreadystatechange = () => {
      		if (xhr.readyState == 4 && xhr.status == 200) {
       	 	console.log("select 성공 확인 : ", JSON.parse(xhr.responseText));
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
	                pageStr += "<table class='table table-hover' style='font-size: 0.9rem;'>";
	                pageStr += "<thead>";
	                pageStr += "<tr class='bg-body-highlight'>";
	                pageStr += "<th class='col-md-4'>IC카드번호</th>";
	                pageStr += "<th class='col-md-4'>운전자명</th>";
	                pageStr += "<th class='col-md-4'>차량모델명</th>";
	                pageStr += "</tr>";
	                pageStr += "</thead>";
	                pageStr += "<tbody class='list'>";
	                
	             // 현재 페이지의 시작 인덱스와 끝 인덱스 계산
	                var startIndex = i * size;
	                var endIndex = Math.min((i + 1) * size, res.length);
	                
	                for (var j = startIndex; j < endIndex; j++) {
	                    pageStr += "<tr>";
	                    pageStr += "<td><a href='#' id='icCardNO' onclick='icCardNo(this)'>" + res[j].icCardNo + "</a></td>";
	                    pageStr += "<td id='drverNm'>" + res[j].drverNm + "</td>";
	                    pageStr += "<td>" + res[j].mdlNm + "</td>";
	                    pageStr += "</tr>";
	                }
	                pageStr += "</tbody>";
	                pageStr += "</table>";

	                div.innerHTML = pageStr; // 새로운 div에 테이블 내용 추가
	               
	               
	                QS("#vehiTable").appendChild(div); // shipTable에 새로운 div 추가
			    }
      		}
    	};
    	xhr.send(JSON.stringify(pData));
	};
// 모달 실행 됬을때 IC카드 리스트 출력하는 함수 끝 ///////////////////////////

// 모달창 안에서 IC카드 번호 클릭시 IC카드 번호 테이블에 자동 입력 함수/////////////
	const icCardNo = (element)=>{
		const icCardNo = element.textContent;
		QS("#icCardNo").value = icCardNo;
	}
// 모달창 안에서 IC카드 번호 클릭시 IC카드 번호 테이블에 자동 입력 함수/////////////

// 등록 버튼 눌렀을때 체크 박스 선택한 항목 가져오기 시작 /////////////////////////
	const insertVehi = ()=>{
		// className이 chkBox이고 checked된 checkBox 전부 찾기
		const chkBoxes = document.querySelectorAll('.chkBox:checked');
		if(chkBoxes.length == 0) {
			// 갯수가 0일때 alert창 띄움
			sweat();
			return;
		}else{
			// 갯수가 0이 아니면 일지 등록 함수 실행
			openModal();
			// 체크된 체크박스중 첫번째 체크박스의 조부모를 찾아서 id가 entrManageNo인 것의 textContent를 가져옴
			const firstCheckedBox = chkBoxes[0];
		    const MchkBox = firstCheckedBox.parentNode.parentNode;
		    const entrManageNo = MchkBox.querySelector("#EDNo").textContent;
		    // id가 ModalEntrManageNo인 곳에 entrManageNo를 채워넣음
			QS("#ModalEntrManageNo").value = entrManageNo;
		}
	}
// 체크 박스 선택한 항목 가져오기 끝 ///////////////////////////

// 옵션 선택 함수 시작 ////////////////////////
	const StartSel = () => {
		// id가 strtpnt인 곳의 value값을 가져옴
	    const FSval = document.querySelector("#strtpnt").value;
	    // console.log(FSval);
	    
	    // 1~5까지 반복함
	    for (let i = 1; i <= 5; i++) {
// 	    	console.log("op",i)
	    	const selectId = "strtpnt" + i;
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
		const FSval = document.querySelector("#aloc").value;
// 	    console.log(FSval);
	    
	    for (let i = 1; i <= 5; i++) {
// 	    	console.log("op",i)
	    	const selectId = "aloc" + i;
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
// 옵션 선택 함수 끝 /////////////////////////



// 보세운송 일지 등록 모달 시작	///////////////////////////////
	const insertVehiDiary = ()=>{
		
	 // 출발지, 도착지 시도 값 가져오는 코드 시작 ////////////////////////
		const startVal = document.querySelector("#strtpnt");
		const startCity = startVal.options[startVal.selectedIndex].text;
		const endVal = document.querySelector("#aloc");
// 		const endCity = endVal.options[endVal.selectedIndex].text;
		const entySt = document.querySelector("#entySt").textContent;
		console.log("entySt : ",entySt);
		let stodelSe = "";
		if(entySt == "입고 요청"){
			stodelSe = 1;
		}
	// 출발지, 도착지 시도 값 가져오는 코드 끝 ////////////////////////
		
	// 출발지, 도착지 보세창고 값 가져오는 코드 시작 ////////////////////////
		const startPointList = [];
// 		const endPointList = [];
		
		document.querySelectorAll('.form-select.start').forEach(select => {
		    if (getComputedStyle(select).display === 'block') {
		        const startPoint = select.querySelector('option:checked');
		        if (startPoint) { startPointList.push(startPoint.value); }
		    }
		});
// 		document.querySelectorAll('.form-select.end').forEach(select => {
// 		    if (getComputedStyle(select).display === 'block') {
// 		        const endPoint = select.querySelector('option:checked');
// 		        if (endPoint) { endPointList.push(endPoint.value); }
// 		    }
// 		});
		let endCity = document.querySelector("#aloc1").value;
	// 출발지, 도착지 보세창고 값 가져오는 코드 끝 ////////////////////////
		
	// 운송 일지 Insert를 위해서 JSON타입으로 값 정리 시작 ///////////////////
		// 출발 날짜 + 출발 시간 값 정리 ///////
			const strtDate = QS("#strtDate").value;
			const strtTime = QS("#strtTime").value;
		// 출발 날짜 + 출발 시간 값 정리 ///////
		// 도착 날짜 + 도착 시간 값 정리 ///////
			const arvlDate = QS("#arvlDate").value;
			const arvlTime = QS("#arvlTime").value;
		// 도착 날짜 + 도착 시간 값 정리 ///////
			
			// 통관 관리 번호
			const ModalEntrManageNo = QS("#ModalEntrManageNo").value;
			// ic카드번호
			const icCardNo = QS("#icCardNo").value;
			// 출발지
			const strtPnt =startPointList[0];
			// 출발 날짜 + 시간
		    const startDate = strtDate + " " + strtTime;
			// 도착지
			const arvlPnt = endCity //+" "+endPointList[0];
			// 도착 날짜 + 시간
		    const arrivalDate = arvlDate + " " + arvlTime;
			
	    let data = {
	    	entrManageNo : ModalEntrManageNo,
	    	icCardNo : icCardNo,
	    	strtPnt : strtPnt,
	    	strtTime : startDate,
	    	arvlPnt : arvlPnt,
	        arvlTime : arrivalDate,
	        stodelSe : stodelSe
	    }
	    console.log("운송일지 인서트전 : ",data);
  	    IVD(data);
	    
	// 운송 일지 Insert를 위해서 JSON타입으로 값 정리 끝 ///////////////////
	}
// 보세운송 일지 등록 모달 끝	///////////////////////////////

// 보세운송 일지 등록 함수 시작 /////////////////////////////////////////
	const IVD = (pVal)=>{
		const ModalEntrManageNo = QS("#ModalEntrManageNo").value;
		let data = {
				entrManageNo:ModalEntrManageNo,
		}
		var xhr = new XMLHttpRequest();
		xhr.open("POST","/cbs/trnsprt/insertVD",true);
		xhr.setRequestHeader("Content-Type","application/json");
		xhr.onreadystatechange = ()=>{
			if(xhr.readyState == 4 && xhr.status == 200){
				console.log("결과값 체크 : ",xhr.responseText);
				let res = xhr.responseText;
				if(res == 1){
					// 입고완료 목록 테이블 호출 함수
					finishStore();
					// 입고 일자 업데이트 함수 호출(TO.사용보세 창고)
					useWarehouseDate(pVal);
				}else{
					errorAlert();
				}
			}
		}
		xhr.send(JSON.stringify(pVal));
	}
// 보세운송 일지 등록 함수 끝 //////////////////////////////////////////

// 보세창고 입고 일자 업데이트 함수 시작 ////////////////////////////////
	const useWarehouseDate = (pVal)=>{
		
		console.log("도착시간 확인",pVal.arvlTime);
		let data = { 
				wrhousngDe:pVal.arvlTime,
				entrManageNo:pVal.entrManageNo
			}
		console.log("도착시간 확인",data);
		let vehiData = { entrManageNo:pVal.entrManageNo };
		var xhr = new XMLHttpRequest();
		xhr.open("PUT","/cbs/trnsprt/updStoreDe",true);
		xhr.setRequestHeader("Content-Type","application/json");
		xhr.onload = ()=>{
			console.log("결과값 체크 : ",xhr.responseText);
			let res = xhr.responseText;
			//보세운송_신고서 테이블에 함수 실행
				selVehiInfo(vehiData);
			
		}
		xhr.send(JSON.stringify(data));
	}
// 보세창고 입고 일자 업데이트 함수 끝//////////////////////////////////

// 신고서에 필요한 함수 호출 시작 ////////////////////////////////
	const selVehiInfo = (pVal)=>{
		let entrManageNo = pVal.entrManageNo;
		let data = {
			entrManageNo:entrManageNo
		}
		console.log("일지 인서트후 통관번호 값 체크 : ",data);
		
		var xhr = new XMLHttpRequest();
		xhr.open("POST","/cbs/declaration/selVehiInfo",true);
		xhr.setRequestHeader("Content-Type","application/json");
		xhr.onreadystatechange = ()=>{
			if(xhr.readyState == 4 && xhr.status == 200){
// 				console.log("결과값 체크 : ",xhr.responseText);
				let res = xhr.responseText;
				console.log("selVehiInfo함수 결과값 체크 : ",res);
				selUserInfo(res);
			}
		}
		xhr.send(JSON.stringify(data));
		
	}
// 신고서에 필요한 함수 호출 시작 ////////////////////////////////


// 로그인한 유저의 정보 함수 시작 /////////////////////////
	const selUserInfo = (pVal)=>{
		
		console.log("pVal : ",pVal);
		let res = JSON.parse(pVal);
		let entrManageNo = res.entrManageNo;
		let vhcleDiaryCd = res.vhcleDiaryCd;
		let strtPnt = res.strtPnt;
		let arvlPnt = res.arvlPnt;
		let strtTime = res.strtTime;
		let arvlTime = res.arvlTime;
		
		let userCd = document.querySelector("#userCd").value;
		let userCmpnm = "(주)CBS"
		let data = {
			userCd:userCd
		}
		var xhr = new XMLHttpRequest();
		xhr.open("POST","/cbs/declaration/selUserInfo",true);
		xhr.setRequestHeader("Content-Type","application/json");
		xhr.onreadystatechange = ()=>{
			if(xhr.readyState == 4 && xhr.status == 200){
// 				console.log("결과값 체크 : ",xhr.responseText);
				let res = JSON.parse(xhr.responseText);
				console.log("adres 결과값 체크 : ",res.adres);
				console.log("userNm 결과값 체크 : ",res.userNm);
				
				let totalData = {
						entrManageNo:entrManageNo,
						vhcleDiaryCd:vhcleDiaryCd,
						strtPnt:strtPnt,
						arvlPnt:arvlPnt,
						strtTime:strtTime,
						arvlTime:arvlTime,
						userCd:userCd,
						userCmpnm:userCmpnm,
						adres:res.adres,
						userNm:res.userNm
				}
				console.log("totalData 값 확인 : ",totalData)
				insTranDecl(totalData);
			}
		}
		xhr.send(JSON.stringify(data));
		
	}
// 로그인한 유저의 정보 함수 끝   /////////////////////////

// 보세운송_신고서 테이블 함수 시작 ////////////////////////////////////
	const insTranDecl = (pVal)=>{

		var xhr = new XMLHttpRequest();
		xhr.open("POST","/cbs/declaration/insTrnDecl",true);
		xhr.setRequestHeader("Content-Type","application/json");
		xhr.onreadystatechange = ()=>{
			if(xhr.readyState == 4 && xhr.status == 200){
				console.log("결과값 체크 : ",xhr.responseText);
			}
		}
		xhr.send(JSON.stringify(pVal));
	}
// 보세운송_신고서 테이블 함수 끝   ////////////////////////////////////


// 보세운송 필증 실패시 alert창 함수 ////
	const errorAlert = ()=>{
		Swal.fire({
			  title: "이미 사용중인 IC카드 입니다.",
			  text: "다른 IC카드를 선택해주세요",
			  icon: "error"
			});
	}
// 보세운송 필증 실패시 alert창 함수 ////
// 보세운송 일지 완료시 입고중 띄우는 함수 시작 //////////////////////////////
	const finishStore = ()=>{
		let timerInterval;
		Swal.fire({
			title: "보세운송 신청완료",
		  	html: "보세창고로 <b></b> 입고중입니다.",
		  	imageUrl: "/resources/img/입고트럭.gif",
		    imageWidth: 300,
		    imageHeight: 300,
		  	timer: 3000,
		  	timerProgressBar: true,
		  	didOpen: () => {
		    	Swal.showLoading();
		    	const timer = Swal.getPopup().querySelector("b");
		    	timerInterval = setInterval(() => {
		      		timer.textContent = `${Swal.getTimerLeft()}`;
		    	}, 100);
		  	},
		  	willClose: () => {
		    	clearInterval(timerInterval);
		  	}
		}).then((result) => {
		  /* Read more about handling dismissals below */
			if (result.dismiss === Swal.DismissReason.timer) {
				// console.log(result);
				updateEntryStat();
		  	}
		});
	}
// 보세운송 일지 완료시 입고중 띄우는 함수 끝 //////////////////////////////

// 입고 처리가 완료되면 통관 상태를 입고요청 -> 입고완료 업데이트 함수 시작 ////////////////
	const updateEntryStat = ()=>{
		const entrManageNo = QS("#ModalEntrManageNo").value;
		const userCd = QS("#userCd").value;
		let data = {
			entrManageNo:entrManageNo,
			userCd:userCd
		}
		console.log(data);

		var xhr = new XMLHttpRequest();
		xhr.open("POST","/cbs/trnsprt/insertEntryStat",true);
		xhr.setRequestHeader("Content-Type","application/json");
		xhr.onreadystatechange = ()=>{
			if(xhr.readyState == 4 && xhr.status == 200){
				console.log("정상적으로 입고완료처리 되었습니다.");
				let res = xhr.responseText;
				if(res == 1){
					success();
					finishReq();
				}
			}
		}
		xhr.send(JSON.stringify(data));
	}
// 입고 처리가 완료되면 통관 상태를 입고요청 -> 입고완료 업데이트 함수 끝   /////////////////

// 입고 완료된 목록 SELECT함수 시작/////////////////////////////////////
	const finishReq = (pVal)=>{
		
		let insBtn = document.querySelector('#btnInsert');
		insBtn.disabled = "disabled";
		
		QS("#storeTab").innerHTML = "";
		var xhr = new XMLHttpRequest();
		xhr.open("POST","/cbs/trnsprt/finishReq",true);
		xhr.setRequestHeader("Content-Type","application/json");
		xhr.onreadystatechange = ()=>{
			if(xhr.readyState == 4 && xhr.status == 200){
// 				console.log(xhr.responseText);

				let res = JSON.parse(xhr.responseText);
				getFinishData = [];
				getFinishData = res; // 데이터를 가져와서 변수에 할당
				renderFinishTable(); // 테이블 렌더링
				renderFinishPagination(); // 페이지네이션 렌더링
				
			}
		}
		xhr.send(JSON.stringify(pVal));
	}
// 입고 완료된 목록 SELECT함수 끝//////////////////////////////////////
	
	var getFinishData = [];
	var FPerPage = 8; // 페이지당 보여줄 아이템 수
	var FcurrentPage = 1; // 현재 페이지 번호
	
	const renderFinishTable = ()=> {
		var tableBody = document.querySelector('.storeTab');
	    tableBody.innerHTML = ''; // 표 초기화
	    
		let process = "";
		let entrSe = "";
	    let port = "";
	    var startIdx = (FcurrentPage - 1) * FPerPage;
	    var endIdx = startIdx + FPerPage;
	    
	    for (var i = startIdx; i < endIdx && i < getFinishData.length; i++) {
	    	var item = getFinishData[i];

	    	var pageStr = ""
			pageStr += "<tr>";
			pageStr += "<td><input class='form-check-input chkBox' type='checkbox'></td>";
			pageStr += "<td><a href='#' id='entrManageNo' onclick='openDeclation(this)'>"+item.entrManageNo+"</a></td>";
			if(item.processSttus == "EPS3"){
				process = "입고 요청"; }
			else if(item.processSttus == "EPS4"){
				process = "입고 완료";}
			pageStr += "<td id='entySt' name='"+item.processSttus+"'>"+process+"</td>";
			pageStr += "<td>"+item.userNm+"</td>";
			pageStr += "<td>"+item.processDe+"</td>";
			pageStr += "<td>"+item.client+"</td>";
			
			if(item.entrSe == "EES2"){ 
				entrSe = "수입"}
			else if(item.entrSe =="EES1"){ 
				entrSe = "수출"}
			else{ entrSe = "알수없음"}
			pageStr += "<td>"+entrSe+"</td>";
			
			if(entrSe == "수입"){
				port = item.arvlPrt;}
			else if(entrSe == "수출"){ 
				port = item.startPrt; }
			pageStr += "<td>"+port+"</td>";
			pageStr += "<td>"+item.shipNm+"</td>";
			pageStr += "</tr>";
			tableBody.innerHTML += pageStr;
		}
	}
	
	const renderFinishPagination = function() {
	    var pagination = document.getElementById('pagination');
	    pagination.innerHTML = ''; // 페이지네이션 초기화

	    var pageCount = Math.ceil(getFinishData.length / FPerPage);
	    var totalPageCount = 5;    // 보여지는 페이지 개수

	    // 현재 페이지가 몇 번째 그룹에 속하는지 계산
	    var currentPageGroup = Math.ceil(FcurrentPage / totalPageCount);

	    // 시작 페이지와 끝 페이지를 계산
	    var startPage = (currentPageGroup - 1) * totalPageCount + 1;
	    var endPage = Math.min(startPage + (totalPageCount - 1), pageCount);

	    // 처음 버튼
	    var prevButton = document.createElement('button');
	    prevButton.textContent = '처음';
	    prevButton.className = 'btn btn-subtle-secondary btn-sm';
	    prevButton.style.marginRight = "10px";
	    prevButton.addEventListener('click', function() {
	    	FcurrentPage = 1;
	    	renderFinishTable();
	        renderFinishPagination();
	        highlightFinishButton();
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
	        if (FcurrentPage > 1) {
	        	FcurrentPage--;
	        	renderFinishTable();
	            renderFinishPagination();
	            highlightFinishButton();
	        }
	    });
	    pagination.appendChild(prevButton2);

	    for (var i = startPage; i <= endPage; i++) {
	        var button = document.createElement('button');
	        button.textContent = i;
	        button.className = "btn btn-outline-primary btn-sm";
	        button.style.marginRight = "5px";

	        button.addEventListener('click', function() {
	        	FcurrentPage = parseInt(this.textContent);
	        	renderFinishTable();
	            renderFinishPagination();
	            highlightFinishButton();
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
	        if (FcurrentPage < pageCount) {
	        	FcurrentPage++;
	        	renderFinishTable();
	            renderFinishPagination();
	            highlightFinishButton();
	        }
	    });
	    pagination.appendChild(nextButton);
	    
	    // 마지막 버튼
	    var nextButton2 = document.createElement('button');
	    nextButton2.textContent = '마지막';
	    nextButton2.className = 'btn btn-subtle-secondary btn-sm';
	    nextButton2.addEventListener('click', function() {
	        FcurrentPage = pageCount;
	        renderFinishTable();
	        renderFinishPagination();
	        highlightFinishButton();
	    });
	    pagination.appendChild(nextButton2);

	    highlightFinishButton();
	}

	// 현재 페이지 버튼을 강조 표시
	const highlightFinishButton = function() {
	    var buttons = document.querySelectorAll('.pagination button');
	    buttons.forEach(function(button) {
	        button.classList.remove('active');
	        if (parseInt(button.textContent) === FcurrentPage) {
	            button.classList.add('active');
	        }
	    });
	}
	
	
	
	
// 입고 요청 목록 SELECT함수 시작 ///////////////////////////////////////
	window.onload = ()=>{
		
		let openWindow;
		
		ReqStore();
		
		let selectElement = document.querySelector('#storeStatus');
		selectElement.addEventListener('change',function(event) {
			let selectedValue = event.target.value;
// 			console.log("selectedValue : ",selectedValue);
			if(selectedValue == "EPS4"){
		        finishReq();
		    } else {
		        ReqStore();
		    }
		    //console.log('선택된 값:', selectedValue);
		});
		
	}

	const ReqStore = (pVal)=>{
		console.log(pVal)
		let insBtn = document.querySelector('#btnInsert');
		insBtn.disabled = false;
		QS("#storeTab").innerHTML = "";
		
		var xhr = new XMLHttpRequest();
		xhr.open("POST","/cbs/trnsprt/storeReq",true);
		xhr.setRequestHeader("Content-Type","application/json");
		xhr.onreadystatechange = ()=> {
			if(xhr.readyState == 4 && xhr.status ==200){
				let res = JSON.parse(xhr.responseText);
				//console.log("res값 체크 : ",res);
				getData = [];
				getData = res; // 데이터를 가져와서 변수에 할당
	            renderTable(); // 테이블 렌더링
	            renderPagination(); // 페이지네이션 렌더링
			}
		};
		xhr.send(JSON.stringify(pVal));
	}
// 입고 요청 목록 SELECT함수 끝  ////////////////////////////////////////

	var getData = []; // JSON 데이터를 저장할 배열
	var itemsPerPage = 8; // 페이지당 보여줄 아이템 수
	var currentPage = 1; // 현재 페이지 번호
	
	//페이지당 아이템 수에 맞게 데이터를 표에 렌더링
	const renderTable = ()=> {
		var tableBody = document.querySelector('.storeTab');
	    tableBody.innerHTML = ''; // 표 초기화
		
		let process = "";
		let thingTy = "";
	    let entrSe = "";
	    let port = "";
	    var startIdx = (currentPage - 1) * itemsPerPage;
	    var endIdx = startIdx + itemsPerPage;
	    
	    for (var i = startIdx; i < endIdx && i < getData.length; i++) {
	    	var item = getData[i];

	    	var pageStr = ""
	    	pageStr += "<tr>";
			pageStr += "<td><input class='form-check-input chkBox' type='checkbox'></td>";
			pageStr += "<td><a href='#' id='EDNo' onclick='openEntryModal(this)'>"+item.entrManageNo+"</a></td>";
			
			if(item.processSttus == "EPS3"){
				process = "입고 요청"; }
			else if(item.processSttus == "EPS4"){
				process = "입고 완료"; }
			pageStr += "<td id='entySt' name='"+item.processSttus+"'>"+process+"</td>";
			pageStr += "<td>"+item.userNm+"</td>";
			pageStr += "<td>"+item.processDe+"</td>";
			pageStr += "<td>"+item.client+"</td>";
			
			if(item.entrSe == "EES2"){ 
				entrSe = "수입"}
			else if(item.entrSe =="EES1"){ 
				entrSe = "수출"}
			else{ entrSe = "알수없음"}
			pageStr += "<td>"+entrSe+"</td>";
			
			if(entrSe == "수입"){
				port = item.arvlPrt;}
			else if(entrSe == "수출"){ 
				port = item.startPrt; }
			pageStr += "<td>"+port+"</td>";
			pageStr += "<td>"+item.shipNm+"</td>";
			pageStr += "</tr>";
			tableBody.innerHTML += pageStr;
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




// 검색 조건에 따른 검색 함수 시작////////////////////////////////////////////
	const search = ()=>{
		let entrManageNo = "";	//통관번호
		let client = "";		//고객명
		let shipNm = "";		//선박명
		let userNm = "";		//요청자명
		
		let searchText = document.querySelector("#searchText").value;
		let serchSel = document.querySelector("#serchSel").value;
		if(serchSel == "entrManageNo"){entrManageNo = searchText; }
		else if(serchSel == "client"){client = searchText; }
		else if(serchSel == "shipNm"){shipNm = searchText; }
		else if(serchSel == "userNm"){userNm = searchText; }
		
		let searchSDate = document.querySelector("#searchSDate").value;
		let searchEDate = document.querySelector("#searchEDate").value;
		
		let data ={
			searchSDate : searchSDate,
			searchEDate : searchEDate,
			entrManageNo : entrManageNo,
			client : client,
			shipNm : shipNm,
			userNm : userNm
		}
		 //console.log("데이터 확인 : ",data);
		
		let entySt = document.querySelector("#entySt");
		let entyStName = entySt.getAttribute("name");
		console.log("entySt의 name 속성 값:", entyStName);
		if(entyStName == "EPS4"){
			finishReq(data);
		}else{
			ReqStore(data);
		}
		
	}
// 검색 조건에 따른 검색 함수 끝////////////////////////////////////////////

// 초기화 버튼 함수 시작 /////////////////////////////////////////////////////
	const reset = ()=>{
		document.querySelector("#storeStatus").value = "";
		document.querySelector("#serchSel").value = "";
		document.querySelector("#searchSDate").value = "";
		document.querySelector("#searchEDate").value = "";
		document.querySelector("#searchText").value = "";
		
		let entySt = document.querySelector("#entySt");
		let entyStName = entySt.getAttribute("name");
		console.log("entySt의 name 속성 값:", entyStName);
		if(entyStName == "EPS4"){
			finishReq();
		}else{
			ReqStore();
		}
	}
// 초기화 버튼 함수 끝 /////////////////////////////////////////////////////

// 화면에 보이는 테이블 엑셀로 다운로드 함수 시작 //////////////////////////////
const downExcel = () => {
    const table = document.querySelector('#totalTable');
    const headerRow = table.querySelector('thead tr');
    const headerCells = Array.from(headerRow.querySelectorAll('th:not(:first-child)')).map(th => th.textContent.trim());
    const dataRows = Array.from(table.querySelectorAll('tbody tr'));
    const data = dataRows.map(row => {
        const rowData = [];
        const cells = row.querySelectorAll('td:not(:first-child)');
        cells.forEach(cell => {
            rowData.push(cell.textContent.trim());
        });
        return rowData;
    });
    const excelData = [headerCells, ...data];
    
    // ExcelJS를 사용하여 새로운 워크북 생성
    const workbook = new ExcelJS.Workbook();
    const worksheet = workbook.addWorksheet('Sheet1');
    
    // 헤더 행 추가 및 스타일 설정
    excelData[0].forEach((header, index) => {
        worksheet.getCell(1, index + 1).value = header; // 헤더 셀에 값 설정
        worksheet.getCell(1, index + 1).fill = { // 배경색 설정
            type: 'pattern',
            pattern: 'solid',
            fgColor: { argb: 'FFD9D9D9' } // RGB 값이 217, 217, 217인 색상
        };
    });

    // 데이터 행 추가
    for (let i = 1; i < excelData.length; i++) {
        worksheet.addRow(excelData[i]);
    }

    // 엑셀 파일로 변환하여 다운로드
    const buffer = workbook.xlsx.writeBuffer().then(buffer => {
        const blob = new Blob([buffer], { type: 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet' });
        const downloadLink = document.createElement('a');
        downloadLink.href = window.URL.createObjectURL(blob);
        downloadLink.download = 'table_data.xlsx';
        downloadLink.click();
    });
};

//화면에 보이는 테이블 엑셀로 다운로드 함수 끝 //////////////////////////////
        const downPDF = () => {
        	 window.print();
        };
// PDF 다운로드 버튼에 클릭 이벤트 리스너 추가

// 보세 운송 신고서 제출 함수 시작 /////////////////
	const openDeclation = (element)=> {
		let entrManageNo = element.innerText;
	    let userCd = document.querySelector("#userCd").value;

// 	    document.querySelector("#parentEntrManageNo").value = entrManageNo;
	    
	    // 보세 운송 신고서 url 호출 
	    let url = '/cbs/pdf/trnsportPdf?entrManageNo='+ encodeURIComponent(entrManageNo);
		window.open(url, "_blank","width=830,height=800,left=300,top=50");
	    
// 		// 운송 전표 url 호출			
// 	    let url = '/cbs/pdf/transportChit?entrManageNo='+ encodeURIComponent(entrManageNo);
// 	    window.open(url, "_blank","width=1080,height=600,left=300,top=150");
	}
// 보세 운송 신고서 제출 함수 시작 /////////////////

// 통관 상세 보기 관련 함수 시작 /////////////////////
	
	// 통관 번호 상세보기 함수 시작 /////////////////////
		const openEntryModal = (element) => {
			let entrManageNo = element.innerText;
			
			let data = {
				entrManageNo : entrManageNo
			}
			
			let title = entrManageNo + " 통관물품 상세정보"
			document.querySelector("#edTitle").innerHTML = title;
		//id가 vehiInsertModal인 함수 찾기
	    	const modal = new bootstrap.Modal(document.querySelector('#entryDetail'));
			// 함수 실행
	    	modal.show();
	    	selEntyThing(data);
		}
	// 통관 번호 상세보기 함수 시작 /////////////////////
	
	// 통관 물품 SELECT 함수 시작 /////////////////////
		const selEntyThing = (pVal)=>{
			let tableInfo = document.querySelector("#entryThingTab");
			tableInfo.innerHTML = "";
			console.log("넘어온 통관번호 쳌 : ",pVal);
			
			var xhr = new XMLHttpRequest();
			xhr.open("POST","/cbs/trnsprt/selET",true);
			xhr.setRequestHeader("Content-Type","application/json");
			xhr.onload = ()=>{
				console.log("결과값 체크 : ",xhr.responseText);
				let res = JSON.parse(xhr.responseText);
				
				let pageStr = "";
				let thingTy = "";
				for(let i=0; i<res.length; i++){
					pageStr += "<tr>";
					if(res[i].thingTy == "ETT1"){
						thingTy = "입고 요청"; }
					else if(res[i].thingTy == "ETT2"){
						thingTy = "입고 완료"; }
					pageStr += "<td>"+thingTy+"</td>";
					pageStr += "<td>"+res[i].thingNm+"</td>";
					pageStr += "<td class='num'>"+res[i].qy+"</td>";
					pageStr += "<td class='num'>"+res[i].untpc+"</td>";
					pageStr += "<td class='num'>"+res[i].amount+"</td>";
					pageStr += "<td class='num'>"+res[i].totAmount+"</td>";
					pageStr += "<td class='num'>"+res[i].baggTnpakg+"</td>";
					pageStr += "<td class='num'>"+res[i].totWt+"</td>";
					pageStr += "</tr>";
				}
				tableInfo.innerHTML = pageStr;
			}
			xhr.send(JSON.stringify(pVal));
		}
	// 통관 물품 SELECT 함수 시작 /////////////////////
	
// 통관 상세 보기 관련 함수 시작 /////////////////////
	
	
</script>


<div class="card" >
<div style="text-align: center; margin= 0; max-width: 100%; height: auto;">
	<img id="ims" src="/resources/img/진행4.png">
</div>
	<div class="m-4" >
		<div class="input-group mb-3 p-1 bd-highlight" style="padding: 10px; width: 100%; float: right;">
			<div class="input-group-text" style="width: 70px; padding: 10px;">처리 상태</div>
			<select class="form-select" id="storeStatus" style="width: 60px;">
				<option selected value="">처리상태</option>
				<option value="EPS4">입고 완료</option>
				<option value="EPS3">입고 요청</option>
			</select>
			<input type="text" style="width: 10px; border: none; background: transparent;" disabled="disabled">
			<div class="input-group-text" style="width: 100px; padding: 10px;">요청일자 범위</div>
			<input type="date" id="searchSDate" class="form-control" placeholder="시작일" style="width: 60px;">
			<input type="date" id="searchEDate" class="form-control" placeholder="종료일" style="width: 60px;">
			<input type="text" style="width: 10px; border: none; background: transparent;" disabled="disabled">
			<div class="input-group-text" style="width: 70px; padding: 10px;">검색 조건</div>
			<select class="form-select" id="serchSel" style="width: 60px;">
				<option value="" selected>검색 조건</option>
				<option value="entrManageNo">통관상태번호</option>
				<option value="userNm">요청자명</option>
				<option value="client">고객명</option>
				<option value="shipNm">선박명</option>
			</select>
			<input type="text" style="width: 10px; border: none; background: transparent;" disabled="disabled">
			<input type="text" id="searchText" class="form-control" placeholder="검색어를 입력하세요." style="width: 110px;">
			<button class="btn btn-primary btn-sm" type="button" id="search" onclick="search()">검색</button>
			<button class="btn btn-primary btn-sm" type="reset" id="reset" onclick="reset()">초기화</button>
		</div>
			<table class='table table-hover' style='text-align: center;' id="totalTable">
				<thead>
					<tr class='bg-body-highlight'>
						<th><input class='form-check-input' name='checkbox1' type='checkbox' onclick='selectAll(this)'></th>
						<th>통관관리번호</th>
						<th>요청 상태</th>
						<th>요청자 명</th>
						<th>요청 일자</th>
						<th>통관 고객명</th>
						<th>수출입 구분</th>
						<th>항구</th>
						<th>선박명</th>
					</tr>
				</thead>
				<tbody class='storeTab' id="storeTab">
					
				</tbody>
			</table>
			<!-- 페이지네이션 시작 -->
			<div class="pagination" id="pagination">
			
			</div>
			<button class="btn btn-primary btn-sm" type="button" id="btnInsert" onclick="insertVehi()">등록</button>
			<!-- 페이지네이션 종료 -->
			<div>
<!-- 				<button class="btn btn-phoenix-secondary btn-sm" type="button" id="btnfile" onclick="transport()">운송신고서 발급</button> -->
<!-- 				<button class="btn btn-primary btn-sm" type="button" id="" onclick="selUserInfo()">유저정보검색</button> -->
<!-- 				<button class="btn btn-primary btn-sm" type="button" id="" onclick="insertVehiDiary2()">값 테스트</button> -->
				<div style="display: none;">
					<sec:authorize access="isAuthenticated()">
						<sec:authentication property="principal.userVO" var="user" />
							<input type="text" id="userNm" value="${user.userNm}">
							<input  type="text" id="userCd" value="${user.userCd}">
					</sec:authorize>
				<input type="text" id="parentEntrManageNo" style="border: none; background: transparent; width: 35px;">
					
				</div>
			</div>
		</div>
	</div>


<!-- 차량 일지 모달 시작 /////////////////////////////////////////////////////////////////////////////// -->
<div class="modal fade" id="vehiInsertModal" tabindex="-1" aria-hidden="true">
  	<div class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-xl VD">
	    <div class="modal-content h-80 w-100">
		    <div class="modal-header">
		      <h5 class="modal-title" id="exampleModalLabel">보세운송 일지 등록</h5>
		      <button class="btn p-1" type="button" data-bs-dismiss="modal" aria-label="Close">
		        <span class="fas fa-times fs-9"></span>
		      </button>
		    </div>
		    <div class="modal-body">
		      	<div class="col-lg-6" style="float: left;">
			        <div style="float: right; margin-right: 25px;">
				        <div class="input-group">
				          <input class="form-control vehi" id="SrcIcNo" type="text" placeholder="IC카드번호 입력" style="width: 170px; border-radius: 5px;"/>
				          <input class="form-control vehi" id="SrcVehiMd" type="text" placeholder="차량모델명 입력" style="width: 130px; border-radius: 5px;"/>
				          <input class="form-control vehi" id="SrcDrver" type="text" placeholder="운전자명 입력" style="width: 130px; margin-right: 5px; border-radius: 5px;"/>
				          <button class="btn btn-subtle-info" id="icCardSrc" onclick="icCardSrc()">검색</button>
				        </div>
					</div>
						<div class="vehiTable" id="vehiTable" style="position: relative; clear: both;">
				        
						
						</div>
			        </div>
		        	<div class="col-lg-5" style="float: right; margin-right: 10px;">
		          	<div class="input-group">
		            	<div class="input-group-text">통관관리번호</div>
		            	<input class="form-control" id="ModalEntrManageNo" type="text" />
		          	</div>
		         	<div class="input-group">
		            	<div class="input-group-text">IC 카드 번호</div>
		            	<input class="form-control" id="icCardNo" type="text" />
		          	</div>
		          	<div class="input-group">
		            	<div class="input-group-text">출발지</div>
		            	<select class="form-select" id="strtpnt" onclick="StartSel()">
							<option selected value="none">해안을 선택</option>
							<option value="op1">서해안</option>
						  	<option value="op2">남해안</option>
						  	<option value="op3">동해안</option>
					 	</select> 
		            	<select class="form-select start" id="strtpnt1" onclick="" style="display: block;">
							<option selected>서해안 무역항</option>
							<option>인천항</option>
						  	<option>평택항</option>
						  	<option>당진항</option>
						  	<option>대산항</option>
						  	<option>태안항</option>
						  	<option>보령항</option>
						  	<option>목포항</option>
					 	</select> 
		            	<select class="form-select start" id="strtpnt2" onclick="" style="display: none;">
							<option selected>남해안 무역항</option>
							<option>여수항</option>
						  	<option>광양항</option>
						  	<option>통영항</option>
						  	<option>진해항</option>
						  	<option>제주항</option>
						  	<option>광양항</option>
						  	<option>부산항</option>
					 	</select> 
		            	<select class="form-select start" id="strtpnt3" onclick="" style="display: none;">
							<option selected>동해안 무역항</option>
							<option>울산항</option>
							<option>포항항</option>
							<option>삼척항</option>
							<option>동해항</option>
							<option>묵호항</option>
							<option>옥계항</option>
							<option>속초항</option>
					 	</select> 
		            	<!-- <select class="form-select start" id="strtpnt4" onclick="" style="display: none;">
							<option selected>전라도 항구</option>
							<option>(주)비아이디씨</option>
						  	<option>동부광양물류센터</option>
						  	<option>목포세관 구내장치장</option>
						  	<option>동부황금물류센터</option>
						  	<option>세관검사장(군산)</option>
					 	</select> 
		            	<select class="form-select start" id="strtpnt5" onclick="" style="display: none;">
							<option selected>강원도 항구</option>
							<option>대한냉동보세창고</option>
						  	<option>속초항여객터미널</option>
						  	<option>한별텔레콤(주)</option>
						  	<option>(주)씨프레창고</option>
						  	<option>(주)한국통운창고</option>
					 	</select>  -->
		          	</div>
					<div class="input-group">
						<div class="input-group-text">출발시간</div>
		            	<input class="form-control" id="strtDate" type="date" />
		            	<input class="form-control" id="strtTime" type="time" />
					</div>
					<div class="input-group">
						<div class="input-group-text">도착지</div>
		            	<!-- <select class="form-select" id="aloc" onclick="ArvlSel()">
							<option selected value="none">지역을 선택하세요</option>
							<option value="op1">경기도</option>
						  	<option value="op2">충청도</option>
						  	<option value="op3">경상도</option>
						  	<option value="op4">전라도</option>
						  	<option value="op5">강원도</option>
					  	</select>  -->
		            	<select class="form-select end" id="aloc1" onclick="" style="display: block;">
							<option selected>검역 보세창고</option>
							<option value="부산검역창고">부산검역창고</option>
						  	<option value="울산검역창고">울산검역창고</option>
						  	<option value="인천검역창고">인천검역창고</option>
						  	<option value="대전검역창고">대전검역창고</option>
					 	</select> 
		            	<!-- <select class="form-select end" id="aloc2" onclick=""style="display: none;">
							<option selected>충청도 보세창고</option>
							<option>(주)우양청양보세</option>
						  	<option>동아물류(주)</option>
						  	<option>천안세관검사장</option>
						  	<option>HDSLP(주)</option>
						  	<option>대전보세창고</option>
					 	</select> 
		            	<select class="form-select end" id="aloc3" onclick="" style="display: none;">
							<option selected>경상도 보세창고</option>
							<option>(주)모든종합보세</option>
						  	<option>대상물류</option>
						  	<option>(주)삼한냉동</option>
						  	<option>LG화학(주)</option>
						  	<option>포항종합제철(주)</option>
					 	</select> 
		            	<select class="form-select end" id="aloc4" onclick="" style="display: none;">
							<option selected>전라도 보세창고</option>
							<option>(주)비아이디씨</option>
						  	<option>동부광양물류센터</option>
						  	<option>목포세관 구내장치장</option>
						  	<option>동부황금물류센터</option>
						  	<option>세관검사장(군산)</option>
					 	</select> 
		            	<select class="form-select end" id="aloc5" onclick="" style="display: none;">
							<option selected>강원도 보세창고</option>
							<option>대한냉동보세창고</option>
						  	<option>속초항여객터미널</option>
						  	<option>한별텔레콤(주)</option>
						  	<option>(주)씨프레창고</option>
						  	<option>(주)한국통운창고</option>
					 	</select> -->
					</div>
			        <div class="input-group">
				    	<div class="input-group-text">도착시간</div>
				        <input class="form-control" id="arvlDate" type="date" />
				        <input class="form-control" id="arvlTime" type="time" />
			        </div>
		        </div>
		        
		    </div>
		    <div>
		    <!-- z-Index사용 페이징처리 /////////////////////// -->
		    <div class="col-lg-4" style="float: left; margin-bottom: 5px; margin-left: 17%" >
		    	<button type='button' class='btn btn-phoenix-info' onclick="btnPre()"><i class='fa-solid fa-angles-left'></i></button>
		    	<input type="text" class="btnPage" value="1" id="btnPre"><span>/</span><input type="text" class="btnPage" value="2" id="btnNex">
				<button type='button' class='btn btn-phoenix-info' onclick="btnNex()"><i class='fa-solid fa-angles-right'></i></button>
		    </div>
		    <!-- z-Index사용 페이징처리 /////////////////////// -->
		    </div>
		    <div class="modal-footer">
			    <button class="btn btn-primary" type="button" id="insertSD" onclick="autoInsVD()">자동입력</button>
			    <button class="btn btn-primary" type="button" data-bs-dismiss="modal" id="insertSD" onclick="insertVehiDiary()">입력</button>
			    <button class="btn btn-outline-primary" type="button" data-bs-dismiss="modal" onclick="closeSD()">닫기</button>
			</div>
    	</div>
  	</div>
	
</div>
<!-- 차량 일지 모달 끝 /////////////////////////////////////////////////////////////////////////////// -->

<!-- ############################################ 통관 번호 -> 물품 상세 보기 일지 모달 ############################################ -->
<div class="modal fade" id="entryDetail" tabindex="-1" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered modal-dialog-scrollable" style="max-width: 60%;">
	    <div class="modal-content h-80 w-100">
			<div class="modal-header">
			<h4 class="modal-title" id="edTitle"></h4>
			<button class="btn p-1" type="button" data-bs-dismiss="modal" aria-label="Close">
				<span class="fas fa-times fs-9"></span>
			</button>
			</div>
			<div class="modal-body">
				<table class='table table-hover' style='text-align: center;' id="totalTable">
					<thead>
						<tr class='bg-body-highlight'>
							<th>물품유형</th>
							<th>물품명</th>
							<th>수량</th>
							<th>단가</th>
							<th>금액</th>
							<th>총_금액</th>
							<th>총 포장 개수</th>
							<th>총 중량</th>
						</tr>
					</thead>
					<tbody class='entryThingTab' id="entryThingTab">
					
					</tbody>
				</table>
			</div>
			<div class="modal-footer">
				<button class="btn btn-outline-primary" type="button" data-bs-dismiss="modal">닫기</button>
			</div>
		</div>
	</div>
</div>
<!-- ############################################################################################# -->