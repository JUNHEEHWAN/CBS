<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <script type="text/javascript" src="/resources/js/jquery.min.js"></script>
    
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
.cs7 {font-size:9pt;color:#000000;font-family:"굴림";}
.cs8 {font-size:12pt;color:#000000;font-family:"휴먼명조", "HCI Poppy";}
.cs9 {font-size:12pt;color:#0000FF;font-family:"휴먼명조", "HCI Poppy";}
.cs10 {font-size:9.60pt;color:#000000;font-family:"바탕";}
.cs11 {font-size:8pt;color:#000000;font-family:"함초롬바탕";}
.cs12 {font-size:8pt;color:#000000;font-family:"굴림체", "H_CIRNUM";font-weight:bold;}
.cs13 {font-size:8pt;color:#000000;font-family:"굴림체";font-weight:bold;}
.cs14 {font-size:8pt;color:#000000;font-family:"굴림체", "H_CIRNUM";letter-spacing:-0.11em;font-weight:bold;}
.cs15 {font-size:8pt;color:#000000;font-family:"함초롬바탕";letter-spacing:-0.06em;font-weight:bold;}
.cs16 {font-size:10pt;color:#000000;font-family:"굴림체";}
.cs17 {font-size:8pt;color:#000000;font-family:"굴림체", "H_CIRNUM";letter-spacing:-0.02em;font-weight:bold;}
.cs18 {font-size:8pt;color:#000000;font-family:"굴림체";letter-spacing:-0.09em;font-weight:bold;}
.cs19 {font-size:8pt;color:#000000;font-family:"굴림체";letter-spacing:-0.06em;font-weight:bold;}
.cs20 {font-size:8pt;color:#000000;font-family:"굴림체";font-weight:bold;}
.cs21 {font-size:10pt;color:#0000FF;font-family:"함초롬바탕";}
.cs22 {font-size:8pt;color:#000000;font-family:"굴림체", "H_CIRNUM";letter-spacing:-0.02em;font-weight:bold;}
.cs23 {font-size:8pt;color:#000000;font-family:"굴림체";letter-spacing:-0.08em;font-weight:bold;}
.cs24 {font-size:10pt;color:#000000;font-family:"함초롬바탕";letter-spacing:-0.04em;}
.cs25 {font-size:8pt;color:#0000FF;font-family:"굴림체", "H_CIRNUM";letter-spacing:-0.11em;font-weight:bold;}
.cs26 {font-size:14pt;color:#000000;font-family:"바탕";}
.cs27 {font-size:19.20pt;color:#000000;font-family:"돋움";}
.cs28 {font-size:8pt;color:#000000;font-family:"바탕체";}
.cs29 {font-size:8.60pt;color:#000000;font-family:"바탕체";}
.cs30 {font-size:7.64pt;color:#000000;font-family:"바탕체";}
.cs31 {font-size:8pt;color:#000000;font-family:"굴림체";}
.cs32 {font-size:8pt;color:#000000;font-family:"바탕체";font-weight:bold;}
.cs33 {font-size:8pt;color:#000000;font-family:"굴림체";letter-spacing:-0.04em;font-weight:bold;}
.cs34 {font-size:8pt;color:#0000FF;font-family:"바탕체";}
.cs35 {font-size:8pt;color:#000000;font-family:"굴림체";letter-spacing:-0.02em;font-weight:bold;}
.cs36 {font-size:8pt;color:#000000;font-family:"굴림체";letter-spacing:0.06em;font-weight:bold;}
.cs37 {font-size:10pt;color:#000000;font-family:"한컴바탕";}
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
.ps19 {text-align:left;}
.ps20 {text-align:left;}
.ps21 {text-align:center;}
.ps22 {text-align:justify;}
.ps23 {text-align:left;}
.ps24 {text-align:right;}
.ps25 {text-align:left;}
.ps26 {text-align:left;}
.ps27 {text-align:right;}
.ps28 {text-align:left;}
.ps29 {text-align:left;}
.ps30 {text-align:right;}
.ps31 {text-align:center;}
.ps32 {text-align:left;}
.ps33 {text-align:justify;}
.ps34 {text-align:left;}
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
.ddas {
  display: flex;
  justify-content: center;
  align-items: center;
}
</style>
<body>
<nav style="margin-bottom: 10px; margin-left: 20px;">
<button type="button" class="btn btn-primary btn-sm" style="height: auto;" onclick="downPDF()">PDF다운</button>
</nav>

<div class="hpa" style="width: 210mm; height: 297mm;">
	<div class="hsR" style="top: 93.90mm; left: 63.94mm; width: 82.13mm; height: 100.12mm; background-repeat: no-repeat; background-image: url('수입신고서_hd1.png');"></div>
	<div class="hcD" style="left: 15mm; top: 24mm;">
		<div class="hcI">
			<div class="hls ps19" style="line-height: 3.43mm; white-space: nowrap; left: 0mm; top: -0.21mm; height: 4.23mm; width: 180mm;">
				<span class="hrt cs8">(별지 제1-3호) 작성예</span><span class="hrt cs9">(제12조제1항 관련)</span>
			</div>
			<div class="hls ps20" style="line-height: 2.66mm; white-space: nowrap; left: 0mm; top: 4.91mm; height: 3.39mm; width: 180mm;"></div>
			<div class="hls ps23" style="line-height: 2.66mm; white-space: nowrap; left: 0mm; top: 10.33mm; height: 3.39mm; width: 180mm;"></div>
			<div class="hls ps20" style="line-height: 2.66mm; white-space: nowrap; left: 0mm; top: 15.07mm; height: 3.39mm; width: 180mm;"></div>
			<div class="hls ps20" style="line-height: 217.84mm; white-space: nowrap; left: 0mm; top: 20.66mm; height: 217.84mm; width: 180mm;">
				<span class="hrt cs10">&nbsp;&nbsp;</span>
				<div class="htb" style="left: 0mm; width: 168.88mm; top: 0mm; height: 217.84mm; display: inline-block; position: relative; vertical-align: middle;">
					<svg class="hs" viewBox="-2.50 -2.50 173.88 222.84" style="left: -2.50mm; top: -2.50mm; width: 173.88mm; height: 222.84mm;">
						<path d="M0,0 L0,217.84" style="stroke:#000000;stroke-linecap:butt;stroke-width:0.40;"></path>
						<path d="M12.30,126.70 L12.30,151.99" style="stroke:#000000;stroke-linecap:butt;stroke-width:0.12;"></path>
						<path d="M22.94,96.99 L22.94,126.71" style="stroke:#000000;stroke-linecap:butt;stroke-width:0.12;"></path>
						<path d="M22.94,156.82 L22.94,217.84" style="stroke:#000000;stroke-linecap:butt;stroke-width:0.12;"></path>
						<path d="M44.96,0 L44.96,7.65" style="stroke:#000000;stroke-linecap:butt;stroke-width:0.12;"></path>
						<path d="M45.83,126.70 L45.83,151.99" style="stroke:#000000;stroke-linecap:butt;stroke-width:0.12;"></path>
						<path d="M46.44,71 L46.44,96.99" style="stroke:#000000;stroke-linecap:butt;stroke-width:0.12;"></path>
						<path d="M46.44,96.99 L46.44,101.76" style="stroke:#000000;stroke-linecap:butt;stroke-width:0.40;"></path>
						<path d="M46.44,101.76 L46.44,111.41" style="stroke:#000000;stroke-linecap:butt;stroke-width:0.12;"></path>
						<path d="M46.78,156.82 L46.78,166.47" style="stroke:#000000;stroke-linecap:butt;stroke-width:0.12;"></path>
						<path d="M46.86,166.47 L46.86,217.84" style="stroke:#000000;stroke-linecap:butt;stroke-width:0.40;"></path>
						<path d="M49.49,7.65 L49.49,15.30" style="stroke:#000000;stroke-linecap:butt;stroke-width:0.12;"></path>
						<path d="M59.63,156.82 L59.63,166.47" style="stroke:#000000;stroke-linecap:butt;stroke-width:0.12;"></path>
						<path d="M60.66,212.19 L60.66,217.84" style="stroke:#000000;stroke-linecap:butt;stroke-width:0.12;"></path>
						<path d="M63.99,126.70 L63.99,156.82" style="stroke:#000000;stroke-linecap:butt;stroke-width:0.12;"></path>
						<path d="M67.13,96.99 L67.13,126.71" style="stroke:#000000;stroke-linecap:butt;stroke-width:0.12;"></path>
						<path d="M71.14,0 L71.14,7.65" style="stroke:#000000;stroke-linecap:butt;stroke-width:0.12;"></path>
						<path d="M84.92,156.82 L84.92,166.47" style="stroke:#000000;stroke-linecap:butt;stroke-width:0.12;"></path>
						<path d="M85.51,15.30 L85.51,53.06" style="stroke:#000000;stroke-linecap:butt;stroke-width:0.12;"></path>
						<path d="M86.81,71 L86.81,96.99" style="stroke:#000000;stroke-linecap:butt;stroke-width:0.12;"></path>
						<path d="M90.44,126.70 L90.44,151.99" style="stroke:#000000;stroke-linecap:butt;stroke-width:0.12;"></path>
						<path d="M93.23,212.19 L93.23,217.84" style="stroke:#000000;stroke-linecap:butt;stroke-width:0.12;"></path>
						<path d="M96.91,0 L96.91,7.65" style="stroke:#000000;stroke-linecap:butt;stroke-width:0.12;"></path>
						<path d="M99.91,60.41 L99.91,71" style="stroke:#000000;stroke-linecap:butt;stroke-width:0.12;"></path>
						<path d="M99.91,156.82 L99.91,212.20" style="stroke:#000000;stroke-linecap:butt;stroke-width:0.12;"></path>
						<path d="M100.25,96.99 L100.25,126.71" style="stroke:#000000;stroke-linecap:butt;stroke-width:0.12;"></path>
						<path d="M109.50,7.65 L109.50,15.30" style="stroke:#000000;stroke-linecap:butt;stroke-width:0.12;"></path>
						<path d="M110.01,212.19 L110.01,217.84" style="stroke:#000000;stroke-linecap:butt;stroke-width:0.12;"></path>
						<path d="M115.34,15.30 L115.34,48.24" style="stroke:#000000;stroke-linecap:butt;stroke-width:0.12;"></path>
						<path d="M118.35,96.99 L118.35,111.41" style="stroke:#000000;stroke-linecap:butt;stroke-width:0.12;"></path>
						<path d="M118.74,71 L118.74,96.99" style="stroke:#000000;stroke-linecap:butt;stroke-width:0.12;"></path>
						<path d="M119.17,126.70 L119.17,151.99" style="stroke:#000000;stroke-linecap:butt;stroke-width:0.12;"></path>
						<path d="M124.21,156.82 L124.21,166.47" style="stroke:#000000;stroke-linecap:butt;stroke-width:0.12;"></path>
						<path d="M127.75,151.99 L127.75,156.82" style="stroke:#000000;stroke-linecap:butt;stroke-width:0.12;"></path>
						<path d="M134.41,106.58 L134.41,126.71" style="stroke:#000000;stroke-linecap:butt;stroke-width:0.12;"></path>
						<path d="M134.41,212.19 L134.41,217.84" style="stroke:#000000;stroke-linecap:butt;stroke-width:0.12;"></path>
						<path d="M136.41,0 L136.41,30.82" style="stroke:#000000;stroke-linecap:butt;stroke-width:0.12;"></path>
						<path d="M139.05,48.23 L139.05,53.06" style="stroke:#000000;stroke-linecap:butt;stroke-width:0.12;"></path>
						<path d="M139.11,156.82 L139.11,161.65" style="stroke:#000000;stroke-linecap:butt;stroke-width:0.12;"></path>
						<path d="M144.46,71 L144.46,106.58" style="stroke:#000000;stroke-linecap:butt;stroke-width:0.12;"></path>
						<path d="M144.46,126.70 L144.46,156.82" style="stroke:#000000;stroke-linecap:butt;stroke-width:0.12;"></path>
						<path d="M146.45,161.64 L146.45,166.47" style="stroke:#000000;stroke-linecap:butt;stroke-width:0.12;"></path>
						<path d="M147.97,30.82 L147.97,38.58" style="stroke:#000000;stroke-linecap:butt;stroke-width:0.12;"></path>
						<path d="M149.35,106.58 L149.35,111.41" style="stroke:#000000;stroke-linecap:butt;stroke-width:0.12;"></path>
						<path d="M150.89,212.19 L150.89,217.84" style="stroke:#000000;stroke-linecap:butt;stroke-width:0.12;"></path>
						<path d="M168.88,0 L168.88,217.84" style="stroke:#000000;stroke-linecap:butt;stroke-width:0.40;"></path>
						<path d="M0,0 L168.89,0" style="stroke:#000000;stroke-linecap:butt;stroke-width:0.40;"></path>
						<path d="M0,7.65 L168.89,7.65" style="stroke:#000000;stroke-linecap:butt;stroke-width:0.12;"></path>
						<path d="M0,15.30 L168.89,15.30" style="stroke:#000000;stroke-linecap:butt;stroke-width:0.40;"></path>
						<path d="M85.51,23.06 L168.89,23.06" style="stroke:#000000;stroke-linecap:butt;stroke-width:0.12;"></path>
						<path d="M85.51,30.82 L168.89,30.82" style="stroke:#000000;stroke-linecap:butt;stroke-width:0.12;"></path>
						<path d="M85.51,38.58 L168.89,38.58" style="stroke:#000000;stroke-linecap:butt;stroke-width:0.12;"></path>
						<path d="M115.34,43.41 L168.89,43.41" style="stroke:#000000;stroke-linecap:butt;stroke-width:0.12;"></path>
						<path d="M85.51,48.23 L168.89,48.23" style="stroke:#000000;stroke-linecap:butt;stroke-width:0.12;"></path>
						<path d="M0,53.06 L168.89,53.06" style="stroke:#000000;stroke-linecap:butt;stroke-width:0.12;"></path>
						<path d="M0,56.59 L168.89,56.59" style="stroke:#000000;stroke-linecap:butt;stroke-width:0.40;"></path>
						<path d="M0,60.41 L168.89,60.41" style="stroke:#000000;stroke-linecap:butt;stroke-width:0.12;"></path>
						<path d="M0,65.70 L99.91,65.70" style="stroke:#000000;stroke-linecap:butt;stroke-width:0.12;"></path>
						<path d="M0,71 L168.89,71" style="stroke:#000000;stroke-linecap:butt;stroke-width:0.12;"></path>
						<path d="M0,75.82 L168.89,75.82" style="stroke:#000000;stroke-linecap:butt;stroke-width:0.12;"></path>
						<path d="M0,86.41 L168.89,86.41" style="stroke:#000000;stroke-linecap:butt;stroke-width:0.12;"></path>
						<path d="M0,96.99 L168.89,96.99" style="stroke:#000000;stroke-linecap:butt;stroke-width:0.40;"></path>
						<path d="M0,101.76 L46.44,101.76" style="stroke:#000000;stroke-linecap:butt;stroke-width:0.40;"></path>
						<path d="M46.44,101.76 L144.46,101.76" style="stroke:#000000;stroke-linecap:butt;stroke-width:0.12;"></path>
						<path d="M22.94,106.58 L168.89,106.58" style="stroke:#000000;stroke-linecap:butt;stroke-width:0.12;"></path>
						<path d="M0,111.41 L168.89,111.41" style="stroke:#000000;stroke-linecap:butt;stroke-width:0.12;"></path>
						<path d="M22.94,119.06 L168.89,119.06" style="stroke:#000000;stroke-linecap:butt;stroke-width:0.12;"></path>
						<path d="M0,126.70 L168.89,126.70" style="stroke:#000000;stroke-linecap:butt;stroke-width:0.12;"></path>
						<path d="M0,131.53 L168.89,131.53" style="stroke:#000000;stroke-linecap:butt;stroke-width:0.12;"></path>
						<path d="M0,151.99 L168.89,151.99" style="stroke:#000000;stroke-linecap:butt;stroke-width:0.40;"></path>
						<path d="M0,156.82 L168.89,156.82" style="stroke:#000000;stroke-linecap:butt;stroke-width:0.12;"></path>
						<path d="M22.94,161.64 L168.89,161.64" style="stroke:#000000;stroke-linecap:butt;stroke-width:0.12;"></path>
						<path d="M0,166.47 L59.64,166.47" style="stroke:#000000;stroke-linecap:butt;stroke-width:0.12;"></path>
						<path d="M46.86,166.47 L168.89,166.47" style="stroke:#000000;stroke-linecap:butt;stroke-width:0.40;"></path>
						<path d="M0,170 L46.87,170" style="stroke:#000000;stroke-linecap:butt;stroke-width:0.12;"></path>
						<path d="M0,174.15 L46.87,174.15" style="stroke:#000000;stroke-linecap:butt;stroke-width:0.12;"></path>
						<path d="M0,178.31 L46.87,178.31" style="stroke:#000000;stroke-linecap:butt;stroke-width:0.12;"></path>
						<path d="M0,182.46 L46.87,182.46" style="stroke:#000000;stroke-linecap:butt;stroke-width:0.12;"></path>
						<path d="M0,186.62 L46.87,186.62" style="stroke:#000000;stroke-linecap:butt;stroke-width:0.12;"></path>
						<path d="M0,190.77 L46.87,190.77" style="stroke:#000000;stroke-linecap:butt;stroke-width:0.12;"></path>
						<path d="M0,194.93 L46.87,194.93" style="stroke:#000000;stroke-linecap:butt;stroke-width:0.12;"></path>
						<path d="M0,199.82 L99.91,199.82" style="stroke:#000000;stroke-linecap:butt;stroke-width:0.12;"></path>
						<path d="M0,207.02 L99.91,207.02" style="stroke:#000000;stroke-linecap:butt;stroke-width:0.12;"></path>
						<path d="M0,212.19 L46.87,212.19" style="stroke:#000000;stroke-linecap:butt;stroke-width:0.40;"></path>
						<path d="M46.86,212.19 L168.89,212.19" style="stroke:#000000;stroke-linecap:butt;stroke-width:0.12;"></path>
						<path d="M0,217.84 L168.89,217.84" style="stroke:#000000;stroke-linecap:butt;stroke-width:0.40;"></path>
						<path d="M168.88,0 L168.88,217.84" style="stroke:#000000;stroke-linecap:butt;stroke-width:0.40;"></path>
						<path d="M0,0 L0,217.84" style="stroke:#000000;stroke-linecap:butt;stroke-width:0.40;"></path>
						<path d="M0,217.84 L168.89,217.84" style="stroke:#000000;stroke-linecap:butt;stroke-width:0.40;"></path>
						<path d="M0,0 L168.89,0" style="stroke:#000000;stroke-linecap:butt;stroke-width:0.40;"></path></svg>
					<div class="hce" style="left: 0mm; top: 0mm; width: 44.96mm; height: 7.65mm;">
						<div class="hcD" style="left: 0mm; top: 0mm;">
							<div class="hcI">
								<div class="hls ps28" style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: -0.18mm; height: 3.53mm; width: 44.96mm;">
									<span class="hrt cs12">①</span><span class="hrt cs13">신고번호</span><span class="ddas" id="papersPresentnDe"></span>
								</div>
							</div>
						</div>
					</div>
					<div class="hce" style="left: 44.96mm; top: 0mm; width: 26.18mm; height: 7.65mm;">
						<div class="hcD" style="left: 0mm; top: 0mm;">
							<div class="hcI">
								<div class="hls ps28"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: -0.18mm; height: 3.53mm; width: 26.18mm;">
									<span class="hrt cs12">②</span><span class="hrt cs13">신고일&nbsp;</span><span class="ddas" id="papersPresentnDe1"></span>
								</div>
							</div>
						</div>
					</div>
					<div class="hce" style="left: 71.14mm; top: 0mm; width: 25.77mm; height: 7.65mm;">
						<div class="hcD" style="left: 0mm; top: 0mm;">
							<div class="hcI">
								<div class="hls ps28" style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: -0.18mm; height: 3.53mm; width: 25.77mm;">
									<span class="hrt cs12">③</span><span class="hrt cs13">세관.과</span><span class="ddas" id="manctmKwa1"></span>
								</div>
							</div>
						</div>
					</div>
					<div class="hce" style="left: 96.91mm; top: 0mm; width: 39.50mm; height: 7.65mm;">
						<div class="hcD" style="left: 0mm; top: 0mm;">
							<div class="hcI">
								<div class="hls ps28" style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: -0.18mm; height: 3.53mm; width: 39.50mm;">
									<span class="hrt cs12">⑥</span><span class="hrt cs13">입항일</span><span class="ddas" id="shipStartDe"></span>
								</div>
							</div>
						</div>
					</div>
					<div class="hce" style="left: 136.41mm; top: 0mm; width: 32.47mm; height: 7.65mm;">
						<div class="hcD" style="left: 0mm; top: 0mm;">
							<div class="hcI" style="top: 1mm;">
								<div class="hls ps29" style="line-height: 2.17mm; white-space: nowrap; left: 0mm; top: -0.14mm; height: 2.82mm; width: 32.47mm;">
									<span class="hco cs12" style="line-height: 2.12mm;"><span
										class="hcc"
										style="left: 0mm; font-size: 8pt; color: #000000; position: relative;">⑦</span></span><span
										class="hrt cs12">전자인보이스 제출번호</span>
								</div>
								<div class="hls ps28" style="line-height: 2.17mm; white-space: nowrap; left: 0mm; top: 2.68mm; height: 2.82mm; width: 32.47mm;"></div>
							</div>
						</div>
					</div>
					<div class="hce" style="left: 0mm; top: 7.65mm; width: 49.49mm; height: 7.65mm;">
						<div class="hcD" style="left: 0mm; top: 0mm;">
							<div class="hcI" style="top: 0.30mm;">
								<div class="hls ps28" style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: -0.18mm; height: 3.53mm; width: 49.49mm;">
									<span class="hrt cs12">④</span><span class="hrt cs13">B/L(AWB)번호</span><span class="ddas" id="waybilNo"></span>
								</div>
							</div>
						</div>
					</div>
					<div class="hce" style="left: 49.49mm; top: 7.65mm; width: 60.01mm; height: 7.65mm;">
						<div class="hcD" style="left: 0mm; top: 0mm;">
							<div class="hcI" style="top: 0.30mm;">
								<div class="hls ps29" style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: -0.18mm; height: 3.53mm; width: 60.01mm;">
									<span class="hrt cs12">⑤</span><span class="hrt cs13">화물관리번호</span><span class="ddas" id="cntanrInnb"></span>
								</div>
							</div>
						</div>
					</div>
					<div class="hce" style="left: 109.50mm; top: 7.65mm; width: 26.91mm; height: 7.65mm;">
						<div class="hcD" style="left: 0mm; top: 0mm;">
							<div class="hcI" style="top: 0.30mm;">
								<div class="hls ps29" style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: -0.18mm; height: 3.53mm; width: 26.91mm;">
									<span class="hco cs12" style="line-height: 2.12mm;"><span class="hcc"
										style="left: 0mm; font-size: 8pt; color: #000000; position: relative;">⑧</span></span><span
										class="hrt cs13">반입일</span><span class="ddas" id="shipEndDe"></span>
								</div>
							</div>
						</div>
					</div>
					<div class="hce"
						style="left: 136.41mm; top: 7.65mm; width: 32.47mm; height: 7.65mm;">
						<div class="hcD" style="left: 0mm; top: 0mm;">
							<div class="hcI" style="top: 0.30mm;">
								<div class="hls ps28"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: -0.18mm; height: 3.53mm; width: 32.47mm;">
									<span class="hrt cs12">⑨</span><span class="hrt cs13">징수형태</span><span class="ddas">14(사후납부)</span>
								</div>
								<div class="hls ps31"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: 3.35mm; height: 3.53mm; width: 32.47mm;"></div>
							</div>
						</div>
					</div>
					<div class="hce"
						style="left: 0mm; top: 15.30mm; width: 85.51mm; height: 37.76mm;">
						<div class="hcD" style="left: 0mm; top: 0mm;">
							<div class="hcI" style="top: 0.18mm;">
								<div class="hls ps28"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: -0.18mm; height: 3.53mm; width: 85.51mm;">
									<span class="hrt cs12">⑩</span><span class="hrt cs13">신 고 인&nbsp;</span><span class="ddas" id="userNm"></span>
								</div>
								<div class="hls ps28"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: 3.35mm; height: 3.53mm; width: 85.51mm;">
									<span class="hrt cs12">⑪</span><span class="hrt cs13">수 입 자&nbsp;</span><span class="ddas" id="client"></span>
								</div>
								<div class="hls ps28"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: 6.88mm; height: 3.53mm; width: 85.51mm;">
									<span class="hrt cs12">⑫납세의무자</span><span class="hrt cs13">&nbsp;</span>
								</div>
								<div class="hls ps28"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: 10.41mm; height: 3.53mm; width: 85.51mm;">
									<span class="hrt cs13">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span
										class="hrt cs31">(주소)</span><span class="hrt cs28">&nbsp;</span><span class="ddas" id="imprAdres"></span>
								</div>
								<div class="hls ps28"
									style="line-height: 2.17mm; white-space: nowrap; left: 0mm; top: 13.97mm; height: 2.82mm; width: 85.51mm;">
									<span class="hrt cs31">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(상호)&nbsp;</span><span class="ddas" id="imprCmpnm"></span>
								</div>
								<div class="hls ps28"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: 16.76mm; height: 3.53mm; width: 85.51mm;">
									<span class="hrt cs0">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span
										class="hrt cs31">(전화번호)&nbsp;</span><span class="ddas" id="imprTelno"></span>
								</div>
								<div class="hls ps28"
									style="line-height: 2.17mm; white-space: nowrap; left: 0mm; top: 20.32mm; height: 2.82mm; width: 85.51mm;">
									<span class="hrt cs11">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
									<span class="hrt cs31">&nbsp;(성명)</span><span class="ddas" id="imprCharger"></span>
								</div>
								<div class="hls ps28"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: 26.63mm; height: 3.53mm; width: 85.51mm;">
									<span class="hrt cs12">⑬운송주선인</span><span class="hrt cs13">&nbsp;</span><span class="ddas" id="drverNm"></span>
								</div>
								<div class="hls ps28"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: 30.16mm; height: 3.53mm; width: 85.51mm;">
									<span class="hco cs12" style="line-height: 2.12mm;"><span class="hcc"
										style="left: 0mm; font-size: 8pt; color: #000000; position: relative;">󰊉</span><span
										class="hcc" style="left: 0mm; font-size: 8pt; color: #000000;">󰊖</span></span><span
										class="hrt cs12">해외거래처</span><span class="hrt cs13">&nbsp;</span><span class="ddas" id="expterCmpnm"></span>
								</div>
								<div class="hls ps28"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: 33.69mm; height: 3.53mm; width: 85.51mm;">
									<span class="hrt cs28">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
								</div>
							</div>
						</div>
					</div>
					<div class="hce"
						style="left: 85.51mm; top: 15.30mm; width: 29.83mm; height: 7.76mm;">
						<div class="hcD" style="left: 0mm; top: 0mm;">
							<div class="hcI">
								<div class="hls ps32"
									style="line-height: 2.17mm; white-space: nowrap; left: 0mm; top: -0.14mm; height: 2.82mm; width: 29.83mm;">
									<span class="hco cs13" style="line-height: 2.12mm;"><span
										class="hcc"
										style="left: 0mm; font-size: 8pt; color: #000000; position: relative;">󰊉</span><span
										class="hcc" style="left: 0mm; font-size: 8pt; color: #000000;">󰊗</span></span><span
										class="hrt cs13">통관계획</span><span class="hrt cs32">&nbsp;&nbsp;&nbsp;&nbsp;</span><span class="ddas" id="thingTy1"></span>
								</div>
							</div>
						</div>
					</div>
					<div class="hce"
						style="left: 115.34mm; top: 15.30mm; width: 21.07mm; height: 7.76mm;">
						<div class="hcD" style="left: 0mm; top: 0mm;">
							<div class="hcI">
								<div class="hls ps33"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: -0.18mm; height: 3.53mm; width: 21.07mm;">
									<span class="hco cs13" style="line-height: 2.12mm;"><span
										class="hcc"
										style="left: 0mm; font-size: 8pt; color: #000000; position: relative;">󰊉</span><span
										class="hcc" style="left: 0mm; font-size: 8pt; color: #000000;">󰊛</span></span><span
										class="hrt cs33">원산지증명서</span>
								</div>
								<div class="hls ps28"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: 4.06mm; height: 3.53mm; width: 21.07mm;">
									<span class="hrt cs13">&nbsp;&nbsp;유무 &nbsp;&nbsp;</span><span class="ddas" id="thingTy2"></span>
								</div>
							</div>
						</div>
					</div>
					<div class="hce"
						style="left: 136.41mm; top: 15.30mm; width: 32.47mm; height: 7.76mm;">
						<div class="hcD" style="left: 0mm; top: 0mm;">
							<div class="hcI">
								<div class="hls ps33"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: -0.18mm; height: 3.53mm; width: 32.47mm;">
									<span class="hco cs13" style="line-height: 2.12mm;"><span
										class="hcc"
										style="left: 0mm; font-size: 8pt; color: #000000; position: relative;">󰊊</span><span
										class="hcc" style="left: 0mm; font-size: 8pt; color: #000000;">󰊓</span></span><span
										class="hrt cs13">총중량</span><span class="ddas" id="totWt"></span>
								</div>
								<div class="hls ps28"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: 4.06mm; height: 3.53mm; width: 32.47mm;">
									<span class="hrt cs28">&nbsp;</span>
								</div>
							</div>
						</div>
					</div>
					<div class="hce"
						style="left: 85.51mm; top: 23.06mm; width: 29.83mm; height: 7.76mm;">
						<div class="hcD" style="left: 0mm; top: 0mm;">
							<div class="hcI">
								<div class="hls ps28"
									style="line-height: 2.17mm; white-space: nowrap; left: 0mm; top: -0.14mm; height: 2.82mm; width: 29.83mm;">
									<span class="hco cs13" style="line-height: 2.12mm;"><span
										class="hcc"
										style="left: 0mm; font-size: 8pt; color: #000000; position: relative;">󰊉</span><span
										class="hcc" style="left: 0mm; font-size: 8pt; color: #000000;">󰊘</span></span><span
										class="hrt cs13">신고구분</span><span class="hrt cs32">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span class="ddas">일반서류신고</span>
								</div>
							</div>
						</div>
					</div>
					<div class="hce"
						style="left: 115.34mm; top: 23.06mm; width: 21.07mm; height: 7.76mm;">
						<div class="hcD" style="left: 0mm; top: 0mm;">
							<div class="hcI">
								<div class="hls ps33"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: -0.18mm; height: 3.53mm; width: 21.07mm;">
									<span class="hco cs13" style="line-height: 2.12mm;"><span
										class="hcc"
										style="left: 0mm; font-size: 8pt; color: #000000; position: relative;">󰊊</span><span
										class="hcc" style="left: 0mm; font-size: 8pt; color: #000000;">󰊒</span></span><span
										class="hrt cs13">가격신고서</span>
								</div>
								<div class="hls ps28"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: 4.06mm; height: 3.53mm; width: 21.07mm;">
									<span class="hrt cs13">&nbsp;&nbsp;유무 &nbsp;&nbsp;</span><span class="ddas" id="amount1"></span>
								</div>
							</div>
						</div>
					</div>
					<div class="hce"
						style="left: 136.41mm; top: 23.06mm; width: 32.47mm; height: 7.76mm;">
						<div class="hcD" style="left: 0mm; top: 0mm;">
							<div class="hcI">
								<div class="hls ps33"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: -0.18mm; height: 3.53mm; width: 32.47mm;">
									<span class="hco cs13" style="line-height: 2.12mm;"><span
										class="hcc"
										style="left: 0mm; font-size: 8pt; color: #000000; position: relative;">󰊊</span><span
										class="hcc" style="left: 0mm; font-size: 8pt; color: #000000;">󰊔</span></span><span
										class="hrt cs13">총포장갯수</span><span class="ddas" id="baggTnpakg"></span>
								</div>
								<div class="hls ps28"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: 4.06mm; height: 3.53mm; width: 32.47mm;">
									<span class="hrt cs13">&nbsp;</span>
								</div>
							</div>
						</div>
					</div>
					<div class="hce"
						style="left: 85.51mm; top: 30.82mm; width: 29.83mm; height: 7.76mm;">
						<div class="hcD" style="left: 0mm; top: 0mm;">
							<div class="hcI">
								<div class="hls ps33"
									style="line-height: 2.17mm; white-space: nowrap; left: 0mm; top: -0.14mm; height: 2.82mm; width: 29.83mm;">
									<span class="hco cs13" style="line-height: 2.12mm;"><span
										class="hcc"
										style="left: 0mm; font-size: 8pt; color: #000000; position: relative;">󰊉</span><span
										class="hcc" style="left: 0mm; font-size: 8pt; color: #000000;">󰊙</span></span><span
										class="hrt cs13">거래구분</span><span class="hrt cs32">&nbsp;&nbsp;</span><span
										class="hrt cs28">&nbsp;&nbsp;</span><span class="ddas">11</span>
								</div>
							</div>
						</div>
					</div>
					<div class="hce"
						style="left: 115.34mm; top: 30.82mm; width: 32.62mm; height: 7.76mm;">
						<div class="hcD" style="left: 0mm; top: 0mm;">
							<div class="hcI">
								<div class="hls ps33"
									style="line-height: 2.17mm; white-space: nowrap; left: 0mm; top: -0.14mm; height: 2.82mm; width: 32.62mm;">
									<span class="hco cs13" style="line-height: 2.12mm;"><span
										class="hcc"
										style="left: 0mm; font-size: 8pt; color: #000000; position: relative;">󰊊</span><span
										class="hcc" style="left: 0mm; font-size: 8pt; color: #000000;">󰊕</span></span><span
										class="hrt cs13">국내도착항&nbsp;</span><span class="ddas" id="arvlPrt"></span>
								</div>
							</div>
						</div>
					</div>
					<div class="hce"
						style="left: 147.97mm; top: 30.82mm; width: 20.91mm; height: 7.76mm;">
						<div class="hcD" style="left: 0mm; top: 0mm;">
							<div class="hcI">
								<div class="hls ps33"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: -0.18mm; height: 3.53mm; width: 20.91mm;">
									<span class="hco cs13" style="line-height: 2.12mm;"><span
										class="hcc"
										style="left: 0mm; font-size: 8pt; color: #000000; position: relative;">󰊊</span><span
										class="hcc" style="left: 0mm; font-size: 8pt; color: #000000;">󰊖</span></span><span
										class="hrt cs13">운송형태</span><span class="hrt cs28">&nbsp;</span><span class="ddas">10-LC</span>
								</div>
								<div class="hls ps27"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: 4.06mm; height: 3.53mm; width: 20.91mm;"></div>
							</div>
						</div>
					</div>
					<div class="hce"
						style="left: 85.51mm; top: 38.58mm; width: 29.83mm; height: 9.65mm;">
						<div class="hcD" style="left: 0mm; top: 0mm;">
							<div class="hcI">
								<div class="hls ps33"
									style="line-height: 2.17mm; white-space: nowrap; left: 0mm; top: -0.14mm; height: 2.82mm; width: 29.83mm;">
									<span class="hco cs13" style="line-height: 2.12mm;"><span
										class="hcc"
										style="left: 0mm; font-size: 8pt; color: #000000; position: relative;">󰊉</span><span
										class="hcc" style="left: 0mm; font-size: 8pt; color: #000000;">󰊚</span></span><span
										class="hrt cs13">종류</span><span class="hrt cs32">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span class="ddas">일반수입(내수용)</span>
								</div>
							</div>
						</div>
					</div>
					<div class="hce"
						style="left: 115.34mm; top: 38.58mm; width: 53.54mm; height: 4.83mm;">
						<div class="hcD" style="left: 0mm; top: 0mm;">
							<div class="hcI">
								<div class="hls ps33"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: -0.18mm; height: 3.53mm; width: 53.54mm;">
									<span class="hco cs13" style="line-height: 2.12mm;"><span
										class="hcc"
										style="left: 0mm; font-size: 8pt; color: #000000; position: relative;">󰊊</span><span
										class="hcc" style="left: 0mm; font-size: 8pt; color: #000000;">󰊗</span></span><span
										class="hrt cs13">적출국&nbsp;</span><span class="ddas" id="startPrt"></span>
								</div>
							</div>
						</div>
					</div>
					<div class="hce"
						style="left: 115.34mm; top: 43.41mm; width: 53.54mm; height: 4.83mm;">
						<div class="hcD" style="left: 0mm; top: 0mm;">
							<div class="hcI">
								<div class="hls ps33"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: -0.18mm; height: 3.53mm; width: 53.54mm;">
									<span class="hco cs13" style="line-height: 2.12mm;"><span
										class="hcc"
										style="left: 0mm; font-size: 8pt; color: #000000; position: relative;">󰊊</span><span
										class="hcc" style="left: 0mm; font-size: 8pt; color: #000000;">󰊘</span></span><span
										class="hrt cs13">선기명</span><span class="ddas" id="shipNm"></span>
								</div>
							</div>
						</div>
					</div>
					<div class="hce"
						style="left: 85.51mm; top: 48.23mm; width: 53.54mm; height: 4.83mm;">
						<div class="hcD" style="left: 0mm; top: 0mm;">
							<div class="hcI">
								<div class="hls ps33"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: -0.18mm; height: 3.53mm; width: 53.54mm;">
									<span class="hco cs13" style="line-height: 2.12mm;"><span
										class="hcc"
										style="left: 0mm; font-size: 8pt; color: #000000; position: relative;">󰊊</span><span
										class="hcc" style="left: 0mm; font-size: 8pt; color: #000000;">󰊙</span></span><span
										class="hrt cs35">MASTER B/L 번호</span><span class="hrt cs28">&nbsp;&nbsp;</span><span class="ddas" id="masterWaybilNo"></span>
								</div>
							</div>
						</div>
					</div>
					<div class="hce"
						style="left: 139.05mm; top: 48.23mm; width: 29.83mm; height: 4.83mm;">
						<div class="hcD" style="left: 0mm; top: 0mm;">
							<div class="hcI">
								<div class="hls ps33"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: -0.18mm; height: 3.53mm; width: 29.83mm;">
									<span class="hco cs13" style="line-height: 2.12mm;"><span
										class="hcc"
										style="left: 0mm; font-size: 8pt; color: #000000; position: relative;">󰊊</span><span
										class="hcc" style="left: 0mm; font-size: 8pt; color: #000000;">󰊚</span></span><span
										class="hrt cs19">운수기관부호</span><span class="ddas"></span>
								</div>
							</div>
						</div>
					</div>
					<div class="hce"
						style="left: 0mm; top: 53.06mm; width: 168.88mm; height: 3.53mm;">
						<div class="hcD" style="left: 0mm; top: 0mm;">
							<div class="hcI">
								<div class="hls ps28"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: -0.18mm; height: 3.53mm; width: 168.88mm;">
									<span class="hco cs13" style="line-height: 2.12mm;"><span
										class="hcc"
										style="left: 0mm; font-size: 8pt; color: #000000; position: relative;">󰊊</span><span
										class="hcc" style="left: 0mm; font-size: 8pt; color: #000000;">󰊛</span></span><span
										class="hrt cs13">검사(반입)장소 &nbsp;&nbsp;&nbsp;</span><span class="ddas" id="bndwasCd1"></span>
								</div>
							</div>
						</div>
					</div>
					<div class="hce"
						style="left: 0mm; top: 56.59mm; width: 168.88mm; height: 3.83mm;">
						<div class="hcD" style="left: 0mm; top: 0mm;">
							<div class="hcI" style="top: 0.15mm;">
								<div class="hls ps34"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: -0.18mm; height: 3.53mm; width: 168.88mm;">
									<span class="hrt cs13">● 품명․규격</span><span class="hrt cs11">&nbsp;</span>
<!-- 									<span class="hrt cs28">(란번호/총란수 : 999/999)</span> -->
								</div>
							</div>
						</div>
					</div>
					<div class="hce"
						style="left: 0mm; top: 60.41mm; width: 99.91mm; height: 5.29mm;">
						<div class="hcD" style="left: 0mm; top: 0mm;">
							<div class="hcI" style="top: 0.88mm;">
								<div class="hls ps33"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: -0.18mm; height: 3.53mm; width: 99.91mm;">
									<span class="hco cs13" style="line-height: 2.12mm;"><span
										class="hcc"
										style="left: 0mm; font-size: 8pt; color: #000000; position: relative;">󰊋</span><span
										class="hcc" style="left: 0mm; font-size: 8pt; color: #000000;">󰊒</span></span><span
										class="hrt cs13">품 &nbsp;&nbsp;&nbsp;명&nbsp;</span><span class="ddas" id="thingNm"></span><span
										class="hrt cs28">&nbsp;&nbsp;</span>
								</div>
							</div>
						</div>
					</div>
					<div class="hce"
						style="left: 99.91mm; top: 60.41mm; width: 68.98mm; height: 10.58mm;">
						<div class="hcD" style="left: 0mm; top: 0mm;">
							<div class="hcI" style="top: 3.88mm;">
								<div class="hls ps33"
									style="line-height: 2.17mm; white-space: nowrap; left: 0mm; top: -0.14mm; height: 2.82mm; width: 68.98mm;">
									<span class="hco cs13" style="line-height: 2.12mm;"><span
										class="hcc"
										style="left: 0mm; font-size: 8pt; color: #000000; position: relative;">󰊋</span><span
										class="hcc" style="left: 0mm; font-size: 8pt; color: #000000;">󰊔</span></span><span
										class="hrt cs36">상 표</span><span class="hrt cs13">&nbsp;</span>
								</div>
							</div>
						</div>
					</div>
					<div class="hce"
						style="left: 0mm; top: 65.70mm; width: 99.91mm; height: 5.29mm;">
						<div class="hcD" style="left: 0mm; top: 0mm;">
							<div class="hcI" style="top: 1.23mm;">
								<div class="hls ps33"
									style="line-height: 2.17mm; white-space: nowrap; left: 0mm; top: -0.14mm; height: 2.82mm; width: 99.91mm;">
									<span class="hco cs13" style="line-height: 2.12mm;"><span
										class="hcc"
										style="left: 0mm; font-size: 8pt; color: #000000; position: relative;">󰊋</span><span
										class="hcc" style="left: 0mm; font-size: 8pt; color: #000000;">󰊓</span></span><span
										class="hrt cs13">거래품명</span><span class="hrt cs28">&nbsp;&nbsp;</span><span class="ddas" id="delngPrdnm"></span>
								</div>
							</div>
						</div>
					</div>
					<div class="hce"
						style="left: 0mm; top: 71mm; width: 46.44mm; height: 4.83mm;">
						<div class="hcD" style="left: 0mm; top: 0mm;">
							<div class="hcI" style="top: 0.65mm;">
								<div class="hls ps33"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: -0.18mm; height: 3.53mm; width: 46.44mm;">
									<span class="hco cs13" style="line-height: 2.12mm;"><span
										class="hcc"
										style="left: 0mm; font-size: 8pt; color: #000000; position: relative;">󰊋</span><span
										class="hcc" style="left: 0mm; font-size: 8pt; color: #000000;">󰊕</span></span><span
										class="hrt cs12">모델․</span><span class="hrt cs13">규격&nbsp;</span><span class="ddas" id="goodsNm"></span>
								</div>
							</div>
						</div>
					</div>
					<div class="hce"
						style="left: 46.44mm; top: 71mm; width: 40.37mm; height: 4.83mm;">
						<div class="hcD" style="left: 0mm; top: 0mm;">
							<div class="hcI" style="top: 0.65mm;">
								<div class="hls ps33"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: -0.18mm; height: 3.53mm; width: 40.37mm;">
									<span class="hco cs13" style="line-height: 2.12mm;"><span
										class="hcc"
										style="left: 0mm; font-size: 8pt; color: #000000; position: relative;">󰊋</span><span
										class="hcc" style="left: 0mm; font-size: 8pt; color: #000000;">󰊖</span></span><span
										class="hrt cs13">성분</span>
								</div>
							</div>
						</div>
					</div>
					<div class="hce"
						style="left: 86.81mm; top: 71mm; width: 31.93mm; height: 4.83mm;">
						<div class="hcD" style="left: 0mm; top: 0mm;">
							<div class="hcI" style="top: 0.65mm;">
								<div class="hls ps33"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: -0.18mm; height: 3.53mm; width: 31.93mm;">
									<span class="hco cs13" style="line-height: 2.12mm;"><span
										class="hcc"
										style="left: 0mm; font-size: 8pt; color: #000000; position: relative;">󰊋</span><span
										class="hcc" style="left: 0mm; font-size: 8pt; color: #000000;">󰊗</span></span><span
										class="hrt cs13">수량</span><span class="ddas" id="qy"></span>
								</div>
							</div>
						</div>
					</div>
					<div class="hce"
						style="left: 118.74mm; top: 71mm; width: 25.71mm; height: 4.83mm;">
						<div class="hcD" style="left: 0mm; top: 0mm;">
							<div class="hcI" style="top: 0.65mm;">
								<div class="hls ps33"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: -0.18mm; height: 3.53mm; width: 25.71mm;">
									<span class="hco cs13" style="line-height: 2.12mm;"><span
										class="hcc"
										style="left: 0mm; font-size: 8pt; color: #000000; position: relative;">󰊋</span><span
										class="hcc" style="left: 0mm; font-size: 8pt; color: #000000;">󰊘</span></span><span
										class="hrt cs13">단가</span><span class="ddas" id="untpc"></span>
								</div>
							</div>
						</div>
					</div>
					<div class="hce"
						style="left: 144.46mm; top: 71mm; width: 24.43mm; height: 4.83mm;">
						<div class="hcD" style="left: 0mm; top: 0mm;">
							<div class="hcI" style="top: 0.65mm;">
								<div class="hls ps33"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: -0.18mm; height: 3.53mm; width: 24.43mm;">
									<span class="hco cs13" style="line-height: 2.12mm;"><span
										class="hcc"
										style="left: 0mm; font-size: 8pt; color: #000000; position: relative;">󰊋</span><span
										class="hcc" style="left: 0mm; font-size: 8pt; color: #000000;">󰊙</span></span><span
										class="hrt cs13">금액</span><span class="ddas" id="amount"></span>
								</div>
							</div>
						</div>
					</div>
					<div class="hce"
						style="left: 0mm; top: 75.82mm; width: 46.44mm; height: 10.58mm;">
						<div class="hcD" style="left: 0mm; top: 0mm;">
							<div class="hcI" style="top: 3.88mm;">
								<div class="hls ps28"
									style="line-height: 2.17mm; white-space: nowrap; left: 0mm; top: -0.14mm; height: 2.82mm; width: 46.44mm;"></div>
							</div>
						</div>
					</div>
					<div class="hce"
						style="left: 46.44mm; top: 75.82mm; width: 40.37mm; height: 10.58mm;">
						<div class="hcD" style="left: 0mm; top: 0mm;">
							<div class="hcI">
								<div class="hls ps32"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: -0.18mm; height: 3.53mm; width: 40.37mm;"></div>
							</div>
						</div>
					</div>
					<div class="hce"
						style="left: 86.81mm; top: 75.82mm; width: 31.93mm; height: 10.58mm;">
						<div class="hcD" style="left: 0mm; top: 0mm;">
							<div class="hcI">
								<div class="hls ps30"
									style="line-height: 2.17mm; white-space: nowrap; left: 0mm; top: -0.14mm; height: 2.82mm; width: 31.93mm;"></div>
							</div>
						</div>
					</div>
					<div class="hce"
						style="left: 118.74mm; top: 75.82mm; width: 25.71mm; height: 10.58mm;">
						<div class="hcD" style="left: 0mm; top: 0mm;">
							<div class="hcI">
								<div class="hls ps30"
									style="line-height: 2.17mm; white-space: nowrap; left: 0mm; top: -0.14mm; height: 2.82mm; width: 25.71mm;"></div>
							</div>
						</div>
					</div>
					<div class="hce"
						style="left: 144.46mm; top: 75.82mm; width: 24.43mm; height: 10.58mm;">
						<div class="hcD" style="left: 0mm; top: 0mm;">
							<div class="hcI">
								<div class="hls ps30"
									style="line-height: 2.17mm; white-space: nowrap; left: 0mm; top: -0.14mm; height: 2.82mm; width: 24.43mm;"></div>
							</div>
						</div>
					</div>
					<div class="hce"
						style="left: 0mm; top: 86.41mm; width: 46.44mm; height: 10.58mm;">
						<div class="hcD" style="left: 0mm; top: 0mm;">
							<div class="hcI" style="top: 3.88mm;">
								<div class="hls ps29"
									style="line-height: 2.17mm; white-space: nowrap; left: 0mm; top: -0.14mm; height: 2.82mm; width: 46.44mm;"></div>
							</div>
						</div>
					</div>
					<div class="hce"
						style="left: 46.44mm; top: 86.41mm; width: 40.37mm; height: 10.58mm;">
						<div class="hcD" style="left: 0mm; top: 0mm;">
							<div class="hcI">
								<div class="hls ps32"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: -0.18mm; height: 3.53mm; width: 40.37mm;"></div>
							</div>
						</div>
					</div>
					<div class="hce"
						style="left: 86.81mm; top: 86.41mm; width: 31.93mm; height: 10.58mm;">
						<div class="hcD" style="left: 0mm; top: 0mm;">
							<div class="hcI">
								<div class="hls ps30"
									style="line-height: 2.17mm; white-space: nowrap; left: 0mm; top: -0.14mm; height: 2.82mm; width: 31.93mm;"></div>
							</div>
						</div>
					</div>
					<div class="hce"
						style="left: 118.74mm; top: 86.41mm; width: 25.71mm; height: 10.58mm;">
						<div class="hcD" style="left: 0mm; top: 0mm;">
							<div class="hcI">
								<div class="hls ps30"
									style="line-height: 2.17mm; white-space: nowrap; left: 0mm; top: -0.14mm; height: 2.82mm; width: 25.71mm;"></div>
							</div>
						</div>
					</div>
					<div class="hce"
						style="left: 144.46mm; top: 86.41mm; width: 24.43mm; height: 10.58mm;">
						<div class="hcD" style="left: 0mm; top: 0mm;">
							<div class="hcI">
								<div class="hls ps30"
									style="line-height: 2.17mm; white-space: nowrap; left: 0mm; top: -0.14mm; height: 2.82mm; width: 24.43mm;"></div>
							</div>
						</div>
					</div>
					<div class="hce"
						style="left: 0mm; top: 96.99mm; width: 22.94mm; height: 4.77mm;">
						<div class="hcD" style="left: 0mm; top: 0mm;">
							<div class="hcI" style="top: 0.62mm;">
								<div class="hls ps33"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: -0.18mm; height: 3.53mm; width: 22.94mm;">
									<span class="hco cs13" style="line-height: 2.12mm;"><span
										class="hcc"
										style="left: 0mm; font-size: 8pt; color: #000000; position: relative;">󰊋</span><span
										class="hcc" style="left: 0mm; font-size: 8pt; color: #000000;">󰊚</span></span><span
										class="hrt cs13">세번 부호</span><span class="ddas" id="hsCd"></span>
								</div>
							</div>
						</div>
					</div>
					<div class="hce"
						style="left: 22.94mm; top: 96.99mm; width: 23.49mm; height: 4.77mm;">
						<div class="hcD" style="left: 0mm; top: 0mm;">
							<div class="hcI" style="top: 0.62mm;">
								<div class="hls ps21"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: -0.18mm; height: 3.53mm; width: 23.49mm;"></div>
							</div>
						</div>
					</div>
					<div class="hce"
						style="left: 46.44mm; top: 96.99mm; width: 20.69mm; height: 4.77mm;">
						<div class="hcD" style="left: 0mm; top: 0mm;">
							<div class="hcI" style="top: 0.62mm;">
								<div class="hls ps33"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: -0.18mm; height: 3.53mm; width: 20.69mm;">
									<span class="hco cs13" style="line-height: 2.12mm;"><span
										class="hcc"
										style="left: 0mm; font-size: 8pt; color: #000000; position: relative;">󰊌</span><span
										class="hcc" style="left: 0mm; font-size: 8pt; color: #000000;">󰊒</span></span><span
										class="hrt cs13">순중량</span><span class="ddas" id="netwght"></span>
								</div>
							</div>
						</div>
					</div>
					<div class="hce"
						style="left: 67.13mm; top: 96.99mm; width: 33.12mm; height: 4.77mm;">
						<div class="hcD" style="left: 0mm; top: 0mm;">
							<div class="hcI" style="top: 0.62mm;">
								<div class="hls ps27"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: -0.18mm; height: 3.53mm; width: 33.12mm;"></div>
							</div>
						</div>
					</div>
					<div class="hce"
						style="left: 100.25mm; top: 96.99mm; width: 18.10mm; height: 4.77mm;">
						<div class="hcD" style="left: 0mm; top: 0mm;">
							<div class="hcI" style="top: 0.62mm;">
								<div class="hls ps33"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: -0.18mm; height: 3.53mm; width: 18.10mm;">
									<span class="hco cs13" style="line-height: 2.12mm;"><span
										class="hcc"
										style="left: 0mm; font-size: 8pt; color: #000000; position: relative;">󰊌</span><span
										class="hcc" style="left: 0mm; font-size: 8pt; color: #000000;">󰊕</span></span><span
										class="hrt cs13">C/S 검사</span><span class="ddas">Y</span>
								</div>
							</div>
						</div>
					</div>
					<div class="hce"
						style="left: 118.35mm; top: 96.99mm; width: 26.11mm; height: 4.77mm;">
						<div class="hcD" style="left: 0mm; top: 0mm;">
							<div class="hcI" style="top: 0.97mm;">
								<div class="hls ps28"
									style="line-height: 2.17mm; white-space: nowrap; left: 0mm; top: -0.14mm; height: 2.82mm; width: 26.11mm;"></div>
							</div>
						</div>
					</div>
					<div class="hce"
						style="left: 144.46mm; top: 96.99mm; width: 24.43mm; height: 9.59mm;">
						<div class="hcD" style="left: 0mm; top: 0mm;">
							<div class="hcI" style="top: 1.27mm;">
								<div class="hls ps33"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: -0.18mm; height: 3.53mm; width: 24.43mm;">
									<span class="hco cs13" style="line-height: 2.12mm;"><span
										class="hcc"
										style="left: 0mm; font-size: 8pt; color: #000000; position: relative;">󰊌</span><span
										class="hcc" style="left: 0mm; font-size: 8pt; color: #000000;">󰊗</span></span><span
										class="hrt cs13">사후확인기관</span>
								</div>
								<div class="hls ps27"
									style="line-height: 2.17mm; white-space: nowrap; left: 0mm; top: 4.09mm; height: 2.82mm; width: 24.43mm;"></div>
							</div>
						</div>
					</div>
					<div class="hce"
						style="left: 0mm; top: 101.76mm; width: 22.94mm; height: 9.65mm;">
						<div class="hcD" style="left: 0mm; top: 0mm;">
							<div class="hcI" style="top: 3.06mm;">
								<div class="hls ps33"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: -0.18mm; height: 3.53mm; width: 22.94mm;">
									<span class="hco cs13" style="line-height: 2.12mm;"><span
										class="hcc"
										style="left: 0mm; font-size: 8pt; color: #000000; position: relative;">󰊋</span><span
										class="hcc" style="left: 0mm; font-size: 8pt; color: #000000;">󰊛</span></span><span
										class="hrt cs19">과세가격(</span><span class="hrt cs15">CIF)</span>
								</div>
							</div>
						</div>
					</div>
					<div class="hce"
						style="left: 22.94mm; top: 101.76mm; width: 23.49mm; height: 4.83mm;">
						<div class="hcD" style="left: 0mm; top: 0mm;">
							<div class="hcI" style="top: 0.65mm;">
								<div class="hls ps27"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: -0.18mm; height: 3.53mm; width: 23.49mm;"></div>
							</div>
						</div>
					</div>
					<div class="hce"
						style="left: 46.44mm; top: 101.76mm; width: 20.69mm; height: 4.83mm;">
						<div class="hcD" style="left: 0mm; top: 0mm;">
							<div class="hcI" style="top: 0.65mm;">
								<div class="hls ps33"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: -0.18mm; height: 3.53mm; width: 20.69mm;">
									<span class="hco cs13" style="line-height: 2.12mm;"><span
										class="hcc"
										style="left: 0mm; font-size: 8pt; color: #000000; position: relative;">󰊌</span><span
										class="hcc" style="left: 0mm; font-size: 8pt; color: #000000;">󰊓</span></span><span
										class="hrt cs13">수 &nbsp;량</span>
								</div>
							</div>
						</div>
					</div>
					<div class="hce"
						style="left: 67.13mm; top: 101.76mm; width: 33.12mm; height: 4.83mm;">
						<div class="hcD" style="left: 0mm; top: 0mm;">
							<div class="hcI" style="top: 0.65mm;">
								<div class="hls ps27"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: -0.18mm; height: 3.53mm; width: 33.12mm;"></div>
							</div>
						</div>
					</div>
					<div class="hce"
						style="left: 100.25mm; top: 101.76mm; width: 18.10mm; height: 4.83mm;">
						<div class="hcD" style="left: 0mm; top: 0mm;">
							<div class="hcI" style="top: 0.65mm;">
								<div class="hls ps33"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: -0.18mm; height: 3.53mm; width: 18.10mm;">
									<span class="hco cs13" style="line-height: 2.12mm;"><span
										class="hcc"
										style="left: 0mm; font-size: 8pt; color: #000000; position: relative;">󰊌</span><span
										class="hcc" style="left: 0mm; font-size: 8pt; color: #000000;">󰊖</span></span><span
										class="hrt cs13">검사변경</span>
								</div>
							</div>
						</div>
					</div>
					<div class="hce"
						style="left: 118.35mm; top: 101.76mm; width: 26.11mm; height: 4.83mm;">
						<div class="hcD" style="left: 0mm; top: 0mm;">
							<div class="hcI" style="top: 0.65mm;">
								<div class="hls ps28"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: -0.18mm; height: 3.53mm; width: 26.11mm;"></div>
							</div>
						</div>
					</div>
					<div class="hce"
						style="left: 22.94mm; top: 106.58mm; width: 23.49mm; height: 4.83mm;">
						<div class="hcD" style="left: 0mm; top: 0mm;">
							<div class="hcI" style="top: 0.65mm;">
								<div class="hls ps27"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: -0.18mm; height: 3.53mm; width: 23.49mm;"></div>
							</div>
						</div>
					</div>
					<div class="hce"
						style="left: 46.44mm; top: 106.58mm; width: 20.69mm; height: 4.83mm;">
						<div class="hcD" style="left: 0mm; top: 0mm;">
							<div class="hcI" style="top: 0.65mm;">
								<div class="hls ps33"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: -0.18mm; height: 3.53mm; width: 20.69mm;">
									<span class="hco cs13" style="line-height: 2.12mm;"><span
										class="hcc"
										style="left: 0mm; font-size: 8pt; color: #000000; position: relative;">󰊌</span><span
										class="hcc" style="left: 0mm; font-size: 8pt; color: #000000;">󰊔</span></span><span
										class="hrt cs12">환급</span><span class="hrt cs13">물량&nbsp;</span>
								</div>
							</div>
						</div>
					</div>
					<div class="hce"
						style="left: 67.13mm; top: 106.58mm; width: 33.12mm; height: 4.83mm;">
						<div class="hcD" style="left: 0mm; top: 0mm;">
							<div class="hcI" style="top: 0.65mm;">
								<div class="hls ps27"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: -0.18mm; height: 3.53mm; width: 33.12mm;"></div>
							</div>
						</div>
					</div>
					<div class="hce"
						style="left: 100.25mm; top: 106.58mm; width: 18.10mm; height: 4.83mm;">
						<div class="hcD" style="left: 0mm; top: 0mm;">
							<div class="hcI" style="top: 0.65mm;">
								<div class="hls ps33"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: -0.18mm; height: 3.53mm; width: 18.10mm;">
									<span class="hco cs13" style="line-height: 2.12mm;"><span
										class="hcc"
										style="left: 0mm; font-size: 8pt; color: #000000; position: relative;">󰊌</span><span
										class="hcc" style="left: 0mm; font-size: 8pt; color: #000000;">󰊘</span></span><span
										class="hrt cs20">원산지</span>
								</div>
							</div>
						</div>
					</div>
					<div class="hce"
						style="left: 118.35mm; top: 106.58mm; width: 16.06mm; height: 4.83mm;">
						<div class="hcD" style="left: 0mm; top: 0mm;">
							<div class="hcI" style="top: 0.65mm;">
								<div class="hls ps21"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: -0.18mm; height: 3.53mm; width: 16.06mm;"></div>
							</div>
						</div>
					</div>
					<div class="hce"
						style="left: 134.41mm; top: 106.58mm; width: 14.94mm; height: 4.83mm;">
						<div class="hcD" style="left: 0mm; top: 0mm;">
							<div class="hcI" style="top: 0.65mm;">
								<div class="hls ps33"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: -0.18mm; height: 3.53mm; width: 14.94mm;">
									<span class="hco cs13" style="line-height: 2.12mm;"><span
										class="hcc"
										style="left: 0mm; font-size: 8pt; color: #000000; position: relative;">󰊌</span><span
										class="hcc" style="left: 0mm; font-size: 8pt; color: #000000;">󰊙</span></span><span
										class="hrt cs22">특수세액</span>
								</div>
							</div>
						</div>
					</div>
					<div class="hce"
						style="left: 149.35mm; top: 106.58mm; width: 19.53mm; height: 4.83mm;">
						<div class="hcD" style="left: 0mm; top: 0mm;">
							<div class="hcI" style="top: 0.65mm;">
								<div class="hls ps28"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: -0.18mm; height: 3.53mm; width: 19.53mm;"></div>
							</div>
						</div>
					</div>
					<div class="hce"
						style="left: 0mm; top: 111.41mm; width: 22.94mm; height: 15.30mm;">
						<div class="hcD" style="left: 0mm; top: 0mm;">
							<div class="hcI" style="top: 3.77mm;">
								<div class="hls ps33"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: -0.18mm; height: 3.53mm; width: 22.94mm;">
									<span class="hco cs13" style="line-height: 2.12mm;"><span
										class="hcc"
										style="left: 0mm; font-size: 8pt; color: #000000; position: relative;">󰊌</span><span
										class="hcc" style="left: 0mm; font-size: 8pt; color: #000000;">󰊚</span></span><span
										class="hrt cs12">수입</span><span class="hrt cs13">요건확인</span>
								</div>
								<div class="hls ps21"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: 4.06mm; height: 3.53mm; width: 22.94mm;">
									<span class="hrt cs13">(발급서류명)&nbsp;</span>
								</div>
							</div>
						</div>
					</div>
					<div class="hce"
						style="left: 22.94mm; top: 111.41mm; width: 44.18mm; height: 7.65mm;">
						<div class="hcD" style="left: 0mm; top: 0mm;">
							<div class="hcI" style="top: 2.06mm;">
								<div class="hls ps21"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: -0.18mm; height: 3.53mm; width: 44.18mm;"></div>
							</div>
						</div>
					</div>
					<div class="hce"
						style="left: 67.13mm; top: 111.41mm; width: 33.12mm; height: 7.65mm;">
						<div class="hcD" style="left: 0mm; top: 0mm;">
							<div class="hcI" style="top: 2.06mm;">
								<div class="hls ps21"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: -0.18mm; height: 3.53mm; width: 33.12mm;"></div>
							</div>
						</div>
					</div>
					<div class="hce"
						style="left: 100.25mm; top: 111.41mm; width: 34.16mm; height: 7.65mm;">
						<div class="hcD" style="left: 0mm; top: 0mm;">
							<div class="hcI" style="top: 2.06mm;">
								<div class="hls ps21"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: -0.18mm; height: 3.53mm; width: 34.16mm;"></div>
							</div>
						</div>
					</div>
					<div class="hce"
						style="left: 134.41mm; top: 111.41mm; width: 34.47mm; height: 7.65mm;">
						<div class="hcD" style="left: 0mm; top: 0mm;">
							<div class="hcI" style="top: 2.06mm;">
								<div class="hls ps21"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: -0.18mm; height: 3.53mm; width: 34.47mm;"></div>
							</div>
						</div>
					</div>
					<div class="hce"
						style="left: 22.94mm; top: 119.06mm; width: 44.18mm; height: 7.65mm;">
						<div class="hcD" style="left: 0mm; top: 0mm;">
							<div class="hcI" style="top: 2.06mm;">
								<div class="hls ps21"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: -0.18mm; height: 3.53mm; width: 44.18mm;"></div>
							</div>
						</div>
					</div>
					<div class="hce"
						style="left: 67.13mm; top: 119.06mm; width: 33.12mm; height: 7.65mm;">
						<div class="hcD" style="left: 0mm; top: 0mm;">
							<div class="hcI" style="top: 2.06mm;">
								<div class="hls ps21"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: -0.18mm; height: 3.53mm; width: 33.12mm;"></div>
							</div>
						</div>
					</div>
					<div class="hce"
						style="left: 100.25mm; top: 119.06mm; width: 34.16mm; height: 7.65mm;">
						<div class="hcD" style="left: 0mm; top: 0mm;">
							<div class="hcI" style="top: 2.06mm;">
								<div class="hls ps21"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: -0.18mm; height: 3.53mm; width: 34.16mm;"></div>
							</div>
						</div>
					</div>
					<div class="hce"
						style="left: 134.41mm; top: 119.06mm; width: 34.47mm; height: 7.65mm;">
						<div class="hcD" style="left: 0mm; top: 0mm;">
							<div class="hcI" style="top: 2.06mm;">
								<div class="hls ps21"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: -0.18mm; height: 3.53mm; width: 34.47mm;"></div>
							</div>
						</div>
					</div>
					<div class="hce"
						style="left: 0mm; top: 126.70mm; width: 12.30mm; height: 4.83mm;">
						<div class="hcD" style="left: 0mm; top: 0mm;">
							<div class="hcI" style="top: 0.65mm;">
								<div class="hls ps33"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: -0.18mm; height: 3.53mm; width: 12.30mm;">
									<span class="hco cs13" style="line-height: 2.12mm;"><span
										class="hcc"
										style="left: 0mm; font-size: 8pt; color: #000000; position: relative;">󰊌</span><span
										class="hcc" style="left: 0mm; font-size: 8pt; color: #000000;">󰊛</span></span><span
										class="hrt cs13">세종</span>
								</div>
							</div>
						</div>
					</div>
					<div class="hce"
						style="left: 12.30mm; top: 126.70mm; width: 33.53mm; height: 4.83mm;">
						<div class="hcD" style="left: 0mm; top: 0mm;">
							<div class="hcI" style="top: 0.65mm;">
								<div class="hls ps33"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: -0.18mm; height: 3.53mm; width: 33.53mm;">
									<span class="hco cs13" style="line-height: 2.12mm;"><span
										class="hcc"
										style="left: 0mm; font-size: 8pt; color: #000000; position: relative;">󰊍</span><span
										class="hcc" style="left: 0mm; font-size: 8pt; color: #000000;">󰊒</span></span><span
										class="hrt cs13">세율(구분)</span>
								</div>
							</div>
						</div>
					</div>
					<div class="hce"
						style="left: 45.83mm; top: 126.70mm; width: 18.16mm; height: 4.83mm;">
						<div class="hcD" style="left: 0mm; top: 0mm;">
							<div class="hcI" style="top: 0.65mm;">
								<div class="hls ps33"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: -0.18mm; height: 3.53mm; width: 18.16mm;">
									<span class="hco cs13" style="line-height: 2.12mm;"><span
										class="hcc"
										style="left: 0mm; font-size: 8pt; color: #000000; position: relative;">󰊍</span><span
										class="hcc" style="left: 0mm; font-size: 8pt; color: #000000;">󰊓</span></span><span
										class="hrt cs13">감면율</span>
								</div>
							</div>
						</div>
					</div>
					<div class="hce"
						style="left: 63.99mm; top: 126.70mm; width: 26.44mm; height: 4.83mm;">
						<div class="hcD" style="left: 0mm; top: 0mm;">
							<div class="hcI" style="top: 0.65mm;">
								<div class="hls ps33"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: -0.18mm; height: 3.53mm; width: 26.44mm;">
									<span class="hco cs13" style="line-height: 2.12mm;"><span
										class="hcc"
										style="left: 0mm; font-size: 8pt; color: #000000; position: relative;">󰊍</span><span
										class="hcc" style="left: 0mm; font-size: 8pt; color: #000000;">󰊔</span></span><span
										class="hrt cs13">세액</span>
								</div>
							</div>
						</div>
					</div>
					<div class="hce"
						style="left: 90.44mm; top: 126.70mm; width: 28.73mm; height: 4.83mm;">
						<div class="hcD" style="left: 0mm; top: 0mm;">
							<div class="hcI" style="top: 0.65mm;">
								<div class="hls ps33"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: -0.18mm; height: 3.53mm; width: 28.73mm;">
									<span class="hco cs13" style="line-height: 2.12mm;"><span
										class="hcc"
										style="left: 0mm; font-size: 8pt; color: #000000; position: relative;">󰊍</span><span
										class="hcc" style="left: 0mm; font-size: 8pt; color: #000000;">󰊕</span></span><span
										class="hrt cs13">감면분납부호</span>
								</div>
							</div>
						</div>
					</div>
					<div class="hce"
						style="left: 119.17mm; top: 126.70mm; width: 25.29mm; height: 4.83mm;">
						<div class="hcD" style="left: 0mm; top: 0mm;">
							<div class="hcI" style="top: 0.65mm;">
								<div class="hls ps21"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: -0.18mm; height: 3.53mm; width: 25.29mm;">
									<span class="hrt cs13">감면액</span>
								</div>
							</div>
						</div>
					</div>
					<div class="hce"
						style="left: 144.46mm; top: 126.70mm; width: 24.43mm; height: 4.83mm;">
						<div class="hcD" style="left: 0mm; top: 0mm;">
							<div class="hcI" style="top: 0.65mm;">
								<div class="hls ps28"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: -0.18mm; height: 3.53mm; width: 24.43mm;">
									<span class="hrt cs13">* 내국세종부호</span>
								</div>
							</div>
						</div>
					</div>
					<div class="hce"
						style="left: 0mm; top: 131.53mm; width: 12.30mm; height: 20.46mm;">
						<div class="hcD" style="left: 0mm; top: 0mm;">
							<div class="hcI" style="top: 8.82mm;">
								<div class="hls ps22" style="line-height: 2.17mm; white-space: nowrap; left: 0mm; top: -2mm; height: 2.82mm; width: 12.30mm;"></div>
							</div>
						</div>
					</div>
					<div class="hce"
						style="left: 12.30mm; top: 131.53mm; width: 33.53mm; height: 20.46mm;">
						<div class="hcD" style="left: 0mm; top: 0mm;">
							<div class="hcI">
								<div class="hls ps22" style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: -0.18mm; height: 3.53mm; width: 33.53mm;"></div>
							</div>
						</div>
					</div>
					<div class="hce"
						style="left: 45.83mm; top: 131.53mm; width: 18.16mm; height: 20.46mm;">
						<div class="hcD" style="left: 0mm; top: 0mm;">
							<div class="hcI">
								<div class="hls ps22" style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: -0.18mm; height: 3.53mm; width: 18.16mm;"></div>
							</div>
						</div>
					</div>
					<div class="hce"
						style="left: 63.99mm; top: 131.53mm; width: 26.44mm; height: 20.46mm;">
						<div class="hcD" style="left: 0mm; top: 0mm;">
							<div class="hcI">
								<div class="hls ps22" style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: -0.18mm; height: 3.53mm; width: 26.44mm;"></div>
							</div>
						</div>
					</div>
					<div class="hce"
						style="left: 90.44mm; top: 131.53mm; width: 28.73mm; height: 20.46mm;">
						<div class="hcD" style="left: 0mm; top: 0mm;">
							<div class="hcI">
								<div class="hls ps22" style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: -0.18mm; height: 3.53mm; width: 28.73mm;"></div>
							</div>
						</div>
					</div>
					<div class="hce"
						style="left: 119.17mm; top: 131.53mm; width: 25.29mm; height: 20.46mm;">
						<div class="hcD" style="left: 0mm; top: 0mm;">
							<div class="hcI">
								<div class="hls ps22" style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: -0.18mm; height: 3.53mm; width: 25.29mm;"></div>
							</div>
						</div>
					</div>
					<div class="hce"
						style="left: 144.46mm; top: 131.53mm; width: 24.43mm; height: 20.46mm;">
						<div class="hcD" style="left: 0mm; top: 0mm;">
							<div class="hcI">
								<div class="hls ps22" style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: -0.18mm; height: 3.53mm; width: 24.43mm;"></div>
							</div>
						</div>
					</div>
					<div class="hce"
						style="left: 0mm; top: 151.99mm; width: 63.99mm; height: 4.83mm;">
						<div class="hcD" style="left: 0mm; top: 0mm;">
							<div class="hcI" style="top: 0.65mm;">
								<div class="hls ps33"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: -0.18mm; height: 3.53mm; width: 63.99mm;">
									<span class="hco cs13" style="line-height: 2.12mm;"><span
										class="hcc"
										style="left: 0mm; font-size: 8pt; color: #000000; position: relative;">󰊍</span><span
										class="hcc" style="left: 0mm; font-size: 8pt; color: #000000;">󰊖</span></span><span
										class="hrt cs33">결제금액(인도조건-통화종류-금액-결제방법)</span>
								</div>
							</div>
						</div>
					</div>
					<div class="hce"
						style="left: 63.99mm; top: 151.99mm; width: 63.75mm; height: 4.83mm;">
						<div class="hcD" style="left: 0mm; top: 0mm;">
							<div class="hcI" style="top: 0.65mm;">
								<div class="hls ps31"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: -0.18mm; height: 3.53mm; width: 63.75mm;"></div>
							</div>
						</div>
					</div>
					<div class="hce"
						style="left: 127.75mm; top: 151.99mm; width: 16.71mm; height: 4.83mm;">
						<div class="hcD" style="left: 0mm; top: 0mm;">
							<div class="hcI" style="top: 0.65mm;">
								<div class="hls ps33"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: -0.18mm; height: 3.53mm; width: 16.71mm;">
									<span class="hco cs13" style="line-height: 2.12mm;"><span
										class="hcc"
										style="left: 0mm; font-size: 8pt; color: #000000; position: relative;">󰊍</span><span
										class="hcc" style="left: 0mm; font-size: 8pt; color: #000000;">󰊘</span></span><span
										class="hrt cs13">환 &nbsp;&nbsp;&nbsp;율</span>
								</div>
							</div>
						</div>
					</div>
					<div class="hce"
						style="left: 144.46mm; top: 151.99mm; width: 24.43mm; height: 4.83mm;">
						<div class="hcD" style="left: 0mm; top: 0mm;">
							<div class="hcI" style="top: 0.65mm;">
								<div class="hls ps21"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: -0.18mm; height: 3.53mm; width: 24.43mm;">
									<span class="ddas" id="exchangeRate"></span></div>
							</div>
						</div>
					</div>
					<div class="hce"
						style="left: 0mm; top: 156.82mm; width: 22.94mm; height: 9.65mm;">
						<div class="hcD" style="left: 0mm; top: 0mm;">
							<div class="hcI" style="top: 3.06mm;">
								<div class="hls ps33"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: -0.18mm; height: 3.53mm; width: 22.94mm;">
									<span class="hco cs13" style="line-height: 2.12mm;"><span
										class="hcc"
										style="left: 0mm; font-size: 8pt; color: #000000; position: relative;">󰊍</span><span
										class="hcc" style="left: 0mm; font-size: 8pt; color: #000000;">󰊗</span></span><span
										class="hrt cs13">총과세가격</span>
								</div>
							</div>
						</div>
					</div>
					<div class="hce"
						style="left: 22.94mm; top: 156.82mm; width: 23.83mm; height: 4.83mm;">
						<div class="hcD" style="left: 0mm; top: 0mm;">
							<div class="hcI" style="top: 1mm;">
								<div class="hls ps27"
									style="line-height: 2.17mm; white-space: nowrap; left: 0mm; top: -0.14mm; height: 2.82mm; width: 23.83mm;">
									<span class="ddas">$</span></div>
							</div>
						</div>
					</div>
					<div class="hce" style="left: 46.78mm; top: 156.82mm; width: 12.86mm; height: 4.83mm;"><span class="ddas">$</span>
						<div class="hcD" style="left: 0mm; top: 0mm;">
							<div class="hcI" style="top: 0.65mm;">
								<div class="hls ps33"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: -0.18mm; height: 3.53mm; width: 12.86mm;">
									<span class="hco cs13" style="line-height: 2.12mm;"><span
										class="hcc"
										style="left: 0mm; font-size: 8pt; color: #000000; position: relative;">󰊍</span><span
										class="hcc" style="left: 0mm; font-size: 8pt; color: #000000;">󰊙</span></span><span
										class="hrt cs13">운임</span>
								</div>
							</div>
						</div>
					</div>
					<div class="hce"
						style="left: 59.63mm; top: 156.82mm; width: 25.29mm; height: 4.83mm;">
						<div class="hcD" style="left: 0mm; top: 0mm;">
							<div class="hcI" style="top: 0.65mm;">
								<div class="hls ps27"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: -0.18mm; height: 3.53mm; width: 25.29mm;"><span class="ddas" id="tax9"></span></div>
							</div>
						</div>
					</div>
					<div class="hce"
						style="left: 84.92mm; top: 156.82mm; width: 14.99mm; height: 4.83mm;">
						<div class="hcD" style="left: 0mm; top: 0mm;">
							<div class="hcI" style="top: 0.65mm;">
								<div class="hls ps33"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: -0.18mm; height: 3.53mm; width: 14.99mm;">
									<span class="hco cs13" style="line-height: 2.12mm;"><span
										class="hcc"
										style="left: 0mm; font-size: 8pt; color: #000000; position: relative;">󰊍</span><span
										class="hcc" style="left: 0mm; font-size: 8pt; color: #000000;">󰊛</span></span><span
										class="hrt cs13">가산금액</span>
								</div>
							</div>
						</div>
					</div>
					<div class="hce"
						style="left: 99.91mm; top: 156.82mm; width: 24.30mm; height: 4.83mm;">
						<div class="hcD" style="left: 0mm; top: 0mm;">
							<div class="hcI" style="top: 0.65mm;">
								<div class="hls ps27"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: -0.18mm; height: 3.53mm; width: 24.30mm;"><span class="ddas">0</span></div>
							</div>
						</div>
					</div>
					<div class="hce"
						style="left: 124.21mm; top: 156.82mm; width: 14.90mm; height: 4.83mm;">
						<div class="hcD" style="left: 0mm; top: 0mm;">
							<div class="hcI" style="top: 0.65mm;">
								<div class="hls ps33"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: -0.18mm; height: 3.53mm; width: 14.90mm;">
									<span class="hco cs13" style="line-height: 2.12mm;"><span
										class="hcc"
										style="left: 0mm; font-size: 8pt; color: #000000; position: relative;">󰊎</span><span
										class="hcc" style="left: 0mm; font-size: 8pt; color: #000000;">󰊖</span></span><span
										class="hrt cs23">납부서번호</span>
								</div>
							</div>
						</div>
					</div>
					<div class="hce"
						style="left: 139.11mm; top: 156.82mm; width: 29.77mm; height: 4.83mm;">
						<div class="hcD" style="left: 0mm; top: 0mm;">
							<div class="hcI" style="top: 0.65mm;">
								<div class="hls ps27"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: -0.18mm; height: 3.53mm; width: 29.77mm;"><span class="ddas">납부부서번호</span></div>
							</div>
						</div>
					</div>
					<div class="hce"
						style="left: 22.94mm; top: 161.64mm; width: 23.83mm; height: 4.83mm;">
						<div class="hcD" style="left: 0mm; top: 0mm;">
							<div class="hcI" style="top: 1mm;">
								<div class="hls ps27"
									style="line-height: 2.17mm; white-space: nowrap; left: 0mm; top: -0.14mm; height: 2.82mm; width: 23.83mm;">₩</div>
							</div>
						</div>
					</div>
					<div class="hce"
						style="left: 46.78mm; top: 161.64mm; width: 12.86mm; height: 4.83mm;">
						<div class="hcD" style="left: 0mm; top: 0mm;">
							<div class="hcI" style="top: 0.65mm;">
								<div class="hls ps33"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: -0.18mm; height: 3.53mm; width: 12.86mm;">
									<span class="hco cs13" style="line-height: 2.12mm;"><span
										class="hcc"
										style="left: 0mm; font-size: 8pt; color: #000000; position: relative;">󰊍</span><span
										class="hcc" style="left: 0mm; font-size: 8pt; color: #000000;">󰊚</span></span><span
										class="hrt cs13">보험료</span>
								</div>
							</div>
						</div>
					</div>
					<div class="hce"
						style="left: 59.63mm; top: 161.64mm; width: 25.29mm; height: 4.83mm;">
						<div class="hcD" style="left: 0mm; top: 0mm;">
							<div class="hcI" style="top: 0.65mm;">
								<div class="hls ps27"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: -0.18mm; height: 3.53mm; width: 25.29mm;"><span class="ddas">0</span></div>
							</div>
						</div>
					</div>
					<div class="hce"
						style="left: 84.92mm; top: 161.64mm; width: 14.99mm; height: 4.83mm;">
						<div class="hcD" style="left: 0mm; top: 0mm;">
							<div class="hcI" style="top: 0.65mm;">
								<div class="hls ps33"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: -0.18mm; height: 3.53mm; width: 14.99mm;">
									<span class="hco cs13" style="line-height: 2.12mm;"><span
										class="hcc"
										style="left: 0mm; font-size: 8pt; color: #000000; position: relative;">󰊎</span><span
										class="hcc" style="left: 0mm; font-size: 8pt; color: #000000;">󰊒</span></span><span
										class="hrt cs13">공제금액</span>
								</div>
							</div>
						</div>
					</div>
					<div class="hce"
						style="left: 99.91mm; top: 161.64mm; width: 24.30mm; height: 4.83mm;">
						<div class="hcD" style="left: 0mm; top: 0mm;">
							<div class="hcI" style="top: 0.65mm;">
								<div class="hls ps27"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: -0.18mm; height: 3.53mm; width: 24.30mm;"><span class="ddas">0</span></div>
							</div>
						</div>
					</div>
					<div class="hce"
						style="left: 124.21mm; top: 161.64mm; width: 22.25mm; height: 4.83mm;">
						<div class="hcD" style="left: 0mm; top: 0mm;">
							<div class="hcI" style="top: 0.65mm;">
								<div class="hls ps33"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: -0.18mm; height: 3.53mm; width: 22.24mm;">
									<span class="hco cs13" style="line-height: 2.12mm;"><span
										class="hcc"
										style="left: 0mm; font-size: 8pt; color: #000000; position: relative;">󰊎</span><span
										class="hcc" style="left: 0mm; font-size: 8pt; color: #000000;">󰊗</span></span><span
										class="hrt cs13">총</span><span class="hrt cs18">부가가치세과표</span>
								</div>
							</div>
						</div>
					</div>
					<div class="hce"
						style="left: 146.45mm; top: 161.64mm; width: 22.43mm; height: 4.83mm;">
						<div class="hcD" style="left: 0mm; top: 0mm;">
							<div class="hcI" style="top: 0.65mm;">
								<div class="hls ps27"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: -0.18mm; height: 3.53mm; width: 22.42mm;"><span class="ddas">0</span></div>
							</div>
						</div>
					</div>
					<div class="hce"
						style="left: 0mm; top: 166.47mm; width: 22.94mm; height: 3.53mm;">
						<div class="hcD" style="left: 0mm; top: 0mm;">
							<div class="hcI">
								<div class="hls ps33"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: -0.18mm; height: 3.53mm; width: 22.94mm;">
									<span class="hco cs13" style="line-height: 2.12mm;"><span
										class="hcc"
										style="left: 0mm; font-size: 8pt; color: #000000; position: relative;">󰊎</span><span
										class="hcc" style="left: 0mm; font-size: 8pt; color: #000000;">󰊓</span></span><span
										class="hrt cs13">세 종</span>
								</div>
							</div>
						</div>
					</div>
					<div class="hce"
						style="left: 22.94mm; top: 166.47mm; width: 23.92mm; height: 3.53mm;">
						<div class="hcD" style="left: 0mm; top: 0mm;">
							<div class="hcI">
								<div class="hls ps33"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: -0.18mm; height: 3.53mm; width: 23.92mm;">
									<span class="hco cs13" style="line-height: 2.12mm;"><span
										class="hcc"
										style="left: 0mm; font-size: 8pt; color: #000000; position: relative;">󰊎</span><span
										class="hcc" style="left: 0mm; font-size: 8pt; color: #000000;">󰊔</span></span><span
										class="hrt cs13">세 액</span>
								</div>
							</div>
						</div>
					</div>
					<div class="hce"
						style="left: 46.86mm; top: 166.47mm; width: 53.04mm; height: 33.35mm;">
						<div class="hcD" style="left: 0mm; top: 0mm;">
							<div class="hcI">
								<div class="hls ps28"
									style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: -0.18mm; height: 3.53mm; width: 53.04mm;">
									<span class="hrt cs12">※신고인기재란</span>
								</div>
							</div>
						</div>
					</div>
					<div class="hce"
						style="left: 99.91mm; top: 166.47mm; width: 68.98mm; height: 45.72mm;">
						<div class="hcD" style="left: 0mm; top: 0mm;">
							<div class="hcI">
								<div class="hls ps33"
									style="line-height: 2.17mm; white-space: nowrap; left: 0mm; top: -0.14mm; height: 2.82mm; width: 68.98mm;">
									<span class="hco cs13" style="line-height: 2.12mm;"><span
										class="hcc"
										style="left: 0mm; font-size: 8pt; color: #000000; position: relative;">󰊎</span><span
										class="hcc" style="left: 0mm; font-size: 8pt; color: #000000;">󰊘</span></span><span
										class="hrt cs12">세관기재란</span>
										
										<div>
 - 수입통관후 단순가공, 낱개 ,산울 ,분활 등 재포장 판매하거나 시공할 경우 원산지 표시를 하여야 하고, 양도(재양도 포함) 시에는 양수인에게 이 의무를 서면으로<br> 통보하여야 하며, 이를 위반시 관련법령에 따라 처벌 됨
 - 사후심사결과에 따라 적용세율 변경 될 수 있음.<br>`20.7.1일부터 중소기업의 컨테이너 수출임화률에 대해 세관검사비율을 지원하고 있으니 지원 대상 여부를 확인하시어 신청하시길 바랍니다.
										</div>
										
								</div>
							</div>
						</div>
					</div>
					<div class="hce" style="left: 0mm; top: 170mm; width: 22.94mm; height: 4.16mm;">
						<div class="hcD" style="left: 0mm; top: 0mm;">
							<div class="hcI" style="top: 0.67mm;">
								<div class="hls ps21" style="line-height: 2.17mm; white-space: nowrap; left: 0mm; top: -0.14mm; height: 2.82mm; width: 22.94mm;">
									<span class="hrt cs12">관 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;세</span>
								</div>
							</div>
						</div>
					</div>
					<div class="hce" style="left: 22.94mm; top: 170mm; width: 23.92mm; height: 4.16mm;">
						<div class="hcD" style="left: 0mm; top: 0mm;">
							<div class="hcI" style="top: 0.67mm;">
								<div class="hls ps22" style="line-height: 2.17mm; white-space: nowrap; left: 0mm; top: -0.14mm; height: 2.82mm; width: 23.92mm;"><span class="ddas" id="tax0"></span></div>
							</div>
						</div>
					</div>
					<div class="hce" style="left: 0mm; top: 174.15mm; width: 22.94mm; height: 4.16mm;">
						<div class="hcD" style="left: 0mm; top: 0mm;">
							<div class="hcI" style="top: 0.31mm;">
								<div class="hls ps21" style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: -0.18mm; height: 3.53mm; width: 22.94mm;">
									<span class="hrt cs12">특 &nbsp;소 &nbsp;세</span>
								</div>
							</div>
						</div>
					</div>
					<div class="hce" style="left: 22.94mm; top: 174.15mm; width: 23.92mm; height: 4.16mm;">
						<div class="hcD" style="left: 0mm; top: 0mm;">
							<div class="hcI" style="top: 0.67mm;">
								<div class="hls ps22" style="line-height: 2.17mm; white-space: nowrap; left: 0mm; top: -0.14mm; height: 2.82mm; width: 23.92mm;"><span class="ddas" id="tax1"></span></div>
							</div>
						</div>
					</div>
					<div class="hce" style="left: 0mm; top: 178.31mm; width: 22.94mm; height: 4.16mm;">
						<div class="hcD" style="left: 0mm; top: 0mm;">
							<div class="hcI" style="top: 0.67mm;">
								<div class="hls ps21" style="line-height: 2.17mm; white-space: nowrap; left: 0mm; top: -0.14mm; height: 2.82mm; width: 22.94mm;">
									<span class="hrt cs12">교 &nbsp;통 &nbsp;세</span>
								</div>
							</div>
						</div>
					</div>
					<div class="hce" style="left: 22.94mm; top: 178.31mm; width: 23.92mm; height: 4.16mm;">
						<div class="hcD" style="left: 0mm; top: 0mm;">
							<div class="hcI" style="top: 0.67mm;">
								<div class="hls ps22" style="line-height: 2.17mm; white-space: nowrap; left: 0mm; top: -0.14mm; height: 2.82mm; width: 23.92mm;"><span class="ddas" id="tax2"></span></div>
							</div>
						</div>
					</div>
					<div class="hce" style="left: 0mm; top: 182.46mm; width: 22.94mm; height: 4.16mm;">
						<div class="hcD" style="left: 0mm; top: 0mm;">
							<div class="hcI" style="top: 0.67mm;">
								<div class="hls ps21" style="line-height: 2.17mm; white-space: nowrap; left: 0mm; top: -0.14mm; height: 2.82mm; width: 22.94mm;">
									<span class="hrt cs12">주 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;세</span>
								</div>
							</div>
						</div>
					</div>
					<div class="hce" style="left: 22.94mm; top: 182.46mm; width: 23.92mm; height: 4.16mm;">
						<div class="hcD" style="left: 0mm; top: 0mm;">
							<div class="hcI" style="top: 0.67mm;">
								<div class="hls ps22" style="line-height: 2.17mm; white-space: nowrap; left: 0mm; top: -0.14mm; height: 2.82mm; width: 23.92mm;"><span class="ddas" id="tax3"></span></div>
							</div>
						</div>
					</div>
					<div class="hce" style="left: 0mm; top: 186.62mm; width: 22.94mm; height: 4.16mm;">
						<div class="hcD" style="left: 0mm; top: 0mm;">
							<div class="hcI" style="top: 0.67mm;">
								<div class="hls ps21" style="line-height: 2.17mm; white-space: nowrap; left: 0mm; top: -0.14mm; height: 2.82mm; width: 22.94mm;">
									<span class="hrt cs12">교 &nbsp;육 &nbsp;세</span>
								</div>
							</div>
						</div>
					</div>
					<div class="hce" style="left: 22.94mm; top: 186.62mm; width: 23.92mm; height: 4.16mm;">
						<div class="hcD" style="left: 0mm; top: 0mm;">
							<div class="hcI" style="top: 0.67mm;">
								<div class="hls ps22" style="line-height: 2.17mm; white-space: nowrap; left: 0mm; top: -0.14mm; height: 2.82mm; width: 23.92mm;"><span class="ddas" id="tax4"></span></div>
							</div>
						</div>
					</div>
					<div class="hce" style="left: 0mm; top: 190.77mm; width: 22.94mm; height: 4.16mm;">
						<div class="hcD" style="left: 0mm; top: 0mm;">
							<div class="hcI" style="top: 0.31mm;">
								<div class="hls ps21" style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: -0.18mm; height: 3.53mm; width: 22.94mm;">
									<span class="hrt cs12">농 &nbsp;특 &nbsp;세</span>
								</div>
							</div>
						</div>
					</div>
					<div class="hce" style="left: 22.94mm; top: 190.77mm; width: 23.92mm; height: 4.16mm;">
						<div class="hcD" style="left: 0mm; top: 0mm;">
							<div class="hcI" style="top: 0.67mm;">
								<div class="hls ps22" style="line-height: 2.17mm; white-space: nowrap; left: 0mm; top: -0.14mm; height: 2.82mm; width: 23.92mm;"><span class="ddas" id="tax5"></span></div>
							</div>
						</div>
					</div>
					<div class="hce" style="left: 0mm; top: 194.93mm; width: 22.94mm; height: 4.89mm;">
						<div class="hcD" style="left: 0mm; top: 0mm;">
							<div class="hcI" style="top: 1.03mm;">
								<div class="hls ps21" style="line-height: 2.17mm; white-space: nowrap; left: 0mm; top: -0.14mm; height: 2.82mm; width: 22.94mm;">
									<span class="hrt cs12">부 &nbsp;가 &nbsp;세</span>
								</div>
							</div>
						</div>
					</div>
					<div class="hce" style="left: 22.94mm; top: 194.93mm; width: 23.92mm; height: 4.89mm;">
						<div class="hcD" style="left: 0mm; top: 0mm;">
							<div class="hcI" style="top: 1.03mm;">
								<div class="hls ps22" style="line-height: 2.17mm; white-space: nowrap; left: 0mm; top: -0.14mm; height: 2.82mm; width: 23.92mm;"><span class="ddas" id="tax6"></span></div>
							</div>
						</div>
					</div>
					<div class="hce" style="left: 0mm; top: 199.82mm; width: 22.94mm; height: 7.20mm;">
						<div class="hcD" style="left: 0mm; top: 0mm;">
							<div class="hcI" style="top: 2.19mm;">
								<div class="hls ps21" style="line-height: 2.17mm; white-space: nowrap; left: 0mm; top: -0.14mm; height: 2.82mm; width: 22.94mm;">
									<span class="hrt cs14">신고지연가산세</span>
								</div>
							</div>
						</div>
					</div>
					<div class="hce" style="left: 22.94mm; top: 199.82mm; width: 23.92mm; height: 7.20mm;">
						<div class="hcD" style="left: 0mm; top: 0mm;">
							<div class="hcI" style="top: 2.19mm;">
								<div class="hls ps22" style="line-height: 2.17mm; white-space: nowrap; left: 0mm; top: -0.14mm; height: 2.82mm; width: 23.92mm;"><span class="ddas" id="tax7"></span></div>
							</div>
						</div>
					</div>
<!-- 					<div class="hce" style="left: 46.86mm; top: 199.82mm; width: 53.04mm; height: 7.20mm;"> -->
<!-- 						<div class="hcD" style="left: 0mm; top: 0mm;"> -->
<!-- 							<div class="hcI"> -->
<!-- 								<div class="hls ps22" style="line-height: 2.17mm; white-space: nowrap; left: 0mm; top: -0.14mm; height: 2.82mm; width: 53.04mm;"> -->
<!-- 									<span class="hrt cs12">- 전화번호&nbsp;</span> -->
<!-- 								</div> -->
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 					</div> -->
					<div class="hce" style="left: 0mm; top: 207.02mm; width: 22.94mm; height: 5.17mm;">
						<div class="hcD" style="left: 0mm; top: 0mm;">
							<div class="hcI" style="top: 1.17mm;">
								<div class="hls ps21" style="line-height: 2.17mm; white-space: nowrap; left: 0mm; top: -0.14mm; height: 2.82mm; width: 22.94mm;">
									<span class="hrt cs25">미신고가산세</span>
								</div>
							</div>
						</div>
					</div>
					<div class="hce" style="left: 22.94mm; top: 207.02mm; width: 23.92mm; height: 5.17mm;">
						<div class="hcD" style="left: 0mm; top: 0mm;">
							<div class="hcI" style="top: 1.17mm;">
								<div class="hls ps22" style="line-height: 2.17mm; white-space: nowrap; left: 0mm; top: -0.14mm; height: 2.82mm; width: 23.92mm;"><span class="ddas" id="tax8"></span></div>
							</div>
						</div>
					</div>
<!-- 					<div class="hce" style="left: 46.86mm; top: 207.02mm; width: 53.04mm; height: 5.17mm;"> -->
<!-- 						<div class="hcD" style="left: 0mm; top: 0mm;"> -->
<!-- 							<div class="hcI"> -->
<!-- 								<div class="hls ps22" style="line-height: 2.17mm; white-space: nowrap; left: 0mm; top: -0.14mm; height: 2.82mm; width: 53.04mm;"> -->
<!-- 									<span class="hrt cs12">- 이메일주소&nbsp;</span> -->
<!-- 								</div> -->
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 					</div> -->
					<div class="hce" style="left: 0mm; top: 212.19mm; width: 22.94mm; height: 5.64mm;">
						<div class="hcD" style="left: 0mm; top: 0mm;">
							<div class="hcI" style="top: 1.06mm;">
								<div class="hls ps33" style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: -0.18mm; height: 3.53mm; width: 22.94mm;">
									<span class="hco cs13" style="line-height: 2.12mm;"><span
										class="hcc"
										style="left: 0mm; font-size: 8pt; color: #000000; position: relative;">󰊎</span><span
										class="hcc" style="left: 0mm; font-size: 8pt; color: #000000;">󰊕</span></span><span
										class="hrt cs13">총세액합계</span>
								</div>
							</div>
						</div>
					</div>
					<div class="hce" style="left: 22.94mm; top: 212.19mm; width: 23.92mm; height: 5.64mm;">
						<div class="hcD" style="left: 0mm; top: 0mm;">
							<div class="hcI" style="top: 1.41mm;">
								<div class="hls ps27" style="line-height: 2.17mm; white-space: nowrap; left: 0mm; top: -0.14mm; height: 2.82mm; width: 23.92mm;"></div>
							</div>
						</div>
					</div>
					<div class="hce" style="left: 46.86mm; top: 212.19mm; width: 13.80mm; height: 5.64mm;">
						<div class="hcD" style="left: 0mm; top: 0mm;">
							<div class="hcI" style="top: 1.06mm;">
								<div class="hls ps33" style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: -0.18mm; height: 3.53mm; width: 13.80mm;">
									<span class="hco cs13" style="line-height: 2.12mm;"><span
										class="hcc"
										style="left: 0mm; font-size: 8pt; color: #000000; position: relative;">󰊎</span><span
										class="hcc" style="left: 0mm; font-size: 8pt; color: #000000;">󰊙</span></span><span
										class="hrt cs13">담당자&nbsp;</span>
								</div>
							</div>
						</div>
					</div>
					<div class="hce" style="left: 60.66mm; top: 212.19mm; width: 32.57mm; height: 5.64mm;">
						<div class="hcD" style="left: 0mm; top: 0mm;">
							<div class="hcI" style="top: 1.06mm;">
								<div class="hls ps28" style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: -0.18mm; height: 3.53mm; width: 32.57mm;"><span class="ddas" id="pbsvntCd"></span></div>
							</div>
						</div>
					</div>
					<div class="hce" style="left: 93.23mm; top: 212.19mm; width: 16.78mm; height: 5.64mm;">
						<div class="hcD" style="left: 0mm; top: 0mm;">
							<div class="hcI" style="top: 1.06mm;">
								<div class="hls ps33" style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: -0.18mm; height: 3.53mm; width: 16.78mm;">
									<span class="hco cs13" style="line-height: 2.12mm;"><span
										class="hcc"
										style="left: 0mm; font-size: 8pt; color: #000000; position: relative;">󰊎</span><span
										class="hcc" style="left: 0mm; font-size: 8pt; color: #000000;">󰊚</span></span><span
										class="hrt cs17">접수일시</span>
								</div>
							</div>
						</div>
					</div>
					<div class="hce" style="left: 110.01mm; top: 212.19mm; width: 24.40mm; height: 5.64mm;">
						<div class="hcD" style="left: 0mm; top: 0mm;">
							<div class="hcI" style="top: 1.06mm;">
								<div class="hls ps28" style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: -0.18mm; height: 3.53mm; width: 24.40mm;"><span class="ddas" id="papersPresentnDe2"></span></div>
							</div>
						</div>
					</div>
					<div class="hce" style="left: 134.41mm; top: 212.19mm; width: 16.48mm; height: 5.64mm;">
						<div class="hcD" style="left: 0mm; top: 0mm;">
							<div class="hcI" style="top: 1.06mm;">
								<div class="hls ps33" style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: -0.18mm; height: 3.53mm; width: 16.48mm;">
									<span class="hco cs13" style="line-height: 2.12mm;"><span
										class="hcc"
										style="left: 0mm; font-size: 8pt; color: #000000; position: relative;">󰊎</span><span
										class="hcc" style="left: 0mm; font-size: 8pt; color: #000000;">󰊛</span></span><span
										class="hrt cs13">수리일자</span>
								</div>
							</div>
						</div>
					</div>
					<div class="hce" style="left: 150.89mm; top: 212.19mm; width: 17.99mm; height: 5.64mm;">
						<div class="hcD" style="left: 0mm; top: 0mm;">
							<div class="hcI" style="top: 1.06mm;">
								<div class="hls ps21" style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: -0.18mm; height: 3.53mm; width: 17.99mm;"><span class="ddas" id="papersPresentnDe3"></span></div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="hsR" style="top: 32.82mm; left: 75.53mm; width: 50.14mm; height: 6.86mm;">
		<div class="hsT" style="left: -0.04mm; top: -0.04mm; width: 50.14mm; height: 6.86mm;">
			<div class="hcD" style="left: 0.04mm; top: 0.04mm;">
				<div class="hcI">
					<div class="hls ps26" style="line-height: 5.97mm; white-space: nowrap; left: 0mm; top: -0.34mm; height: 6.77mm; width: 50.05mm;">
						<span class="hrt cs27">수 입 신 고 서</span>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="hsR" style="top: 32.82mm; left: 75.53mm; width: 50.13mm; height: 6.86mm;">
		<div class="hsT" style="left: -0.04mm; top: -0.04mm; width: 50.13mm; height: 6.86mm;">
			<div class="hcD" style="left: 0.04mm; top: 0.04mm;">
				<div class="hcI">
					<div class="hls ps26" style="line-height: 5.97mm; white-space: nowrap; left: 0mm; top: -0.34mm; height: 6.77mm; width: 50.04mm;">
						<span class="hrt cs27">수 입 신 고 서</span>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="hsR" style="top: 36.06mm; left: 155.57mm; width: 30.23mm; height: 5.01mm;">
		<div class="hsT" style="left: -0.04mm; top: -0.04mm; width: 30.23mm; height: 5.01mm;">
			<div class="hcD" style="left: 1.04mm; top: 1.04mm;">
				<div class="hcI" style="top: 0.05mm;">
					<div class="hls ps21" style="line-height: 2.17mm; white-space: nowrap; left: 0mm; top: -0.14mm; height: 2.82mm; width: 28.14mm;">
						<span class="hrt cs28">※ 처리기간 : 3일</span>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="hsR" style="top: 308mm; left: 91.73mm; width: 116.50mm; height: 3.12mm;">
		<div class="hsT" style="left: -0.04mm; top: -0.04mm; width: 116.50mm; height: 3.12mm;">
			<div class="hcD" style="left: 0.04mm; top: 0.04mm;">
				<div class="hcI">
					<div class="hls ps27" style="line-height: 2.35mm; white-space: nowrap; left: 0mm; top: -0.15mm; height: 3.03mm; width: 116.42mm;">
						<span class="hrt cs29">세관․과</span><span class="hrt cs30">&nbsp;</span><span
							class="hrt cs29">:</span><span class="hrt cs30">&nbsp;</span><span
							class="hrt cs29">999-99</span><span class="hrt cs30">&nbsp;&nbsp;&nbsp;</span><span
							class="hrt cs29">신고번호</span><span class="hrt cs30">&nbsp;</span><span
							class="hrt cs29">:</span><span class="hrt cs30">&nbsp;</span><span
							class="hrt cs29">99999-99-9999999-9</span><span class="hrt cs30">&nbsp;&nbsp;&nbsp;</span><span
							class="hrt cs29">Page</span><span class="hrt cs30">&nbsp;</span><span
							class="hrt cs29">:</span><span class="hrt cs30">&nbsp;</span><span
							class="hrt cs29">999/999</span>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="hsR" style="top: 268.57mm; left: 17.26mm; width: 16.56mm; height: 8.55mm; background-repeat: no-repeat; background-image: url('수입신고서_hd2.png');"></div>
	<div class="hsR" style="top: 264.14mm; left: 80.42mm; width: 103.35mm; height: 4.18mm;">
		<div class="hsT" style="left: -0.04mm; top: -0.04mm; width: 103.35mm; height: 4.18mm;">
			<div class="hcD" style="left: 0.04mm; top: 0.04mm;">
				<div class="hcI">
					<div class="hls ps24" style="line-height: 2.17mm; white-space: nowrap; left: 0mm; top: -0.14mm; height: 2.82mm; width: 102.15mm;">
						<span class="hrt cs11">세관․과 : <span class="ddas" id="manctmKwa2"></span>&nbsp;</span> <span class="hrt cs28">&nbsp;</span><span class="hrt cs11">&nbsp;신고번호 : 99999-99-9999999-9 &nbsp;&nbsp;Page : 1/1</span>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="hsR" style="top: 268.57mm; left: 39.77mm; width: 143.39mm; height: 8.55mm; background-repeat: no-repeat; background-image: url('수입신고서_hd3.png');"></div>
</div>
</body>
</html>