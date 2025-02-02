<!-- 카드 https://prium.github.io/phoenix/v1.14.0/modules/components/card.html#horizontal -->
<!-- 색 참고 https://prium.github.io/phoenix/v1.14.0/documentation/customization/color.html // bg-body-tertiary-->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript" src="/resources/js/jquery.min.js"></script>
<script type="text/javascript">
$(function() {
  var zone = "";
  // ###################### 구역 선택시 input ######################
  $("#zone").change(function() {
    var selectZone = $(this).find("option:selected");
    zone = selectZone.attr("value");
    //console.log("zone: "+zone);
    $("#showZone").val(zone);
  });
  //##############################################################

  // ###################### div 선택시 해당 구역 현황 출력 ######################
  $(".hover").on("click", function() {
	  var no = $(this).find("h4.card-title").text();
	  //console.log("zone: "+zone.slice(0,1));
      //console.log("no: "+no);
      var bndwasCd = zone.slice(0,1) + "" + no;
      //console.log("bndwasCd:",bndwasCd);
      $.ajax({
    	type: "post",
        url: "/cbs/bounded/useBoundedList",
        data: JSON.stringify({bndwasCd: bndwasCd}),
        contentType: "application/json",
        dataType: "json",
        success: function(result) {
          $(".card-body h3").text(bndwasCd + "구역 입고 현황");
          $("#showList").empty(); // 기존 html 초기화
          
          // ----------------------- XX 구역 목록 테이블 출력 -----------------------
		  var table = $("<table>").addClass("table table-hover table-striped").css("text-align", "center");
		
		  var thead = $("<thead>").appendTo(table);
		  var trHead = $("<tr>").appendTo(thead);
		  $("<th>").text("물품 번호").appendTo(trHead);
		  $("<th>").text("HS 코드").appendTo(trHead);
		  $("<th>").text("입고일").appendTo(trHead);
		  $("<th>").text("출고일").appendTo(trHead);
		
		  var tbody = $("<tbody>").appendTo(table);
		
		  $.each(result, function(index, listItem) {
		    var tr = $("<tr>").appendTo(tbody);
		    $("<th>").attr("scope", "row").text(listItem.goodsNo).appendTo(tr);
		    $("<td>").text(listItem.hsCd).appendTo(tr);
	        $("<td>").html(listItem.wrhousngDe).appendTo(tr);
		    $("<td>").text(listItem.dlivyDe).appendTo(tr);
		  });
		
		  $("#showList").append(table);
          // ---------------------------------------------------------------------
        } 
      });
  });
  //##########################################################################
});
</script>
<style>
.hover:hover {
  background-color: #c1cad9;
}
.card-title {
  text-align: center;
  font-size: 100px;
}
</style>
<div class="card h-50">
c구역 4 조회 가능
	<div class="card-body">
		<h3>창고 현황 조회</h3><br>
		<div id="showList">
		<div class="row">
          <div class="col-2 p-2">
            <select class="form-select" id="zone">
              <option>구역 선택</option>
              <c:forEach var="zone" items="${zone}">
                <option value="${zone.bndwasZone}구역">${zone.bndwasZone}구역</option>
              </c:forEach>
            </select>
          </div>
          <div class="col-8 col-sm-3 p-2">
            <input class="w-100" type="text" id="showZone">
          </div>
        </div>
        <br>
		<div class="row g-10">
		<div class="col-sm-6 col-md-4 col-lg-3">
          <div class="card text-dark bg-light">
            <div class="card-body hover">
              <h4 class="card-title">1</h4>
            </div>
          </div>
        </div>
		<div class="col-sm-6 col-md-4 col-lg-3">
          <div class="card text-dark bg-light">
            <div class="card-body hover">
              <h4 class="card-title">2</h4>
            </div>
          </div>
        </div>
        </div>
        <br>
        <div class="row g-10">
		<div class="col-sm-6 col-md-4 col-lg-3">
          <div class="card text-dark bg-light">
            <div class="card-body hover">
              <h4 class="card-title">3</h4>
            </div>
          </div>
        </div>
		<div class="col-sm-6 col-md-4 col-lg-3">
          <div class="card text-dark bg-light">
            <div class="card-body hover">
              <h4 class="card-title">4</h4>
            </div>
          </div>
        </div>
        </div>
	</div>
	</div>
</div>
