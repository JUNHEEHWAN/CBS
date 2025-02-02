<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<style>
body {margin:0;padding-left:0;padding-right:0;padding-bottom:0;padding-top:2mm;}
.hce {margin:0;padding:0;position:absolute;overflow:hidden;}
.hme {margin:0;padding:0;position:absolute;}
.hhe {margin:0;padding:0;position:relative;}
.hhi {display:inline-block;margin:0;padding:0;position:relative;background-size:contain;}
.hls {margin:0;padding:0;position:absolute;}
.hfS {margin:0;padding:0;position:absolute;}
.hcD {margin:0;padding:0;position:absolute;}
.hcI {margin:0;padding:0;position:absolute;}
.hcS {margin:0;padding:0;position:absolute;}
.hfN {margin:0;padding:0;position:relative;}
.hmB {margin:0;padding:0;position:absolute;}
.hmO {margin:0;padding:0;position:absolute;}
.hmT {margin:0;padding:0;position:absolute;}
.hpN {display:inline-block;margin:0;padding:0;position:relative;white-space:nowrap;}
.htC {display:inline-block;margin:0;padding:0;position:relative;vertical-align:top;overflow:hidden;}
.haN {display:inline-block;margin:0;padding:0;position:relative;}
.hdu {margin:0;padding:0;position:relative;}
.hdS {margin:0;padding:0;position:absolute;}
.hsC {margin:0;padding:0;position:absolute;}
.hsR {margin:0;padding:0;position:absolute;}
.hsG {margin:0;padding:0;position:absolute;}
.hsL {margin:0;padding:0;position:absolute;}
.hsT {margin:0;padding:0;position:absolute;overflow:hidden;}
.hsE {margin:0;padding:0;position:absolute;overflow:hidden;}
.hsA {margin:0;padding:0;position:absolute;overflow:hidden;}
.hsP {margin:0;padding:0;position:absolute;overflow:hidden;}
.hsV {margin:0;padding:0;position:absolute;overflow:hidden;}
.hsO {margin:0;padding:0;position:absolute;}
.hsU {margin:0;padding:0;position:absolute;overflow:hidden;}
.hpi {margin:0;padding:0;position:absolute;}
.hch {margin:0;padding:0;position:absolute;}
.hcG {margin:0;padding:0;position:absolute;}
.heq {margin:0;padding:0;position:absolute;}
.heG {margin:0;padding:0;position:absolute;}
.htA {margin:0;padding:0;position:absolute;}
.hvi {margin:0;padding:0;position:absolute;}
.htb {margin:0;padding:0;position:absolute;}
.htG {margin:0;padding:0;position:absolute;}
.hfJ {margin:0;padding:0;position:absolute;}
.hfG {margin:0;padding:0;position:absolute;}
.hfB {margin:0;padding:0;position:absolute;}
.hfR {margin:0;padding:0;position:absolute;}
.hfC {margin:0;padding:0;position:absolute;}
.hfO {margin:0;padding:0;position:absolute;}
.hfL {margin:0;padding:0;position:absolute;}
.hfM {margin:0;padding:0;position:absolute;}
.hfE {margin:0;padding:0;position:absolute;}
.hpl {margin:0;padding:0;position:absolute;}
.hs {margin:0;padding:0;position:absolute;overflow:visible;}
.hpa {position:relative;padding:0;overflow:hidden;margin-left:2mm;margin-right:0mm;margin-bottom:2mm;margin-top:0mm;border:1px black solid;box-shadow:1mm 1mm 0 #AAAAAA;}
.hpa::after {content:'';position:absolute;margin:0;padding:0;left:0;right:0;top:0;bottom:0;background-color:white;z-index:-2;}
.hrt {display:inline-block;margin:0;padding:0;position:relative;white-space:inherit;vertical-align:middle;line-height:1.1;}
.hco {display:inline-block;margin:0;padding:0;position:relative;white-space:inherit;}
.hcc {margin:0;padding:0;position:absolute;}
.hls {clear:both;}
[onclick] {cursor:pointer;}
.cs0 {font-size:10pt;color:#000000;font-family:"함초롬바탕";}
.cs1 {font-size:10pt;color:#000000;font-family:"함초롬돋움";}
.cs2 {font-size:9pt;color:#000000;font-family:"함초롬돋움";}
.cs3 {font-size:9pt;color:#000000;font-family:"함초롬바탕";}
.cs4 {font-size:9pt;color:#000000;font-family:"함초롬돋움";letter-spacing:-0.03em;}
.cs5 {font-size:16pt;color:#2E74B5;font-family:"함초롬돋움";}
.cs6 {font-size:11pt;color:#000000;font-family:"함초롬돋움";}
.cs7 {font-size:10pt;color:#000000;font-family:"한컴바탕";}
.cs8 {font-size:12pt;color:#000000;font-family:"바탕";}
.cs9 {font-size:9pt;color:#000000;font-family:"HY옛글M";}
.cs10 {font-size:8pt;color:#000000;font-family:"HY태명조";letter-spacing:-0.05em;font-style:italic;}
.cs11 {font-size:10pt;color:#000000;font-family:"함초롬바탕";}
.cs12 {font-size:10pt;color:#000000;font-family:"바탕";}
.cs13 {font-size:6pt;color:#000000;font-family:"바탕";}
.cs14 {font-size:10pt;color:#000000;font-family:"바탕";font-style:italic;}
.cs15 {font-size:10pt;color:#000000;font-family:"바탕";}
.cs16 {font-size:10pt;color:#000000;font-family:"바탕";letter-spacing:0.09em;}
.cs17 {font-size:10pt;color:#000000;font-family:"바탕";letter-spacing:0.01em;}
.cs18 {font-size:10pt;color:#000000;font-family:"바탕";letter-spacing:0.06em;}
.cs19 {font-size:9pt;color:#000000;font-family:"바탕";}
.cs20 {font-size:10pt;color:#000000;font-family:"바탕";letter-spacing:-0.01em;}
.cs21 {font-size:10pt;color:#000000;font-family:"바탕";}
.cs21::after {content:'';position:absolute;left:0;right:0;top:0;bottom:0;z-index:-1;background-image:url('data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxMDAlIiBoZWlnaHQ9IjEwMCUiPjxsaW5lIHgxPSIwIiB5MT0iOTQlIiB4Mj0iMTAwJSIgeTI9Ijk0JSIgc3R5bGU9InN0cm9rZTpyZ2IoMCwwLDApO3N0cm9rZS13aWR0aDowLjJtbSIvPjwvc3ZnPg==');}
.cs22 {font-size:10pt;color:#000000;font-family:"바탕";letter-spacing:-0.02em;}
.cs22::after {content:'';position:absolute;left:0;right:0;top:0;bottom:0;z-index:-1;background-image:url('data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxMDAlIiBoZWlnaHQ9IjEwMCUiPjxsaW5lIHgxPSIwIiB5MT0iOTQlIiB4Mj0iMTAwJSIgeTI9Ijk0JSIgc3R5bGU9InN0cm9rZTpyZ2IoMCwwLDApO3N0cm9rZS13aWR0aDowLjJtbSIvPjwvc3ZnPg==');}
.cs23 {font-size:10pt;color:#000000;font-family:"바탕";letter-spacing:-0.02em;}
.cs23::after {content:'';position:absolute;left:0;right:0;top:0;bottom:0;z-index:-1;background-image:url('data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxMDAlIiBoZWlnaHQ9IjEwMCUiPjxsaW5lIHgxPSIwIiB5MT0iOTQlIiB4Mj0iMTAwJSIgeTI9Ijk0JSIgc3R5bGU9InN0cm9rZTpyZ2IoMCwwLDApO3N0cm9rZS13aWR0aDowLjJtbSIvPjwvc3ZnPg==');}
.cs24 {font-size:10pt;color:#000000;font-family:"바탕";letter-spacing:-0.01em;}
.cs24::after {content:'';position:absolute;left:0;right:0;top:0;bottom:0;z-index:-1;background-image:url('data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxMDAlIiBoZWlnaHQ9IjEwMCUiPjxsaW5lIHgxPSIwIiB5MT0iOTQlIiB4Mj0iMTAwJSIgeTI9Ijk0JSIgc3R5bGU9InN0cm9rZTpyZ2IoMCwwLDApO3N0cm9rZS13aWR0aDowLjJtbSIvPjwvc3ZnPg==');}
.cs25 {font-size:5pt;color:#000000;font-family:"바탕";}
.cs26 {font-size:10pt;color:#000000;font-family:"바탕";letter-spacing:-0.07em;}
.cs27 {font-size:12pt;color:#000000;font-family:"바탕";}
.cs28 {font-size:12pt;color:#000000;font-family:"바탕";letter-spacing:0.06em;}
.cs29 {font-size:12pt;color:#000000;font-family:"바탕";letter-spacing:-0.04em;}
.cs30 {font-size:8pt;color:#000000;font-family:"바탕";}
.cs31 {font-size:10pt;color:#000000;font-family:"바탕";letter-spacing:-0.06em;}
.cs32 {font-size:18pt;color:#000000;font-family:"바탕";}
.ps0 {text-align:justify;}
.ps1 {text-align:justify;}
.ps2 {text-align:justify;}
.ps3 {text-align:justify;}
.ps4 {text-align:justify;}
.ps5 {text-align:justify;}
.ps6 {text-align:justify;}
.ps7 {text-align:justify;}
.ps8 {text-align:justify;}
.ps9 {text-align:justify;}
.ps10 {text-align:justify;}
.ps11 {text-align:left;}
.ps12 {text-align:left;}
.ps13 {text-align:left;}
.ps14 {text-align:left;}
.ps15 {text-align:left;}
.ps16 {text-align:justify;}
.ps17 {text-align:justify;}
.ps18 {text-align:justify;}
.ps19 {text-align:center;}
.ps20 {text-align:justify;}
.ps21 {text-align:right;}
.ps22 {text-align:justify;}
.ps23 {text-align:center;}
.ps24 {text-align:justify;}
.ps25 {text-align:justify;}
.ps26 {text-align:center;}
.ps27 {text-align:justify;}
.ps28 {text-align:justify;}
.ps29 {text-align:justify;}
.ps30 {text-align:justify;}
.ps31 {text-align:justify;}
.ps32 {text-align:center;}

.number{
	text-align: right;
}

#doChackBose1 {
        white-space: normal; /* 줄바꿈을 자동으로 처리하도록 지정합니다. */
        word-wrap: break-word; /* 긴 단어를 자동으로 줄바꿈합니다. */
        overflow-wrap: break-word; /* 오버플로우를 고려하여 단어를 자동으로 줄바꿈합니다. */
}

@media print {
.hpa {margin:0;border:0 black none;box-shadow:none;}
body {padding:0;}
nav, .no-print {
        display: none; /* 네비게이션과 원치 않는 요소 숨기기 */
    }
}
@page {
    size: A4;
    margin:0
}
</style>
<script src="/resources/js/sweetalert2.min.js"></script>
<link rel="stylesheet" href="/resources/css/sweetalert2.min.css">
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

// 		let userCd = opener.document.querySelector('#userCd').value;
// 		let btnSub = document.querySelector('#btnSub');
// 		if(userCd != 'TRAN0001'){
// 			btnSub.style.display = "none";
// 		}
		
		checkSelVehiDecl(data);
	}
	
	const checkSelVehiDecl= (pVal)=>{
		
		var xhr = new XMLHttpRequest();
		xhr.open("POST","/cbs/declaration/selVehiDecl",true);
		xhr.setRequestHeader("Content-Type", "application/json");
		xhr.onload= ()=>{
			console.log("컨트롤러에서 받은값 체크 : ",xhr.responseText)
			let res = JSON.parse(xhr.responseText);
// 			console.log("정제된 xhr.responseText 값 : ",res);
			
			openDeclaration(res);
		}
		xhr.send(JSON.stringify(pVal));
	}
	
	
	const openDeclaration = (res)=>{
		
// 		console.log("openDeclaration 넘어온값 다시 체크 : ",res);
		
		let dclrtNo = res[0].dclrtNo;
		let dclrtDe = res[0].dclrtDe;
		let userCd = res[0].userCd;
		let userCmpnm = res[0].userCmpnm;
		let userNm = res[0].userNm;
		let adres = res[0].adres;
		
		let parts = res[0].blNo.split('-');
		let msqNo1 = parts[0];
		let hsqNo1 = parts[1];
		
		let cntanrInnb = res[0].cntanrInnb;
		
		let entrManageNo = res[0].entrManageNo;
		let vhcleDiaryCd = res[0].vhcleDiaryCd;
		let strtPnt = res[0].strtPnt;
		let arvlPnt = res[0].arvlPnt;
		let strtTime = res[0].strtTime;
		let arvlTime = res[0].arvlTime;
		
		
		document.getElementById("sinGoBunHo").value = dclrtNo;			//신고번호
		document.getElementById("chongRanSu").value = "30";				//총 란수
		document.getElementById("name").value = userNm;				//신고자이름
		document.getElementById("sinGoDate").value = dclrtDe;			//신고날짜
		document.getElementById("guBun").value = 1;						//구분
		document.getElementById("sinGoInBuho").value = "운송대행업체";	//신고인부호
		document.getElementById("saUpJaBunHo").value = "406-2265-2222";	//사업자번호
		document.getElementById("sinGoDate").value = dclrtDe;			//신고일자
		
		let trnDa = strtTime + " → " + arvlTime;
		document.getElementById("trnsDate").value = trnDa;				//운송기간
		let trnPl = strtPnt + " → " + arvlPnt;
		document.getElementById("trnsGugan").value = trnPl;				//운송구간
		document.getElementById("trnsSudanTo").value = "선박";			//운송수단(TO)
		document.getElementById("trnsSudanFrom").value = "차량";			//운송수단()
		document.getElementById("trnsBalSongji").value = strtPnt;		//발송지 보세구역
		
		let pakgSum = 0;
		let wtSum = 0;
		
		let cnt = 1;
		for(let i=0; i < res.length; i++){
			let qy = res[i].qy;
			let totWt = res[i].totWt;
			let thingNm = res[i].thingNm;
			let baggTnpakg = res[i].baggTnpakg;
			
			document.getElementById("jukHaBun"+cnt).value = "No.0"+cnt;			//관리번호(고정값)
			document.getElementById("msqNo"+ cnt).value = msqNo1;				//M.Seq.No(고정값)
			document.getElementById("hsqNo"+ cnt).value = hsqNo1;				//H.Seq.No(고정값)
			document.getElementById("containerNo"+ cnt).value = cntanrInnb;	//컨테이너번호(고정값)
			document.getElementById("pumName"+ cnt).value = thingNm;			//품명(변동값)
			document.getElementById("gaeSu"+ cnt).value = qy;					//개수(변동값)
			document.getElementById("danWuwee"+ cnt).value = "1000";			//단위(변동값)
			document.getElementById("chongGungYang"+cnt).value = totWt;		//총 중량
			document.getElementById("doChackBose"+cnt).value = arvlPnt;		//보세구역 도착지
			cnt++
			
			pakgSum += baggTnpakg;
			wtSum += totWt;
		}
			document.getElementById("containTotal").value = 1;					//총 컨테이너수
			document.getElementById("poJangTotal").value = pakgSum;				//포장 개수 합계
			document.getElementById("gungYangTotal").value = wtSum + " (ton)";	//중량 합계
		
		
// 		let data = {
// 				dclrtNo:dclrtNo,
// 				dclrtDe:dclrtDe,
// 				userCd:userCd,
// 				userCmpnm:userCmpnm,
// 				userCmpnm:userCmpnm,
// 				userNm:userNm,
// 				adres:adres,
// 				msqNo1:msqNo1,
// 				hsqNo1:hsqNo1,
// 				entrManageNo:entrManageNo,
// 				vhcleDiaryCd:vhcleDiaryCd,
// 				strtPnt:strtPnt,
// 				arvlPnt:arvlPnt,
// 				strtTime:strtTime,
// 				arvlTime:arvlTime,
// 				qy:qy,
// 				totWt:totWt,
// 				thingNm:thingNm,
// 				baggTnpakg:baggTnpakg
// 		}
// 		console.log("sinGoja 값 : ",data);
		
	}	
	
	const downPDF = () => {
		window.print();
	};
	
	const checkSub = ()=>{
		Swal.fire({
			  title: "보세 운송 필증",
			  text: "신고서를 하시겠습니까?",
			  icon: "question",
			  showCancelButton: true,
			  confirmButtonColor: "#3085d6",
			  cancelButtonColor: "#d33",
			  confirmButtonText: "제출"
			}).then((result) => {
			  if (result.isConfirmed) {
				// 보세운송필증 제출 업데이트 2
				updtranDel();
			  }
			});
	}
	
	const updtranDel = ()=>{
		const queryString = window.location.search;
		const urlParams = new URLSearchParams(queryString);

		// qrantRequestCd 값 가져오기
		const entrManageNo = urlParams.get('entrManageNo');
		let dclrtSttus = 1;
		let data = {
				entrManageNo : entrManageNo,
				dclrtSttus : dclrtSttus
		}
		var xhr = new XMLHttpRequest();
		xhr.open("POST","/cbs/declaration/updtranDecl",true);
		xhr.setRequestHeader("Content-Type", "application/json");
		xhr.onload= ()=>{
// 			console.log("컨트롤러에서 받은값 체크 : ",xhr.responseText)
			let res = xhr.responseText;
			if(res == 1){
				updSuc();
			}
		}
		xhr.send(JSON.stringify(data));
	}
	const updSuc = ()=>{
		 Swal.fire({
		      title: "제출성공!",
//		      text: "Your file has been deleted.",
		      icon: "success"
		    });
// 		 winClose();
	}
	const winClose = ()=> {
		window.close();
	}
</script>

<nav style="margin-bottom: 10px; margin-left: 20px;">
<!-- <button type="button" class="btn btn-primary btn-sm" id="btnSub" style="display:block; height: auto;" onclick="checkSub()">제출</button> -->
<input type="text" id="entrManageNo" style="border: none; background: transparent; width: 35px;">
<input type="text" id="userCd" style="border: none; background: transparent; width: 35px;">
</nav>

<div style="display: none;">
	<sec:authorize access="isAuthenticated()">
		<sec:authentication property="principal.userVO" var="user" />
			<input type="text" id="userNm" value="${user.userNm}">
			<input  type="text" id="userCd" value="${user.userCd}">
	</sec:authorize>
	<input type="text" id="parentEntrManageNo" style="border: none; background: transparent; width: 35px;">
</div>

<div class="hpa" style="width: 210mm; height: 297mm;">
	<div class="hcD" style="left: 10mm; top: 10mm;">
		<div class="hcI">
			<div class="hls ps32"
				style="line-height: 5.52mm; white-space: nowrap; left: 0mm; top: -0.32mm; height: 6.35mm; width: 189.99mm;">
				<span class="hrt cs32">보</span><span class="hrt cs32">&nbsp;</span><span
					class="hrt cs32">세</span><span class="hrt cs32">&nbsp;</span><span
					class="hrt cs32">운</span><span class="hrt cs32">&nbsp;</span><span
					class="hrt cs32">송</span><span class="hrt cs32">&nbsp;</span><span
					class="hrt cs32">필</span><span class="hrt cs32">&nbsp;</span><span
					class="hrt cs32">증</span><span class="hrt cs32">&nbsp;</span><span
					class="hrt cs32"></span>
			</div>
			<div class="hls ps32"
				style="line-height: 3.43mm; white-space: nowrap; left: 0mm; top: 12.42mm; height: 4.23mm; width: 189.99mm;">
				<span class="hrt cs8">(</span><span class="hrt cs8">&nbsp;</span><span
					class="hrt cs8">청 &nbsp;구 &nbsp;용</span><span class="hrt cs8">&nbsp;</span><span
					class="hrt cs8">)</span>
			</div>
			<div class="hls ps21"
				style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: 21.70mm; height: 5mm; width: 189.99mm;">
				<span class="hrt cs12">※ 처리기간：즉시</span>
			</div>
			<div class="hls ps0"
				style="line-height: 20.49mm; white-space: nowrap; left: 0mm; top: 27.52mm; height: 20.49mm; width: 189.99mm;">
				<div class="htb"
					style="left: 0mm; width: 179.97mm; top: 0mm; height: 20.49mm; display: inline-block; position: relative; vertical-align: middle;">
					<svg class="hs" viewBox="-2.50 -2.50 184.97 25.49"
						style="left: -2.50mm; top: -2.50mm; width: 184.97mm; height: 25.49mm;">
						<path d="M69.19,5.12 L69.19,10.25"
							style="stroke:#000000;stroke-linecap:butt;stroke-width:0.25;"></path>
						<path d="M69.19,15.37 L69.19,20.49"
							style="stroke:#000000;stroke-linecap:butt;stroke-width:0.25;"></path>
						<path d="M80.73,5.12 L80.73,10.25"
							style="stroke:#000000;stroke-linecap:butt;stroke-width:0.25;"></path>
						<path d="M103.79,5.12 L103.79,10.25"
							style="stroke:#000000;stroke-linecap:butt;stroke-width:0.25;"></path>
						<path d="M103.79,15.37 L103.79,20.49"
							style="stroke:#000000;stroke-linecap:butt;stroke-width:0.25;"></path>
						<path d="M105.79,0 L105.79,20.49"
							style="stroke:#000000;stroke-linecap:butt;stroke-width:0.25;"></path>
						<path d="M136.89,10.24 L136.89,20.49"
							style="stroke:#000000;stroke-linecap:butt;stroke-width:0.25;"></path>
						<path d="M146.87,0 L146.87,10.25"
							style="stroke:#000000;stroke-linecap:butt;stroke-width:0.25;"></path>
						<path d="M179.97,0 L179.97,20.49"
							style="stroke:#000000;stroke-linecap:butt;stroke-width:0.40;"></path>
						<path d="M105.66,0 L180.18,0"
							style="stroke:#000000;stroke-linecap:butt;stroke-width:0.40;"></path>
						<path d="M69.07,5.12 L103.92,5.12"
							style="stroke:#000000;stroke-linecap:butt;stroke-width:0.25;"></path>
						<path d="M16.28,10.24 L67.33,10.24"
							style="stroke:#000000;stroke-linecap:butt;stroke-width:0.25;"></path>
						<path d="M69.07,10.24 L103.92,10.24"
							style="stroke:#000000;stroke-linecap:butt;stroke-width:0.25;"></path>
						<path d="M105.66,10.24 L180.18,10.24"
							style="stroke:#000000;stroke-linecap:butt;stroke-width:0.25;"></path>
						<path d="M16.28,15.37 L67.33,15.37"
							style="stroke:#000000;stroke-linecap:butt;stroke-width:0.25;"></path>
						<path d="M69.07,15.37 L103.92,15.37"
							style="stroke:#000000;stroke-linecap:butt;stroke-width:0.25;"></path>
						<path d="M16.28,20.49 L67.33,20.49"
							style="stroke:#000000;stroke-linecap:butt;stroke-width:0.12;"></path>
						<path d="M69.07,20.49 L103.92,20.49"
							style="stroke:#000000;stroke-linecap:butt;stroke-width:0.12;"></path>
						<path d="M105.66,20.49 L180.18,20.49"
							style="stroke:#000000;stroke-linecap:butt;stroke-width:0.40;"></path>
						<path d="M179.97,0 L179.97,20.49"
							style="stroke:#000000;stroke-linecap:butt;stroke-width:0.40;"></path>
						<path d="M69.19,15.37 L69.19,20.49"
							style="stroke:#000000;stroke-linecap:butt;stroke-width:0.25;"></path>
						<path d="M69.19,5.12 L69.19,10.25"
							style="stroke:#000000;stroke-linecap:butt;stroke-width:0.25;"></path>
						<path d="M16.28,20.49 L67.33,20.49"
							style="stroke:#000000;stroke-linecap:butt;stroke-width:0.12;"></path>
						<path d="M69.07,20.49 L103.92,20.49"
							style="stroke:#000000;stroke-linecap:butt;stroke-width:0.12;"></path>
						<path d="M105.66,20.49 L180.18,20.49"
							style="stroke:#000000;stroke-linecap:butt;stroke-width:0.40;"></path>
						<path d="M105.66,0 L180.18,0"
							style="stroke:#000000;stroke-linecap:butt;stroke-width:0.40;"></path></svg>
					<div class="hce"
						style="left: 0mm; top: 0mm; width: 67.20mm; height: 5.12mm;">
						<div class="hcD" style="left: 0.50mm; top: 0.80mm;">
							<div class="hcI">
								<div class="hls ps22"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: -0.18mm; height: 5mm; width: 66.20mm;">
									<span class="hrt cs12">1. 신고자 :</span><input type="text" id="sinGoja" value="" style="border: 1px none; width: 100px;">
								</div>
							</div>
						</div>
					</div>
					<div class="hce"
						style="left: 67.20mm; top: 0mm; width: 1.99mm; height: 5.12mm;">
						<div class="hcD" style="left: 0.50mm; top: 0.80mm;">
							<div class="hcI">
								<div class="hls ps22"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: -0.18mm; height: 5mm; width: 5.08mm;"></div>
							</div>
						</div>
					</div>
					<div class="hce"
						style="left: 69.19mm; top: 0mm; width: 11.53mm; height: 5.12mm;">
						<div class="hcD" style="left: 0.50mm; top: 0.80mm;">
							<div class="hcI">
								<div class="hls ps23"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: -0.18mm; height: 5mm; width: 10.53mm;">
									<span class="hrt cs12">구 분</span>
								</div>
							</div>
						</div>
					</div>
					<div class="hce"
						style="left: 80.73mm; top: 0mm; width: 23.07mm; height: 5.12mm;">
						<div class="hcD" style="left: 0.50mm; top: 0.80mm;">
							<div class="hcI">
								<div class="hls ps23"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: -0.18mm; height: 5mm; width: 22.07mm;">
									<span class="hrt cs12">신</span><span class="hrt cs12">&nbsp;</span><span
										class="hrt cs12">고</span><span class="hrt cs12">&nbsp;</span><span
										class="hrt cs12">인</span><span class="hrt cs12">&nbsp;</span><span
										class="hrt cs12">부</span><span class="hrt cs12">&nbsp;</span><span
										class="hrt cs12">호</span>
								</div>
							</div>
						</div>
					</div>
					<div class="hce"
						style="left: 103.79mm; top: 0mm; width: 1.99mm; height: 5.12mm;">
						<div class="hcD" style="left: 0.50mm; top: 0.80mm;">
							<div class="hcI">
								<div class="hls ps22"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: -0.18mm; height: 5mm; width: 5.08mm;"></div>
							</div>
						</div>
					</div>
					<div class="hce"
						style="left: 105.79mm; top: 0mm; width: 41.08mm; height: 5.12mm;">
						<div class="hcD" style="left: 0.50mm; top: 0.80mm;">
							<div class="hcI">
								<div class="hls ps22"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: -0.18mm; height: 5mm; width: 40.09mm;">
									<span class="hrt cs12">2. 신고번호</span>
								</div>
							</div>
						</div>
					</div>
					<div class="hce"
						style="left: 146.87mm; top: 0mm; width: 33.10mm; height: 5.12mm;">
						<div class="hcD" style="left: 0.50mm; top: 0.80mm;">
							<div class="hcI">
								<div class="hls ps22"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: -0.18mm; height: 5mm; width: 32.10mm;">
									<span class="hrt cs12">3. 총란수</span><span class="hrt cs13">(일괄보세운송시기재)</span>
								</div>
							</div>
						</div>
					</div>
					<div class="hce"
						style="left: 0mm; top: 5.12mm; width: 16.41mm; height: 5.12mm;">
						<div class="hcD" style="left: 0.50mm; top: 0.80mm;">
							<div class="hcI">
								<div class="hls ps22"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: -0.18mm; height: 5mm; width: 15.41mm;">
									<span class="hrt cs12">&nbsp;&nbsp;&nbsp;상 &nbsp;호</span>
								</div>
							</div>
						</div>
					</div>
					<div class="hce"
						style="left: 16.41mm; top: 5.12mm; width: 50.79mm; height: 5.12mm;">
						<div class="hcD" style="left: 0.50mm; top: 0.80mm;">
							<div class="hcI">
								<div class="hls ps22"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: -0.18mm; height: 5mm; width: 49.80mm;">
								<input type="text" id="sangHo" style="border: none; background: transparent; width: 150px;">
								</div>
							</div>
						</div>
					</div>
					<div class="hce"
						style="left: 67.20mm; top: 5.12mm; width: 1.99mm; height: 5.12mm;">
						<div class="hcD" style="left: 0.50mm; top: 0.80mm;">
							<div class="hcI">
								<div class="hls ps22"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: -0.18mm; height: 5mm; width: 5.08mm;"></div>
							</div>
						</div>
					</div>
					<div class="hce"
						style="left: 69.19mm; top: 5.12mm; width: 11.53mm; height: 5.12mm;">
						<div class="hcD" style="left: 0.50mm; top: 0.80mm;">
							<div class="hcI">
								<div class="hls ps22"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: -0.18mm; height: 5mm; width: 10.53mm;">
									<input type="text" id="guBun" style="border: none; background: transparent; width: 35px;" readonly>
								</div>
							</div>
						</div>
					</div>
					<div class="hce"
						style="left: 80.73mm; top: 5.12mm; width: 23.07mm; height: 5.12mm;">
						<div class="hcD" style="left: 0.50mm; top: 0.80mm;">
							<div class="hcI">
								<div class="hls ps22"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: -0.18mm; height: 5mm; width: 22.07mm;">
									<input type="text" id="sinGoInBuho" style="border: none; background: transparent; width: 85px;" readonly>	
								</div>
							</div>
						</div>
					</div>
					<div class="hce"
						style="left: 103.79mm; top: 5.12mm; width: 1.99mm; height: 5.12mm;">
						<div class="hcD" style="left: 0.50mm; top: 0.80mm;">
							<div class="hcI">
								<div class="hls ps22"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: -0.18mm; height: 5mm; width: 5.08mm;"></div>
							</div>
						</div>
					</div>
					<div class="hce"
						style="left: 105.79mm; top: 5.12mm; width: 41.08mm; height: 5.12mm;">
						
						<div class="hcD" style="left: 0.50mm; top: 0.80mm;">
							<div class="hcI">
								<div class="hls ps22"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: -0.18mm; height: 5mm; width: 40.09mm;">
								<input type="text" id="sinGoBunHo" style="border: none; background: transparent; width: 150px;" readonly>
								</div>
							</div>
						</div>
					</div>
					<div class="hce"
						style="left: 146.87mm; top: 5.12mm; width: 33.10mm; height: 5.12mm;">
						<div class="hcD" style="left: 0.50mm; top: 0.80mm;">
							<div class="hcI">
								<div class="hls ps22"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: -0.18mm; height: 5mm; width: 32.10mm;">
								<input type="text" id="chongRanSu" style="border: none; background: transparent; width: 110px;" readonly>
								</div>
							</div>
						</div>
					</div>
					<div class="hce"
						style="left: 0mm; top: 10.24mm; width: 16.41mm; height: 5.12mm;">
						<div class="hcD" style="left: 0.50mm; top: 0.80mm;">
							<div class="hcI">
								<div class="hls ps22"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: -0.18mm; height: 5mm; width: 15.41mm;">
									<span class="hrt cs12">&nbsp;&nbsp;&nbsp;주 &nbsp;소</span>
								</div>
							</div>
						</div>
					</div>
					<div class="hce"
						style="left: 16.41mm; top: 10.24mm; width: 50.79mm; height: 5.12mm;">
						<div class="hcD" style="left: 0.50mm; top: 0.80mm;">
							<div class="hcI">
								<div class="hls ps22"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: -0.18mm; height: 5mm; width: 49.80mm;">
								<input type="text" id="address" style="border: none; background: transparent; width: 150px;" readonly>
								</div>
							</div>
						</div>
					</div>
					<div class="hce"
						style="left: 67.20mm; top: 10.24mm; width: 1.99mm; height: 5.12mm;">
						<div class="hcD" style="left: 0.50mm; top: 0.80mm;">
							<div class="hcI">
								<div class="hls ps22"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: -0.18mm; height: 5mm; width: 5.08mm;"></div>
							</div>
						</div>
					</div>
					<div class="hce"
						style="left: 69.19mm; top: 10.24mm; width: 34.60mm; height: 5.12mm;">
						<div class="hcD" style="left: 0.50mm; top: 0.80mm;">
							<div class="hcI">
								<div class="hls ps24"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: -0.18mm; height: 5mm; width: 33.60mm;">
									<span class="hrt cs12">사업자등록번호</span>
								</div>
							</div>
						</div>
					</div>
					<div class="hce"
						style="left: 103.79mm; top: 10.24mm; width: 1.99mm; height: 5.12mm;">
						<div class="hcD" style="left: 0.50mm; top: 0.80mm;">
							<div class="hcI">
								<div class="hls ps22"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: -0.18mm; height: 5mm; width: 5.08mm;"></div>
							</div>
						</div>
					</div>
					<div class="hce"
						style="left: 105.79mm; top: 10.24mm; width: 31.10mm; height: 5.12mm;">
						<div class="hcD" style="left: 0.50mm; top: 0.80mm;">
							<div class="hcI">
								<div class="hls ps22"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: -0.18mm; height: 5mm; width: 30.10mm;">
									<span class="hrt cs12">4. 신고일자</span>
								</div>
							</div>
						</div>
					</div>
					<div class="hce"
						style="left: 136.89mm; top: 10.24mm; width: 43.08mm; height: 5.12mm;">
						<div class="hcD" style="left: 0.50mm; top: 0.80mm;">
							<div class="hcI">
								<div class="hls ps22"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: -0.18mm; height: 5mm; width: 42.08mm;">
									<span class="hrt cs12">5. 운송기간</span>
								</div>
							</div>
						</div>
					</div>
					<div class="hce"
						style="left: 0mm; top: 15.37mm; width: 16.41mm; height: 5.12mm;">
						<div class="hcD" style="left: 0.50mm; top: 0.80mm;">
							<div class="hcI">
								<div class="hls ps22"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: -0.18mm; height: 5mm; width: 15.41mm;">
									<span class="hrt cs12">&nbsp;&nbsp;&nbsp;성 &nbsp;명</span>
								</div>
							</div>
						</div>
					</div>
					<div class="hce"
						style="left: 16.41mm; top: 15.37mm; width: 50.79mm; height: 5.12mm;">
						<div class="hcD" style="left: 0.50mm; top: 0.80mm;">
							<div class="hcI">
								<div class="hls ps22"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: -0.18mm; height: 5mm; width: 49.80mm;">
								<input type="text" id="name" style="border: none; background: transparent; width: 150px;" readonly>
								</div>
							</div>
						</div>
					</div>
					<div class="hce"
						style="left: 67.20mm; top: 15.37mm; width: 1.99mm; height: 5.12mm;">
						<div class="hcD" style="left: 0.50mm; top: 0.80mm;">
							<div class="hcI">
								<div class="hls ps22"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: -0.18mm; height: 5mm; width: 5.08mm;"></div>
							</div>
						</div>
					</div>
					<div class="hce"
						style="left: 69.19mm; top: 15.37mm; width: 34.60mm; height: 5.12mm;">
						<div class="hcD" style="left: 0.50mm; top: 0.80mm;">
							<div class="hcI">
								<div class="hls ps22"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: -0.18mm; height: 5mm; width: 33.60mm;">
								<input type="text" id="saUpJaBunHo" style="border: none; background: transparent; width: 120px;" readonly>
								</div>
							</div>
						</div>
					</div>
					<div class="hce"
						style="left: 103.79mm; top: 15.37mm; width: 1.99mm; height: 5.12mm;">
						<div class="hcD" style="left: 0.50mm; top: 0.80mm;">
							<div class="hcI">
								<div class="hls ps22"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: -0.18mm; height: 5mm; width: 5.08mm;"></div>
							</div>
						</div>
					</div>
					<div class="hce"
						style="left: 105.79mm; top: 15.37mm; width: 31.10mm; height: 5.12mm;">
						<div class="hcD" style="left: 0.50mm; top: 0.80mm;">
							<div class="hcI">
								<div class="hls ps22"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: -0.18mm; height: 5mm; width: 30.10mm;">
									<input type="text" id="sinGoDate" style="border: none; background: transparent; width: 100px; text-align: right;" readonly>
								</div>
							</div>
						</div>
					</div>
					<div class="hce"
						style="left: 136.89mm; top: 15.37mm; width: 43.08mm; height: 5.12mm;">
						<div class="hcD" style="left: 0.50mm; top: 0.80mm;">
							<div class="hcI">
								<div class="hls ps22"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: -0.18mm; height: 5mm; width: 42.08mm;">
									<input type="text" id="trnsDate" style="border: none; background: transparent; width: 100px; text-align: right;" readonly>
									<span class="hrt cs12">&nbsp;까지</span>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="hls ps0"
				style="line-height: 20.17mm; white-space: nowrap; left: 0mm; top: 50.12mm; height: 20.17mm; width: 189.99mm;">
				<div class="htb"
					style="left: 0mm; width: 179.99mm; top: 0mm; height: 20.17mm; display: inline-block; position: relative; vertical-align: middle;">
					<svg class="hs" viewBox="-2.50 -2.50 184.99 25.17"
						style="left: -2.50mm; top: -2.50mm; width: 184.99mm; height: 25.17mm;">
						<path d="M0,0 L0,20.17"
							style="stroke:#000000;stroke-linecap:butt;stroke-width:0.40;"></path>
						<path d="M119.99,0 L119.99,20.17"
							style="stroke:#000000;stroke-linecap:butt;stroke-width:0.25;"></path>
						<path d="M155.98,9.85 L155.98,15.25"
							style="stroke:#000000;stroke-linecap:butt;stroke-width:0.25;"></path>
						<path d="M173.97,9.85 L173.97,15.25"
							style="stroke:#000000;stroke-linecap:butt;stroke-width:0.25;"></path>
						<path d="M179.99,0 L179.99,20.17"
							style="stroke:#000000;stroke-linecap:butt;stroke-width:0.40;"></path>
						<path d="M60,9.85 L60,15.25"
							style="stroke:#000000;stroke-linecap:butt;stroke-dasharray:0.37,0.54;stroke-width:0.25;"></path>
						<path d="M-0.20,0 L180.20,0"
							style="stroke:#000000;stroke-linecap:butt;stroke-width:0.40;"></path>
						<path d="M155.85,9.85 L174.10,9.85"
							style="stroke:#000000;stroke-linecap:butt;stroke-width:0.25;"></path>
						<path d="M155.85,15.24 L174.10,15.24"
							style="stroke:#000000;stroke-linecap:butt;stroke-width:0.25;"></path>
						<path d="M-0.20,20.17 L180.20,20.17"
							style="stroke:#000000;stroke-linecap:butt;stroke-width:0.40;"></path>
						<path d="M-0.20,9.85 L120.12,9.85"
							style="stroke:#000000;stroke-linecap:butt;stroke-dasharray:0.37,0.54;stroke-width:0.25;"></path>
						<path d="M60,9.85 L60,15.25"
							style="stroke:#000000;stroke-linecap:butt;stroke-dasharray:0.37,0.54;stroke-width:0.25;"></path>
						<path d="M0,0 L0,20.17"
							style="stroke:#000000;stroke-linecap:butt;stroke-width:0.40;"></path>
						<path d="M-0.20,9.85 L120.12,9.85"
							style="stroke:#000000;stroke-linecap:butt;stroke-dasharray:0.37,0.54;stroke-width:0.25;"></path>
						<path d="M-0.20,0 L180.20,0"
							style="stroke:#000000;stroke-linecap:butt;stroke-width:0.40;"></path></svg>
					<div class="hce"
						style="left: 0mm; top: 0mm; width: 119.99mm; height: 4.92mm;">
						<div class="hcD" style="left: 0.50mm; top: 0.70mm;">
							<div class="hcI">
								<div class="hls ps22"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: -0.18mm; height: 5mm; width: 119mm;">
									<span class="hrt cs12">&nbsp;6. 운송구간 &nbsp;</span>
								</div>
							</div>
						</div>
					</div>
					<div class="hce"
						style="left: 119.99mm; top: 0mm; width: 60mm; height: 4.92mm;">
						<div class="hcD" style="left: 0.50mm; top: 0.70mm;">
							<div class="hcI">
								<div class="hls ps22"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: -0.18mm; height: 5mm; width: 59mm;">
									<span class="hrt cs12">&nbsp;7. 운송수단</span>
								</div>
							</div>
						</div>
					</div>
					<div class="hce"
						style="left: 2mm; top: 4mm; width: 110mm; height: 4.92mm;">
						<div class="hcD" style="left: 0.50mm; top: 0.70mm;">
							<div class="hcI">
								<div class="hls ps22"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: -0.18mm; height: 5mm; width: 119mm;">
								<input type="text" id="trnsGugan" style="border: none; background: transparent; width: 400px;" readonly>
								</div>
							</div>
						</div>
					</div>
					<div class="hce"
						style="left: 119.99mm; top: 4.92mm; width: 60mm; height: 4.92mm;">
						<div class="hcD" style="left: 0.50mm; top: 0.70mm;">
							<div class="hcI">
								<div class="hls ps22"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: -0.18mm; height: 5mm; width: 59mm;"></div>
							</div>
						</div>
					</div>
					<div class="hce"
						style="left: 0mm; top: 9.85mm; width: 32.99mm; height: 5.39mm;">
						<div class="hcD" style="left: 0.50mm; top: 0.70mm;">
							<div class="hcI" style="top: 0.23mm;">
								<div class="hls ps22"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: -0.18mm; height: 5mm; width: 31.99mm;">
									<span class="hrt cs12">발송지보세구역(부호)</span>
								</div>
							</div>
						</div>
					</div>
					<div class="hce"
						style="left: 32.99mm; top: 9.85mm; width: 27.01mm; height: 5.39mm;">
						<div class="hcD" style="left: 0.50mm; top: 0.70mm;">
							<div class="hcI" style="top: 0.23mm;">
								<div class="hls ps23"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: -0.18mm; height: 5mm; width: 26.01mm;"></div>
							</div>
						</div>
					</div>
					<div class="hce"
						style="left: 60mm; top: 9.85mm; width: 32.99mm; height: 5.39mm;">
						<div class="hcD" style="left: 0.50mm; top: 0.70mm;">
							<div class="hcI" style="top: 0.23mm;">
								<div class="hls ps22"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: -0.18mm; height: 5mm; width: 31.99mm;">
									<span class="hrt cs12">경유지보세구역(부호)</span>
								</div>
							</div>
						</div>
					</div>
					<div class="hce"
						style="left: 92.99mm; top: 9.85mm; width: 27.01mm; height: 5.39mm;">
						<div class="hcD" style="left: 0.50mm; top: 0.70mm;">
							<div class="hcI" style="top: 0.23mm;">
								<div class="hls ps23"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: -0.18mm; height: 5mm; width: 26.01mm;"></div>
							</div>
						</div>
					</div>
					<div class="hce"
						style="left: 119.99mm; top: 9.85mm; width: 11mm; height: 5.39mm;">
						<div class="hcD" style="left: 0.50mm; top: 0.70mm;">
							<div class="hcI" style="top: 0.23mm;">
								<div class="hls ps22"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: -0.18mm; height: 5mm; width: 9.99mm;">
								<input type="text" id="trnsSudanTo" style="border: none; background: transparent; width: 50px;" value="선박" readonly>
								</div>
							</div>
						</div>
					</div>
					<div class="hce"
						style="left: 130.99mm; top: 9.85mm; width: 7.99mm; height: 5.39mm;">
						<div class="hcD" style="left: 0.50mm; top: 0.70mm;">
							<div class="hcI" style="top: 0.23mm;">
								<div class="hls ps22"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: -0.18mm; height: 5mm; width: 7mm;">
									<span class="hrt cs12">(→)</span>
								</div>
							</div>
						</div>
					</div>
					<div class="hce"
						style="left: 138.98mm; top: 9.85mm; width: 16.99mm; height: 5.39mm;">
						<div class="hcD" style="left: 0.50mm; top: 0.70mm;">
							<div class="hcI" style="top: 0.23mm;">
								<div class="hls ps22"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: -0.18mm; height: 5mm; width: 15.99mm;">
								<input type="text" id="trnsSudanFrom" style="border: none; background: transparent; width: 50px;" value="차량" readonly>
								</div>
							</div>
						</div>
					</div>
					<div class="hce"
						style="left: 155.98mm; top: 9.85mm; width: 5mm; height: 5.39mm;">
						<div class="hcD" style="left: 0.50mm; top: 0.70mm;">
							<div class="hcI" style="top: 0.23mm;">
								<div class="hls ps22"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: -0.18mm; height: 5mm; width: 5.08mm;"></div>
							</div>
						</div>
					</div>
					<div class="hce"
						style="left: 160.98mm; top: 9.85mm; width: 7.99mm; height: 5.39mm;">
						<div class="hcD" style="left: 0.50mm; top: 0.70mm;">
							<div class="hcI" style="top: 0.23mm;">
								<div class="hls ps22"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: -0.18mm; height: 5mm; width: 7mm;">
									<span class="hrt cs12">[→]</span>
								</div>
							</div>
						</div>
					</div>
					<div class="hce"
						style="left: 168.97mm; top: 9.85mm; width: 5mm; height: 5.39mm;">
						<div class="hcD" style="left: 0.50mm; top: 0.70mm;">
							<div class="hcI" style="top: 0.23mm;">
								<div class="hls ps22"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: -0.18mm; height: 5mm; width: 5.08mm;"></div>
							</div>
						</div>
					</div>
					<div class="hce"
						style="left: 173.97mm; top: 9.85mm; width: 6.02mm; height: 5.39mm;">
						<div class="hcD" style="left: 0.50mm; top: 0.70mm;">
							<div class="hcI" style="top: 0.23mm;">
								<div class="hls ps22"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: -0.18mm; height: 5mm; width: 5.08mm;"></div>
							</div>
						</div>
					</div>
					<div class="hce"
						style="left: 0mm; top: 14.77mm; width: 60mm; height: 4.92mm;">
						<div class="hcD" style="left: 0.50mm; top: 0.70mm;">
							<div class="hcI">
								<div class="hls ps22"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: -0.18mm; height: 5mm; width: 59mm;">
								<input type="text" id="trnsBalSongji" style="border: none; background: transparent; width: 220px;" readonly>
								</div>
							</div>
						</div>
					</div>
					<div class="hce"
						style="left: 60mm; top: 14.77mm; width: 60mm; height: 4.92mm;">
						<div class="hcD" style="left: 0.50mm; top: 0.70mm;">
							<div class="hcI">
								<div class="hls ps22"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: -0.18mm; height: 5mm; width: 59mm;">
								<input type="text" id="trnskyungUji" style="border: none; background: transparent; width: 220px;">
								</div>
							</div>
						</div>
					</div>
					<div class="hce"
						style="left: 119.99mm; top: 15.24mm; width: 60mm; height: 4.92mm;">
						<div class="hcD" style="left: 0.50mm; top: 0.70mm;">
							<div class="hcI">
								<div class="hls ps22"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: -0.18mm; height: 5mm; width: 59mm;"></div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="hls ps0"
				style="line-height: 111.42mm; white-space: nowrap; left: 0mm; top: 72.41mm; height: 111.42mm; width: 189.99mm;">
				<div class="htb"
					style="left: 0mm; width: 179.99mm; top: 0mm; height: 111.42mm; display: inline-block; position: relative; vertical-align: middle;">
					<svg class="hs" viewBox="-2.50 -2.50 184.99 116.42"
						style="left: -2.50mm; top: -2.50mm; width: 184.99mm; height: 116.42mm;">
						<path d="M0,0 L0,111.42"
							style="stroke:#000000;stroke-linecap:butt;stroke-width:0.40;"></path>
						<path d="M25.06,0 L25.06,111.42"
							style="stroke:#000000;stroke-linecap:butt;stroke-width:0.25;"></path>
						<path d="M35.60,4.52 L35.60,111.42"
							style="stroke:#000000;stroke-linecap:butt;stroke-width:0.25;"></path>
						<path d="M46.13,0 L46.13,111.42"
							style="stroke:#000000;stroke-linecap:butt;stroke-width:0.25;"></path>
						<path d="M82.18,0 L82.18,111.42"
							style="stroke:#000000;stroke-linecap:butt;stroke-width:0.25;"></path>
						<path d="M118.78,0 L118.78,111.42"
							style="stroke:#000000;stroke-linecap:butt;stroke-width:0.25;"></path>
						<path d="M129.31,4.88 L129.31,111.42"
							style="stroke:#000000;stroke-linecap:butt;stroke-width:0.25;"></path>
						<path d="M139.84,0 L139.84,111.42"
							style="stroke:#000000;stroke-linecap:butt;stroke-width:0.25;"></path>
						<path d="M156.37,0 L156.37,111.42"
							style="stroke:#000000;stroke-linecap:butt;stroke-width:0.25;"></path>
						<path d="M179.99,0 L179.99,111.42"
							style="stroke:#000000;stroke-linecap:butt;stroke-width:0.40;"></path>
						<path d="M-0.20,0 L180.20,0"
							style="stroke:#000000;stroke-linecap:butt;stroke-width:0.40;"></path>
						<path d="M24.94,4.52 L46.26,4.52"
							style="stroke:#000000;stroke-linecap:butt;stroke-width:0.25;"></path>
						<path d="M118.65,4.88 L139.97,4.88"
							style="stroke:#000000;stroke-linecap:butt;stroke-width:0.25;"></path>
						<path d="M-0.20,12.28 L180.20,12.28"
							style="stroke:#000000;stroke-linecap:butt;stroke-width:0.25;"></path>
						<path d="M-0.20,111.42 L180.20,111.42"
							style="stroke:#000000;stroke-linecap:butt;stroke-width:0.40;"></path>
						<path d="M179.99,0 L179.99,111.42"
							style="stroke:#000000;stroke-linecap:butt;stroke-width:0.40;"></path>
						<path d="M0,0 L0,111.42"
							style="stroke:#000000;stroke-linecap:butt;stroke-width:0.40;"></path>
						<path d="M-0.20,111.42 L180.20,111.42"
							style="stroke:#000000;stroke-linecap:butt;stroke-width:0.40;"></path>
						<path d="M-0.20,0 L180.20,0"
							style="stroke:#000000;stroke-linecap:butt;stroke-width:0.40;"></path></svg>
					<div class="hce"
						style="left: 0mm; top: 0mm; width: 25.06mm; height: 12.28mm;">
						<div class="hcD" style="left: 0.50mm; top: 0.50mm;">
							<div class="hcI" style="top: 1.94mm;">
								<div class="hls ps25"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: -0.18mm; height: 5mm; width: 24.06mm;">
									<span class="hrt cs15">8. 적 하 목 록</span>
								</div>
								<div class="hls ps25"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: 3.70mm; height: 5mm; width: 24.06mm;">
									<span class="hrt cs15">관리번호(MRN)</span>
								</div>
							</div>
						</div>
					</div>
					<div class="hce"
						style="left: 25.06mm; top: 0mm; width: 21.07mm; height: 4.52mm;">
						<div class="hcD" style="left: 0.50mm; top: 0.50mm;">
							<div class="hcI">
								<div class="hls ps26"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: -0.18mm; height: 5mm; width: 20.07mm;">
									<span class="hrt cs15">9.B/L일련번호</span>
								</div>
							</div>
						</div>
					</div>
					<div class="hce"
						style="left: 46.13mm; top: 0mm; width: 36.05mm; height: 12.28mm;">
						<div class="hcD" style="left: 0.50mm; top: 0.50mm;">
							<div class="hcI">
								<div class="hls ps26"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: -0.18mm; height: 5mm; width: 35.05mm;">
									<span class="hrt cs16">10.</span><span class="hrt cs16">&nbsp;</span><span
										class="hrt cs16">B/L(AWB)번호</span>
								</div>
								<div class="hls ps26"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: 3.70mm; height: 5mm; width: 35.05mm;">
									<span class="hrt cs17">(컨테이너번호/</span><span class="hrt cs18">봉인&nbsp;</span>
								</div>
								<div class="hls ps26"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: 7.58mm; height: 5mm; width: 35.05mm;">
									<span class="hrt cs18">번호)</span>
								</div>
							</div>
						</div>
					</div>
					<div class="hce"
						style="left: 82.18mm; top: 0mm; width: 36.60mm; height: 12.28mm;">
						<div class="hcD" style="left: 0.50mm; top: 0.50mm;">
							<div class="hcI" style="top: 3.88mm;">
								<div class="hls ps26"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: -0.18mm; height: 5mm; width: 35.60mm;">
									<span class="hrt cs15">11. 품
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;명</span>
								</div>
							</div>
						</div>
					</div>
					<div class="hce"
						style="left: 118.78mm; top: 0mm; width: 21.07mm; height: 4.88mm;">
						<div class="hcD" style="left: 0.50mm; top: 0.50mm;">
							<div class="hcI" style="top: 0.18mm;">
								<div class="hls ps26"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: -0.18mm; height: 5mm; width: 20.07mm;">
									<span class="hrt cs15">12.포장명세</span>
								</div>
							</div>
						</div>
					</div>
					<div class="hce"
						style="left: 139.84mm; top: 0mm; width: 16.53mm; height: 12.28mm;">
						<div class="hcD" style="left: 0.50mm; top: 0.50mm;">
							<div class="hcI" style="top: 1.94mm;">
								<div class="hls ps26"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: -0.18mm; height: 5mm; width: 15.52mm;">
									<span class="hrt cs15">13.총중량</span>
								</div>
								<div class="hls ps26"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: 3.70mm; height: 5mm; width: 15.52mm;">
									<span class="hrt cs15">(TON)</span>
								</div>
							</div>
						</div>
					</div>
					<div class="hce"
						style="left: 156.37mm; top: 0mm; width: 23.62mm; height: 12.28mm;">
						<div class="hcD" style="left: 0.50mm; top: 0.50mm;">
							<div class="hcI" style="top: 1.94mm;">
								<div class="hls ps26"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: -0.18mm; height: 5mm; width: 22.62mm;">
									<span class="hrt cs15">14. 도 착 지</span>
								</div>
								<div class="hls ps26"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: 3.70mm; height: 5mm; width: 22.62mm;">
									<span class="hrt cs15">보 세 구 역</span>
								</div>
							</div>
						</div>
					</div>
					<div class="hce"
						style="left: 25.06mm; top: 4.52mm; width: 10.53mm; height: 7.76mm;">
						<div class="hcD" style="left: 0.50mm; top: 0.50mm;">
							<div class="hcI" style="top: 0.05mm;">
								<div class="hls ps26"
									style="line-height: 2.48mm; white-space: nowrap; left: 0mm; top: -0.16mm; height: 3.17mm; width: 9.54mm;">
									<span class="hrt cs19">M.Seq.</span>
								</div>
								<div class="hls ps26"
									style="line-height: 2.48mm; white-space: nowrap; left: 0mm; top: 3.34mm; height: 3.17mm; width: 9.54mm;">
									<span class="hrt cs19">No.</span>
								</div>
							</div>
						</div>
					</div>
					<div class="hce"
						style="left: 35.60mm; top: 4.52mm; width: 10.53mm; height: 7.76mm;">
						<div class="hcD" style="left: 0.50mm; top: 0.50mm;">
							<div class="hcI" style="top: 0.05mm;">
								<div class="hls ps26"
									style="line-height: 2.48mm; white-space: nowrap; left: 0mm; top: -0.16mm; height: 3.17mm; width: 9.54mm;">
									<span class="hrt cs19">H.Seq.</span>
								</div>
								<div class="hls ps26"
									style="line-height: 2.48mm; white-space: nowrap; left: 0mm; top: 3.34mm; height: 3.17mm; width: 9.54mm;">
									<span class="hrt cs19">No.</span>
								</div>
							</div>
						</div>
					</div>
					<div class="hce"
						style="left: 118.78mm; top: 4.88mm; width: 10.53mm; height: 7.41mm;">
						<div class="hcD" style="left: 0.50mm; top: 0.50mm;">
							<div class="hcI" style="top: 1.44mm;">
								<div class="hls ps26"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: -0.18mm; height: 5mm; width: 9.54mm;">
									<span class="hrt cs15">개수</span>
								</div>
							</div>
						</div>
					</div>
					<div class="hce"
						style="left: 129.31mm; top: 4.88mm; width: 10.53mm; height: 7.41mm;">
						<div class="hcD" style="left: 0.50mm; top: 0.50mm;">
							<div class="hcI" style="top: 1.44mm;">
								<div class="hls ps26"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: -0.18mm; height: 5mm; width: 9.54mm;">
									<span class="hrt cs15">단위</span>
								</div>
							</div>
						</div>
					</div>
					<div class="hce"
						style="left: 0mm; top: 12.28mm; width: 25.06mm; height: 99.13mm;">
						<div class="hcD" style="left: 0.50mm; top: 0.50mm;">
							<div class="hcI">
								<div class="hls ps23"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: -0.18mm; height: 5mm; width: 24.06mm;">
									<input type="text" id="jukHaBun1" style="border: none; background: transparent; width: 85px;">	
								</div>
								<div class="hls ps23"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: 4.06mm; height: 5mm; width: 24.06mm;">
									<input type="text" id="jukHaBun2" style="border: none; background: transparent; width: 85px;">
								</div>
								<div class="hls ps23"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: 8.29mm; height: 5mm; width: 24.06mm;">
									<input type="text" id="jukHaBun3" style="border: none; background: transparent; width: 85px;">
								</div>
								<div class="hls ps23"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: 12.52mm; height: 5mm; width: 24.06mm;">
									<input type="text" id="jukHaBun4" style="border: none; background: transparent; width: 85px;">
								</div>
								<div class="hls ps23"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: 16.76mm; height: 5mm; width: 24.06mm;">
									<input type="text" id="jukHaBun5" style="border: none; background: transparent; width: 85px;">	
								</div>
								<div class="hls ps23"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: 20.99mm; height: 5mm; width: 24.06mm;">
									<input type="text" id="jukHaBun6" style="border: none; background: transparent; width: 85px;">	
								</div>
								<div class="hls ps23"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: 25.22mm; height: 5mm; width: 24.06mm;">
									<input type="text" id="jukHaBun7" style="border: none; background: transparent; width: 85px;">	
								</div>
								<div class="hls ps23"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: 29.46mm; height: 5mm; width: 24.06mm;">
									<input type="text" id="jukHaBun8" style="border: none; background: transparent; width: 85px;">	
								</div>
								<div class="hls ps23"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: 33.69mm; height: 5mm; width: 24.06mm;">
									<input type="text" id="jukHaBun9" style="border: none; background: transparent; width: 85px;">	
								</div>
								<div class="hls ps23"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: 37.92mm; height: 5mm; width: 24.06mm;">
									<input type="text" id="jukHaBun10" style="border: none; background: transparent; width: 85px;">
								</div>
								<div class="hls ps23"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: 42.16mm; height: 5mm; width: 24.06mm;">
									<input type="text" id="jukHaBun11" style="border: none; background: transparent; width: 85px;">	
								</div>
							</div>
						</div>
					</div>
					<div class="hce"
						style="left: 25.06mm; top: 12.28mm; width: 10.53mm; height: 99.13mm;">
						<div class="hcD" style="left: 0.50mm; top: 0.50mm;">
							<div class="hcI">
								<div class="hls ps23"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: -0.18mm; height: 5mm; width: 9.54mm;">
									<input type="text" id="msqNo1" style="border: none; background: transparent; width: 35px;">
								</div>
								<div class="hls ps23"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: 4.06mm; height: 5mm; width: 9.54mm;">
									<input type="text" id="msqNo2" style="border: none; background: transparent; width: 35px;">
								</div>
								<div class="hls ps23"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: 8.29mm; height: 5mm; width: 9.54mm;">
									<input type="text" id="msqNo3" style="border: none; background: transparent; width: 35px;">
								</div>
								<div class="hls ps23"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: 12.52mm; height: 5mm; width: 9.54mm;">
									<input type="text" id="msqNo4" style="border: none; background: transparent; width: 35px;">
								</div>
								<div class="hls ps23"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: 16.76mm; height: 5mm; width: 9.54mm;">
									<input type="text" id="msqNo5" style="border: none; background: transparent; width: 35px;">
								</div>
								<div class="hls ps23"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: 20.99mm; height: 5mm; width: 9.54mm;">
									<input type="text" id="msqNo6" style="border: none; background: transparent; width: 35px;">
								</div>
								<div class="hls ps23"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: 25.22mm; height: 5mm; width: 9.54mm;">
									<input type="text" id="msqNo7" style="border: none; background: transparent; width: 35px;">
								</div>
								<div class="hls ps23"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: 29.46mm; height: 5mm; width: 9.54mm;">
									<input type="text" id="msqNo8" style="border: none; background: transparent; width: 35px;">
								</div>
								<div class="hls ps23"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: 33.69mm; height: 5mm; width: 9.54mm;">
									<input type="text" id="msqNo9" style="border: none; background: transparent; width: 35px;">
								</div>
								<div class="hls ps23"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: 37.92mm; height: 5mm; width: 9.54mm;">
									<input type="text" id="msqNo10" style="border: none; background: transparent; width: 35px;">
								</div>
								<div class="hls ps23"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: 42.16mm; height: 5mm; width: 9.54mm;">
									<input type="text" id="msqNo11" style="border: none; background: transparent; width: 35px;">	
								</div>
							</div>
						</div>
					</div>
					<div class="hce"
						style="left: 35.60mm; top: 12.28mm; width: 10.53mm; height: 99.13mm;">
						<div class="hcD" style="left: 0.50mm; top: 0.50mm;">
							<div class="hcI">
								<div class="hls ps23"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: -0.18mm; height: 5mm; width: 9.54mm;">
									<input type="text" id="hsqNo1" style="border: none; background: transparent; width: 35px;">
								</div>
								<div class="hls ps23"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: 4.06mm; height: 5mm; width: 9.54mm;">
									<input type="text" id="hsqNo2" style="border: none; background: transparent; width: 35px;">
								</div>
								<div class="hls ps23"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: 8.29mm; height: 5mm; width: 9.54mm;">
									<input type="text" id="hsqNo3" style="border: none; background: transparent; width: 35px;">
								</div>
								<div class="hls ps23"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: 12.52mm; height: 5mm; width: 9.54mm;">
									<input type="text" id="hsqNo4" style="border: none; background: transparent; width: 35px;">
								</div>
								<div class="hls ps23"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: 16.76mm; height: 5mm; width: 9.54mm;">
									<input type="text" id="hsqNo5" style="border: none; background: transparent; width: 35px;">
								</div>
								<div class="hls ps23"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: 20.99mm; height: 5mm; width: 9.54mm;">
									<input type="text" id="hsqNo6" style="border: none; background: transparent; width: 35px;">
								</div>
								<div class="hls ps23"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: 25.22mm; height: 5mm; width: 9.54mm;">
									<input type="text" id="hsqNo7" style="border: none; background: transparent; width: 35px;">
								</div>
								<div class="hls ps23"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: 29.46mm; height: 5mm; width: 9.54mm;">
									<input type="text" id="hsqNo8" style="border: none; background: transparent; width: 35px;">
								</div>
								<div class="hls ps23"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: 33.69mm; height: 5mm; width: 9.54mm;">
									<input type="text" id="hsqNo9" style="border: none; background: transparent; width: 35px;">
								</div>
								<div class="hls ps23"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: 37.92mm; height: 5mm; width: 9.54mm;">
									<input type="text" id="hsqNo10" style="border: none; background: transparent; width: 35px;">
								</div>
								<div class="hls ps23"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: 42.16mm; height: 5mm; width: 9.54mm;">
									<input type="text" id="hsqNo11" style="border: none; background: transparent; width: 35px;">
								</div>
							</div>
						</div>
					</div>
					<div class="hce"
						style="left: 46.13mm; top: 12.28mm; width: 36.05mm; height: 99.13mm;">
						<div class="hcD" style="left: 0.50mm; top: 0.50mm;">
							<div class="hcI">
								<div class="hls ps23"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: -0.18mm; height: 5mm; width: 35.05mm;">
									<input type="text" id="containerNo1" style="border: none; background: transparent; width: 130px;">
								</div>
								<div class="hls ps23"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: 4.06mm; height: 5mm; width: 35.05mm;">
									<input type="text" id="containerNo2" style="border: none; background: transparent; width: 130px;">
								</div>
								<div class="hls ps23"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: 8.29mm; height: 5mm; width: 35.05mm;">
									<input type="text" id="containerNo3" style="border: none; background: transparent; width: 130px;">
								</div>
								<div class="hls ps23"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: 12.52mm; height: 5mm; width: 35.05mm;">
									<input type="text" id="containerNo4" style="border: none; background: transparent; width: 130px;">
								</div>
								<div class="hls ps23"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: 16.76mm; height: 5mm; width: 35.05mm;">
									<input type="text" id="containerNo5" style="border: none; background: transparent; width: 130px;">
								</div>
								<div class="hls ps23"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: 20.99mm; height: 5mm; width: 35.05mm;">
									<input type="text" id="containerNo6" style="border: none; background: transparent; width: 130px;">
								</div>
								<div class="hls ps23"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: 25.22mm; height: 5mm; width: 35.05mm;">
									<input type="text" id="containerNo7" style="border: none; background: transparent; width: 130px;">
								</div>
								<div class="hls ps23"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: 29.46mm; height: 5mm; width: 35.05mm;">
									<input type="text" id="containerNo8" style="border: none; background: transparent; width: 130px;">
								</div>
								<div class="hls ps23"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: 33.69mm; height: 5mm; width: 35.05mm;">
									<input type="text" id="containerNo9" style="border: none; background: transparent; width: 130px;">
								</div>
								<div class="hls ps23"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: 37.92mm; height: 5mm; width: 35.05mm;">
									<input type="text" id="containerNo10" style="border: none; background: transparent; width: 130px;">
								</div>
								<div class="hls ps23"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: 42.16mm; height: 5mm; width: 35.05mm;">
									<input type="text" id="containerNo11" style="border: none; background: transparent; width: 130px;">
								</div>
							</div>
						</div>
					</div>
					<div class="hce"
						style="left: 82.18mm; top: 12.28mm; width: 36.60mm; height: 99.13mm;">
						<div class="hcD" style="left: 0.50mm; top: 0.50mm;">
							<div class="hcI">
								<div class="hls ps23"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: -0.18mm; height: 5mm; width: 35.60mm;">
									<input type="text" id="pumName1" style="border: none; background: transparent; width: 130px;">
								</div>
								<div class="hls ps23"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: 4.06mm; height: 5mm; width: 35.60mm;">
									<input type="text" id="pumName2" style="border: none; background: transparent; width: 130px;">
								</div>
								<div class="hls ps23"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: 8.29mm; height: 5mm; width: 35.60mm;">
									<input type="text" id="pumName3" style="border: none; background: transparent; width: 130px;">
								</div>
								<div class="hls ps23"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: 12.52mm; height: 5mm; width: 35.60mm;">
									<input type="text" id="pumName4" style="border: none; background: transparent; width: 130px;">
								</div>
								<div class="hls ps23"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: 16.76mm; height: 5mm; width: 35.60mm;">
									<input type="text" id="pumName5" style="border: none; background: transparent; width: 130px;">
								</div>
								<div class="hls ps23"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: 20.99mm; height: 5mm; width: 35.60mm;">
									<input type="text" id="pumName6" style="border: none; background: transparent; width: 130px;">
								</div>
								<div class="hls ps23"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: 25.22mm; height: 5mm; width: 35.60mm;">
									<input type="text" id="pumName7" style="border: none; background: transparent; width: 130px;">
								</div>
								<div class="hls ps23"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: 29.46mm; height: 5mm; width: 35.60mm;">
									<input type="text" id="pumName8" style="border: none; background: transparent; width: 130px;">
								</div>
								<div class="hls ps23"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: 33.69mm; height: 5mm; width: 35.60mm;">
									<input type="text" id="pumName9" style="border: none; background: transparent; width: 130px;">
								</div>
								<div class="hls ps23"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: 37.92mm; height: 5mm; width: 35.60mm;">
									<input type="text" id="pumName10" style="border: none; background: transparent; width: 130px;">
								</div>
								<div class="hls ps23"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: 42.16mm; height: 5mm; width: 35.60mm;">
									<input type="text" id="pumName11" style="border: none; background: transparent; width: 130px;">
								</div>
							</div>
						</div>
					</div>
					<div class="hce"
						style="left: 118.78mm; top: 12.28mm; width: 10.53mm; height: 99.13mm;">
						<div class="hcD" style="left: 0.50mm; top: 0.50mm;">
							<div class="hcI">
								<div class="hls ps23"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: -0.18mm; height: 5mm; width: 9.54mm;">
									<input type="text" id="gaeSu1" class="number" style="border: none; background: transparent; width: 35px;">
								</div>
								<div class="hls ps23"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: 4.06mm; height: 5mm; width: 9.54mm;">
									<input type="text" id="gaeSu2" class="number" style="border: none; background: transparent; width: 35px;">
								</div>
								<div class="hls ps23"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: 8.29mm; height: 5mm; width: 9.54mm;">
									<input type="text" id="gaeSu3" class="number" style="border: none; background: transparent; width: 35px;">
								</div>
								<div class="hls ps23"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: 12.52mm; height: 5mm; width: 9.54mm;">
									<input type="text" id="gaeSu4" class="number" style="border: none; background: transparent; width: 35px;">
								</div>
								<div class="hls ps23"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: 16.76mm; height: 5mm; width: 9.54mm;">
									<input type="text" id="gaeSu5" class="number" style="border: none; background: transparent; width: 35px;">
								</div>
								<div class="hls ps23"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: 20.99mm; height: 5mm; width: 9.54mm;">
									<input type="text" id="gaeSu6" class="number" style="border: none; background: transparent; width: 35px;">
								</div>
								<div class="hls ps23"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: 25.22mm; height: 5mm; width: 9.54mm;">
									<input type="text" id="gaeSu7" class="number" style="border: none; background: transparent; width: 35px;">
								</div>
								<div class="hls ps23"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: 29.46mm; height: 5mm; width: 9.54mm;">
									<input type="text" id="gaeSu8" class="number" style="border: none; background: transparent; width: 35px;">
								</div>
								<div class="hls ps23"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: 33.69mm; height: 5mm; width: 9.54mm;">
									<input type="text" id="gaeSu9" class="number" style="border: none; background: transparent; width: 35px;">
								</div>
								<div class="hls ps23"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: 37.92mm; height: 5mm; width: 9.54mm;">
									<input type="text" id="gaeSu10" class="number" style="border: none; background: transparent; width: 35px;">
								</div>
								<div class="hls ps23"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: 42.16mm; height: 5mm; width: 9.54mm;">
									<input type="text" id="gaeSu11" class="number" style="border: none; background: transparent; width: 35px;">
								</div>
							</div>
						</div>
					</div>
					<div class="hce"
						style="left: 129.31mm; top: 12.28mm; width: 10.53mm; height: 99.13mm;">
						<div class="hcD" style="left: 0.50mm; top: 0.50mm;">
							<div class="hcI">
								<div class="hls ps23"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: -0.18mm; height: 5mm; width: 9.54mm;">
									<input type="text" id="danWuwee1" class="number" style="border: none; background: transparent; width: 35px;">
								</div>
								<div class="hls ps23"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: 4.06mm; height: 5mm; width: 9.54mm;">
									<input type="text" id="danWuwee2" class="number" style="border: none; background: transparent; width: 35px;">
								</div>
								<div class="hls ps23"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: 8.29mm; height: 5mm; width: 9.54mm;">
									<input type="text" id="danWuwee3" class="number" style="border: none; background: transparent; width: 35px;">
								</div>
								<div class="hls ps23"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: 12.52mm; height: 5mm; width: 9.54mm;">
									<input type="text" id="danWuwee4" class="number" style="border: none; background: transparent; width: 35px;">
								</div>
								<div class="hls ps23"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: 16.76mm; height: 5mm; width: 9.54mm;">
									<input type="text" id="danWuwee5" class="number" style="border: none; background: transparent; width: 35px;">
								</div>
								<div class="hls ps23"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: 20.99mm; height: 5mm; width: 9.54mm;">
									<input type="text" id="danWuwee6" class="number" style="border: none; background: transparent; width: 35px;">
								</div>
								<div class="hls ps23"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: 25.22mm; height: 5mm; width: 9.54mm;">
									<input type="text" id="danWuwee7" class="number" style="border: none; background: transparent; width: 35px;">
								</div>
								<div class="hls ps23"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: 29.46mm; height: 5mm; width: 9.54mm;">
									<input type="text" id="danWuwee8" class="number" style="border: none; background: transparent; width: 35px;">
								</div>
								<div class="hls ps23"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: 33.69mm; height: 5mm; width: 9.54mm;">
									<input type="text" id="danWuwee9" class="number" style="border: none; background: transparent; width: 35px;">
								</div>
								<div class="hls ps23"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: 37.92mm; height: 5mm; width: 9.54mm;">
									<input type="text" id="danWuwee10" class="number" style="border: none; background: transparent; width: 35px;">
								</div>
								<div class="hls ps23"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: 42.16mm; height: 5mm; width: 9.54mm;">
									<input type="text" id="danWuwee11" class="number" style="border: none; background: transparent; width: 35px;">
								</div>
							</div>
						</div>
					</div>
					<div class="hce"
						style="left: 139.84mm; top: 12.28mm; width: 16.53mm; height: 99.13mm;">
						<div class="hcD" style="left: 0.50mm; top: 0.50mm;">
							<div class="hcI">
								<div class="hls ps23"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: -0.18mm; height: 5mm; width: 15.52mm;">
									<input type="text" id="chongGungYang1" class="number" style="border: none; background: transparent; width: 55px;">
								</div>
								<div class="hls ps23"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: 4.06mm; height: 5mm; width: 15.52mm;">
									<input type="text" id="chongGungYang2" class="number" style="border: none; background: transparent; width: 55px;">
								</div>
								<div class="hls ps23"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: 8.29mm; height: 5mm; width: 15.52mm;">
									<input type="text" id="chongGungYang3" class="number" style="border: none; background: transparent; width: 55px;">
								</div>
								<div class="hls ps23"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: 12.52mm; height: 5mm; width: 15.52mm;">
									<input type="text" id="chongGungYang4" class="number" style="border: none; background: transparent; width: 55px;">
								</div>
								<div class="hls ps23"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: 16.76mm; height: 5mm; width: 15.52mm;">
									<input type="text" id="chongGungYang5" class="number" style="border: none; background: transparent; width: 55px;">
								</div>
								<div class="hls ps23"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: 20.99mm; height: 5mm; width: 15.52mm;">
									<input type="text" id="chongGungYang6" class="number" style="border: none; background: transparent; width: 55px;">
								</div>
								<div class="hls ps23"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: 25.22mm; height: 5mm; width: 15.52mm;">
									<input type="text" id="chongGungYang7" class="number" style="border: none; background: transparent; width: 55px;">
								</div>
								<div class="hls ps23"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: 29.46mm; height: 5mm; width: 15.52mm;">
									<input type="text" id="chongGungYang8" class="number" style="border: none; background: transparent; width: 55px;">
								</div>
								<div class="hls ps23"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: 33.69mm; height: 5mm; width: 15.52mm;">
									<input type="text" id="chongGungYang9" class="number" style="border: none; background: transparent; width: 55px;">
								</div>
								<div class="hls ps23"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: 37.92mm; height: 5mm; width: 15.52mm;">
									<input type="text" id="chongGungYang10" class="number" style="border: none; background: transparent; width: 55px;">
								</div>
								<div class="hls ps23"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: 42.16mm; height: 5mm; width: 15.52mm;">
									<input type="text" id="chongGungYang11" class="number" style="border: none; background: transparent; width: 55px;">
								</div>
							</div>
						</div>
					</div>
					<div class="hce"
						style="left: 156.37mm; top: 12.28mm; width: 23.62mm; height: 99.13mm;">
						<div class="hcD" style="left: 0.50mm; top: 0.50mm;">
							<div class="hcI">
								<div class="hls ps23"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: -0.18mm; height: 5mm; width: 22.62mm;">
									<input type="text" id="doChackBose1" style="border: none; background: transparent; width: 85px;">
								</div>
								<div class="hls ps23"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: 4.06mm; height: 5mm; width: 22.62mm;">
									<input type="text" id="doChackBose2" style="border: none; background: transparent; width: 85px;">
								</div>
								<div class="hls ps23"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: 8.29mm; height: 5mm; width: 22.62mm;">
									<input type="text" id="doChackBose3" style="border: none; background: transparent; width: 85px;">
								</div>
								<div class="hls ps23"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: 12.52mm; height: 5mm; width: 22.62mm;">
									<input type="text" id="doChackBose4" style="border: none; background: transparent; width: 85px;">
								</div>
								<div class="hls ps23"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: 16.76mm; height: 5mm; width: 22.62mm;">
									<input type="text" id="doChackBose5" style="border: none; background: transparent; width: 85px;">
								</div>
								<div class="hls ps23"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: 20.99mm; height: 5mm; width: 22.62mm;">
									<input type="text" id="doChackBose6" style="border: none; background: transparent; width: 85px;">
								</div>
								<div class="hls ps23"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: 25.22mm; height: 5mm; width: 22.62mm;">
									<input type="text" id="doChackBose7" style="border: none; background: transparent; width: 85px;">
								</div>
								<div class="hls ps23"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: 29.46mm; height: 5mm; width: 22.62mm;">
									<input type="text" id="doChackBose8" style="border: none; background: transparent; width: 85px;">
								</div>
								<div class="hls ps23"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: 33.69mm; height: 5mm; width: 22.62mm;">
									<input type="text" id="doChackBose9" style="border: none; background: transparent; width: 85px;">
								</div>
								<div class="hls ps23"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: 37.92mm; height: 5mm; width: 22.62mm;">
									<input type="text" id="doChackBose10" style="border: none; background: transparent; width: 85px;">
								</div>
								<div class="hls ps23"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: 42.16mm; height: 5mm; width: 22.62mm;">
									<input type="text" id="doChackBose11" style="border: none; background: transparent; width: 85px;">
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="hls ps0"
				style="line-height: 6.79mm; white-space: nowrap; left: 0mm; top: 185.94mm; height: 7.52mm; width: 189.99mm;">
				<div class="htb"
					style="left: 0mm; width: 180mm; top: 0mm; height: 7.52mm; display: inline-block; position: relative; vertical-align: middle;">
					<svg class="hs" viewBox="-2.50 -2.50 185 12.52"
						style="left: -2.50mm; top: -2.50mm; width: 185mm; height: 12.52mm;">
						<path d="M0,0 L0,7.52"
							style="stroke:#000000;stroke-linecap:butt;stroke-width:0.40;"></path>
						<path d="M30.71,0 L30.71,7.52"
							style="stroke:#000000;stroke-linecap:butt;stroke-width:0.25;"></path>
						<path d="M67.40,0 L67.40,7.52"
							style="stroke:#000000;stroke-linecap:butt;stroke-width:0.25;"></path>
						<path d="M72.15,0 L72.15,7.52"
							style="stroke:#000000;stroke-linecap:butt;stroke-width:0.25;"></path>
						<path d="M101.86,0 L101.86,7.52"
							style="stroke:#000000;stroke-linecap:butt;stroke-width:0.25;"></path>
						<path d="M114.59,0 L114.59,7.52"
							style="stroke:#000000;stroke-linecap:butt;stroke-width:0.25;"></path>
						<path d="M143.30,0 L143.30,7.52"
							style="stroke:#000000;stroke-linecap:butt;stroke-width:0.25;"></path>
						<path d="M180,0 L180,7.52"
							style="stroke:#000000;stroke-linecap:butt;stroke-width:0.40;"></path>
						<path d="M-0.20,0 L180.20,0"
							style="stroke:#000000;stroke-linecap:butt;stroke-width:0.40;"></path>
						<path d="M-0.20,7.52 L180.20,7.52"
							style="stroke:#000000;stroke-linecap:butt;stroke-width:0.40;"></path>
						<path d="M180,0 L180,7.52"
							style="stroke:#000000;stroke-linecap:butt;stroke-width:0.40;"></path>
						<path d="M0,0 L0,7.52"
							style="stroke:#000000;stroke-linecap:butt;stroke-width:0.40;"></path>
						<path d="M-0.20,7.52 L180.20,7.52"
							style="stroke:#000000;stroke-linecap:butt;stroke-width:0.40;"></path>
						<path d="M-0.20,0 L180.20,0"
							style="stroke:#000000;stroke-linecap:butt;stroke-width:0.40;"></path></svg>
					<div class="hce"
						style="left: 0mm; top: 0mm; width: 30.71mm; height: 7.52mm;">
						<div class="hcD" style="left: 0.50mm; top: 2mm;">
							<div class="hcI">
								<div class="hls ps23"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: -0.18mm; height: 5mm; width: 29.70mm;">
									<span class="hrt cs12">합 계 (TOTAL) ⇒</span>
								</div>
							</div>
						</div>
					</div>
					<div class="hce"
						style="left: 30.71mm; top: 0mm; width: 36.70mm; height: 7.52mm;">
						<div class="hcD" style="left: 0.50mm; top: 2mm;">
							<div class="hcI">
								<div class="hls ps23"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: -0.18mm; height: 5mm; width: 35.70mm;">
									<span class="hrt cs12">15. 컨테이너 총 개수</span>
								</div>
							</div>
						</div>
					</div>
					<div class="hce"
						style="left: 67.40mm; top: 0mm; width: 4.75mm; height: 7.52mm;">
						<div class="hcD" style="left: 0.50mm; top: 2mm;">
							<div class="hcI">
								<div class="hls ps23"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: -0.18mm; height: 5mm; width: 5.08mm;">
									<input type="text" id="containTotal" class="number" style="border: none; background: transparent; width: 15px;">	
								</div>
							</div>
						</div>
					</div>
					<div class="hce"
						style="left: 72.15mm; top: 0mm; width: 29.71mm; height: 7.52mm;">
						<div class="hcD" style="left: 0.50mm; top: 2mm;">
							<div class="hcI">
								<div class="hls ps23"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: -0.18mm; height: 5mm; width: 28.70mm;">
									<span class="hrt cs12">16. 포장개수 합계</span>
								</div>
							</div>
						</div>
					</div>
					<div class="hce"
						style="left: 101.86mm; top: 0mm; width: 12.74mm; height: 7.52mm;">
						<div class="hcD" style="left: 0.50mm; top: 2mm;">
							<div class="hcI">
								<div class="hls ps23"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: -0.18mm; height: 5mm; width: 11.74mm;">
									<input type="text" id="poJangTotal" class="number" style="border: none; background: transparent; width: 45px;">
								</div>
							</div>
						</div>
					</div>
					<div class="hce"
						style="left: 114.59mm; top: 0mm; width: 28.71mm; height: 7.52mm;">
						<div class="hcD" style="left: 0.50mm; top: 2mm;">
							<div class="hcI">
								<div class="hls ps23"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: -0.18mm; height: 5mm; width: 27.71mm;">
									<span class="hrt cs12">17. 총중량 합계</span>
								</div>
							</div>
						</div>
					</div>
					<div class="hce"
						style="left: 143.30mm; top: 0mm; width: 36.70mm; height: 7.52mm;">
						<div class="hcD" style="left: 0.50mm; top: 2mm;">
							<div class="hcI">
								<div class="hls ps23"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: -0.18mm; height: 5mm; width: 35.70mm;">
									<input type="text" id="gungYangTotal" class="number" style="border: none; background: transparent; width: 135px;">
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="hls ps0"
				style="line-height: 51.22mm; white-space: nowrap; left: 0mm; top: 195.58mm; height: 51.22mm; width: 189.99mm;">
				<div class="htb"
					style="left: 0mm; width: 180mm; top: 0mm; height: 51.22mm; display: inline-block; position: relative; vertical-align: middle;">
					<svg class="hs" viewBox="-2.50 -2.50 185 56.22"
						style="left: -2.50mm; top: -2.50mm; width: 185mm; height: 56.22mm;">
						<path d="M0,0 L0,51.23"
							style="stroke:#000000;stroke-linecap:butt;stroke-width:0.40;"></path>
						<path d="M74.81,0 L74.81,51.23"
							style="stroke:#000000;stroke-linecap:butt;stroke-width:0.25;"></path>
						<path d="M143.63,0 L143.63,51.23"
							style="stroke:#000000;stroke-linecap:butt;stroke-width:0.25;"></path>
						<path d="M180,0 L180,51.23"
							style="stroke:#000000;stroke-linecap:butt;stroke-width:0.40;"></path>
						<path d="M-0.20,0 L180.21,0"
							style="stroke:#000000;stroke-linecap:butt;stroke-width:0.40;"></path>
						<path d="M74.69,8.80 L143.76,8.80"
							style="stroke:#000000;stroke-linecap:butt;stroke-width:0.25;"></path>
						<path d="M-0.20,51.22 L180.21,51.22"
							style="stroke:#000000;stroke-linecap:butt;stroke-width:0.40;"></path>
						<path d="M180,0 L180,51.23"
							style="stroke:#000000;stroke-linecap:butt;stroke-width:0.40;"></path>
						<path d="M0,0 L0,51.23"
							style="stroke:#000000;stroke-linecap:butt;stroke-width:0.40;"></path>
						<path d="M-0.20,51.22 L180.21,51.22"
							style="stroke:#000000;stroke-linecap:butt;stroke-width:0.40;"></path>
						<path d="M-0.20,0 L180.21,0"
							style="stroke:#000000;stroke-linecap:butt;stroke-width:0.40;"></path></svg>
					<div class="hce"
						style="left: 0mm; top: 0mm; width: 74.81mm; height: 5.81mm;">
						<div class="hcD" style="left: 1mm; top: 0.80mm;">
							<div class="hcI" style="top: 0.34mm;">
								<div class="hls ps27"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: -0.18mm; height: 5mm; width: 72.81mm;">
									<span class="hrt cs12">※ 주의</span>
								</div>
							</div>
						</div>
					</div>
					<div class="hce"
						style="left: 74.81mm; top: 0mm; width: 68.82mm; height: 8.80mm;">
						<div class="hcD" style="left: 1mm; top: 0.80mm;">
							<div class="hcI" style="top: 1.84mm;">
								<div class="hls ps22"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: -0.18mm; height: 5mm; width: 66.82mm;">
									<span class="hrt cs12">18. 수리일자： <input type="text" id="suRiDate" style="border: none; background: transparent; width: 150px;"></span>
								</div>
							</div>
						</div>
					</div>
					<div class="hce"
						style="left: 143.63mm; top: 0mm; width: 36.37mm; height: 8.80mm;">
						<div class="hcD" style="left: 1mm; top: 0.80mm;">
							<div class="hcI" style="top: 1.84mm;">
								<div class="hls ps22"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: -0.18mm; height: 5mm; width: 34.37mm;">
									<span class="hrt cs12">&nbsp;※ 비 &nbsp;고</span>
								</div>
							</div>
						</div>
					</div>
					<div class="hce"
						style="left: 0mm; top: 5.81mm; width: 74.81mm; height: 11.35mm;">
						<div class="hcD" style="left: 1mm; top: 0.80mm;">
							<div class="hcI" style="top: 1mm;">
								<div class="hls ps28"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: -0.18mm; height: 5mm; width: 72.81mm;">
									<span class="hrt cs12">1.&nbsp;</span><span class="hrt cs20">보세운송물품이
										목적지에 도착하면 도착지장치</span>
								</div>
								<div class="hls ps28"
									style="padding-left: 4.45mm; line-height: 2.79mm; white-space: nowrap; left: 0mm; top: 4.06mm; height: 5mm; width: 72.81mm;">
									<span class="hrt cs20">장에 보세운송</span><span class="hrt cs12">&nbsp;신고필증을
										제출하여야 한다.</span>
								</div>
							</div>
						</div>
					</div>
					<div class="hce"
						style="left: 74.81mm; top: 8.80mm; width: 68.82mm; height: 8.71mm;">
						<div class="hcD" style="left: 1mm; top: 0.80mm;">
							<div class="hcI" style="top: 1.79mm;">
								<div class="hls ps22"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: -0.18mm; height: 5mm; width: 66.82mm;">
									<span class="hrt cs12">&nbsp;【 도착지보세구역 】</span>
								</div>
							</div>
						</div>
					</div>
					<div class="hce"
						style="left: 143.63mm; top: 8.80mm; width: 36.37mm; height: 8.71mm;">
						<div class="hcD" style="left: 1mm; top: 0.80mm;">
							<div class="hcI" style="top: 1.79mm;">
								<div class="hls ps22"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: -0.18mm; height: 5mm; width: 34.37mm;">
									<input type="text" id="doChackBose" style="border: none; background: transparent; width: 130px; "></div>
							</div>
						</div>
					</div>
					<div class="hce"
						style="left: 0mm; top: 17.16mm; width: 74.81mm; height: 13.59mm;">
						<div class="hcD" style="left: 1mm; top: 0.80mm;">
							<div class="hcI">
								<div class="hls ps29"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: -0.18mm; height: 5mm; width: 72.81mm;">
									<span class="hrt cs21">2.&nbsp;</span><span class="hrt cs22">세관검사물품의
										경우 목적지에 도착하면 즉시&nbsp;</span>
								</div>
								<div class="hls ps29"
									style="padding-left: 4.77mm; line-height: 2.79mm; white-space: nowrap; left: 0mm; top: 4.06mm; height: 5mm; width: 72.81mm;">
									<span class="hrt cs23">도착지세관장에게</span><span class="hrt cs24">&nbsp;도착결과보고를
										하여야 한</span>
								</div>
								<div class="hls ps29"
									style="padding-left: 4.77mm; line-height: 2.79mm; white-space: nowrap; left: 0mm; top: 8.29mm; height: 5mm; width: 72.81mm;">
									<span class="hrt cs24">다.</span>
								</div>
							</div>
						</div>
					</div>
					<div class="hce"
						style="left: 74.81mm; top: 17.51mm; width: 68.82mm; height: 13.24mm;">
						<div class="hcD" style="left: 1mm; top: 0.80mm;">
							<div class="hcI" style="top: 4.06mm;">
								<div class="hls ps22"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: -0.18mm; height: 5mm; width: 66.82mm;">
									<span class="hrt cs12">&nbsp;&nbsp;</span><span
										class="hrt cs21">도착일시： &nbsp;&nbsp;&nbsp;&nbsp;년
										&nbsp;&nbsp;월 &nbsp;&nbsp;&nbsp;일 &nbsp;&nbsp;시 &nbsp;&nbsp;분</span>
								</div>
							</div>
						</div>
					</div>
					<div class="hce"
						style="left: 143.63mm; top: 17.51mm; width: 36.37mm; height: 13.59mm;">
						<div class="hcD" style="left: 1mm; top: 0.80mm;">
							<div class="hcI" style="top: 4.23mm;">
								<div class="hls ps22"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: -0.18mm; height: 5mm; width: 34.37mm;"></div>
							</div>
						</div>
					</div>
					<div class="hce"
						style="left: 0mm; top: 30.75mm; width: 74.81mm; height: 3.36mm;">
						<div class="hcD" style="left: 1mm; top: 0.80mm;">
							<div class="hcI">
								<div class="hls ps30"
									style="line-height: 1.31mm; white-space: nowrap; left: 0mm; top: -0.09mm; height: 1.76mm; width: 72.81mm;"></div>
							</div>
						</div>
					</div>
					<div class="hce"
						style="left: 74.81mm; top: 30.75mm; width: 68.82mm; height: 8.47mm;">
						<div class="hcD" style="left: 1mm; top: 0.80mm;">
							<div class="hcI" style="top: 1.67mm;">
								<div class="hls ps22"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: -0.18mm; height: 5mm; width: 66.82mm;">
									<span class="hrt cs12">&nbsp;&nbsp;인 수 자：
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;서명</span>
								</div>
							</div>
						</div>
					</div>
					<div class="hce"
						style="left: 143.63mm; top: 31.10mm; width: 36.37mm; height: 8.12mm;">
						<div class="hcD" style="left: 1mm; top: 0.80mm;">
							<div class="hcI" style="top: 1.50mm;">
								<div class="hls ps22"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: -0.18mm; height: 5mm; width: 34.37mm;"></div>
							</div>
						</div>
					</div>
					<div class="hce"
						style="left: 0mm; top: 34.11mm; width: 74.81mm; height: 17.12mm;">
						<div class="hcD" style="left: 1mm; top: 0.80mm;">
							<div class="hcI">
								<div class="hls ps31"
									style="line-height: 3.43mm; white-space: nowrap; left: 0mm; top: -0.21mm; height: 4.23mm; width: 72.81mm;">
									<span class="hrt cs27">※&nbsp;</span><span class="hrt cs28">차
										량 번 호</span><span class="hrt cs29">&nbsp;</span><span
										class="hrt cs27">:&nbsp;</span>
								</div>
								<div class="hls ps31"
									style="line-height: 3.43mm; white-space: nowrap; left: 0mm; top: 6.14mm; height: 4.23mm; width: 72.81mm;">
									<span class="hrt cs27">&nbsp;&nbsp;&nbsp;세관봉인번호 :&nbsp;</span>
								</div>
								<div class="hls ps22"
									style="line-height: 2.17mm; white-space: nowrap; left: 0mm; top: 12.56mm; height: 2.82mm; width: 72.81mm;">
									<span class="hrt cs30">&nbsp;* 반출전에 상기사항을 운전자가 기재할 것</span>
								</div>
							</div>
						</div>
					</div>
					<div class="hce"
						style="left: 74.81mm; top: 39.22mm; width: 68.82mm; height: 12.01mm;">
						<div class="hcD" style="left: 1mm; top: 0.80mm;">
							<div class="hcI" style="top: 3.44mm;">
								<div class="hls ps22"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: -0.18mm; height: 5mm; width: 66.82mm;">
									<span class="hrt cs12">&nbsp;&nbsp;</span><span
										class="hrt cs21">인계자(도착보고시) :&nbsp;</span><span
										class="hrt cs22">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span
										class="hrt cs21">서명</span>
								</div>
							</div>
						</div>
					</div>
					<div class="hce"
						style="left: 143.63mm; top: 39.22mm; width: 36.37mm; height: 12.01mm;">
						<div class="hcD" style="left: 1mm; top: 0.80mm;">
							<div class="hcI" style="top: 3.44mm;">
								<div class="hls ps22"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: -0.18mm; height: 5mm; width: 34.37mm;"></div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="htb"
		style="left: 10mm; width: 47.22mm; top: 10mm; height: 12.04mm;">
		<div class="hce"
			style="left: 0mm; top: 0mm; width: 11.13mm; height: 12.04mm;">
			<div class="hcD" style="left: 0mm; top: 0mm;">
				<div class="hcI">
					<div class="hls ps19"
						style="line-height: 12.04mm; white-space: nowrap; left: 0mm; top: 0mm; height: 12.04mm; width: 11.12mm;">
						<div class="hsR"
							style="top: 0mm; left: 0mm; margin-bottom: 0mm; margin-right: 0mm; width: 10mm; height: 12.04mm; display: inline-block; position: relative; vertical-align: middle; background-repeat: no-repeat; background-image: url('보세운송신고서_hd1.png');"></div>
					</div>
				</div>
			</div>
		</div>
		<div class="hce"
			style="left: 11.13mm; top: 0mm; width: 36.09mm; height: 6.02mm;">
			<div class="hcD" style="left: 0mm; top: 0mm;">
				<div class="hcI" style="top: 0.80mm;">
					<div class="hls ps20"
						style="line-height: 2.48mm; white-space: nowrap; left: 2.47mm; top: 1.08mm; height: 3.17mm; width: 33.61mm;">
						<span class="hrt cs9">대한민국세관</span>
					</div>
				</div>
			</div>
		</div>
		<div class="hce"
			style="left: 11.13mm; top: 6.02mm; width: 36.09mm; height: 6.02mm;">
			<div class="hcD" style="left: 0mm; top: 0mm;">
				<div class="hcI">
					<div class="hls ps20"
						style="line-height: 2.17mm; white-space: nowrap; left: 2.47mm; top: 1.09mm; height: 2.82mm; width: 33.61mm;">
						<span class="hrt cs10">KOREA CUSTOMS SERVICE</span>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>