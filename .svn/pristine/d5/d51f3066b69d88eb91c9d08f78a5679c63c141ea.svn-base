<%@ page contentType="text/html;charset=UTF-8" language="java" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<!DOCTYPE html>
		<html>

		<head>
			<meta charset="UTF-8">
			<title>Document</title>
		</head>

		<body>
			<script>
				window.onload = function () {
					updateData();
				}
				const next = function () {
					console.log("결과 체크:next");
					First = First + 4;
					Last = Last + 4;
					console.log("First : ", First);
					console.log("Last : ", Last);
					const prevdi = document.getElementById('prev');
					prevdi.disabled = false;
					if (Last > 23) {
						First = 18;
						Last = 22;
						const nextdi = document.getElementById('next');
						nextdi.disabled = true;
					}
					updateData();
				}
				const prev = function () {
					console.log("결과 체크:prev");
					// 이전 페이지로 이동할 때 처리
					if (First <= 5 || Last <= 0) {
						const prevdi = document.getElementById('prev');
						prevdi.disabled = true;
						First = 0;
						Last = 4;
					} else {
						First = First - 4;
						Last = Last - 4;
						console.log("First : ", First);
						console.log("Last : ", Last);
						const nextdi = document.getElementById('next');
						nextdi.disabled = false;
					}
					updateData();
				}
                
                let First = 0;
                let Last = 4;
                let authkey = "Rb5gNIVrjtJhAxBzrB9r3XbGqAEuvnbw";
                let data = "AP01"; // AP01 : 환율, AP02 : 대출금리, AP03 : 국제금리
                // 파라미터로 보낼 현재 시점의 날짜 구하기
                let today = new Date();
                let dayOfWeek = today.getDay(); // 현재 요일을 가져옵니다. (0: 일요일, 1: 월요일, ..., 6: 토요일)

                // 만약 오늘이 토요일(6)이면 날짜를 하루 전으로 변경합니다.
                if (dayOfWeek === 6) {
                    today.setDate(today.getDate() - 1);
                }
                // 만약 오늘이 일요일(0)이면 날짜를 이틀 전으로 변경합니다.
                else if (dayOfWeek === 0) {
                    today.setDate(today.getDate() - 2);
                }

                // 변경된 날짜를 이용하여 년, 월, 일을 구합니다.
                let year = today.getFullYear();
                let month = ("0" + (today.getMonth() + 1)).slice(-2);
                let day = ("0" + today.getDate()).slice(-2);
                let searchdate = year + "" + month + "" + "08";

                console.log(authkey);
                console.log(data);
                console.log(searchdate);
                console.log(day);
                let url = "https://www.koreaexim.go.kr/site/program/financial/exchangeJSON?authkey="
                    + authkey + "&searchdate=" + searchdate + "&data=" + data + "";
                console.log("url : ", url);
				function updateData() {
                    
					let xhr = new XMLHttpRequest();
					xhr.open("get", url, true);
					xhr.onreadystatechange = function () {
						if (xhr.readyState == 4 && xhr.status == 200) {
							var rows = JSON.parse(xhr.responseText)
							total = rows.length;
							console.log("rows", rows);
							var tbStr = "";
							tbStr += " <thead>";
							tbStr += "<td>" + year + "년 " + month + "월 " + day
								+ "일 기준</td>";
							tbStr += "<tr>";
							tbStr += "<th class='border-top border-translucent ps-0 align-middle' scope='col' data-sort='country' style='width:32%'>통화코드</th>";
							tbStr += "<th class='border-top border-translucent align-middle' scope='col' data-sort='users' style='width:17%'>국가/통화명</th>";
							tbStr += "<th class='border-top border-translucent text-end align-middle' scope='col' data-sort='transactions' style='width:16%'>전신환(송금)받으실때</th>";
							tbStr += "<th class='border-top border-translucent text-end align-middle' scope='col' data-sort='revenue' style='width:20%'>전신환(송금)보내실때</th>";
							tbStr += "</tr></thead>";

							for (var i = First; i <= Last; i++) {
								// CUR_UNIT : 통화코드, CUR_NM :  국가/통화명, TTB : 전신환(송금)받으실때, TTS : 전신환(송금)보내실때

								tbStr += "<tbody class='list' id='table-regions-by-revenue'>";
								tbStr += "<tr><td class='white-space-nowrap ps-0 country' style='width:32%'>";
								tbStr += "<div class='d-flex align-items-center'>";
								tbStr += "<img src='/resources/img/flag/" + rows[i].cur_unit + ".gif' alt='' width='24'>";
								tbStr += "<p class='mb-0 ps-3 text-primary fw-bold fs-9'>" + rows[i].cur_unit + "</p>";
								tbStr += "</div></td>";
								tbStr += "<td class='align-middle users' style='width:17%'>";
								tbStr += "<h6 class='mb-0'>" + rows[i].cur_nm + "</h6></td>";
								tbStr += "<td class='align-middle text-end transactions' style='width:17%'>";
								tbStr += "<h6 class='mb-0'>" + rows[i].ttb + "</h6></td>";
								tbStr += "<td class='align-middle text-end revenue' style='width:17%'>";
								tbStr += "<h6 class='mb-0'>" + rows[i].tts + "</h6></td></tr>";
							}
							tbStr += "</tbody>";
							document.getElementById("tb").innerHTML = tbStr;
						}
					}
					xhr.send();
				}
			</script>
			<div class="col-12 col-xl-6">
				<div
					data-list="{&quot;valueNames&quot;:[&quot;country&quot;,&quot;users&quot;,&quot;transactions&quot;,&quot;revenue&quot;,&quot;conv-rate&quot;],&quot;page&quot;:5}">
					<div class="mb-5 mt-7">
						<h3>Top regions by revenue</h3>
						<p class="text-body-tertiary">Where you generated most of the revenue</p>
					</div>
					<div class="table-responsive scrollbar">
						<table class="table fs-10 mb-0">
							<tbody id="tb"></tbody>
						</table>
					</div>
					<div class="row align-items-center py-1">
						<div class="pagination d-none"></div>
						<div class="col d-flex fs-9">
						</div>
						<div class="col-auto d-flex">
							<button class="btn btn-link px-1 me-1" id="prev" onclick="prev()" type="button"
								title="Previous" data-list-pagination="prev" disabled><svg
									class="svg-inline--fa fa-chevron-left me-2" aria-hidden="true" focusable="false"
									data-prefix="fas" data-icon="chevron-left" role="img"
									xmlns="http://www.w3.org/2000/svg" viewBox="0 0 320 512" data-fa-i2svg="">
									<path fill="currentColor"
										d="M224 480c-8.188 0-16.38-3.125-22.62-9.375l-192-192c-12.5-12.5-12.5-32.75 0-45.25l192-192c12.5-12.5 32.75-12.5 45.25 0s12.5 32.75 0 45.25L77.25 256l169.4 169.4c12.5 12.5 12.5 32.75 0 45.25C240.4 476.9 232.2 480 224 480z">
									</path>
								</svg><span class="fas fa-chevron-left me-2"></span>prev</button>
							<button class="btn btn-link px-1 ms-1" id="next" onclick="next()" type="button" title="Next"
								data-list-pagination="next">Next<svg class="svg-inline--fa fa-chevron-right ms-2"
									aria-hidden="true" focusable="false" data-prefix="fas" data-icon="chevron-right"
									role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 320 512"
									data-fa-i2svg="">
									<path fill="currentColor"
										d="M96 480c-8.188 0-16.38-3.125-22.62-9.375c-12.5-12.5-12.5-32.75 0-45.25L242.8 256L73.38 86.63c-12.5-12.5-12.5-32.75 0-45.25s32.75-12.5 45.25 0l192 192c12.5 12.5 12.5 32.75 0 45.25l-192 192C112.4 476.9 104.2 480 96 480z">
									</path>
								</svg><span class="fas fa-chevron-right ms-2"></span></button>
						</div>
					</div>
				</div>
			</div>
		</body>
		</html> 