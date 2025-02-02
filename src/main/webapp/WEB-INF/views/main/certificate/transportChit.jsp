<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style type="text/css">
.tg {
	border-collapse: collapse;
	border-spacing: 0;
}

.tg td {
	border-color: black;
	border-style: solid;
	border-width: 1px;
	font-family: "바탕", sans-serif;
	font-size: 13px;
	overflow: hidden;
	padding: 10px 5px;
	word-break: normal;
}

.tg th {
	border-color: black;
	border-style: solid;
	border-width: 1px;
	font-family: "바탕", sans-serif;
	font-size: 13px;
	font-weight: normal;
	overflow: hidden;
	padding: 10px 5px;
	word-break: normal;
}

.tg .tg-wa1i {
	font-weight: bold;
	text-align: center;
	vertical-align: middle
}

.tg .tg-qbk9 {
	background-color: #efefef;
	border-color: inherit;
	font-weight: bold;
	text-align: center;
	vertical-align: middle
}
.tg .tg-qbk8 {
	border-color: inherit;
	font-weight: bold;
	text-align: center;
	vertical-align: middle
}
.tg .tg-qbk7 {
	border-color: inherit;
	font-weight: bold;
	vertical-align: middle
}

.tg .tg-i8mc {
	background-color: #efefef;
	font-size: 17px;
	font-weight: bold;
	text-align: center;
	vertical-align: top
}

.tg .tg-nnwx {
	border-color: inherit;
	font-size: 17px;
	font-weight: bold;
	text-align: center;
	vertical-align: middle
}

.tg .tg-7btt {
	border-color: inherit;
	font-weight: bold;
	text-align: center;
	vertical-align: top
}

.tg .tg-0pky {
	border-color: inherit;
	text-align: left;
	vertical-align: top
}

.tg .tg-0lax {
	text-align: left;
	vertical-align: top
}

.num{
 text-align: right;
}

