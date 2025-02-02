<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<style type="text/css">:host,:root{--fa-font-solid:normal 900 1em/1 "Font Awesome 6 Solid";--fa-font-regular:normal 400 1em/1 "Font Awesome 6 Regular";--fa-font-light:normal 300 1em/1 "Font Awesome 6 Light";--fa-font-thin:normal 100 1em/1 "Font Awesome 6 Thin";--fa-font-duotone:normal 900 1em/1 "Font Awesome 6 Duotone";--fa-font-brands:normal 400 1em/1 "Font Awesome 6 Brands"}svg:not(:host).svg-inline--fa,svg:not(:root).svg-inline--fa{overflow:visible;box-sizing:content-box}.svg-inline--fa{display:var(--fa-display,inline-block);height:1em;overflow:visible;vertical-align:-.125em}.svg-inline--fa.fa-2xs{vertical-align:.1em}.svg-inline--fa.fa-xs{vertical-align:0}.svg-inline--fa.fa-sm{vertical-align:-.0714285705em}.svg-inline--fa.fa-lg{vertical-align:-.2em}.svg-inline--fa.fa-xl{vertical-align:-.25em}.svg-inline--fa.fa-2xl{vertical-align:-.3125em}.svg-inline--fa.fa-pull-left{margin-right:var(--fa-pull-margin,.3em);width:auto}.svg-inline--fa.fa-pull-right{margin-left:var(--fa-pull-margin,.3em);width:auto}.svg-inline--fa.fa-li{width:var(--fa-li-width,2em);top:.25em}.svg-inline--fa.fa-fw{width:var(--fa-fw-width,1.25em)}.fa-layers svg.svg-inline--fa{bottom:0;left:0;margin:auto;position:absolute;right:0;top:0}.fa-layers-counter,.fa-layers-text{display:inline-block;position:absolute;text-align:center}.fa-layers{display:inline-block;height:1em;position:relative;text-align:center;vertical-align:-.125em;width:1em}.fa-layers svg.svg-inline--fa{-webkit-transform-origin:center center;transform-origin:center center}.fa-layers-text{left:50%;top:50%;-webkit-transform:translate(-50%,-50%);transform:translate(-50%,-50%);-webkit-transform-origin:center center;transform-origin:center center}.fa-layers-counter{background-color:var(--fa-counter-background-color,#ff253a);border-radius:var(--fa-counter-border-radius,1em);box-sizing:border-box;color:var(--fa-inverse,#fff);line-height:var(--fa-counter-line-height,1);max-width:var(--fa-counter-max-width,5em);min-width:var(--fa-counter-min-width,1.5em);overflow:hidden;padding:var(--fa-counter-padding,.25em .5em);right:var(--fa-right,0);text-overflow:ellipsis;top:var(--fa-top,0);-webkit-transform:scale(var(--fa-counter-scale,.25));transform:scale(var(--fa-counter-scale,.25));-webkit-transform-origin:top right;transform-origin:top right}.fa-layers-bottom-right{bottom:var(--fa-bottom,0);right:var(--fa-right,0);top:auto;-webkit-transform:scale(var(--fa-layers-scale,.25));transform:scale(var(--fa-layers-scale,.25));-webkit-transform-origin:bottom right;transform-origin:bottom right}.fa-layers-bottom-left{bottom:var(--fa-bottom,0);left:var(--fa-left,0);right:auto;top:auto;-webkit-transform:scale(var(--fa-layers-scale,.25));transform:scale(var(--fa-layers-scale,.25));-webkit-transform-origin:bottom left;transform-origin:bottom left}.fa-layers-top-right{top:var(--fa-top,0);right:var(--fa-right,0);-webkit-transform:scale(var(--fa-layers-scale,.25));transform:scale(var(--fa-layers-scale,.25));-webkit-transform-origin:top right;transform-origin:top right}.fa-layers-top-left{left:var(--fa-left,0);right:auto;top:var(--fa-top,0);-webkit-transform:scale(var(--fa-layers-scale,.25));transform:scale(var(--fa-layers-scale,.25));-webkit-transform-origin:top left;transform-origin:top left}.fa-1x{font-size:1em}.fa-2x{font-size:2em}.fa-3x{font-size:3em}.fa-4x{font-size:4em}.fa-5x{font-size:5em}.fa-6x{font-size:6em}.fa-7x{font-size:7em}.fa-8x{font-size:8em}.fa-9x{font-size:9em}.fa-10x{font-size:10em}.fa-2xs{font-size:.625em;line-height:.1em;vertical-align:.225em}.fa-xs{font-size:.75em;line-height:.0833333337em;vertical-align:.125em}.fa-sm{font-size:.875em;line-height:.0714285718em;vertical-align:.0535714295em}.fa-lg{font-size:1.25em;line-height:.05em;vertical-align:-.075em}.fa-xl{font-size:1.5em;line-height:.0416666682em;vertical-align:-.125em}.fa-2xl{font-size:2em;line-height:.03125em;vertical-align:-.1875em}.fa-fw{text-align:center;width:1.25em}.fa-ul{list-style-type:none;margin-left:var(--fa-li-margin,2.5em);padding-left:0}.fa-ul>li{position:relative}.fa-li{left:calc(var(--fa-li-width,2em) * -1);position:absolute;text-align:center;width:var(--fa-li-width,2em);line-height:inherit}.fa-border{border-color:var(--fa-border-color,#eee);border-radius:var(--fa-border-radius,.1em);border-style:var(--fa-border-style,solid);border-width:var(--fa-border-width,.08em);padding:var(--fa-border-padding,.2em .25em .15em)}.fa-pull-left{float:left;margin-right:var(--fa-pull-margin,.3em)}.fa-pull-right{float:right;margin-left:var(--fa-pull-margin,.3em)}.fa-beat{-webkit-animation-name:fa-beat;animation-name:fa-beat;-webkit-animation-delay:var(--fa-animation-delay,0);animation-delay:var(--fa-animation-delay,0);-webkit-animation-direction:var(--fa-animation-direction,normal);animation-direction:var(--fa-animation-direction,normal);-webkit-animation-duration:var(--fa-animation-duration,1s);animation-duration:var(--fa-animation-duration,1s);-webkit-animation-iteration-count:var(--fa-animation-iteration-count,infinite);animation-iteration-count:var(--fa-animation-iteration-count,infinite);-webkit-animation-timing-function:var(--fa-animation-timing,ease-in-out);animation-timing-function:var(--fa-animation-timing,ease-in-out)}.fa-bounce{-webkit-animation-name:fa-bounce;animation-name:fa-bounce;-webkit-animation-delay:var(--fa-animation-delay,0);animation-delay:var(--fa-animation-delay,0);-webkit-animation-direction:var(--fa-animation-direction,normal);animation-direction:var(--fa-animation-direction,normal);-webkit-animation-duration:var(--fa-animation-duration,1s);animation-duration:var(--fa-animation-duration,1s);-webkit-animation-iteration-count:var(--fa-animation-iteration-count,infinite);animation-iteration-count:var(--fa-animation-iteration-count,infinite);-webkit-animation-timing-function:var(--fa-animation-timing,cubic-bezier(.28,.84,.42,1));animation-timing-function:var(--fa-animation-timing,cubic-bezier(.28,.84,.42,1))}.fa-fade{-webkit-animation-name:fa-fade;animation-name:fa-fade;-webkit-animation-delay:var(--fa-animation-delay,0);animation-delay:var(--fa-animation-delay,0);-webkit-animation-direction:var(--fa-animation-direction,normal);animation-direction:var(--fa-animation-direction,normal);-webkit-animation-duration:var(--fa-animation-duration,1s);animation-duration:var(--fa-animation-duration,1s);-webkit-animation-iteration-count:var(--fa-animation-iteration-count,infinite);animation-iteration-count:var(--fa-animation-iteration-count,infinite);-webkit-animation-timing-function:var(--fa-animation-timing,cubic-bezier(.4,0,.6,1));animation-timing-function:var(--fa-animation-timing,cubic-bezier(.4,0,.6,1))}.fa-beat-fade{-webkit-animation-name:fa-beat-fade;animation-name:fa-beat-fade;-webkit-animation-delay:var(--fa-animation-delay,0);animation-delay:var(--fa-animation-delay,0);-webkit-animation-direction:var(--fa-animation-direction,normal);animation-direction:var(--fa-animation-direction,normal);-webkit-animation-duration:var(--fa-animation-duration,1s);animation-duration:var(--fa-animation-duration,1s);-webkit-animation-iteration-count:var(--fa-animation-iteration-count,infinite);animation-iteration-count:var(--fa-animation-iteration-count,infinite);-webkit-animation-timing-function:var(--fa-animation-timing,cubic-bezier(.4,0,.6,1));animation-timing-function:var(--fa-animation-timing,cubic-bezier(.4,0,.6,1))}.fa-flip{-webkit-animation-name:fa-flip;animation-name:fa-flip;-webkit-animation-delay:var(--fa-animation-delay,0);animation-delay:var(--fa-animation-delay,0);-webkit-animation-direction:var(--fa-animation-direction,normal);animation-direction:var(--fa-animation-direction,normal);-webkit-animation-duration:var(--fa-animation-duration,1s);animation-duration:var(--fa-animation-duration,1s);-webkit-animation-iteration-count:var(--fa-animation-iteration-count,infinite);animation-iteration-count:var(--fa-animation-iteration-count,infinite);-webkit-animation-timing-function:var(--fa-animation-timing,ease-in-out);animation-timing-function:var(--fa-animation-timing,ease-in-out)}.fa-shake{-webkit-animation-name:fa-shake;animation-name:fa-shake;-webkit-animation-delay:var(--fa-animation-delay,0);animation-delay:var(--fa-animation-delay,0);-webkit-animation-direction:var(--fa-animation-direction,normal);animation-direction:var(--fa-animation-direction,normal);-webkit-animation-duration:var(--fa-animation-duration,1s);animation-duration:var(--fa-animation-duration,1s);-webkit-animation-iteration-count:var(--fa-animation-iteration-count,infinite);animation-iteration-count:var(--fa-animation-iteration-count,infinite);-webkit-animation-timing-function:var(--fa-animation-timing,linear);animation-timing-function:var(--fa-animation-timing,linear)}.fa-spin{-webkit-animation-name:fa-spin;animation-name:fa-spin;-webkit-animation-delay:var(--fa-animation-delay,0);animation-delay:var(--fa-animation-delay,0);-webkit-animation-direction:var(--fa-animation-direction,normal);animation-direction:var(--fa-animation-direction,normal);-webkit-animation-duration:var(--fa-animation-duration,2s);animation-duration:var(--fa-animation-duration,2s);-webkit-animation-iteration-count:var(--fa-animation-iteration-count,infinite);animation-iteration-count:var(--fa-animation-iteration-count,infinite);-webkit-animation-timing-function:var(--fa-animation-timing,linear);animation-timing-function:var(--fa-animation-timing,linear)}.fa-spin-reverse{--fa-animation-direction:reverse}.fa-pulse,.fa-spin-pulse{-webkit-animation-name:fa-spin;animation-name:fa-spin;-webkit-animation-direction:var(--fa-animation-direction,normal);animation-direction:var(--fa-animation-direction,normal);-webkit-animation-duration:var(--fa-animation-duration,1s);animation-duration:var(--fa-animation-duration,1s);-webkit-animation-iteration-count:var(--fa-animation-iteration-count,infinite);animation-iteration-count:var(--fa-animation-iteration-count,infinite);-webkit-animation-timing-function:var(--fa-animation-timing,steps(8));animation-timing-function:var(--fa-animation-timing,steps(8))}@media (prefers-reduced-motion:reduce){.fa-beat,.fa-beat-fade,.fa-bounce,.fa-fade,.fa-flip,.fa-pulse,.fa-shake,.fa-spin,.fa-spin-pulse{-webkit-animation-delay:-1ms;animation-delay:-1ms;-webkit-animation-duration:1ms;animation-duration:1ms;-webkit-animation-iteration-count:1;animation-iteration-count:1;transition-delay:0s;transition-duration:0s}}@-webkit-keyframes fa-beat{0%,90%{-webkit-transform:scale(1);transform:scale(1)}45%{-webkit-transform:scale(var(--fa-beat-scale,1.25));transform:scale(var(--fa-beat-scale,1.25))}}@keyframes fa-beat{0%,90%{-webkit-transform:scale(1);transform:scale(1)}45%{-webkit-transform:scale(var(--fa-beat-scale,1.25));transform:scale(var(--fa-beat-scale,1.25))}}@-webkit-keyframes fa-bounce{0%{-webkit-transform:scale(1,1) translateY(0);transform:scale(1,1) translateY(0)}10%{-webkit-transform:scale(var(--fa-bounce-start-scale-x,1.1),var(--fa-bounce-start-scale-y,.9)) translateY(0);transform:scale(var(--fa-bounce-start-scale-x,1.1),var(--fa-bounce-start-scale-y,.9)) translateY(0)}30%{-webkit-transform:scale(var(--fa-bounce-jump-scale-x,.9),var(--fa-bounce-jump-scale-y,1.1)) translateY(var(--fa-bounce-height,-.5em));transform:scale(var(--fa-bounce-jump-scale-x,.9),var(--fa-bounce-jump-scale-y,1.1)) translateY(var(--fa-bounce-height,-.5em))}50%{-webkit-transform:scale(var(--fa-bounce-land-scale-x,1.05),var(--fa-bounce-land-scale-y,.95)) translateY(0);transform:scale(var(--fa-bounce-land-scale-x,1.05),var(--fa-bounce-land-scale-y,.95)) translateY(0)}57%{-webkit-transform:scale(1,1) translateY(var(--fa-bounce-rebound,-.125em));transform:scale(1,1) translateY(var(--fa-bounce-rebound,-.125em))}64%{-webkit-transform:scale(1,1) translateY(0);transform:scale(1,1) translateY(0)}100%{-webkit-transform:scale(1,1) translateY(0);transform:scale(1,1) translateY(0)}}@keyframes fa-bounce{0%{-webkit-transform:scale(1,1) translateY(0);transform:scale(1,1) translateY(0)}10%{-webkit-transform:scale(var(--fa-bounce-start-scale-x,1.1),var(--fa-bounce-start-scale-y,.9)) translateY(0);transform:scale(var(--fa-bounce-start-scale-x,1.1),var(--fa-bounce-start-scale-y,.9)) translateY(0)}30%{-webkit-transform:scale(var(--fa-bounce-jump-scale-x,.9),var(--fa-bounce-jump-scale-y,1.1)) translateY(var(--fa-bounce-height,-.5em));transform:scale(var(--fa-bounce-jump-scale-x,.9),var(--fa-bounce-jump-scale-y,1.1)) translateY(var(--fa-bounce-height,-.5em))}50%{-webkit-transform:scale(var(--fa-bounce-land-scale-x,1.05),var(--fa-bounce-land-scale-y,.95)) translateY(0);transform:scale(var(--fa-bounce-land-scale-x,1.05),var(--fa-bounce-land-scale-y,.95)) translateY(0)}57%{-webkit-transform:scale(1,1) translateY(var(--fa-bounce-rebound,-.125em));transform:scale(1,1) translateY(var(--fa-bounce-rebound,-.125em))}64%{-webkit-transform:scale(1,1) translateY(0);transform:scale(1,1) translateY(0)}100%{-webkit-transform:scale(1,1) translateY(0);transform:scale(1,1) translateY(0)}}@-webkit-keyframes fa-fade{50%{opacity:var(--fa-fade-opacity,.4)}}@keyframes fa-fade{50%{opacity:var(--fa-fade-opacity,.4)}}@-webkit-keyframes fa-beat-fade{0%,100%{opacity:var(--fa-beat-fade-opacity,.4);-webkit-transform:scale(1);transform:scale(1)}50%{opacity:1;-webkit-transform:scale(var(--fa-beat-fade-scale,1.125));transform:scale(var(--fa-beat-fade-scale,1.125))}}@keyframes fa-beat-fade{0%,100%{opacity:var(--fa-beat-fade-opacity,.4);-webkit-transform:scale(1);transform:scale(1)}50%{opacity:1;-webkit-transform:scale(var(--fa-beat-fade-scale,1.125));transform:scale(var(--fa-beat-fade-scale,1.125))}}@-webkit-keyframes fa-flip{50%{-webkit-transform:rotate3d(var(--fa-flip-x,0),var(--fa-flip-y,1),var(--fa-flip-z,0),var(--fa-flip-angle,-180deg));transform:rotate3d(var(--fa-flip-x,0),var(--fa-flip-y,1),var(--fa-flip-z,0),var(--fa-flip-angle,-180deg))}}@keyframes fa-flip{50%{-webkit-transform:rotate3d(var(--fa-flip-x,0),var(--fa-flip-y,1),var(--fa-flip-z,0),var(--fa-flip-angle,-180deg));transform:rotate3d(var(--fa-flip-x,0),var(--fa-flip-y,1),var(--fa-flip-z,0),var(--fa-flip-angle,-180deg))}}@-webkit-keyframes fa-shake{0%{-webkit-transform:rotate(-15deg);transform:rotate(-15deg)}4%{-webkit-transform:rotate(15deg);transform:rotate(15deg)}24%,8%{-webkit-transform:rotate(-18deg);transform:rotate(-18deg)}12%,28%{-webkit-transform:rotate(18deg);transform:rotate(18deg)}16%{-webkit-transform:rotate(-22deg);transform:rotate(-22deg)}20%{-webkit-transform:rotate(22deg);transform:rotate(22deg)}32%{-webkit-transform:rotate(-12deg);transform:rotate(-12deg)}36%{-webkit-transform:rotate(12deg);transform:rotate(12deg)}100%,40%{-webkit-transform:rotate(0);transform:rotate(0)}}@keyframes fa-shake{0%{-webkit-transform:rotate(-15deg);transform:rotate(-15deg)}4%{-webkit-transform:rotate(15deg);transform:rotate(15deg)}24%,8%{-webkit-transform:rotate(-18deg);transform:rotate(-18deg)}12%,28%{-webkit-transform:rotate(18deg);transform:rotate(18deg)}16%{-webkit-transform:rotate(-22deg);transform:rotate(-22deg)}20%{-webkit-transform:rotate(22deg);transform:rotate(22deg)}32%{-webkit-transform:rotate(-12deg);transform:rotate(-12deg)}36%{-webkit-transform:rotate(12deg);transform:rotate(12deg)}100%,40%{-webkit-transform:rotate(0);transform:rotate(0)}}@-webkit-keyframes fa-spin{0%{-webkit-transform:rotate(0);transform:rotate(0)}100%{-webkit-transform:rotate(360deg);transform:rotate(360deg)}}@keyframes fa-spin{0%{-webkit-transform:rotate(0);transform:rotate(0)}100%{-webkit-transform:rotate(360deg);transform:rotate(360deg)}}.fa-rotate-90{-webkit-transform:rotate(90deg);transform:rotate(90deg)}.fa-rotate-180{-webkit-transform:rotate(180deg);transform:rotate(180deg)}.fa-rotate-270{-webkit-transform:rotate(270deg);transform:rotate(270deg)}.fa-flip-horizontal{-webkit-transform:scale(-1,1);transform:scale(-1,1)}.fa-flip-vertical{-webkit-transform:scale(1,-1);transform:scale(1,-1)}.fa-flip-both,.fa-flip-horizontal.fa-flip-vertical{-webkit-transform:scale(-1,-1);transform:scale(-1,-1)}.fa-rotate-by{-webkit-transform:rotate(var(--fa-rotate-angle,none));transform:rotate(var(--fa-rotate-angle,none))}.fa-stack{display:inline-block;vertical-align:middle;height:2em;position:relative;width:2.5em}.fa-stack-1x,.fa-stack-2x{bottom:0;left:0;margin:auto;position:absolute;right:0;top:0;z-index:var(--fa-stack-z-index,auto)}.svg-inline--fa.fa-stack-1x{height:1em;width:1.25em}.svg-inline--fa.fa-stack-2x{height:2em;width:2.5em}.fa-inverse{color:var(--fa-inverse,#fff)}.fa-sr-only,.sr-only{position:absolute;width:1px;height:1px;padding:0;margin:-1px;overflow:hidden;clip:rect(0,0,0,0);white-space:nowrap;border-width:0}.fa-sr-only-focusable:not(:focus),.sr-only-focusable:not(:focus){position:absolute;width:1px;height:1px;padding:0;margin:-1px;overflow:hidden;clip:rect(0,0,0,0);white-space:nowrap;border-width:0}.svg-inline--fa .fa-primary{fill:var(--fa-primary-color,currentColor);opacity:var(--fa-primary-opacity,1)}.svg-inline--fa .fa-secondary{fill:var(--fa-secondary-color,currentColor);opacity:var(--fa-secondary-opacity,.4)}.svg-inline--fa.fa-swap-opacity .fa-primary{opacity:var(--fa-secondary-opacity,.4)}.svg-inline--fa.fa-swap-opacity .fa-secondary{opacity:var(--fa-primary-opacity,1)}.svg-inline--fa mask .fa-primary,.svg-inline--fa mask .fa-secondary{fill:#000}.fa-duotone.fa-inverse,.fad.fa-inverse{color:var(--fa-inverse,#fff)}</style><link rel="apple-touch-icon" sizes="180x180" href="https://prium.github.io/phoenix/v1.14.0/assets/img/favicons/apple-touch-icon.png">
<link href="/resources/css/entry-detail-modal.css" rel="stylesheet">
<link href="/resources/css/theme.min.css" type="text/css" rel="stylesheet" id="style-default">
<script type="text/javascript" src="/resources/js/jquery.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="/resources/js/sweetalert2.min.js"></script>
<link rel="stylesheet" href="/resources/css/sweetalert2.min.css" />
      <script type="text/javascript">
      	var presentnPapersNo = "";
 	    window.onload = function(){
 	    	presentnPapersNo = opener.document.getElementById("parents").value;
 	    	//var presentnPapersNo = opener.document.querySelector("#parents").value;
 	      	console.log("부모에서 가져온 값 : ", presentnPapersNo);	//[object HTMLInputElement] 못받아옴
 	    	
 	      	let data = {presentnPapersNo: presentnPapersNo};
		    $.ajax({
		        method: "post",
		        url: "/cbs/cstbrkr/presentnPapersDetail",
		        data: JSON.stringify(data),
		        contentType: "application/json",
		        dataType: "json",
		        success: function(result) {
		        	console.log("result: ", result);
		            $("#presentnPapersNo").val(result.presentnPapersVOList[0].presentnPapersNo);
		            $("#cstmrCd").val(result.cstmrCd);
		            $("#papersPresentnDe").val(result.presentnPapersVOList[0].papersPresentnDe);
		            $("#entrprsNm").val(result.entrprsNm);
		            $("#scaleSe").val(result.scaleSe);
		            $("#charger").val(result.charger);
		            $("#reprsntAdres").val(result.reprsntAdres);
		            $("#reprsntDetailAdres").val(result.reprsntDetailAdres);
		            $("#reprsntTelno").val(result.reprsntTelno);
		            $("#taxNpymHist").val(result.taxNpymHist);
		            $("#crmnlHist").val(result.crmnlHist);
		            $("#reprsntEmail").val(result.reprsntEmail);
		            $("#bsnAt").val(result.bsnAt);
		            $("#processSttus").val(result.processSttus);
		            $("#atchmnflNo").val(result.presentnPapersVOList[0].atchmnflNo);
		            
		         // 기업규모 값에 따라 출력되는 값 설정
	                  let scaleSeDetText = "";
	                  switch (result.scaleSe) {
	                      case "SSE1":
	                          scaleSeDetText = "대기업";
	                          break;
	                      case "SSE2":
	                          scaleSeDetText = "중소기업";
	                          break;
	                      case "SSE3":
	                          scaleSeDetText = "소상공인";
	                          break;
	                      case "SSE4":	
	                          scaleSeDetText = "자영업자";
	                          break;
	                      default:
	                          scaleSeDetText = " - ";
	                  }
	                  $("#scaleSe").val(scaleSeDetText);
		            
	               // 영업여부 값에 따라 출력되는 값 설정
	                  let bsnAtText = "";
	                  switch (result.bsnAt) {
	                      case "T":
	                    	  bsnAtText = "영업중";
	                          break;
	                      case "F":
	                    	  bsnAtText = "폐업";
	                          break;
	                      default:
	                    	  bsnAtText = " - ";
	                  }
	                  $("#bsnAt").val(bsnAtText);
	                  
	               // 범죄이력 값에 따라 출력되는 값 설정
	                  let crmnlHistText = "";
	                  switch (result.crmnlHist) {
	                      case "T":
	                    	  crmnlHistText = "이력 있음";
	                          break;
	                      case "F":
	                    	  crmnlHistText = "이력 없음";
	                          break;
	                      default:
	                    	  crmnlHistText = " - ";
	                  }
	                  $("#crmnlHist").val(crmnlHistText);
	                  
	               // 세금체납이력 값에 따라 출력되는 값 설정
	                  let taxNpymHistText = "";
	                  switch (result.taxNpymHist) {
	                      case "T":
	                    	  taxNpymHistText = "이력 있음";
	                          break;
	                      case "F":
	                    	  taxNpymHistText = "이력 없음";
	                          break;
	                      default:
	                    	  taxNpymHistText = " - ";
	                  }
	                  $("#taxNpymHist").val(taxNpymHistText);
	                  
	               // 고객상태 승인여부 값에 따라 출력되는 값 설정
	                  let processSttusText = "";
	                  switch (result.processSttus) {
	                      case "CPS1":
	                    	  processSttusText = "신청전";
	                          break;
	                      case "CPS2":
	                    	  processSttusText = "처리중";
	                          break;
	                      case "CPS3":
	                    	  processSttusText = "승인";
	                          break;
	                      case "CPS4":
	                    	  processSttusText = "미승인";
	                          break;
	                      default:
	                    	  processSttusText = " - ";
	                  }
	                  $("#processSttus").val(processSttusText);   
	                  
		            let str = "";
		            
		            $.each(result.presentnPapersVOList[0].attachmentFileVOList,function(idx,attachmentFileVO){
			            str += "<div class='col-md-4 mb-3 mt-2'>";
		            	str += "<div class='input-group'>";
	            		str += "<div class='input-group-text' style='width: 100px;'>첨부파일</div>";
	           			str += "<input class='form-control inpDownload' data-atchmnfl-no='"+attachmentFileVO.atchmnflNo+"' data-atchmnfl-sn='"+attachmentFileVO.atchmnflSn+"' data-file-pth='"+attachmentFileVO.filePth+"' type='text' value='"+attachmentFileVO.fileNm+"' readonly style='cursor:pointer;'>";
	        			str += "</div>";
	        			str += "</div>";
	        			str += "</div>";
	        			str += "</div>";
		            });
		            
		            $("#divAttach").html(str);
		        }
		    });
		    
		    //파일다운로드
		    $(document).on("click",".inpDownload",function(){
		    	//data-atchmnfl-no="ATCH0001"
		    	let atchmnflNo = $(this).data("atchmnflNo");
		    	//data-atchmnfl-sn="1"
		    	let atchmnflSn = $(this).data("atchmnflSn");
		    	//data-file-pth="/team4/PapersFile/수입면장.pdf"
		    	let filePth = $(this).data("filePth");		    	
		    	//data-atchmnfl-nm="수입면장.pdf"
		    	let fileNm = $(this).data("fileNm");
		    	$("#atchmnflNo").val(atchmnflNo);
		    	$("#atchmnflSn").val(atchmnflSn);
		    	$("#fileNm").val(fileNm);
		    	console.log("atchmnflNo : " + atchmnflNo + ", atchmnflSn : " + atchmnflSn + ", filePth : " + filePth);
		    	
		    	// /download?fileName=/team4/PapersFile/%EC%88%98%EC%9E%85%EB%A9%B4%EC%9E%A5.pdf
		    	$("#ifrm").attr("src","/download?fileName="+filePth);
		    	
		    });
		    
		    //고객검사 요청
		    $(document).ready(function(){
		        $('#btnRequest').click(function() {
		            Swal.fire({
		                title: "고객 검사를 요청하시겠습니까?",
		                showCancelButton: true,
		                confirmButtonText: "예",
		                cancelButtonText: "아니요"
		            }).then(function(result) {
		                if (result.isConfirmed) {
		                	var cstmrCd = $('#cstmrCd').val();
		                	var processSttus = $('#processSttus').val();
		                	var requestData = {
		                	cstmrCd : cstmrCd,
		                	processSttus : processSttus
		                	};
		                	// 사용자가 확인을 클릭한 경우에만 요청을 보냄
		                    $.ajax({
		                        method: "POST",
		                        url: "/cbs/cstbrkr/customerRequest",
		                        contentType: "application/json",
		                        data: JSON.stringify(requestData),
		                        success: function(result) {
		                            console.log("update process_sttus: " + result);
		                            // 성공적으로 요청이 완료된 경우 메시지를 표시
		                            Swal.fire({
		                                title: "요청되었습니다",
		                                icon: "success",
		                                showConfirmButton: true
		                            });
		                        },
		                        error: function(xhr, status, error) {
		                            // 요청이 실패한 경우 에러 메시지를 콘솔에 출력
		                            console.error(xhr.responseText);
		                        }
		                    });
		                }
		            });
		        });
		    });
 	    }
      
      </script>

      <body>
      <iframe id="ifrm" src="" style="display: none;"></iframe>
        <div class="row" style="width: 100%;">
          <div class="card h-20">
            <div class="card-body pb-3">
              <div class="d-flex align-items-center mb-3">
                <h5 class="me-1">의뢰정보</h5>
              </div>
              <div class="row" id="dynamicRows">
                <div class="row" id="fam">
                  <div class="col-md-4 mb-3 mt-2">
                    <div class="input-group">
                      <div class="input-group-text" style="width: 100px;">제출서류번호</div>
                      <input class="form-control" id="presentnPapersNo" type="text" readonly>
                    </div>
                  </div>
                  <div class="col-md-4 mb-3 mt-2">
                    <div class="input-group">
                      <div class="input-group-text" style="width: 100px;">고객코드</div>
                      <input class="form-control" id="cstmrCd" type="text" readonly>
                    </div>
                  </div>
                  <div class="col-md-4 mb-3 mt-2">
                    <div class="input-group">
                      <div class="input-group-text" style="width: 100px;">제출일자</div>
                      <input class="form-control" id="papersPresentnDe" type="text" readonly>
                    </div>
                  </div>
              </div>
              <div class="row" id="divAttach">
              	<div class="col-md-4 mb-3 mt-2">
                <div class="input-group">
                  <div class="input-group-text" style="width: 80px;">첨부파일</div>
                  <input class="form-control" id="atchmnflNo" type="text" readonly >
                </div>
            </div>
          </div>
        </div>
      </div>
    </div>
   </div>
        <div class="row" style="width: 100%;">
          <div class="card h-70">
            <div class="card-body pb-3">
              <div class="d-flex align-items-center mb-3">
                <h5 class="me-1">고객정보</h5>
              </div>
              <div class="row" id="dynamicRows">
                <div class="row" id="fam">
                  <div class="col-md-6 mb-3 mt-2">
                    <div class="input-group">
                      <div class="input-group-text" style="width: 100px;">기업명</div>
                      <input class="form-control" id="entrprsNm" type="text" readonly>
                    </div>
                  </div>
                  <div class="col-md-3 mb-3 mt-2">
                    <div class="input-group">
                      <div class="input-group-text" style="width: 100px;">기업규모</div>
                      <input class="form-control" id="scaleSe" type="text" readonly>
                    </div>
                  </div>
                  <div class="col-md-3 mb-3 mt-2">
                    <div class="input-group">
                      <div class="input-group-text" style="width: 100px;">담당자</div>
                      <input class="form-control" id="charger" type="text" readonly>
                    </div>
                  </div>
                </div>
              </div>
              <div class="row" id="dynamicRows">
                <div class="row" id="fam">
                  <div class="col-md-6 mb-3 mt-2">
                    <div class="input-group">
                      <div class="input-group-text" style="width: 100px;">대표주소</div>
                      <input class="form-control" id="reprsntAdres" type="text" readonly>
                    </div>
                  </div>
                  <div class="col-md-6 mb-3 mt-2">
                    <div class="input-group">
                      <div class="input-group-text" style="width: 100px;">상세주소</div>
                      <input class="form-control" id="reprsntDetailAdres" type="text" readonly>
                    </div>
                  </div>
                </div>
              </div>
              <div class="row" id="dynamicRows">
                <div class="row" id="fam">
                  <div class="col-md-6 mb-3 mt-2">
                    <div class="input-group">
                      <div class="input-group-text" style="width: 100px;">대표전화번호</div>
                      <input class="form-control" id="reprsntTelno" type="text" readonly>
                    </div>
                  </div>
				  <div class="col-md-3 mb-3 mt-2">
                    <div class="input-group">
                      <div class="input-group-text" style="width: 100px;">세금체납이력</div>
                      <input class="form-control" id="taxNpymHist" type="text" readonly>
                    </div>
                  </div>
                  
                  <div class="col-md-3 mb-3 mt-2">
                    <div class="input-group">
                      <div class="input-group-text" style="width: 100px;">범죄이력</div>
                      <input class="form-control" id="crmnlHist" type="text" readonly>
                    </div>
                  </div>
                </div>
              </div>
              <div class="row" id="dynamicRows">
                <div class="row" id="fam">
                  <div class="col-md-6 mb-3 mt-2">
                    <div class="input-group">
                      <div class="input-group-text" style="width: 100px;">대표이메일</div>
                      <input class="form-control" id="reprsntEmail" type="text" readonly>
                    </div>
                  </div>
                  <div class="col-md-3 mb-3 mt-2">
                    <div class="input-group">
                      <div class="input-group-text" style="width: 100px;">영업여부</div>
                      <input class="form-control" id="bsnAt" type="text" readonly>
                    </div>
                  </div>
                  <div class="col-md-3 mb-3 mt-2">
                    <div class="input-group">
                      <div class="input-group-text" style="width: 100px;">고객승인상태</div>
                      <input class="form-control" id="processSttus" type="text" readonly>
                    </div>
                  </div>
                </div>
              </div>
              <div class="text-end">
      			<button class="btn btn-primary" type="button" id="btnRequest">검사요청</button>
      		</div>
          </div>
        </div>
      </div>
    </div>
    </body>

      </html>