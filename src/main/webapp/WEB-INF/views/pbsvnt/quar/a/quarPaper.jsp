<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<link href="/resources/css/theme.min.css" type="text/css"
	rel="stylesheet" id="style-default">
<script src="/resources/js/sweetalert2.min.js"></script>
<link rel="stylesheet" href="/resources/css/sweetalert2.min.css">
<script src="/resources/js/jquery.min.js"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<style type="text/css">
body {
	font-family: Arial, sans-serif;
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

.container {
	max-width: 985px;
	margin: 20px auto;
	padding: 20px;
	/* A4 용지 스타일의 외부 테두리 */
	border: 2px solid black; /* 테두리 두께와 색상 설정 */
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); /* 테두리에 그림자 효과 추가 */
	background-color: #ffffff; /* 배경색 설정 */
}

table {
	width: 100%;
	border-collapse: collapse;
	margin-top: 20px;
}

table, th, td {
	border: 1px solid black; /* 테이블 내부 셀의 테두리 설정 */
	padding: 10px;
	text-align: center;
}

.tg {
	border-collapse: collapse;
	border-spacing: 0;
}

table.tg {
	border: 2px solid black; /* 테이블의 바깥쪽 테두리 두께와 스타일 지정 */
}

.tg td {
	border-color: black;
	border-style: solid;
	border-width: 1px;
	font-family: Arial, sans-serif;
	font-size: 10px;
	overflow: hidden;
	padding: 10px 5px;
	word-break: normal;
}

.tg th {
	border-color: black;
	border-style: solid;
	border-width: 1px;
	font-family: Arial, sans-serif;
	font-size: 10px;
	font-weight: normal;
	overflow: hidden;
	padding: 10px 5px;
	word-break: normal;
}

.tg .tg-c7fd {
	border-color: #000000;
	font-size: 10px;
	font-weight: bold;
	text-align: center;
	vertical-align: middle
}

.tg .tg-j01z {
	border-color: #000000;
	font-weight: bold;
	text-align: center;
	vertical-align: middle
}

.tg .tg-xwyw {
	border-color: #000000;
	text-align: center;
	vertical-align: middle
}

.tg .tg-vhtn {
	background-color: #ffffff;
	border-color: #000000;
	text-align: center;
	vertical-align: middle
}

.button-container {
	display: flex;
	justify-content: flex-end;
	align-items: center;
	margin-top: 20px;
}