@media print {
.tg .tg-i8mc {background-color:#efefef !important; -webkit-print-color-adjust:exact;}
.tg .tg-qbk9 {background-color:#efefef !important; -webkit-print-color-adjust:exact;}

.hpa {margin:0;border:0 black none;}
body {padding:0; font-family: "바탕";}
nav, .no-print {
        display: none; /* 네비게이션과 원치 않는 요소 숨기기 */
    }
}
@page {
    size: 284mm 120mm;
    margin:0
}
</style>
<script>
	window.onload = ()=>{
		const queryString = window.location.search;
		const urlParams = new URLSearchParams(queryString);

		// qrantRequestCd 값 가져오기
		const entrManageNo = urlParams.get('entrManageNo');
// 		console.log("userCd확인: ", userCd);

		let data = {
			entrManageNo : entrManageNo
		};
// 		console.log("넘어온값 체크 : ",data);
		
		selTranChit(data);
	}
// 운송 전표 SELECT함수 시작 /////////////////////
	const selTranChit = (pVal)=>{
		
		var xhr = new XMLHttpRequest();
		xhr.open("POST","/cbs/declaration/transChit",true);
		xhr.setRequestHeader("Content-Type","application/json");
		xhr.onload = ()=>{
			console.log("결과 값 체크 : ",xhr.responseText);
			let res = JSON.parse(xhr.responseText);
			inpVal(res);
		}
		xhr.send(JSON.stringify(pVal));
	}
	const inpVal = (pVal)=>{
		document.querySelector("#tranNo").textContent = pVal.vhcleDiaryCd;
		document.querySelector("#bizrno").textContent = pVal.bizrno;
		document.querySelector("#tManager").textContent = pVal.userNm;
		document.querySelector("#tTel").textContent = pVal.telno;
		document.querySelector("#etNm").textContent = pVal.charger;
		document.querySelector("#etComp").textContent = pVal.entrprsNm;
		document.querySelector("#tPlace").textContent = pVal.strtPnt + " - " + pVal.arvlPnt;
		document.querySelector("#etPlace").textContent = pVal.reprsntAdres;
		document.querySelector("#tTime").textContent = pVal.strtTime + " - " + pVal.arvlTime;
		document.querySelector("#etNo").textContent = pVal.entrManageNo;
		
		let etThing = pVal.entryThingList;
		console.log("체크 : ",etThing);
		let str = "";
		let cnt = 1;
		let totalPrice = 0;
		for(let i=0; i<etThing.length; i++){
			str += "<tr>";
			str += "<td colspan='1' class='num'>"+ cnt +"</td>";
			str += "<td colspan='3' class='num'>"+ etThing[i].thingNm +"</td>";
			str += "<td colspan='2' class='num'>"+ etThing[i].qy +"</td>";
			str += "<td colspan='2' class='num'>"+ 1000 +"</td>";
			str += "<td class='num'>"+ etThing[i].totWt +"</td>";
			let price = (etThing[i].totWt * 8000);
			str += "<td colspan='3' class='num'>"+ price +"</td>";
			str += "<td colspan='3'></td>";
			str += "</tr>";
			cnt++
			totalPrice += price;
		}
		document.querySelector("#tbody").innerHTML = str;
		document.querySelector("#allPrice").textContent = totalPrice;
		
	}
// 운송 전표 SELECT함수 끝 /////////////////////

const downPDF = () => {
	window.print();
};
</script>
<nav style="margin-bottom: 10px; margin-left: 20px;">
<!-- <button type="button" class="btn btn-primary btn-sm" id="btnSub" style="height: auto;" onclick="downPDF()">제출</button> -->
<input type="text" id="entrManageNo" style="border: none; background: transparent; width: 35px;" readonly>
<input type="text" id="userCd" style="border: none; background: transparent; width: 35px;" readonly>
</nav>
<div>
	<table class="tg" style="table-layout: fixed; width: 1054px">
		<colgroup>
			<col style="width: 70px">
			<col style="width: 44px">
			<col style="width: 55px">
			<col style="width: 26px">
			<col style="width: 112px">
			<col style="width: 72px">
			<col style="width: 26px">
			<col style="width: 90px">
			<col style="width: 84px">
			<col style="width: 44px">
			<col style="width: 65px">
			<col style="width: 23px">
			<col style="width: 149px">
			<col style="width: 74px">
			<col style="width: 120px">
		</colgroup>
		<thead>
			<tr>
				<th class="tg-nnwx" colspan="15" rowspan="2">보세 운송 계산서</th>
			</tr>
			<tr>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td class="tg-qbk9" rowspan="4">공급자</td>
				<td class="tg-qbk9" colspan="2">운송 번호</td>
				<td class="tg-qbk8" colspan="5" id="tranNo"></td>
				<td class="tg-qbk9" rowspan="4">공급받는자<br>(화주)</td>
				<td class="tg-qbk9" colspan="2">사업자 번호</td>
				<td class="tg-qbk8" colspan="4" id="bizrno"></td>
			</tr>
			<tr>
				<td class="tg-qbk9" colspan="2">운송 담당자<br></td>
				<td class="tg-qbk8" colspan="2" id="tManager"></td>
				<td class="tg-qbk9" colspan="2">전화번호</td>
				<td class="tg-qbk8" colspan="2" id="tTel"></td>
				<td class="tg-qbk9" colspan="2">화주명(담당자)</td>
				<td class="tg-qbk8" colspan="2" id="etNm"></td>
				<td class="tg-qbk9">상호</td>
				<td class="tg-qbk8" id="etComp"></td>
			</tr>
			<tr>
				<td class="tg-qbk9" colspan="2">운송 장소</td>
				<td class="tg-qbk8" colspan="5" id="tPlace"></td>
				<td class="tg-qbk9" colspan="2">사업장 주소</td>
				<td class="tg-qbk8" colspan="4" id="etPlace"></td>
			</tr>
			<tr>
				<td class="tg-qbk9" colspan="2">운송 일시</td>
				<td class="tg-qbk8" colspan="5"id="tTime"></td>
				<td class="tg-qbk9" colspan="2">통관관리번호</td>
				<td class="tg-qbk8" colspan="2" id="etNo"></td>
				<td class="tg-qbk9"></td>
				<td class="tg-qbk8" id="mfrcRealmSe"></td>
			</tr>
			<tr>
				<td colspan="15" style="border: none;"></td>
			</tr>
			<tr>
				<td class="tg-qbk9">번호</td>
				<td class="tg-qbk9" colspan="3">품목 명</td>
				<td class="tg-qbk9" colspan="2">수량</td>
				<td class="tg-qbk9" colspan="2">단가</td>
				<td class="tg-qbk9" >중량(KG)</td>
				<td class="tg-qbk9" colspan="3">금액(중량 X 8,000)</td>
				<td class="tg-qbk9" colspan="3">비고</td>
			</tr>
			<tbody id="tbody">
			<!-- 데이터 들어갈 곳 -->
			</tbody>
			<tr>
				<td class="tg-i8mc" colspan="12">합 계 금 액</td>
				<td class="tg-wa1i" colspan="3" rowspan="2">이 금액을 청구 함</td>
			</tr>
			<tr>
				<td class="tg-qbk8" colspan="12" id="allPrice">합계금액</td>
			</tr>
			<tr>
				<td colspan="15" style="border: none;"></td>
			</tr>
			<tr>
				<td class="tg-i8mc" colspan="15" rowspan="3" id="allPrice">(주)CBS 운송 대행업체</td>
			</tr>
		</tbody>
	</table>
	</div>