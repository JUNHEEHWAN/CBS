<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<script type="text/javascript" src="/resources/js/jquery.min.js"></script>
<link href="/resources/css/theme.min.css" type="text/css" rel="stylesheet" id="style-default">
<script src="/resources/js/sweetalert2.min.js"></script>
<link rel="stylesheet" href="/resources/css/sweetalert2.min.css">
<link href="/resources/css/exportLicense.css" rel="stylesheet">
<script>
const downPDF = () => {
	window.print();
};

$(function() {
	
	// ################# 권한에 따라 버튼 숨기기 #################
	var userID = $("#userID").val();
// 	console.log("userID: " + userID);

	if(!userID.startsWith("PUBL1")) {
		$("#eps12Btn").css("display", "none");
	}
	// #######################################################
	
	var entrManageNo = new URLSearchParams(window.location.search).get("entrManageNo");
// 	console.log("entrManageNo 체킁: " + entrManageNo);
	
	// -------------------------- entrManageNo 주고 수출입 승인서 input 태그 채우기 --------------------------
	let data = { entrManageNo : entrManageNo };
	$.ajax ({ 
		method: "post",
    	url: "/cbs/svntAdmin/insExportLicense",
    	data: JSON.stringify(data),
    	contentType: "application/json",
    	dataType: "json",
    	async: false,
    	success: function(result) {
//     		console.log("insExportLicense result: " + result);
    	}
	});
	
	$.ajax ({ 
		method: "post",
    	url: "/cbs/svntAdmin/getExportLicense",
    	data: JSON.stringify(data),
    	contentType: "application/json",
    	dataType: "json",
    	async: false,
    	success: function(result) {
    		$("#entrManageNo").val(result.entrManageNo);
    		$("#expterCmpnm").val(result.expterCmpnm);
    		$("#expterAdres").val(result.expterAdres);
    		$("#client").val(result.client);
    		$("#clientAdres").val(result.clientAdres);
    		$("#imprCmpnm").val(result.imprCmpnm);
    		$("#totAmount").val(( (result.totAmount) * 1000).toLocaleString() + "원");
    		$("#entrSe").val(result.entrSe);
    		$("#manctmKwa").val(result.manctmKwa);
    		$("#arvlPrt").val(result.arvlPrt);
    	}
	});
	
	$.ajax ({ 
		method: "post",
    	url: "/cbs/svntAdmin/getExportLicense2",
    	data: JSON.stringify(data),
    	contentType: "application/json",
    	dataType: "json",
    	async: false,
    	success: function(result) {
    		var str = "";
    		$.each(result, function(idx, exportLicenseVO) {
//     			console.log("exportLicenseVO["+idx+"]",exportLicenseVO);
    			var thingTy = "";
    			if(exportLicenseVO.thingTy == "ETT1") thingTy = "동식물";
    			var amountTxt = (exportLicenseVO.amount * 1000).toLocaleString(); 
    			str += `<tr>
							<td><input type='text' style='width: 27mm; border: none;' value='\${exportLicenseVO.hsCd}'></td>
							<td><input type='text' style='width: 52mm; border: none;' value='\${exportLicenseVO.goodsNm} / \${thingTy}'></td>
							<td><input type='text' style='width: 38mm; border: none; text-align: right;' value='\${exportLicenseVO.qy}'></td>
							<td><input type='text' style='width: 19mm; border: none; text-align: right;' value='\${exportLicenseVO.untpc}'></td>
							<td><input type='text' style='width: 30mm; border: none; text-align: right;' value='\${amountTxt}'></td>
// 							<td><input type='text' style='width: 30mm; border: none; text-align: right;' value='\${exportLicenseVO.amount}'></td>
						</tr>`;
    		});
    		$("#tbody").empty();
    		$("#tbody").append(str);
    	}
	});
	
	$.ajax ({ 
		method: "post",
    	url: "/cbs/svntAdmin/getExportLicense3",
    	data: JSON.stringify(data),
    	contentType: "application/json",
    	dataType: "json",
    	async: false,
    	success: function(result) {
    		$("#confmInstt").val(result.confmInstt);
    		$("#validPd").val(result.validPd);
    		$("#confmNo").val(result.confmNo);
    		$("#confmDe").val("승인 날짜    " + result.confmDe);
    		$("#confmer").val(result.confmer);
    	}
	});
	
	$("#eps12Btn").on("click", function() {
// 		console.log("click~~~");
		Swal.fire({
   		  title: "수출입을 승인하시겠습니까?",
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
 		    	url: "/cbs/svntAdmin/eps12upd",
 		    	data: JSON.stringify(data),
 		    	contentType: "application/json",
 		    	dataType: "json",
 		    	async: false,
 		    	success: function(result) {
 		    		Swal.fire({
						title: "수출입 승인이 완료되었습니다.",
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
});
</script>

<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal.userVO" var="user" />
	<input type="hidden" id="userID" value="<sec:authentication property='principal.username'/>">
</sec:authorize>

<nav style="margin-bottom: 10px; margin-left: 20px;">
<button type="button" class="btn btn-primary btn-sm" style="height: auto;" onclick="downPDF()">PDF 다운</button>
</nav>

<div class="hpa" style="width: 210mm; height: 245mm;">
	<div class="hcD" style="left: 15mm; top: 5mm;">
		<div class="hcI">
			<div class="hls ps2" style="line-height: 3.76mm; white-space: nowrap; left: 0mm; top: -0.23mm; height: 4.59mm; width: 180mm;">
				<span class="hrt cs7">[별지 제3호 서식]</span>
			</div>
			<div class="hls ps16" style="line-height: 232.11mm; white-space: nowrap; left: 0mm; top: 7.34mm; height: 232.11mm; width: 180mm;">
				<div class="htb" style="left: 0.49mm; width: 175.23mm; top: 0.49mm; height: 232.11mm; display: inline-block; position: relative; vertical-align: middle;">
					<svg class="hs" viewBox="-2.50 -2.50 180.23 237.11" style="left: -2.50mm; top: -2.50mm; width: 180.23mm; height: 237.11mm;">
						<path d="M0,21.59 L0,220.31"
							style="stroke:#000000;stroke-linecap:butt;stroke-width:0.12;"></path>
						<path d="M81.08,21.59 L81.08,93.55"
							style="stroke:#000000;stroke-linecap:butt;stroke-width:0.12;"></path>
						<path d="M112.92,12.98 L112.92,21.59"
							style="stroke:#000000;stroke-linecap:butt;stroke-width:0.12;"></path>
						<path d="M174.24,12.98 L174.24,220.31"
							style="stroke:#000000;stroke-linecap:butt;stroke-width:0.12;"></path>
						<path d="M27.78,93.54 L27.78,103"
							style="stroke:#000000;stroke-linecap:butt;stroke-dasharray:0.17,0.26;stroke-width:0.12;"></path>
						<path d="M81.08,93.54 L81.08,103"
							style="stroke:#000000;stroke-linecap:butt;stroke-dasharray:0.17,0.26;stroke-width:0.12;"></path>
						<path d="M120.51,93.54 L120.51,103"
							style="stroke:#000000;stroke-linecap:butt;stroke-dasharray:0.17,0.26;stroke-width:0.12;"></path>
						<path d="M139.39,93.54 L139.39,103"
							style="stroke:#000000;stroke-linecap:butt;stroke-dasharray:0.17,0.26;stroke-width:0.12;"></path>
						<path d="M112.86,12.98 L174.31,12.98"
							style="stroke:#000000;stroke-linecap:butt;stroke-width:0.12;"></path>
						<path d="M-0.05,21.59 L174.31,21.59"
							style="stroke:#000000;stroke-linecap:butt;stroke-width:0.12;"></path>
						<path d="M-0.06,35.69 L174.31,35.69"
							style="stroke:#000000;stroke-linecap:butt;stroke-width:0.12;"></path>
						<path d="M-0.06,52.64 L174.31,52.64"
							style="stroke:#000000;stroke-linecap:butt;stroke-width:0.12;"></path>
						<path d="M-0.06,65.36 L174.31,65.36"
							style="stroke:#000000;stroke-linecap:butt;stroke-width:0.12;"></path>
						<path d="M81.03,74.07 L174.31,74.07"
							style="stroke:#000000;stroke-linecap:butt;stroke-width:0.12;"></path>
						<path d="M81.03,85.10 L174.31,85.10"
							style="stroke:#000000;stroke-linecap:butt;stroke-width:0.12;"></path>
						<path d="M-0.06,85.78 L81.15,85.78"
							style="stroke:#000000;stroke-linecap:butt;stroke-width:0.12;"></path>
						<path d="M-0.06,93.54 L174.31,93.54"
							style="stroke:#000000;stroke-linecap:butt;stroke-width:0.12;"></path>
						<path d="M139.33,103 L174.31,103"
							style="stroke:#000000;stroke-linecap:butt;stroke-width:0.12;"></path>
						<path d="M-0.06,154.55 L174.31,154.55"
							style="stroke:#000000;stroke-linecap:butt;stroke-width:0.12;"></path>
						<path d="M-0.06,159.98 L174.31,159.98"
							style="stroke:#000000;stroke-linecap:butt;stroke-width:0.12;"></path>
						<path d="M-0.06,165.56 L174.31,165.56"
							style="stroke:#000000;stroke-linecap:butt;stroke-width:0.12;"></path>
						<path d="M-0.06,170.99 L174.31,170.99"
							style="stroke:#000000;stroke-linecap:butt;stroke-width:0.12;"></path>
						<path d="M-0.06,176.80 L174.31,176.80"
							style="stroke:#000000;stroke-linecap:butt;stroke-width:0.12;"></path>
						<path d="M-0.06,209.26 L174.31,209.26"
							style="stroke:#000000;stroke-linecap:butt;stroke-width:0.12;"></path>
						<path d="M-0.06,220.31 L174.31,220.31"
							style="stroke:#000000;stroke-linecap:butt;stroke-width:0.12;"></path>
						<path d="M139.39,93.54 L139.39,103"
							style="stroke:#000000;stroke-linecap:butt;stroke-dasharray:0.17,0.26;stroke-width:0.12;"></path>
						<path d="M0,21.59 L0,220.31"
							style="stroke:#000000;stroke-linecap:butt;stroke-width:0.12;"></path>
						<path d="M-0.06,220.31 L174.31,220.31"
							style="stroke:#000000;stroke-linecap:butt;stroke-width:0.12;"></path>
						<path d="M112.86,12.98 L174.31,12.98"
							style="stroke:#000000;stroke-linecap:butt;stroke-width:0.12;"></path></svg>
					<div class="hce"
						style="left: 0mm; top: 0mm; width: 174.24mm; height: 12.98mm;">
						<div class="hcD" style="left: 0.49mm; top: 0.49mm;">
							<div class="hcI">
								<div class="hls ps13"
									style="line-height: 4.44mm; white-space: nowrap; left: 0mm; top: -0.26mm; height: 5.29mm; width: 173.26mm;">
									<span class="hrt cs8">수출승인(신청)서</span>
								</div>
								<div class="hls ps12"
									style="line-height: 3.76mm; white-space: nowrap; left: 0mm; top: 6.12mm; height: 4.59mm; width: 173.26mm;">
									<span class="hrt cs6">Export License(Application)</span>
								</div>
							</div>
						</div>
					</div>
					<div class="hce"
						style="left: 0mm; top: 12.98mm; width: 112.92mm; height: 8.61mm;">
						<div class="hcD" style="left: 0.49mm; top: 0.49mm;">
							<div class="hcI">
								<div class="hls ps12"
									style="line-height: 3.76mm; white-space: nowrap; left: 0mm; top: -0.23mm; height: 4.59mm; width: 111.93mm;">
									<span class="hrt cs9">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
								</div>
							</div>
						</div>
					</div>
					<div class="hce"
						style="left: 112.92mm; top: 12.98mm; width: 61.33mm; height: 8.61mm;">
						<div class="hcD" style="left: 0.49mm; top: 0.49mm;">
							<div class="hcI">
								<div class="hls ps14"
									style="line-height: 2.48mm; white-space: nowrap; left: 0mm; top: -0.16mm; height: 3.17mm; width: 60.34mm;">
									<span class="hrt cs10">&nbsp;처리기간 : &nbsp;1일</span>
								</div>
								<div class="hls ps14"
									style="line-height: 2.48mm; white-space: nowrap; left: 0mm; top: 4.29mm; height: 3.17mm; width: 60.34mm;">
									<span class="hrt cs10">&nbsp;Handling Time : 1 Day</span>
								</div>
							</div>
						</div>
					</div>
					<div class="hce"
						style="left: 0mm; top: 21.59mm; width: 70.00mm; height: 14.10mm;">
						<div class="hcD" style="left: 0.49mm; top: 0.49mm;">
							<div class="hcI">
								<div class="hls ps14"
									style="line-height: 2.17mm; white-space: nowrap; left: 0mm; top: -0.14mm; height: 2.82mm; width: 34.60mm;">
									<span class="hrt cs11">&nbsp;① 수출자 상호</span>
									<span class="hrt cs13">(Name of Firm)</span><br>
									<input type="text" class="" id="expterCmpnm" style="border:none; width:264px;">
								</div>
							</div>
						</div>
					</div>
					<div class="hce"
						style="left: 81.08mm; top: 21.59mm; width: 93.16mm; height: 14.10mm;">
						<div class="hcD" style="left: 0.49mm; top: 0.49mm;">
							<div class="hcI">
								<div class="hls ps14"
									style="line-height: 2.17mm; white-space: nowrap; left: 0mm; top: -0.14mm; height: 2.82mm; width: 92.17mm;">
									<span class="hrt cs11">&nbsp;⑤ 구매자 또는 계약당사자</span>
									<span class="hrt cs13">(Buyer or Principal of<br> &nbsp;&nbsp;&nbsp;Contract)</span><br>
									<input type="text" id="imprCmpnm" style="border:none; width:264px;">
								</div>
								<div class="hls ps14"
									style="line-height: 2.17mm; white-space: nowrap; left: 0mm; top: 3.81mm; height: 2.82mm; width: 92.17mm;">
									<span class="hrt cs12">&nbsp;</span>
								</div>
							</div>
						</div>
					</div>
					<div class="hce"
						style="left: 0mm; top: 35.69mm; width: 81.08mm; height: 9.19mm;">
						<div class="hcD" style="left: 0.49mm; top: 0.49mm;">
							<div class="hcI">
								<div class="hls ps14"
									style="line-height: 2.17mm; white-space: nowrap; left: 0mm; top: -0.14mm; height: 2.82mm; width: 80.09mm;">
									<span class="hrt cs11">&nbsp;② 수출자 주소, 성명</span>
									<span class="hrt cs13">(Address,&nbsp;Name of Rep.)</span><br>
									<input type="text" id="expterAdres" style="border:none; width:264px;">
								</div>
								<div class="hls ps14"
									style="line-height: 2.17mm; white-space: nowrap; left: 0mm; top: 3.81mm; height: 2.82mm; width: 80.09mm;"></div>
							</div>
						</div>
					</div>
					<div class="hce"
						style="left: 81.08mm; top: 35.69mm; width: 93.16mm; height: 9.19mm;">
						<div class="hcD" style="left: 0.49mm; top: 0.49mm;">
							<div class="hcI">
								<div class="hls ps14"
									style="line-height: 2.17mm; white-space: nowrap; left: 0mm; top: -0.14mm; height: 2.82mm; width: 92.17mm;">
									<span class="hrt cs11">&nbsp;⑥ 통관 관리 번호</span>
									<span class="hrt cs13">&nbsp;(Entry Manage No.)</span><br>
									<input type="text" id="entrManageNo" style="border:none; width:264px;">
								</div>
							</div>
						</div>
					</div>
					<div class="hce"
						style="left: 0mm; top: 44.88mm; width: 81.08mm; height: 7.76mm;">
						<div class="hcD" style="left: 0.49mm; top: 0.49mm;">
							<div class="hcI">
								<div class="hls ps14"
									style="line-height: 2.17mm; white-space: nowrap; left: 0mm; top: -0.14mm; height: 2.82mm; width: 80.09mm;">
									<span class="hrt cs11">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(서명
										또는 인)</span>
								</div>
								<div class="hls ps14"
									style="line-height: 2.17mm; white-space: nowrap; left: 0mm; top: 3.81mm; height: 2.82mm; width: 80.09mm;">
									<span class="hrt cs11">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(Signature)</span>
								</div>
							</div>
						</div>
					</div>
					<div class="hce"
						style="left: 81.08mm; top: 44.88mm; width: 44.55mm; height: 7.76mm;">
						<div class="hcD" style="left: 0.49mm; top: 0.49mm;">
							<div class="hcI">
								<div class="hls ps14"
									style="line-height: 2.17mm; white-space: nowrap; left: 0mm; top: -0.14mm; height: 2.82mm; width: 43.56mm;"></div>
							</div>
						</div>
					</div>
					<div class="hce"
						style="left: 125.63mm; top: 44.88mm; width: 48.61mm; height: 7.76mm;">
						<div class="hcD" style="left: 0.49mm; top: 0.49mm;">
							<div class="hcI">
								<div class="hls ps14"
									style="line-height: 2.17mm; white-space: nowrap; left: 0mm; top: -0.14mm; height: 2.82mm; width: 47.62mm;"></div>
							</div>
						</div>
					</div>
					<div class="hce"
						style="left: 0mm; top: 52.64mm; width: 70.00mm; height: 12.71mm;">
						<div class="hcD" style="left: 0.49mm; top: 0.49mm;">
							<div class="hcI">
								<div class="hls ps14"
									style="line-height: 2.17mm; white-space: nowrap; left: 0mm; top: -0.14mm; height: 2.82mm; width: 35.59mm;">
									<span class="hrt cs11">&nbsp;③ 위탁자 상호</span>
									<span class="hrt cs13">(Requester)</span><br>
									<input type="text" id="client" style="border:none; width:264px;">
								</div>
							</div>
						</div>
					</div>
					<div class="hce"
						style="left: 81.08mm; top: 52.64mm; width: 93.16mm; height: 12.71mm;">
						<div class="hcD" style="left: 0.49mm; top: 0.49mm;">
							<div class="hcI">
								<div class="hls ps14"
									style="line-height: 2.17mm; white-space: nowrap; left: 0mm; top: -0.14mm; height: 2.82mm; width: 92.17mm;">
									<span class="hrt cs11">&nbsp;⑦ 총금액</span>
									<span class="hrt cs13">(Total Amount)</span><br>
									<input type="text" id="totAmount" style="border:none; width:264px;">
								</div>
							</div>
						</div>
					</div>
					<div class="hce"
						style="left: 0mm; top: 65.36mm; width: 81.08mm; height: 8.71mm;">
						<div class="hcD" style="left: 0.49mm; top: 0.49mm;">
							<div class="hcI">
								<div class="hls ps14"
									style="line-height: 2.17mm; white-space: nowrap; left: 0mm; top: -0.14mm; height: 2.82mm; width: 80.09mm;">
									<span class="hrt cs11">&nbsp;④ 위탁자 주소, 성명 &nbsp;</span>
									<span class="hrt cs13">(Address, Name of Rep.)</span><br>
									<input type="text" id="clientAdres" style="border:none; width:264px;">
								</div>
							</div>
						</div>
					</div>
					<div class="hce"
						style="left: 81.08mm; top: 65.36mm; width: 93.16mm; height: 8.72mm;">
						<div class="hcD" style="left: 0.49mm; top: 0.49mm;">
							<div class="hcI">
								<div class="hls ps14"
									style="line-height: 2.17mm; white-space: nowrap; left: 0mm; top: -0.14mm; height: 2.82mm; width: 92.17mm;">
									<span class="hrt cs11">&nbsp;⑧ 통관 구분</span>
									<span class="hrt cs12">&nbsp;(Entry Section)</span><br>
									<input type="text" id="entrSe" style="border:none; width:264px;">
								</div>
							</div>
						</div>
					</div>
					<div class="hce"
						style="left: 0mm; top: 74.07mm; width: 81.08mm; height: 11.71mm;">
						<div class="hcD" style="left: 0.49mm; top: 0.49mm;">
							<div class="hcI">
								<div class="hls ps14"
									style="line-height: 2.17mm; white-space: nowrap; left: 0mm; top: -0.14mm; height: 2.82mm; width: 80.09mm;"></div>
								<div class="hls ps14"
									style="line-height: 2.17mm; white-space: nowrap; left: 0mm; top: 3.81mm; height: 2.82mm; width: 80.09mm;">
									<span class="hrt cs11">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(서명
										또는 인)</span>
								</div>
								<div class="hls ps14"
									style="line-height: 2.17mm; white-space: nowrap; left: 0mm; top: 7.76mm; height: 2.82mm; width: 80.09mm;">
									<span class="hrt cs11">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(Signature)</span>
								</div>
							</div>
						</div>
					</div>
					<div class="hce"
						style="left: 81.08mm; top: 74.07mm; width: 93.16mm; height: 11.02mm;">
						<div class="hcD" style="left: 0.49mm; top: 0.49mm;">
							<div class="hcI">
								<div class="hls ps14"
									style="line-height: 2.17mm; white-space: nowrap; left: 0mm; top: -0.14mm; height: 2.82mm; width: 92.17mm;">
									<span class="hrt cs11">&nbsp;⑨ 관할세관</span>
									<span class="hrt cs13">(Main Customs)</span><br>
									<input type="text" id="manctmKwa" style="border:none; width:264px;">
								</div>
							</div>
						</div>
					</div>
					<div class="hce"
						style="left: 81.08mm; top: 85.10mm; width: 93.16mm; height: 8.45mm;">
						<div class="hcD" style="left: 0.49mm; top: 0.49mm;">
							<div class="hcI">
								<div class="hls ps14"
									style="line-height: 2.17mm; white-space: nowrap; left: 0mm; top: -0.14mm; height: 2.82mm; width: 92.17mm;">
									<span class="hrt cs11">&nbsp;⑩ 도착항 </span>
									<span class="hrt cs13">(Port of Dispatch)</span><br>
									<input type="text" id="arvlPrt" style="border:none; width:264px;">
								</div>
							</div>
						</div>
					</div>
					<div class="hce"
						style="left: 0mm; top: 93.54mm; width: 27.78mm; height: 9.45mm;">
						<div class="hcD" style="left: 0.49mm; top: 0.49mm;">
							<div class="hcI">
								<div class="hls ps2"
									style="line-height: 2.17mm; white-space: nowrap; left: 0mm; top: -0.14mm; height: 2.82mm; width: 26.80mm;">
									<span class="hrt cs11">&nbsp;⑪ HS 부호</span>
								</div>
							</div>
						</div>
					</div>
					<div class="hce"
						style="left: 27.78mm; top: 93.54mm; width: 38.54mm; height: 9.45mm;">
						<div class="hcD" style="left: 0.49mm; top: 0.49mm;">
							<div class="hcI">
								<div class="hls ps2"
									style="line-height: 2.17mm; white-space: nowrap; left: 0mm; top: -0.14mm; height: 2.82mm; width: 37.55mm;">
									<span class="hrt cs11">&nbsp;⑫ 품명 및 물품 유형</span>
								</div>
							</div>
						</div>
					</div>
					<div class="hce"
						style="left: 66.32mm; top: 93.54mm; width: 14.76mm; height: 9.45mm;">
						<div class="hcD" style="left: 0.49mm; top: 0.49mm;">
							<div class="hcI">
								<div class="hls ps2"
									style="line-height: 2.17mm; white-space: nowrap; left: 0mm; top: -0.14mm; height: 2.82mm; width: 13.77mm;"></div>
							</div>
						</div>
					</div>
					<div class="hce"
						style="left: 81.08mm; top: 93.54mm; width: 36.31mm; height: 9.45mm;">
						<div class="hcD" style="left: 0.49mm; top: 0.49mm;">
							<div class="hcI">
								<div class="hls ps2"
									style="line-height: 2.17mm; white-space: nowrap; left: 0mm; top: -0.14mm; height: 2.82mm; width: 35.32mm;">
									<span class="hrt cs11">&nbsp;⑬ 수량</span>
								</div>
							</div>
						</div>
					</div>
					<div class="hce"
						style="left: 117.39mm; top: 93.54mm; width: 3.12mm; height: 9.45mm;">
						<div class="hcD" style="left: 0.49mm; top: 0.49mm;">
							<div class="hcI">
								<div class="hls ps2"
									style="line-height: 2.17mm; white-space: nowrap; left: 0mm; top: -0.14mm; height: 2.82mm; width: 5.08mm;"></div>
							</div>
						</div>
					</div>
					<div class="hce"
						style="left: 125.63mm; top: 93.54mm; width: 13.76mm; height: 9.45mm;">
						<div class="hcD" style="left: 0.49mm; top: 0.49mm;">
							<div class="hcI">
								<div class="hls ps2"
									style="line-height: 2.17mm; white-space: nowrap; left: 0mm; top: -0.14mm; height: 2.82mm; width: 12.77mm;">
									<span class="hrt cs11"> ⑭ 단가</span>
								</div>
							</div>
						</div>
					</div>
					<div class="hce"
						style="left: 139.39mm; top: 93.54mm; width: 34.85mm; height: 9.45mm;">
						<div class="hcD" style="left: 0.49mm; top: 0.49mm;">
							<div class="hcI">
								<div class="hls ps2"
									style="line-height: 2.17mm; white-space: nowrap; left: 0mm; top: -0.14mm; height: 2.82mm; width: 33.87mm;">
									<span class="hrt cs11">&nbsp;⑮ 금 &nbsp;&nbsp;액</span>
								</div>
							</div>
						</div>
					</div>
					<div class="hce"
						style="left: 0mm; top: 103mm; width: 174.24mm; height: 51.55mm;">
						<div class="hcD" style="left: 0.49mm; top: 0.49mm;">
							<div class="hcI">
								<div class="hls ps2"
									style="line-height: 2.17mm; white-space: nowrap; left: 0mm; top: -0.14mm; height: 2.82mm; width: 173.26mm;">
									<span class="hrt cs11">&nbsp;&nbsp;&nbsp;(HS Code)
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp(Description/Type)
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(Quantity)
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(Unit
										Price) &nbsp;&nbsp;(Amount)</span><br>
									<table style="border: none;">
										<tbody id="tbody"></tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
					<div class="hce"
						style="left: 0mm; top: 154.55mm; width: 174.24mm; height: 5.43mm;">
						<div class="hcD" style="left: 0.49mm; top: 0.49mm;">
							<div class="hcI" style="top: 0.81mm;">
								<div class="hls ps2"
									style="line-height: 2.17mm; white-space: nowrap; left: 0mm; top: -0.14mm; height: 2.82mm; width: 173.26mm;">
									<span class="hrt cs11">&nbsp;승인기관 기재란(Remarks to be filled out by an Approval Agency)&nbsp;</span>
									 <input type="text" id="confmInstt" style="border: none; width:264px;">
								</div>
							</div>
						</div>
					</div>
					<div class="hce"
						style="left: 0mm; top: 159.98mm; width: 174.24mm; height: 5.57mm;">
						<div class="hcD" style="left: 0.49mm; top: 0.49mm;">
							<div class="hcI">
								<div class="hls ps2"
									style="line-height: 3.76mm; white-space: nowrap; left: 0mm; top: -0.23mm; height: 4.59mm; width: 173.26mm;">
									<span class="hrt cs11">&nbsp;</span><span class="hrt cs11">유효기간(Period of Approval)</span>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<input type="text" id="validPd" style="border: none; width:264px;">
								</div>
							</div>
						</div>
					</div>
					<div class="hce"
						style="left: 0mm; top: 165.56mm; width: 174.24mm; height: 5.43mm;">
						<div class="hcD" style="left: 0.49mm; top: 0.49mm;">
							<div class="hcI" style="top: 0.81mm;">
								<div class="hls ps2"
									style="line-height: 2.17mm; white-space: nowrap; left: 0mm; top: -0.14mm; height: 2.82mm; width: 173.26mm;">
									<span class="hrt cs11">&nbsp;</span><span class="hrt cs11">승인번호(Approval No.)</span>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<input type="text" id="confmNo" style="border: none; width:264px;"> 
								</div>
							</div>
						</div>
					</div>
					<div class="hce"
						style="left: 0mm; top: 176.80mm; width: 174.24mm; height: 32.46mm;">
						<div class="hcD" style="left: 0.49mm; top: 0.49mm;">
							<div class="hcI">
								<div class="hls ps14"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: -0.18mm; height: 3.53mm; width: 173.26mm;">
									<span class="hrt cs11">&nbsp;</span><span class="hco cs11"
										style="line-height: 2.12mm;"><span class="hcc"
										style="left: 0mm; font-size: 8pt; color: #000000; position: relative;">󰊉</span><span
										class="hcc" style="left: 0mm; font-size: 8pt; color: #000000;">󰊛</span></span><span
										class="hrt cs14">&nbsp;</span><span class="hrt cs11">위의
										신청 사항을 「대외무역법」 제11조제2항 및 동법 시행령 제18조제1항에 따라 승인합니다.&nbsp;</span>
								</div>
								<div class="hls ps14"
									style="line-height: 2.17mm; white-space: nowrap; left: 0mm; top: 4.80mm; height: 2.82mm; width: 173.26mm;">
									<span class="hrt cs11">(The
										undersigned hereby approves the above-mentioned goods in
										accordance with Article 11(2)</span>
								</div>
								<div class="hls ps14"
									style="line-height: 2.17mm; white-space: nowrap; left: 0mm; top: 8.75mm; height: 2.82mm; width: 173.26mm;">
									<span class="hrt cs11">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Trade
										Act and Article 18(1) of the Enforcement Decree of the said
										Act.)</span>
								</div>
								<div class="hls ps14"
									style="line-height: 2.17mm; white-space: nowrap; left: 0mm; top: 12.70mm; height: 2.82mm; width: 173.26mm;"></div>
								<div class="hls ps14"
									style="line-height: 2.17mm; white-space: nowrap; left: 0mm; top: 16.65mm; height: 2.82mm; width: 173.26mm;">
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<span class="hrt cs11"><input type="text" id="confmDe" style="border: none; text-align: right;"></span>
								</div>
								<div class="hls ps14"
									style="line-height: 2.17mm; white-space: nowrap; left: 0mm; top: 20.60mm; height: 2.82mm; width: 173.26mm;">
									<span class="hrt cs11">&nbsp;&nbsp;</span>
								</div>
								<div class="hls ps14"
									style="line-height: 2.17mm; white-space: nowrap; left: 0mm; top: 24.55mm; height: 2.82mm; width: 173.26mm;">
									<span class="hrt cs11">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									승인권자 <input type="text" id="confmer" style="border: none; text-align: right;">&nbsp;&nbsp;&nbsp;(인)</span>
								</div>
								<div class="hls ps14"
									style="line-height: 2.17mm; white-space: nowrap; left: 0mm; top: 28.50mm; height: 2.82mm; width: 173.26mm;"></div>
							</div>
						</div>
					</div>
					<div class="hce"
						style="left: 0mm; top: 209.26mm; width: 174.24mm; height: 15.05mm;">
						<div class="hcD" style="left: 0.49mm; top: 0.49mm;">
							<div class="hcI" style="top: 1.36mm;">
								<div class="hls ps2"
									style="line-height: 2.17mm; white-space: nowrap; left: 0mm; top: -0.14mm; height: 2.82mm; width: 173.26mm;">
									<span class="hrt cs11">&nbsp;※승인기관이&nbsp;둘</span><span class="hrt cs11">&nbsp;이상인
										경우&nbsp;</span><span class="hco cs11" style="line-height: 2.12mm;"><span
										class="hcc"
										style="left: 0mm; font-size: 8pt; color: #000000; position: relative;">󰊉</span><span
										class="hcc" style="left: 0mm; font-size: 8pt; color: #000000;">󰊗</span></span><span
										class="hrt cs11">&nbsp;-&nbsp;</span><span class="hco cs11"
										style="line-height: 2.12mm;"><span class="hcc"
										style="left: 0mm; font-size: 8pt; color: #000000; position: relative;">15-</span><span
										class="hcc" style="left: 0mm; font-size: 8pt; color: #000000;">18</span></span><span
										class="hrt cs11">의 기재사항은 이면에 기재하도록 합니다.</span>
								</div>
								<div class="hls ps2"
									style="line-height: 2.17mm; white-space: nowrap; left: 0mm; top: 4.37mm; height: 2.82mm; width: 173.26mm;">
									<span class="hrt cs11">&nbsp;※ 승인과는 별도로 대금결제에 관한
										사항에 대하여는 외국환거래법령에 따라야 합니다.</span>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="hls ps16" style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: 241.38mm; height: 3.53mm; width: 180mm;"></div>
		</div>
	</div>
</div>

<nav style="float:right; margin-right:80px; margin-top:10px">
	<button class="btn btn-primary me-1 mb-1" type="button" id="eps12Btn">승인</button>
</nav>