.button-container button {
	margin-right: 10px;
	cursor: pointer;
}
</style>
<script>
	window.onload = function() {
		
		    // jQuery를 사용하여 요소에 이벤트 핸들러를 등록합니다.
		    $('#downPDF').on('click', function() {
		        window.print();
		    });

		    // jQuery를 사용하여 userID 값을 가져옵니다.
		    let userID = $('#userID').val();

		    let btnSub = document.querySelector('#passButton');
		    let reBtnSub = document.querySelector('#rejectButton');
		    let submitButton = document.querySelector('#submitButton');

		        btnSub.style.display = 'none';
		        reBtnSub.style.display = 'none';
		        submitButton.style.display = 'none';

		    // userID가 정의되어 있고, 특정 문자열로 시작하는지 확인합니다.
		    if (userID && userID.startsWith('PUBL1')) {
		        // 해당 조건에 따라 버튼 표시
		        if (btnSub) {
		            btnSub.style.display = 'block';
		        }
		        if (reBtnSub) {
		            reBtnSub.style.display = 'block';
		        }
		    }

		    if (userID && userID.startsWith('PUBL2')) {
		        // 해당 조건에 따라 버튼 표시
		        if (submitButton) {
		            submitButton.style.display = 'block';
		        }

		        if (submitButton && submitButton.textContent.trim() === '제출') {
		            console.log("버튼 제출 확인");
		            $('#submitButton').on('click', function() {
		                // SweetAlert2 라이브러리를 사용하여 제출 성공 알림창 띄우기
		                Swal.fire({
		                    icon: 'success',
		                    title: '제출 성공',
		                    text: '제출을 성공했습니다.'
		                }).then((result) => {
		                    if (result.isConfirmed) {
		                        submitButton.style.display = 'none';
		                    }
		                });
		            });
		        }
		    };
		

		const queryString = window.location.search;
		const urlParams = new URLSearchParams(queryString);

		// qrantRequestCd 값 가져오기
		const entrManageNo = urlParams.get('entrManageNo');
		console.log("entrManageNo확인: ", entrManageNo);

		let data = {
			entrManageNo : entrManageNo
		};

		//결과서 입력

		$.ajax({
					url : "/cbs/quar/getQuarPaper",
					data : JSON.stringify(data),
					contentType : "application/json",
					type : "post",
					dataType : "json",
					success : function(result) {
						console.log("getQuarPaper 가져온 값 확인: ", result);
						console.log("getQuarPaper 가져온 값 length 확인: ",
								result.length);
						//console.log("thingNm 가져온 값 확인: ",thingNm[0].etThingList[0].thingNm);

						//기본정보 테이블
						document.getElementById('entrprsNm').innerText = result[0].entrprsNm;
						document.getElementById('charger').innerText = result[0].charger;
						document.getElementById('reprsntAdres').innerText = result[0].reprsntAdres;
						document.getElementById('entrManageNo').innerText = result[0].entrManageNo;
						document.getElementById('inspctDate').innerText = result[0].inspctDate;
						document.getElementById('inspctAgen').innerText = result[0].inspctAgen;
						document.getElementById('userNm').innerText = result[0].userNm;
						var a = 0;
						var b = 0;
						var c = 0;
						var d = 0;

						for (let i = 0; i < result.length; i++) {
							var qrantSe = result[i].qrantSe;
							console.log(result[i].qrantSe);
							console.log("result.length", result.length);
							let str = "";
							let qstr = "";
							

							if (qrantSe == 1) {
								a++;
								console.log("case1 실행");
								console.log("case1 실행 a값", a);
								if (a == 1) {

									qstr += "<tr><td class='tg-j01z'>■품목</td><td class='tg-xwyw' colspan='7'>"
											+ result[i].thingNm + "</td></tr>";
									qstr += "<tr>";
									qstr += "<td class='tg-j01z'>■검사 구분</td>";
									qstr += "<td class='tg-xwyw' colspan='3'>■정밀검사</td>";
									qstr += "<td class='tg-j01z'>■판정</td>";
									qstr += "<td class='tg-xwyw' colspan='3'>"
											+ result[i].allQrantJudg + "</td>";
									qstr += "</tr>";

									qstr += "<tr>";
									qstr += "<td class='tg-j01z'>①시험검사 항목명</td>";
									qstr += "<td class='tg-j01z'>②규격</td>";
									qstr += "<td class='tg-j01z'>③결과</td>";
									qstr += "<td class='tg-j01z'>④판정</td>";
									qstr += "<td class='tg-j01z' colspan='4'>⑤비고</td>";
									qstr += "</tr>";

									qstr += "<tr>";
									qstr += "<td class='tg-xwyw'>"
											+ result[i].qrantIemNm +"</td>";
									qstr += "<td class='tg-xwyw'>"
											+ result[i].inspctSpcfct + "</td>";
									qstr += "<td class='tg-xwyw'>"
											+ result[i].iemResult + "</td>";
									qstr += "<td class='tg-xwyw'>"
											+ result[i].iemJudg + "</td>";
									qstr += "<td class='tg-xwyw' colspan='4'></td>";
									qstr += "</tr>";
								} else if (a > 1) {
									if(result[i].thingNm == result[i-1].thingNm){
										
										qstr += "<tr>";
										qstr += "<td class='tg-xwyw'>"
												+ result[i].qrantIemNm +"</td>";
										qstr += "<td class='tg-xwyw'>"
												+ result[i].inspctSpcfct + "</td>";
										qstr += "<td class='tg-xwyw'>"
												+ result[i].iemResult + "</td>";
										qstr += "<td class='tg-xwyw'>"
												+ result[i].iemJudg + "</td>";
										qstr += "<td class='tg-xwyw' colspan='4'></td>";
										qstr += "</tr>";
									}else if(result[i].thingNm != result[i-1].thingNm){
										qstr += "<tr><td class='tg-j01z'>■품목</td><td class='tg-xwyw' colspan='7'>"
											+ result[i].thingNm + "</td></tr>";
										qstr += "<tr>";
										qstr += "<td class='tg-j01z'>■검사 구분</td>";
										qstr += "<td class='tg-xwyw' colspan='3'>■정밀검사</td>";
										qstr += "<td class='tg-j01z'>■판정</td>";
										qstr += "<td class='tg-xwyw' colspan='3'>"
												+ result[i].allQrantJudg + "</td>";
										qstr += "</tr>";
	
										qstr += "<tr>";
										qstr += "<td class='tg-j01z'>①시험검사 항목명</td>";
										qstr += "<td class='tg-j01z'>②규격</td>";
										qstr += "<td class='tg-j01z'>③결과</td>";
										qstr += "<td class='tg-j01z'>④판정</td>";
										qstr += "<td class='tg-j01z' colspan='4'>⑤비고</td>";
										qstr += "</tr>";
	
										qstr += "<tr>";
										qstr += "<td class='tg-xwyw'>"
												+ result[i].qrantIemNm +"</td>";
										qstr += "<td class='tg-xwyw'>"
												+ result[i].inspctSpcfct + "</td>";
										qstr += "<td class='tg-xwyw'>"
												+ result[i].iemResult + "</td>";
										qstr += "<td class='tg-xwyw'>"
												+ result[i].iemJudg + "</td>";
										qstr += "<td class='tg-xwyw' colspan='4'></td>";
										qstr += "</tr>";
									}
								}
							}

							if (qrantSe == 2) {
								qstr += "<tr><td class='tg-j01z'>■품목</td><td class='tg-xwyw' colspan='7'>"
										+ result[i].thingNm + "</td></tr>";
								qstr += "<tr>";
								qstr += "<td class='tg-j01z'>■검사 구분</td>";
								qstr += "<td class='tg-vhtn' colspan='3'>■관능검사</td>";
								qstr += "<td class='tg-j01z'>■판정</td>";
								qstr += "<td class='tg-xwyw' colspan='3'>"
										+ result[i].allQrantJudg + "</td>";
								qstr += "</tr>";
								qstr += "<tr>";
								qstr += "<td class='tg-j01z'>①포장상태</td>";
								qstr += "<td class='tg-j01z'>②물품 수량</td>";
								qstr += "<td class='tg-j01z'>③한글표시사항</td>";
								qstr += "<td class='tg-j01z'>④보존/보관상태</td>";
								qstr += "<td class='tg-j01z'>⑤육안검사</td>";
								qstr += "<td class='tg-j01z'>⑥부패/변질여부</td>";
								qstr += "<td class='tg-j01z'>⑦이물존재여부</td>";
								qstr += "<td class='tg-j01z'>⑧비고</td>";
								qstr += "</tr>";
								qstr += "<tr>";
								qstr += "<td class='tg-xwyw'>"
										+ result[i].packCondt + "</td>";
								qstr += "<td class='tg-xwyw'>"
										+ result[i].itmAmo + "</td>";
								qstr += "<td class='tg-xwyw'>"
										+ result[i].koreanIndictMatter
										+ "</td>";
								qstr += "<td class='tg-xwyw'>"
										+ result[i].cstdyCondt + "</td>";
								qstr += "<td class='tg-xwyw'>"
										+ result[i].visualAbnorWhet + "</td>";
								qstr += "<td class='tg-xwyw'>"
										+ result[i].decayDeteriWhet + "</td>";
								qstr += "<td class='tg-xwyw'>"
										+ result[i].impurWhet + "</td>";
								qstr += "<td class='tg-xwyw'>"
										+ result[i].inspctNote + "</td>";
								qstr += "<tr>";

							}

							if (qrantSe == 3) {
								qstr += "<tr><td class='tg-j01z'>■품목</td><td class='tg-xwyw' colspan='7'>"
										+ result[i].thingNm + "</td></tr>";
								qstr += "<tr>";
								qstr += "<td class='tg-j01z'>■검사 구분</td>";
								qstr += "<td class='tg-xwyw' colspan='3'>■임상검사</td>";
								qstr += "<td class='tg-j01z'>■판정</td>";
								qstr += "<td class='tg-xwyw' colspan='3'>"
										+ result[i].allQrantJudg + "</td>";
								qstr += "</tr>";
								qstr += "<tr>";
								qstr += "<td class='tg-j01z'>①행동 정상여부</td>";
								qstr += "<td class='tg-j01z'>②외부 증상</td>";
								qstr += "<td class='tg-j01z'>③해부학적 증상</td>";
								qstr += "<td class='tg-j01z' colspan='5'>④상세</td>";
								qstr += "</tr>";

								qstr += "<tr>";
								qstr += "<td class='tg-xwyw'>"
										+ result[i].actAbnorWhet + "</td>";
								qstr += "<td class='tg-xwyw'>"
										+ result[i].etpSymp + "</td>";
								qstr += "<td class='tg-xwyw'>"
										+ result[i].anatoSymp + "</td>";
								qstr += "<td class='tg-xwyw' colspan='5'>"
										+ result[i].detailCn + "</td>";
								qstr += "</tr>";

							}
							if (qrantSe == 12) {
								b++;
								console.log("case12 실행");
								console.log("case1 실행 b값", b);
								if (b == 1) {

									qstr += "<tr><td class='tg-j01z'>■품목</td><td class='tg-xwyw' colspan='7'>"
											+ result[i].thingNm + "</td></tr>";

									qstr += "<tr>";
									qstr += "<td class='tg-j01z'>■검사 구분</td>";
									qstr += "<td class='tg-vhtn' colspan='3'>■관능검사</td>";
									qstr += "<td class='tg-j01z'>■판정</td>";
									qstr += "<td class='tg-xwyw' colspan'3'></td>";
									qstr += "</tr>";
									qstr += "<tr>";
									qstr += "<td class='tg-j01z'>①포장상태</td>";
									qstr += "<td class='tg-j01z'>②물품 수량</td>";
									qstr += "<td class='tg-j01z'>③한글표시사항</td>";
									qstr += "<td class='tg-j01z'>④보존/보관상태</td>";
									qstr += "<td class='tg-j01z'>⑤육안검사</td>";
									qstr += "<td class='tg-j01z'>⑥부패/변질여부</td>";
									qstr += "<td class='tg-j01z'>⑦이물존재여부</td>";
									qstr += "<td class='tg-j01z'>⑧비고</td>";
									qstr += "</tr>";
									qstr += "<tr>";
									qstr += "<td class='tg-xwyw'>"
											+ result[i].packCondt + "</td>";
									qstr += "<td class='tg-xwyw'>"
											+ result[i].itmAmo + "</td>";
									qstr += "<td class='tg-xwyw'>"
											+ result[i].koreanIndictMatter
											+ "</td>";
									qstr += "<td class='tg-xwyw'>"
											+ result[i].cstdyCondt + "</td>";
									qstr += "<td class='tg-xwyw'>"
											+ result[i].visualAbnorWhet
											+ "</td>";
									qstr += "<td class='tg-xwyw'>"
											+ result[i].decayDeteriWhet
											+ "</td>";
									qstr += "<td class='tg-xwyw'>"
											+ result[i].impurWhet + "</td>";
									qstr += "<td class='tg-xwyw'>"
											+ result[i].inspctNote + "</td>";
									qstr += "<tr>";
									qstr += "<tr>";
									qstr += "<td class='tg-j01z'>■검사 구분</td>";
									qstr += "<td class='tg-xwyw' colspan='3'>■정밀검사</td>";
									qstr += "<td class='tg-j01z'>■판정</td>";
									qstr += "<td class='tg-xwyw' colspan='3'>"
											+ result[i].allQrantJudg + "</td>";
									qstr += "</tr>";

									qstr += "<tr>";
									qstr += "<td class='tg-j01z'>①시험검사 항목명</td>";
									qstr += "<td class='tg-j01z'>②규격</td>";
									qstr += "<td class='tg-j01z'>③결과</td>";
									qstr += "<td class='tg-j01z'>④판정</td>";
									qstr += "<td class='tg-j01z' colspan='4'>⑤비고</td>";
									qstr += "</tr>";

									qstr += "<tr>";
									qstr += "<td class='tg-xwyw'>"
											+ result[i].qrantIemNm +"</td>";
									qstr += "<td class='tg-xwyw'>"
											+ result[i].inspctSpcfct + "</td>";
									qstr += "<td class='tg-xwyw'>"
											+ result[i].iemResult + "</td>";
									qstr += "<td class='tg-xwyw'>"
											+ result[i].iemJudg + "</td>";
									qstr += "<td class='tg-xwyw' colspan='4'></td>";
									qstr += "</tr>";
								} else if (b > 1) {
									if(result[i].thingNm == result[i-1].thingNm){
										
										qstr += "<tr>";
										qstr += "<td class='tg-xwyw'>"
												+ result[i].qrantIemNm +"</td>";
										qstr += "<td class='tg-xwyw'>"
												+ result[i].inspctSpcfct + "</td>";
										qstr += "<td class='tg-xwyw'>"
												+ result[i].iemResult + "</td>";
										qstr += "<td class='tg-xwyw'>"
												+ result[i].iemJudg + "</td>";
										qstr += "<td class='tg-xwyw' colspan='4'></td>";
										qstr += "</tr>";
									}else if(result[i].thingNm != result[i-1].thingNm){
										qstr += "<tr><td class='tg-j01z'>■품목</td><td class='tg-xwyw' colspan='7'>"
											+ result[i].thingNm + "</td></tr>";
	
										qstr += "<tr>";
										qstr += "<td class='tg-j01z'>■검사 구분</td>";
										qstr += "<td class='tg-vhtn' colspan='3'>■관능검사</td>";
										qstr += "<td class='tg-j01z'>■판정</td>";
										qstr += "<td class='tg-xwyw' colspan'3'></td>";
										qstr += "</tr>";
										qstr += "<tr>";
										qstr += "<td class='tg-j01z'>①포장상태</td>";
										qstr += "<td class='tg-j01z'>②물품 수량</td>";
										qstr += "<td class='tg-j01z'>③한글표시사항</td>";
										qstr += "<td class='tg-j01z'>④보존/보관상태</td>";
										qstr += "<td class='tg-j01z'>⑤육안검사</td>";
										qstr += "<td class='tg-j01z'>⑥부패/변질여부</td>";
										qstr += "<td class='tg-j01z'>⑦이물존재여부</td>";
										qstr += "<td class='tg-j01z'>⑧비고</td>";
										qstr += "</tr>";
										qstr += "<tr>";
										qstr += "<td class='tg-xwyw'>"
												+ result[i].packCondt + "</td>";
										qstr += "<td class='tg-xwyw'>"
												+ result[i].itmAmo + "</td>";
										qstr += "<td class='tg-xwyw'>"
												+ result[i].koreanIndictMatter
												+ "</td>";
										qstr += "<td class='tg-xwyw'>"
												+ result[i].cstdyCondt + "</td>";
										qstr += "<td class='tg-xwyw'>"
												+ result[i].visualAbnorWhet
												+ "</td>";
										qstr += "<td class='tg-xwyw'>"
												+ result[i].decayDeteriWhet
												+ "</td>";
										qstr += "<td class='tg-xwyw'>"
												+ result[i].impurWhet + "</td>";
										qstr += "<td class='tg-xwyw'>"
												+ result[i].inspctNote + "</td>";
										qstr += "<tr>";
										qstr += "<tr>";
										qstr += "<td class='tg-j01z'>■검사 구분</td>";
										qstr += "<td class='tg-xwyw' colspan='3'>■정밀검사</td>";
										qstr += "<td class='tg-j01z'>■판정</td>";
										qstr += "<td class='tg-xwyw' colspan='3'>"
												+ result[i].allQrantJudg + "</td>";
										qstr += "</tr>";
	
										qstr += "<tr>";
										qstr += "<td class='tg-j01z'>①시험검사 항목명</td>";
										qstr += "<td class='tg-j01z'>②규격</td>";
										qstr += "<td class='tg-j01z'>③결과</td>";
										qstr += "<td class='tg-j01z'>④판정</td>";
										qstr += "<td class='tg-j01z' colspan='4'>⑤비고</td>";
										qstr += "</tr>";
	
										qstr += "<tr>";
										qstr += "<td class='tg-xwyw'>"
												+ result[i].qrantIemNm +"</td>";
										qstr += "<td class='tg-xwyw'>"
												+ result[i].inspctSpcfct + "</td>";
										qstr += "<td class='tg-xwyw'>"
												+ result[i].iemResult + "</td>";
										qstr += "<td class='tg-xwyw'>"
												+ result[i].iemJudg + "</td>";
										qstr += "<td class='tg-xwyw' colspan='4'></td>";
										qstr += "</tr>";
									}
								}

							}
							if (qrantSe == 13) {
								c++;
								console.log("case13 실행");
								console.log("case13 실행 c값", c);
								if (c == 1) {

									qstr += "<tr><td class='tg-j01z'>■품목</td><td class='tg-xwyw' colspan='7'>"
											+ result[i].thingNm + "</td></tr>";

									qstr += "<tr>";
									qstr += "<td class='tg-j01z'>■검사 구분</td>";
									qstr += "<td class='tg-xwyw' colspan='3'>■임상검사</td>";
									qstr += "<td class='tg-j01z'>■판정</td>";
									qstr += "<td class='tg-xwyw' colspan='3'>"
											+ result[i].allQrantJudg + "</td>";
									qstr += "</tr>";
									qstr += "<tr>";
									qstr += "<td class='tg-j01z'>①행동 정상여부</td>";
									qstr += "<td class='tg-j01z'>②외부 증상</td>";
									qstr += "<td class='tg-j01z'>③해부학적 증상</td>";
									qstr += "<td class='tg-j01z' colspan='5'>④상세</td>";
									qstr += "</tr>";

									qstr += "<tr>";
									qstr += "<td class='tg-xwyw'>"
											+ result[i].actAbnorWhet + "</td>";
									qstr += "<td class='tg-xwyw'>"
											+ result[i].etpSymp + "</td>";
									qstr += "<td class='tg-xwyw'>"
											+ result[i].anatoSymp + "</td>";
									qstr += "<td class='tg-xwyw' colspan='5'>"
											+ result[i].detailCn + "</td>";
									qstr += "</tr>";

									qstr += "<tr>";
									qstr += "<td class='tg-j01z'>■검사 구분</td>";
									qstr += "<td class='tg-xwyw' colspan='3'>■정밀검사</td>";
									qstr += "<td class='tg-j01z'>■판정</td>";
									qstr += "<td class='tg-xwyw' colspan='3'>"
											+ result[i].allQrantJudg + "</td>";
									qstr += "</tr>";

									qstr += "<tr>";
									qstr += "<td class='tg-j01z'>①시험검사 항목명</td>";
									qstr += "<td class='tg-j01z'>②규격</td>";
									qstr += "<td class='tg-j01z'>③결과</td>";
									qstr += "<td class='tg-j01z'>④판정</td>";
									qstr += "<td class='tg-j01z' colspan='4'>⑤비고</td>";
									qstr += "</tr>";

									qstr += "<tr>";
									qstr += "<td class='tg-xwyw'>"
											+ result[i].qrantIemNm +"</td>";
									qstr += "<td class='tg-xwyw'>"
											+ result[i].inspctSpcfct + "</td>";
									qstr += "<td class='tg-xwyw'>"
											+ result[i].iemResult + "</td>";
									qstr += "<td class='tg-xwyw'>"
											+ result[i].iemJudg + "</td>";
									qstr += "<td class='tg-xwyw' colspan='4'></td>";
									qstr += "</tr>";
								} else if (c > 1) {
									console.log("13 c>1실행")
									if(result[i].thingNm == result[i-1].thingNm){
										
										qstr += "<tr>";
										qstr += "<td class='tg-xwyw'>"
												+ result[i].qrantIemNm +"</td>";
										qstr += "<td class='tg-xwyw'>"
												+ result[i].inspctSpcfct + "</td>";
										qstr += "<td class='tg-xwyw'>"
												+ result[i].iemResult + "</td>";
										qstr += "<td class='tg-xwyw'>"
												+ result[i].iemJudg + "</td>";
										qstr += "<td class='tg-xwyw' colspan='4'></td>";
										qstr += "</tr>";
									}else if(result[i].thingNm != result[i-1].thingNm){
										qstr += "<tr><td class='tg-j01z'>■품목</td><td class='tg-xwyw' colspan='7'>"
											+ result[i].thingNm + "</td></tr>";

										qstr += "<tr>";
										qstr += "<td class='tg-j01z'>■검사 구분</td>";
										qstr += "<td class='tg-xwyw' colspan='3'>■임상검사</td>";
										qstr += "<td class='tg-j01z'>■판정</td>";
										qstr += "<td class='tg-xwyw' colspan='3'>"
												+ result[i].allQrantJudg + "</td>";
										qstr += "</tr>";
										qstr += "<tr>";
										qstr += "<td class='tg-j01z'>①행동 정상여부</td>";
										qstr += "<td class='tg-j01z'>②외부 증상</td>";
										qstr += "<td class='tg-j01z'>③해부학적 증상</td>";
										qstr += "<td class='tg-j01z' colspan='5'>④상세</td>";
										qstr += "</tr>";
	
										qstr += "<tr>";
										qstr += "<td class='tg-xwyw'>"
												+ result[i].actAbnorWhet + "</td>";
										qstr += "<td class='tg-xwyw'>"
												+ result[i].etpSymp + "</td>";
										qstr += "<td class='tg-xwyw'>"
												+ result[i].anatoSymp + "</td>";
										qstr += "<td class='tg-xwyw' colspan='5'>"
												+ result[i].detailCn + "</td>";
										qstr += "</tr>";
	
										qstr += "<tr>";
										qstr += "<td class='tg-j01z'>■검사 구분</td>";
										qstr += "<td class='tg-xwyw' colspan='3'>■정밀검사</td>";
										qstr += "<td class='tg-j01z'>■판정</td>";
										qstr += "<td class='tg-xwyw' colspan='3'>"
												+ result[i].allQrantJudg + "</td>";
										qstr += "</tr>";
	
										qstr += "<tr>";
										qstr += "<td class='tg-j01z'>①시험검사 항목명</td>";
										qstr += "<td class='tg-j01z'>②규격</td>";
										qstr += "<td class='tg-j01z'>③결과</td>";
										qstr += "<td class='tg-j01z'>④판정</td>";
										qstr += "<td class='tg-j01z' colspan='4'>⑤비고</td>";
										qstr += "</tr>";
	
										qstr += "<tr>";
										qstr += "<td class='tg-xwyw'>"
												+ result[i].qrantIemNm +"</td>";
										qstr += "<td class='tg-xwyw'>"
												+ result[i].inspctSpcfct + "</td>";
										qstr += "<td class='tg-xwyw'>"
												+ result[i].iemResult + "</td>";
										qstr += "<td class='tg-xwyw'>"
												+ result[i].iemJudg + "</td>";
										qstr += "<td class='tg-xwyw' colspan='4'></td>";
										qstr += "</tr>";
									}
									console.log("13 c>1실행완료")
								}

							}
							if (qrantSe == 123) {
								d++;
								console.log("case123 실행");
								console.log("case1 실행 d값", d);
								if (d == 1) {

									qstr += "<tr><td class='tg-j01z'>■품목</td><td class='tg-xwyw' colspan='7'>"
											+ result[i].thingNm + "</td></tr>";

									qstr += "<tr>";
									qstr += "<td class='tg-j01z'>■검사 구분</td>";
									qstr += "<td class='tg-vhtn' colspan='3'>■관능검사</td>";
									qstr += "<td class='tg-j01z'>■판정</td>";
									qstr += "<td class='tg-xwyw' colspan'3'></td>";
									qstr += "</tr>";
									qstr += "<tr>";
									qstr += "<td class='tg-j01z'>①포장상태</td>";
									qstr += "<td class='tg-j01z'>②물품 수량</td>";
									qstr += "<td class='tg-j01z'>③한글표시사항</td>";
									qstr += "<td class='tg-j01z'>④보존/보관상태</td>";
									qstr += "<td class='tg-j01z'>⑤육안검사</td>";
									qstr += "<td class='tg-j01z'>⑥부패/변질여부</td>";
									qstr += "<td class='tg-j01z'>⑦이물존재여부</td>";
									qstr += "<td class='tg-j01z'>⑧비고</td>";
									qstr += "</tr>";
									qstr += "<tr>";
									qstr += "<td class='tg-xwyw'>"
											+ result[i].packCondt + "</td>";
									qstr += "<td class='tg-xwyw'>"
											+ result[i].itmAmo + "</td>";
									qstr += "<td class='tg-xwyw'>"
											+ result[i].koreanIndictMatter
											+ "</td>";
									qstr += "<td class='tg-xwyw'>"
											+ result[i].cstdyCondt + "</td>";
									qstr += "<td class='tg-xwyw'>"
											+ result[i].visualAbnorWhet
											+ "</td>";
									qstr += "<td class='tg-xwyw'>"
											+ result[i].decayDeteriWhet
											+ "</td>";
									qstr += "<td class='tg-xwyw'>"
											+ result[i].impurWhet + "</td>";
									qstr += "<td class='tg-xwyw'>"
											+ result[i].inspctNote + "</td>";
									qstr += "<tr>";

									qstr += "<tr>";
									qstr += "<td class='tg-j01z'>■검사 구분</td>";
									qstr += "<td class='tg-xwyw' colspan='3'>■임상검사</td>";
									qstr += "<td class='tg-j01z'>■판정</td>";
									qstr += "<td class='tg-xwyw' colspan='3'>"
											+ result[i].allQrantJudg + "</td>";
									qstr += "</tr>";
									qstr += "<tr>";
									qstr += "<td class='tg-j01z'>①행동 정상여부</td>";
									qstr += "<td class='tg-j01z'>②외부 증상</td>";
									qstr += "<td class='tg-j01z'>③해부학적 증상</td>";
									qstr += "<td class='tg-j01z' colspan='5'>④상세</td>";
									qstr += "</tr>";

									qstr += "<tr>";
									qstr += "<td class='tg-xwyw'>"
											+ result[i].actAbnorWhet + "</td>";
									qstr += "<td class='tg-xwyw'>"
											+ result[i].etpSymp + "</td>";
									qstr += "<td class='tg-xwyw'>"
											+ result[i].anatoSymp + "</td>";
									qstr += "<td class='tg-xwyw' colspan='5'>"
											+ result[i].detailCn + "</td>";
									qstr += "</tr>";

									qstr += "<tr>";
									qstr += "<td class='tg-j01z'>■검사 구분</td>";
									qstr += "<td class='tg-xwyw' colspan='3'>■정밀검사</td>";
									qstr += "<td class='tg-j01z'>■판정</td>";
									qstr += "<td class='tg-xwyw' colspan='3'>"
											+ result[i].allQrantJudg + "</td>";
									qstr += "</tr>";

									qstr += "<tr>";
									qstr += "<td class='tg-j01z'>①시험검사 항목명</td>";
									qstr += "<td class='tg-j01z'>②규격</td>";
									qstr += "<td class='tg-j01z'>③결과</td>";
									qstr += "<td class='tg-j01z'>④판정</td>";
									qstr += "<td class='tg-j01z' colspan='4'>⑤비고</td>";
									qstr += "</tr>";

									qstr += "<tr>";
									qstr += "<td class='tg-xwyw'>"
											+ result[i].qrantIemNm +"</td>";
									qstr += "<td class='tg-xwyw'>"
											+ result[i].inspctSpcfct + "</td>";
									qstr += "<td class='tg-xwyw'>"
											+ result[i].iemResult + "</td>";
									qstr += "<td class='tg-xwyw'>"
											+ result[i].iemJudg + "</td>";
									qstr += "<td class='tg-xwyw' colspan='4'></td>";
									qstr += "</tr>";
								} else if (d > 1) {
									if(result[i].thingNm == result[i-1].thingNm){
										
										qstr += "<tr>";
										qstr += "<td class='tg-xwyw'>"
												+ result[i].qrantIemNm +"</td>";
										qstr += "<td class='tg-xwyw'>"
												+ result[i].inspctSpcfct + "</td>";
										qstr += "<td class='tg-xwyw'>"
												+ result[i].iemResult + "</td>";
										qstr += "<td class='tg-xwyw'>"
												+ result[i].iemJudg + "</td>";
										qstr += "<td class='tg-xwyw' colspan='4'></td>";
										qstr += "</tr>";
									}else if(result[i].thingNm !=result[i-1].thingNm){
										
										qstr += "<tr><td class='tg-j01z'>■품목</td><td class='tg-xwyw' colspan='7'>"
												+ result[i].thingNm + "</td></tr>";
	
										qstr += "<tr>";
										qstr += "<td class='tg-j01z'>■검사 구분</td>";
										qstr += "<td class='tg-vhtn' colspan='3'>■관능검사</td>";
										qstr += "<td class='tg-j01z'>■판정</td>";
										qstr += "<td class='tg-xwyw' colspan'3'></td>";
										qstr += "</tr>";
										qstr += "<tr>";
										qstr += "<td class='tg-j01z'>①포장상태</td>";
										qstr += "<td class='tg-j01z'>②물품 수량</td>";
										qstr += "<td class='tg-j01z'>③한글표시사항</td>";
										qstr += "<td class='tg-j01z'>④보존/보관상태</td>";
										qstr += "<td class='tg-j01z'>⑤육안검사</td>";
										qstr += "<td class='tg-j01z'>⑥부패/변질여부</td>";
										qstr += "<td class='tg-j01z'>⑦이물존재여부</td>";
										qstr += "<td class='tg-j01z'>⑧비고</td>";
										qstr += "</tr>";
										qstr += "<tr>";
										qstr += "<td class='tg-xwyw'>"
												+ result[i].packCondt + "</td>";
										qstr += "<td class='tg-xwyw'>"
												+ result[i].itmAmo + "</td>";
										qstr += "<td class='tg-xwyw'>"
												+ result[i].koreanIndictMatter
												+ "</td>";
										qstr += "<td class='tg-xwyw'>"
												+ result[i].cstdyCondt + "</td>";
										qstr += "<td class='tg-xwyw'>"
												+ result[i].visualAbnorWhet
												+ "</td>";
										qstr += "<td class='tg-xwyw'>"
												+ result[i].decayDeteriWhet
												+ "</td>";
										qstr += "<td class='tg-xwyw'>"
												+ result[i].impurWhet + "</td>";
										qstr += "<td class='tg-xwyw'>"
												+ result[i].inspctNote + "</td>";
										qstr += "<tr>";
	
										qstr += "<tr>";
										qstr += "<td class='tg-j01z'>■검사 구분</td>";
										qstr += "<td class='tg-xwyw' colspan='3'>■임상검사</td>";
										qstr += "<td class='tg-j01z'>■판정</td>";
										qstr += "<td class='tg-xwyw' colspan='3'>"
												+ result[i].allQrantJudg + "</td>";
										qstr += "</tr>";
										qstr += "<tr>";
										qstr += "<td class='tg-j01z'>①행동 정상여부</td>";
										qstr += "<td class='tg-j01z'>②외부 증상</td>";
										qstr += "<td class='tg-j01z'>③해부학적 증상</td>";
										qstr += "<td class='tg-j01z' colspan='5'>④상세</td>";
										qstr += "</tr>";
	
										qstr += "<tr>";
										qstr += "<td class='tg-xwyw'>"
												+ result[i].actAbnorWhet + "</td>";
										qstr += "<td class='tg-xwyw'>"
												+ result[i].etpSymp + "</td>";
										qstr += "<td class='tg-xwyw'>"
												+ result[i].anatoSymp + "</td>";
										qstr += "<td class='tg-xwyw' colspan='5'>"
												+ result[i].detailCn + "</td>";
										qstr += "</tr>";
	
										qstr += "<tr>";
										qstr += "<td class='tg-j01z'>■검사 구분</td>";
										qstr += "<td class='tg-xwyw' colspan='3'>■정밀검사</td>";
										qstr += "<td class='tg-j01z'>■판정</td>";
										qstr += "<td class='tg-xwyw' colspan='3'>"
												+ result[i].allQrantJudg + "</td>";
										qstr += "</tr>";
	
										qstr += "<tr>";
										qstr += "<td class='tg-j01z'>①시험검사 항목명</td>";
										qstr += "<td class='tg-j01z'>②규격</td>";
										qstr += "<td class='tg-j01z'>③결과</td>";
										qstr += "<td class='tg-j01z'>④판정</td>";
										qstr += "<td class='tg-j01z' colspan='4'>⑤비고</td>";
										qstr += "</tr>";
	
										qstr += "<tr>";
										qstr += "<td class='tg-xwyw'>"
												+ result[i].qrantIemNm +"</td>";
										qstr += "<td class='tg-xwyw'>"
												+ result[i].inspctSpcfct + "</td>";
										qstr += "<td class='tg-xwyw'>"
												+ result[i].iemResult + "</td>";
										qstr += "<td class='tg-xwyw'>"
												+ result[i].iemJudg + "</td>";
										qstr += "<td class='tg-xwyw' colspan='4'></td>";
										qstr += "</tr>";
									}
								}

							}
							if (qrantSe == 23) {
								qstr += "<tr><td class='tg-j01z'>■품목</td><td class='tg-xwyw' colspan='7'>"
										+ result[i].thingNm + "</td></tr>";

								qstr += "<tr>";
								qstr += "<td class='tg-j01z'>■검사 구분</td>";
								qstr += "<td class='tg-vhtn' colspan='3'>■관능검사</td>";
								qstr += "<td class='tg-j01z'>■판정</td>";
								qstr += "<td class='tg-xwyw' colspan='3'>"
										+ result[i].allQrantJudg + "</td>";
								qstr += "</tr>";
								qstr += "<tr>";
								qstr += "<td class='tg-j01z'>①포장상태</td>";
								qstr += "<td class='tg-j01z'>②물품 수량</td>";
								qstr += "<td class='tg-j01z'>③한글표시사항</td>";
								qstr += "<td class='tg-j01z'>④보존/보관상태</td>";
								qstr += "<td class='tg-j01z'>⑤육안검사</td>";
								qstr += "<td class='tg-j01z'>⑥부패/변질여부</td>";
								qstr += "<td class='tg-j01z'>⑦이물존재여부</td>";
								qstr += "<td class='tg-j01z'>⑧비고</td>";
								qstr += "</tr>";
								qstr += "<tr>";
								qstr += "<td class='tg-xwyw'>"
										+ result[i].packCondt + "</td>";
								qstr += "<td class='tg-xwyw'>"
										+ result[i].itmAmo + "</td>";
								qstr += "<td class='tg-xwyw'>"
										+ result[i].koreanIndictMatter
										+ "</td>";
								qstr += "<td class='tg-xwyw'>"
										+ result[i].cstdyCondt + "</td>";
								qstr += "<td class='tg-xwyw'>"
										+ result[i].visualAbnorWhet + "</td>";
								qstr += "<td class='tg-xwyw'>"
										+ result[i].decayDeteriWhet + "</td>";
								qstr += "<td class='tg-xwyw'>"
										+ result[i].impurWhet + "</td>";
								qstr += "<td class='tg-xwyw'>"
										+ result[i].inspctNote + "</td>";
								qstr += "<tr>";

								qstr += "<tr>";
								qstr += "<td class='tg-j01z'>■검사 구분</td>";
								qstr += "<td class='tg-xwyw' colspan='3'>■임상검사</td>";
								qstr += "<td class='tg-j01z'>■판정</td>";
								qstr += "<td class='tg-xwyw' colspan='3'>"
										+ result[i].allQrantJudg + "</td>";
								qstr += "</tr>";
								qstr += "<tr>";
								qstr += "<td class='tg-j01z'>①행동 정상여부</td>";
								qstr += "<td class='tg-j01z'>②외부 증상</td>";
								qstr += "<td class='tg-j01z'>③해부학적 증상</td>";
								qstr += "<td class='tg-j01z' colspan='5'>④상세</td>";
								qstr += "</tr>";

								qstr += "<tr>";
								qstr += "<td class='tg-xwyw'>"
										+ result[i].actAbnorWhet + "</td>";
								qstr += "<td class='tg-xwyw'>"
										+ result[i].etpSymp + "</td>";
								qstr += "<td class='tg-xwyw'>"
										+ result[i].anatoSymp + "</td>";
								qstr += "<td class='tg-xwyw' colspan='5'>"
										+ result[i].detailCn + "</td>";
								qstr += "</tr>";
							}

							$("#namePlace" + i).html(qstr);

						}

					}
				});
		
		// 한봄 (승인 버튼 클릭시)
		$("#passButton").on("click", function() {
			Swal.fire({
      		  title: "검역을 승인하시겠습니까?",
      		  icon: "warning",
      		  showCancelButton: true,
      		  confirmButtonColor: "#3085d6",
      		  cancelButtonColor: "#d33",
      		  confirmButtonText: "예",
      		  cancleButtonText: "취소"
      		}).then((result) => {
      		  if (result.isConfirmed) {
      			$.ajax ({ 
    				method: "post",
    		    	url: "/cbs/svntAdmin/quarPassEps8upd",
    		    	data: JSON.stringify(data),
    		    	contentType: "application/json",
    		    	dataType: "json",
    		    	async: false,
    		    	success: function(result) {
    		    		Swal.fire({
							title: "검역 승인이 완료되었습니다.",
                		    icon: "success"
                		  }).then(function(result) {
                			  window.close();
                			  window.location.reload();
                		  });
    		    	}
    			});
      		  }
      		});
		});

	}
