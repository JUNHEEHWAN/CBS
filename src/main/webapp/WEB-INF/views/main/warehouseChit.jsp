<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/resources/css/warehoust-chit.css" rel="stylesheet">
<script type="text/javascript" src="/resources/js/jquery.min.js"></script>
<script type="text/javascript">
$(function() {
	var entrManageNo = new URLSearchParams(window.location.search).get("entrManageNo");
	
	let data = { entrManageNo : entrManageNo };
	$.ajax ({ 
		method: "post",
    	url: "/cbs/svntAdmin/warehouseChit",
    	data: JSON.stringify(data),
    	contentType: "application/json",
    	dataType: "json",
    	async: false,
    	success: function(result) {
    		if(result.chcy < 1) result.chcy = 1; // 보관일수가 0.9일 이하일 때 1일로
    		var aprpc1000 = result.aprpc * 1000;
    		var cstms1000 = result.cstms * 1000;
    		$("#wrhousngDe").text(result.wrhousngDe);
    		$("#dlivyDe").text(result.dlivyDe);
    		$("#chcy").text(result.chcy);
    		$("#totWt").text(result.totWt);
    		$("#aprpc").text(aprpc1000.toLocaleString());
    		$("#cstms").text(cstms1000.toLocaleString());
    		
    		/* 보관료 (id=storageFee) 계산
    		종가료 [{  1.20    + (   0.50  X   (보관일수)  )} X  (감정가)  ]  /  1000
			종량료  {  32    + (   45  X   (보관일수)  )} X  12.0
			보관료 = 종가료 + 종량료
    		*/
    		
    		var fee1 = (1.20 + (0.50 * result.chcy)) * (result.aprpc) / 1000; // 종가료
    		var fee2 = (32 + (45 * result.chcy)) * 12.0; 						// 종량료
// 			console.log("fee1: " + fee1);
// 			console.log("fee2: " + fee2);
			var sumFee = (Math.floor(fee1 + fee2));
			$("#storageFee").text(sumFee.toLocaleString());
    		
    		/* T.H.C (id=thcFee) 계산
    			기본료 3,200원 + KG당 73원 */
    		
    		var thcFee = 3200 + (result.totWt * 73000); // ton 기준
    		$("#thcFee").text((Math.floor(thcFee)).toLocaleString());
    			
    		// 창고료(보관료+THC) (id=houseFee) 계산
    		var houseFee = Math.floor(fee1 + fee2 + thcFee).toLocaleString();
    		$("#houseFee").text(houseFee.toLocaleString());
    		$("#totPrice").text(houseFee.toLocaleString() + "원");
    	}
	});
});
</script>
</head>
<body>

<div>
   <table class="tg" style="table-layout: fixed; width: 1054px">
<!--       <colgroup> -->
<!--          <col style="width: 70px"> -->
<!--          <col style="width: 44px"> -->
<!--          <col style="width: 55px"> -->
<!--          <col style="width: 26px"> -->
<!--          <col style="width: 112px"> -->
<!--          <col style="width: 72px"> -->
<!--          <col style="width: 26px"> -->
<!--          <col style="width: 90px"> -->
<!--          <col style="width: 84px"> -->
<!--          <col style="width: 44px"> -->
<!--          <col style="width: 65px"> -->
<!--          <col style="width: 23px"> -->
<!--          <col style="width: 149px"> -->
<!--          <col style="width: 74px"> -->
<!--          <col style="width: 120px"> -->
<!--       </colgroup> -->
      <thead>
         <tr>
            <th class="tg-nnwx" colspan="24" rowspan="2">보세창고 전표</th>
         </tr>
         <tr>
         </tr>
      </thead>
      <tbody>
         <tr>
            <td class="tg-qbk9" colspan="4">입고일</td>
            <td class="tg-qbk8" colspan="4" id="wrhousngDe"></td>
            <td class="tg-qbk9" colspan="4">출고일</td>
            <td class="tg-qbk8" colspan="4" id="dlivyDe"></td>
            <td class="tg-qbk9" colspan="4">보관일수</td>
            <td class="tg-qbk8" colspan="4" id="chcy"></td>
         </tr>
         <tr>
            <td class="tg-qbk9" colspan="4">총중량(ton)</td>
            <td class="tg-qbk8" colspan="4" id="totWt"></td>
            <td class="tg-qbk9" colspan="4">감정가(원)</td>
            <td class="tg-qbk8" colspan="4" id="aprpc"></td>
            <td class="tg-qbk9" colspan="4">관세(원)</td>
            <td class="tg-qbk8" colspan="4" id="cstms"></td>
         </tr>
         <tr><td class="tg-qbk8" colspan="24"></td></tr>
         <tr>         	
            <td class="tg-qbk9" colspan="6"></td>
            <td class="tg-qbk9" colspan="6">종가율</td>
            <td class="tg-qbk9" colspan="6">종량율</td>
            <td class="tg-qbk9" colspan="6">T.H.C</td>
         </tr>
         <tr>
            <td class="tg-qbk9" colspan="6">기본료</td>
            <td class="tg-qbk8" colspan="6" style="text-align: right;">0</td>
            <td class="tg-qbk8" colspan="6" style="text-align: right;">0</td>
            <td class="tg-qbk8" colspan="6" style="text-align: right;">3,200</td>
         </tr>
         <tr>
            <td class="tg-qbk9" colspan="6">기본요율</td>
            <td class="tg-qbk8" colspan="6" style="text-align: right;">1.20</td>
            <td class="tg-qbk8" colspan="6" style="text-align: right;">32.00</td>
            <td class="tg-qbk8" colspan="6" style="text-align: right;">73.00</td>
         </tr>
         <tr>
            <td class="tg-qbk9" colspan="6">1일 할증</td>
            <td class="tg-qbk8" colspan="6" style="text-align: right;">0.50</td>
            <td class="tg-qbk8" colspan="6" style="text-align: right;">45.00</td>
            <td class="tg-qbk8" colspan="6" style="text-align: right;">0.00</td>
         </tr>
         <tr><td class="tg-qbk8" colspan="24"></td></tr>
         <tr>
            <td class="tg-qbk9" colspan="4">보관료(원)</td>
            <td class="tg-qbk8" colspan="4" id="storageFee"></td>
            <td class="tg-qbk9" colspan="4">T.H.C(원)</td>
            <td class="tg-qbk8" colspan="4" id="thcFee"></td>
            <td class="tg-qbk9" colspan="4">창고료(보관료+THC)(원)</td>
            <td class="tg-qbk8" colspan="4" id="houseFee"></td>
         </tr>
         <tr><td class="tg-qbk8" colspan="24"></td></tr>
         <tr>
            <td class="tg-i8mc" colspan="18">합 계 금 액</td>
			<td class="tg-i8mc" colspan="6" rowspan="1">입금처</td>
         </tr>
         <tr>
            <td class="tg-qbk8" colspan="18" id="totPrice"></td>
			<td class="tg-wa1i" colspan="6" rowspan="1">국민은행 : 4571851-22-178299</td>
         </tr>
      </tbody>
   </table>
   </div>
</body>
</html>