</script>
<nav style="margin-bottom: 10px; margin-left: 20px;">
	<button type="button" class="btn btn-primary btn-sm"
		style="height: auto;" id="downPDF">PDF다운</button>
</nav>
<div class="container">
	<p style="text-align: center; font-size: 30px;">검역 검사서</p>
	<sec:authorize access="isAuthenticated()">
		<sec:authentication property="principal.userVO" var="user" />
		<input type="hidden" id="userID"
			value="<sec:authentication property='principal.username'/>">
	</sec:authorize>
	<br>
	<table class="tg" style="table-layout: fixed; width: 938px">
		<colgroup>
			<col style="width: 131px">
			<col style="width: 133px">
			<col style="width: 118px">
			<col style="width: 132px">
			<col style="width: 129px">
			<col style="width: 108px">
			<col style="width: 111px">
			<col style="width: 76px">
		</colgroup>
		<thead>
			<tr>
				<th class="tg-c7fd" rowspan="2">■수입 신고인<br>(수입 화주)
				</th>
				<th class="tg-j01z">■상호</th>
				<th class="tg-xwyw" colspan="2" id="entrprsNm"></th>
				<th class="tg-j01z">■대표자</th>
				<th class="tg-vhtn" colspan="3" id="charger"></th>
			</tr>
			<tr>
				<th class="tg-j01z">■주소</th>
				<th class="tg-xwyw" colspan="6" id="reprsntAdres"></th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td class="tg-j01z">■통관관리번호</td>
				<td class="tg-xwyw" colspan="3" id="entrManageNo"></td>
				<td class="tg-j01z">■검역일자</td>
				<td class="tg-xwyw" colspan="3" id="inspctDate"></td>
			</tr>
			<tr>
				<td class="tg-j01z">■검역기관</td>
				<td class="tg-xwyw" colspan="3" id="inspctAgen"></td>
				<td class="tg-j01z">■검역 담당자</td>
				<td class="tg-xwyw" colspan="3" id="userNm"></td>
			</tr>
		</tbody>

		<tbody id=namePlace0>

		</tbody>
		<tbody id=namePlace1>

		</tbody>
		<tbody id=namePlace2>

		</tbody>
		<tbody id=namePlace3>

		</tbody>
		<tbody id=namePlace4>

		</tbody>
		<tbody id=namePlace5>

		</tbody>
		<tbody id=namePlace6>

		</tbody>
		<tbody id=namePlace7>

		</tbody>
		<tbody id=namePlace8>

		</tbody>
		<tbody id=namePlace9>

		</tbody>
		<tbody id=namePlace10>

		</tbody>
		<tbody id=namePlace11>

		</tbody>
	</table>
</div>
<div class="button-container">
	<!-- 미승인 버튼 -->
	<button class="btn btn-primary me-1 mb-1" type="button"
		id="submitButton">제출</button>
	<button class="btn btn-primary me-1 mb-1" type="button" id="passButton">승인</button>
	<button class="btn btn-warning me-1 mb-1" type="button"
		id="rejectButton">미승인</button>
	<!-- 제출 버튼 -->
</div>