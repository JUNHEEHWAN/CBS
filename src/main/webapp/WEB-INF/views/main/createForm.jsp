<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<style>
.main {
	background-image: url('/resources/img/메인영상2.gif');
	background-size: cover;
}

</style>
<script src="/resources/js/jquery.min.js"></script>
<script src="/resources/css/imagesloaded.pkgd.min.js"></script>
<script src="/resources/css/simplebar.min.js"></script>
<script src="/resources/css/config.js"></script>
<script src="/resources/js/jquery.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>



<html data-navigation-type="horizontal" data-navbar-horizontal-shape="default" lang="en-US" dir="ltr" class="chrome windows fontawesome-i2svg-active fontawesome-i2svg-complete"><head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- ===============================================-->
    <!--    Document Title-->
    <!-- ===============================================-->
    <title>Phoenix</title>

    <!-- ===============================================-->
    <!--    Favicons-->
    <!-- ===============================================-->
    <style type="text/css">:host,:root{--fa-font-solid:normal 900 1em/1 "Font Awesome 6 Solid";--fa-font-regular:normal 400 1em/1 "Font Awesome 6 Regular";--fa-font-light:normal 300 1em/1 "Font Awesome 6 Light";--fa-font-thin:normal 100 1em/1 "Font Awesome 6 Thin";--fa-font-duotone:normal 900 1em/1 "Font Awesome 6 Duotone";--fa-font-brands:normal 400 1em/1 "Font Awesome 6 Brands"}svg:not(:host).svg-inline--fa,svg:not(:root).svg-inline--fa{overflow:visible;box-sizing:content-box}.svg-inline--fa{display:var(--fa-display,inline-block);height:1em;overflow:visible;vertical-align:-.125em}.svg-inline--fa.fa-2xs{vertical-align:.1em}.svg-inline--fa.fa-xs{vertical-align:0}.svg-inline--fa.fa-sm{vertical-align:-.0714285705em}.svg-inline--fa.fa-lg{vertical-align:-.2em}.svg-inline--fa.fa-xl{vertical-align:-.25em}.svg-inline--fa.fa-2xl{vertical-align:-.3125em}.svg-inline--fa.fa-pull-left{margin-right:var(--fa-pull-margin,.3em);width:auto}.svg-inline--fa.fa-pull-right{margin-left:var(--fa-pull-margin,.3em);width:auto}.svg-inline--fa.fa-li{width:var(--fa-li-width,2em);top:.25em}.svg-inline--fa.fa-fw{width:var(--fa-fw-width,1.25em)}.fa-layers svg.svg-inline--fa{bottom:0;left:0;margin:auto;position:absolute;right:0;top:0}.fa-layers-counter,.fa-layers-text{display:inline-block;position:absolute;text-align:center}.fa-layers{display:inline-block;height:1em;position:relative;text-align:center;vertical-align:-.125em;width:1em}.fa-layers svg.svg-inline--fa{-webkit-transform-origin:center center;transform-origin:center center}.fa-layers-text{left:50%;top:50%;-webkit-transform:translate(-50%,-50%);transform:translate(-50%,-50%);-webkit-transform-origin:center center;transform-origin:center center}.fa-layers-counter{background-color:var(--fa-counter-background-color,#ff253a);border-radius:var(--fa-counter-border-radius,1em);box-sizing:border-box;color:var(--fa-inverse,#fff);line-height:var(--fa-counter-line-height,1);max-width:var(--fa-counter-max-width,5em);min-width:var(--fa-counter-min-width,1.5em);overflow:hidden;padding:var(--fa-counter-padding,.25em .5em);right:var(--fa-right,0);text-overflow:ellipsis;top:var(--fa-top,0);-webkit-transform:scale(var(--fa-counter-scale,.25));transform:scale(var(--fa-counter-scale,.25));-webkit-transform-origin:top right;transform-origin:top right}.fa-layers-bottom-right{bottom:var(--fa-bottom,0);right:var(--fa-right,0);top:auto;-webkit-transform:scale(var(--fa-layers-scale,.25));transform:scale(var(--fa-layers-scale,.25));-webkit-transform-origin:bottom right;transform-origin:bottom right}.fa-layers-bottom-left{bottom:var(--fa-bottom,0);left:var(--fa-left,0);right:auto;top:auto;-webkit-transform:scale(var(--fa-layers-scale,.25));transform:scale(var(--fa-layers-scale,.25));-webkit-transform-origin:bottom left;transform-origin:bottom left}.fa-layers-top-right{top:var(--fa-top,0);right:var(--fa-right,0);-webkit-transform:scale(var(--fa-layers-scale,.25));transform:scale(var(--fa-layers-scale,.25));-webkit-transform-origin:top right;transform-origin:top right}.fa-layers-top-left{left:var(--fa-left,0);right:auto;top:var(--fa-top,0);-webkit-transform:scale(var(--fa-layers-scale,.25));transform:scale(var(--fa-layers-scale,.25));-webkit-transform-origin:top left;transform-origin:top left}.fa-1x{font-size:1em}.fa-2x{font-size:2em}.fa-3x{font-size:3em}.fa-4x{font-size:4em}.fa-5x{font-size:5em}.fa-6x{font-size:6em}.fa-7x{font-size:7em}.fa-8x{font-size:8em}.fa-9x{font-size:9em}.fa-10x{font-size:10em}.fa-2xs{font-size:.625em;line-height:.1em;vertical-align:.225em}.fa-xs{font-size:.75em;line-height:.0833333337em;vertical-align:.125em}.fa-sm{font-size:.875em;line-height:.0714285718em;vertical-align:.0535714295em}.fa-lg{font-size:1.25em;line-height:.05em;vertical-align:-.075em}.fa-xl{font-size:1.5em;line-height:.0416666682em;vertical-align:-.125em}.fa-2xl{font-size:2em;line-height:.03125em;vertical-align:-.1875em}.fa-fw{text-align:center;width:1.25em}.fa-ul{list-style-type:none;margin-left:var(--fa-li-margin,2.5em);padding-left:0}.fa-ul>li{position:relative}.fa-li{left:calc(var(--fa-li-width,2em) * -1);position:absolute;text-align:center;width:var(--fa-li-width,2em);line-height:inherit}.fa-border{border-color:var(--fa-border-color,#eee);border-radius:var(--fa-border-radius,.1em);border-style:var(--fa-border-style,solid);border-width:var(--fa-border-width,.08em);padding:var(--fa-border-padding,.2em .25em .15em)}.fa-pull-left{float:left;margin-right:var(--fa-pull-margin,.3em)}.fa-pull-right{float:right;margin-left:var(--fa-pull-margin,.3em)}.fa-beat{-webkit-animation-name:fa-beat;animation-name:fa-beat;-webkit-animation-delay:var(--fa-animation-delay,0);animation-delay:var(--fa-animation-delay,0);-webkit-animation-direction:var(--fa-animation-direction,normal);animation-direction:var(--fa-animation-direction,normal);-webkit-animation-duration:var(--fa-animation-duration,1s);animation-duration:var(--fa-animation-duration,1s);-webkit-animation-iteration-count:var(--fa-animation-iteration-count,infinite);animation-iteration-count:var(--fa-animation-iteration-count,infinite);-webkit-animation-timing-function:var(--fa-animation-timing,ease-in-out);animation-timing-function:var(--fa-animation-timing,ease-in-out)}.fa-bounce{-webkit-animation-name:fa-bounce;animation-name:fa-bounce;-webkit-animation-delay:var(--fa-animation-delay,0);animation-delay:var(--fa-animation-delay,0);-webkit-animation-direction:var(--fa-animation-direction,normal);animation-direction:var(--fa-animation-direction,normal);-webkit-animation-duration:var(--fa-animation-duration,1s);animation-duration:var(--fa-animation-duration,1s);-webkit-animation-iteration-count:var(--fa-animation-iteration-count,infinite);animation-iteration-count:var(--fa-animation-iteration-count,infinite);-webkit-animation-timing-function:var(--fa-animation-timing,cubic-bezier(.28,.84,.42,1));animation-timing-function:var(--fa-animation-timing,cubic-bezier(.28,.84,.42,1))}.fa-fade{-webkit-animation-name:fa-fade;animation-name:fa-fade;-webkit-animation-delay:var(--fa-animation-delay,0);animation-delay:var(--fa-animation-delay,0);-webkit-animation-direction:var(--fa-animation-direction,normal);animation-direction:var(--fa-animation-direction,normal);-webkit-animation-duration:var(--fa-animation-duration,1s);animation-duration:var(--fa-animation-duration,1s);-webkit-animation-iteration-count:var(--fa-animation-iteration-count,infinite);animation-iteration-count:var(--fa-animation-iteration-count,infinite);-webkit-animation-timing-function:var(--fa-animation-timing,cubic-bezier(.4,0,.6,1));animation-timing-function:var(--fa-animation-timing,cubic-bezier(.4,0,.6,1))}.fa-beat-fade{-webkit-animation-name:fa-beat-fade;animation-name:fa-beat-fade;-webkit-animation-delay:var(--fa-animation-delay,0);animation-delay:var(--fa-animation-delay,0);-webkit-animation-direction:var(--fa-animation-direction,normal);animation-direction:var(--fa-animation-direction,normal);-webkit-animation-duration:var(--fa-animation-duration,1s);animation-duration:var(--fa-animation-duration,1s);-webkit-animation-iteration-count:var(--fa-animation-iteration-count,infinite);animation-iteration-count:var(--fa-animation-iteration-count,infinite);-webkit-animation-timing-function:var(--fa-animation-timing,cubic-bezier(.4,0,.6,1));animation-timing-function:var(--fa-animation-timing,cubic-bezier(.4,0,.6,1))}.fa-flip{-webkit-animation-name:fa-flip;animation-name:fa-flip;-webkit-animation-delay:var(--fa-animation-delay,0);animation-delay:var(--fa-animation-delay,0);-webkit-animation-direction:var(--fa-animation-direction,normal);animation-direction:var(--fa-animation-direction,normal);-webkit-animation-duration:var(--fa-animation-duration,1s);animation-duration:var(--fa-animation-duration,1s);-webkit-animation-iteration-count:var(--fa-animation-iteration-count,infinite);animation-iteration-count:var(--fa-animation-iteration-count,infinite);-webkit-animation-timing-function:var(--fa-animation-timing,ease-in-out);animation-timing-function:var(--fa-animation-timing,ease-in-out)}.fa-shake{-webkit-animation-name:fa-shake;animation-name:fa-shake;-webkit-animation-delay:var(--fa-animation-delay,0);animation-delay:var(--fa-animation-delay,0);-webkit-animation-direction:var(--fa-animation-direction,normal);animation-direction:var(--fa-animation-direction,normal);-webkit-animation-duration:var(--fa-animation-duration,1s);animation-duration:var(--fa-animation-duration,1s);-webkit-animation-iteration-count:var(--fa-animation-iteration-count,infinite);animation-iteration-count:var(--fa-animation-iteration-count,infinite);-webkit-animation-timing-function:var(--fa-animation-timing,linear);animation-timing-function:var(--fa-animation-timing,linear)}.fa-spin{-webkit-animation-name:fa-spin;animation-name:fa-spin;-webkit-animation-delay:var(--fa-animation-delay,0);animation-delay:var(--fa-animation-delay,0);-webkit-animation-direction:var(--fa-animation-direction,normal);animation-direction:var(--fa-animation-direction,normal);-webkit-animation-duration:var(--fa-animation-duration,2s);animation-duration:var(--fa-animation-duration,2s);-webkit-animation-iteration-count:var(--fa-animation-iteration-count,infinite);animation-iteration-count:var(--fa-animation-iteration-count,infinite);-webkit-animation-timing-function:var(--fa-animation-timing,linear);animation-timing-function:var(--fa-animation-timing,linear)}.fa-spin-reverse{--fa-animation-direction:reverse}.fa-pulse,.fa-spin-pulse{-webkit-animation-name:fa-spin;animation-name:fa-spin;-webkit-animation-direction:var(--fa-animation-direction,normal);animation-direction:var(--fa-animation-direction,normal);-webkit-animation-duration:var(--fa-animation-duration,1s);animation-duration:var(--fa-animation-duration,1s);-webkit-animation-iteration-count:var(--fa-animation-iteration-count,infinite);animation-iteration-count:var(--fa-animation-iteration-count,infinite);-webkit-animation-timing-function:var(--fa-animation-timing,steps(8));animation-timing-function:var(--fa-animation-timing,steps(8))}@media (prefers-reduced-motion:reduce){.fa-beat,.fa-beat-fade,.fa-bounce,.fa-fade,.fa-flip,.fa-pulse,.fa-shake,.fa-spin,.fa-spin-pulse{-webkit-animation-delay:-1ms;animation-delay:-1ms;-webkit-animation-duration:1ms;animation-duration:1ms;-webkit-animation-iteration-count:1;animation-iteration-count:1;transition-delay:0s;transition-duration:0s}}@-webkit-keyframes fa-beat{0%,90%{-webkit-transform:scale(1);transform:scale(1)}45%{-webkit-transform:scale(var(--fa-beat-scale,1.25));transform:scale(var(--fa-beat-scale,1.25))}}@keyframes fa-beat{0%,90%{-webkit-transform:scale(1);transform:scale(1)}45%{-webkit-transform:scale(var(--fa-beat-scale,1.25));transform:scale(var(--fa-beat-scale,1.25))}}@-webkit-keyframes fa-bounce{0%{-webkit-transform:scale(1,1) translateY(0);transform:scale(1,1) translateY(0)}10%{-webkit-transform:scale(var(--fa-bounce-start-scale-x,1.1),var(--fa-bounce-start-scale-y,.9)) translateY(0);transform:scale(var(--fa-bounce-start-scale-x,1.1),var(--fa-bounce-start-scale-y,.9)) translateY(0)}30%{-webkit-transform:scale(var(--fa-bounce-jump-scale-x,.9),var(--fa-bounce-jump-scale-y,1.1)) translateY(var(--fa-bounce-height,-.5em));transform:scale(var(--fa-bounce-jump-scale-x,.9),var(--fa-bounce-jump-scale-y,1.1)) translateY(var(--fa-bounce-height,-.5em))}50%{-webkit-transform:scale(var(--fa-bounce-land-scale-x,1.05),var(--fa-bounce-land-scale-y,.95)) translateY(0);transform:scale(var(--fa-bounce-land-scale-x,1.05),var(--fa-bounce-land-scale-y,.95)) translateY(0)}57%{-webkit-transform:scale(1,1) translateY(var(--fa-bounce-rebound,-.125em));transform:scale(1,1) translateY(var(--fa-bounce-rebound,-.125em))}64%{-webkit-transform:scale(1,1) translateY(0);transform:scale(1,1) translateY(0)}100%{-webkit-transform:scale(1,1) translateY(0);transform:scale(1,1) translateY(0)}}@keyframes fa-bounce{0%{-webkit-transform:scale(1,1) translateY(0);transform:scale(1,1) translateY(0)}10%{-webkit-transform:scale(var(--fa-bounce-start-scale-x,1.1),var(--fa-bounce-start-scale-y,.9)) translateY(0);transform:scale(var(--fa-bounce-start-scale-x,1.1),var(--fa-bounce-start-scale-y,.9)) translateY(0)}30%{-webkit-transform:scale(var(--fa-bounce-jump-scale-x,.9),var(--fa-bounce-jump-scale-y,1.1)) translateY(var(--fa-bounce-height,-.5em));transform:scale(var(--fa-bounce-jump-scale-x,.9),var(--fa-bounce-jump-scale-y,1.1)) translateY(var(--fa-bounce-height,-.5em))}50%{-webkit-transform:scale(var(--fa-bounce-land-scale-x,1.05),var(--fa-bounce-land-scale-y,.95)) translateY(0);transform:scale(var(--fa-bounce-land-scale-x,1.05),var(--fa-bounce-land-scale-y,.95)) translateY(0)}57%{-webkit-transform:scale(1,1) translateY(var(--fa-bounce-rebound,-.125em));transform:scale(1,1) translateY(var(--fa-bounce-rebound,-.125em))}64%{-webkit-transform:scale(1,1) translateY(0);transform:scale(1,1) translateY(0)}100%{-webkit-transform:scale(1,1) translateY(0);transform:scale(1,1) translateY(0)}}@-webkit-keyframes fa-fade{50%{opacity:var(--fa-fade-opacity,.4)}}@keyframes fa-fade{50%{opacity:var(--fa-fade-opacity,.4)}}@-webkit-keyframes fa-beat-fade{0%,100%{opacity:var(--fa-beat-fade-opacity,.4);-webkit-transform:scale(1);transform:scale(1)}50%{opacity:1;-webkit-transform:scale(var(--fa-beat-fade-scale,1.125));transform:scale(var(--fa-beat-fade-scale,1.125))}}@keyframes fa-beat-fade{0%,100%{opacity:var(--fa-beat-fade-opacity,.4);-webkit-transform:scale(1);transform:scale(1)}50%{opacity:1;-webkit-transform:scale(var(--fa-beat-fade-scale,1.125));transform:scale(var(--fa-beat-fade-scale,1.125))}}@-webkit-keyframes fa-flip{50%{-webkit-transform:rotate3d(var(--fa-flip-x,0),var(--fa-flip-y,1),var(--fa-flip-z,0),var(--fa-flip-angle,-180deg));transform:rotate3d(var(--fa-flip-x,0),var(--fa-flip-y,1),var(--fa-flip-z,0),var(--fa-flip-angle,-180deg))}}@keyframes fa-flip{50%{-webkit-transform:rotate3d(var(--fa-flip-x,0),var(--fa-flip-y,1),var(--fa-flip-z,0),var(--fa-flip-angle,-180deg));transform:rotate3d(var(--fa-flip-x,0),var(--fa-flip-y,1),var(--fa-flip-z,0),var(--fa-flip-angle,-180deg))}}@-webkit-keyframes fa-shake{0%{-webkit-transform:rotate(-15deg);transform:rotate(-15deg)}4%{-webkit-transform:rotate(15deg);transform:rotate(15deg)}24%,8%{-webkit-transform:rotate(-18deg);transform:rotate(-18deg)}12%,28%{-webkit-transform:rotate(18deg);transform:rotate(18deg)}16%{-webkit-transform:rotate(-22deg);transform:rotate(-22deg)}20%{-webkit-transform:rotate(22deg);transform:rotate(22deg)}32%{-webkit-transform:rotate(-12deg);transform:rotate(-12deg)}36%{-webkit-transform:rotate(12deg);transform:rotate(12deg)}100%,40%{-webkit-transform:rotate(0);transform:rotate(0)}}@keyframes fa-shake{0%{-webkit-transform:rotate(-15deg);transform:rotate(-15deg)}4%{-webkit-transform:rotate(15deg);transform:rotate(15deg)}24%,8%{-webkit-transform:rotate(-18deg);transform:rotate(-18deg)}12%,28%{-webkit-transform:rotate(18deg);transform:rotate(18deg)}16%{-webkit-transform:rotate(-22deg);transform:rotate(-22deg)}20%{-webkit-transform:rotate(22deg);transform:rotate(22deg)}32%{-webkit-transform:rotate(-12deg);transform:rotate(-12deg)}36%{-webkit-transform:rotate(12deg);transform:rotate(12deg)}100%,40%{-webkit-transform:rotate(0);transform:rotate(0)}}@-webkit-keyframes fa-spin{0%{-webkit-transform:rotate(0);transform:rotate(0)}100%{-webkit-transform:rotate(360deg);transform:rotate(360deg)}}@keyframes fa-spin{0%{-webkit-transform:rotate(0);transform:rotate(0)}100%{-webkit-transform:rotate(360deg);transform:rotate(360deg)}}.fa-rotate-90{-webkit-transform:rotate(90deg);transform:rotate(90deg)}.fa-rotate-180{-webkit-transform:rotate(180deg);transform:rotate(180deg)}.fa-rotate-270{-webkit-transform:rotate(270deg);transform:rotate(270deg)}.fa-flip-horizontal{-webkit-transform:scale(-1,1);transform:scale(-1,1)}.fa-flip-vertical{-webkit-transform:scale(1,-1);transform:scale(1,-1)}.fa-flip-both,.fa-flip-horizontal.fa-flip-vertical{-webkit-transform:scale(-1,-1);transform:scale(-1,-1)}.fa-rotate-by{-webkit-transform:rotate(var(--fa-rotate-angle,none));transform:rotate(var(--fa-rotate-angle,none))}.fa-stack{display:inline-block;vertical-align:middle;height:2em;position:relative;width:2.5em}.fa-stack-1x,.fa-stack-2x{bottom:0;left:0;margin:auto;position:absolute;right:0;top:0;z-index:var(--fa-stack-z-index,auto)}.svg-inline--fa.fa-stack-1x{height:1em;width:1.25em}.svg-inline--fa.fa-stack-2x{height:2em;width:2.5em}.fa-inverse{color:var(--fa-inverse,#fff)}.fa-sr-only,.sr-only{position:absolute;width:1px;height:1px;padding:0;margin:-1px;overflow:hidden;clip:rect(0,0,0,0);white-space:nowrap;border-width:0}.fa-sr-only-focusable:not(:focus),.sr-only-focusable:not(:focus){position:absolute;width:1px;height:1px;padding:0;margin:-1px;overflow:hidden;clip:rect(0,0,0,0);white-space:nowrap;border-width:0}.svg-inline--fa .fa-primary{fill:var(--fa-primary-color,currentColor);opacity:var(--fa-primary-opacity,1)}.svg-inline--fa .fa-secondary{fill:var(--fa-secondary-color,currentColor);opacity:var(--fa-secondary-opacity,.4)}.svg-inline--fa.fa-swap-opacity .fa-primary{opacity:var(--fa-secondary-opacity,.4)}.svg-inline--fa.fa-swap-opacity .fa-secondary{opacity:var(--fa-primary-opacity,1)}.svg-inline--fa mask .fa-primary,.svg-inline--fa mask .fa-secondary{fill:#000}.fa-duotone.fa-inverse,.fad.fa-inverse{color:var(--fa-inverse,#fff)}</style><link rel="apple-touch-icon" sizes="180x180" href="../../../assets/img/favicons/apple-touch-icon.png">
    <link rel="icon" type="image/png" sizes="32x32" href="../../../assets/img/favicons/favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="16x16" href="../../../assets/img/favicons/favicon-16x16.png">
    <link rel="shortcut icon" type="image/x-icon" href="../../../assets/img/favicons/favicon.ico">
    <link rel="manifest" href="../../../assets/img/favicons/manifest.json">
    <meta name="msapplication-TileImage" content="../../../assets/img/favicons/mstile-150x150.png">
    <meta name="theme-color" content="#ffffff">

    <!-- ===============================================-->
    <!--    Stylesheets-->
    <!-- ===============================================-->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin="">
    <link href="https://fonts.googleapis.com/css2?family=Nunito+Sans:wght@300;400;600;700;800;900&amp;display=swap" rel="stylesheet">
    <link href="../../../vendors/simplebar/simplebar.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.8/css/line.css">
    <link href="../../../assets/css/theme-rtl.min.css" type="text/css" rel="stylesheet" id="style-rtl" disabled="true">
    <link href="../../../assets/css/theme.min.css" type="text/css" rel="stylesheet" id="style-default">
    <link href="../../../assets/css/user-rtl.min.css" type="text/css" rel="stylesheet" id="user-style-rtl" disabled="true">
    <link href="../../../assets/css/user.min.css" type="text/css" rel="stylesheet" id="user-style-default">
  </head>

  <body>
    <!-- ===============================================-->
    <!--    Main Content-->
    <!-- ===============================================-->
    <main class="main" id="top">
      <div class="container-fluid bg-body-tertiary dark__bg-gray-1200">
        <div class="bg-holder" style="background-image:url('/resources/img/메인영상2.gif');"></div>
        <!--/.bg-holder-->
        <div class="row flex-center position-relative min-vh-100 g-0 py-5">
          <div class="col-11 col-sm-6 col-xl-6">
            <div class="card border border-translucent auth-card">
              <div class="card-body pe-md-5">
                <div class="row align-items-center gx-0 gy-7">
                  

    <!-- ===============================================-->
    <!--    JavaScripts-->
    <!-- ===============================================-->
    <script src="../../../vendors/popper/popper.min.js"></script>
    <script src="../../../vendors/bootstrap/bootstrap.min.js"></script>
    <script src="../../../vendors/anchorjs/anchor.min.js"></script>
    <script src="../../../vendors/is/is.min.js"></script>
    <script src="../../../vendors/fontawesome/all.min.js"></script>
    <script src="../../../vendors/lodash/lodash.min.js"></script>
    <script src="https://polyfill.io/v3/polyfill.min.js?features=window.scroll"></script>
    <script src="../../../vendors/list.js/list.min.js"></script>
    <script src="../../../vendors/feather-icons/feather.min.js"></script>
    <script src="../../../vendors/dayjs/dayjs.min.js"></script>
    <script src="../../../assets/js/phoenix.js"></script>
  



<!-- ===============================================-->


<!--    Stylesheets-->
<!-- ===============================================-->
<link href="/resources/css/choices.min.css" rel="stylesheet">
<link href="/resources/css/dhtmlxgantt.css" rel="stylesheet">
<link href="/resources/css/flatpickr.min.css" rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com/">
<link rel="preconnect" href="https://fonts.gstatic.com/" crossorigin="">
<link href="/resources/css/css2" rel="stylesheet">
<link href="/resources/css/simplebar.min.css" rel="stylesheet">
<link rel="stylesheet" href="/resources/css/line.css">
<link href="/resources/css/theme-rtl.min.css" type="text/css"
	rel="stylesheet" id="style-rtl" disabled="true">
<link href="/resources/css/theme.min.css" type="text/css"
	rel="stylesheet" id="style-default">
<link href="/resources/css/user-rtl.min.css" type="text/css"
	rel="stylesheet" id="user-style-rtl" disabled="true">
<link href="/resources/css/user.min.css" type="text/css"
	rel="stylesheet" id="user-style-default">


<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
// 	window.onload = function(){
// 		prod1();
// 	}
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function prod1() {
    	new daum.Postcode({
			oncomplete: function(data) {
				$('[name=zipcode]').val(data.zonecode); // 우편번호 (5자리)
				$('[id=roadAddress]').val(data.address);
				$('[id=adres]').val(data.buildingName);
			}
		}).open();
    }
</script>
<script type="text/javascript">
function shFormAjax(){
	 event.preventDefault();
     //console.log("보내는 데이타",$("#frm").serialize());
     
	 let inputImgs = $("#inputImgs");//파일객체
	 //파일들 꺼내오기
	 let file = inputImgs[0].files[0];
	 console.log("맞지용? 눈으로 찌거서 확인:",file);
     
     let customsBrokerVO = {
        qualfNo: document.querySelector("[name='customsBrokerVO.qualfNo']").value,
        qualfAcqsDe: document.querySelector("[name='customsBrokerVO.qualfAcqsDe']").value,
     }
     
     
     let userVO = {
        userCd:document.querySelector("[name=userCd]").value,
        userNm:document.querySelector("[name=userNm]").value,
        ihidnum:document.querySelector("[name=ihidnum]").value,
        telno:document.querySelector("[name=telno]").value,
        emailAdres:document.querySelector("[name=emailAdres]").value,
        adres:document.querySelector("[name=roadAddress]").value,
        detailAdres:document.querySelector("[name=detailAdres]").value,
        password:document.querySelector("[name=password]").value,
        customsBrokerVO:customsBrokerVO
     }
     
     let formData = new FormData();
     formData.append("uploadFile", file);
     formData.append("userVO", new Blob([JSON.stringify(userVO)], {type: "application/json"}));
     
     
    /*  console.log("값을 확인 먼저:",userVO); */

     
	 $.ajax({
            type : "post",
            url : "/cbs/create",
            processData:false,
	    	contentType:false,
			/* contentType : "application/json;charset=utf-8", */
			data: formData,
			dataType : "text",             // json이라 쓰면 JSON.parse(결과)
			success : function(result) {
                console.log("결과",result);
                if(result == "OK"){
                    swal({
		      		  title: "회원가입이 완료되었습니다.",
		      		  text: "관리자 승인 후 로그인하실 수 있습니다.",
		      		  icon: "success"
		      		}).then(function() {
		      		  location.href = "/cbs/login";
		      		});
                    

                }
            },
            error: function (xhr, status, error) {
                console.log("code: " + xhr.status)
                console.log("message: " + xhr.responseText)
                console.log("error: " + error);
            }                
	});
    
}

// document.addEventListener("DOMContentLoaded",function())
$(function() {
	
	//자동 입력
	$("#btnAuto1").on("click", function() {
		$("#userCd").val("CUST1001");
		$("#userNm").val("김지영");
		$("#ihidnum").val("880105-2546522");
		$("#telno").val("010-4223-3330");
		$("#emailAdres").val("thgml8161@naver.com");
		$("#qualfNo").val("19990203");
		$("#qualfAcqsDe").val("1999-02-03");
		$("#password").val("java");
		$("#confirmPassword").val("java");
	});
	//ID 중복확인
	$(document).ready(function() {
    	//ID 중복 확인
    	//id를 입력할 수 있는 input text 영역을 벗어나면 동작한다.
    	$("#userCd").on("focusout", function() {
    		
    		var id = $("#userCd").val();
    		
    		if(id == '' || id.length == 0) {
    			$("#label1").css("color", "red").text("공백은 ID로 사용할 수 없습니다.");
    			return false;
    		}
    		//Ajax로 전송
        	$.ajax({
        		url : '/cbs/ConfirmId',
        		data : {
        			id : id
        		},
        		type : 'POST',
        		dataType : 'json',
        		success : function(result) {
        			if (result == true) {
        				$("#label1").css("color", "black").text("사용 가능한 ID 입니다.");
        			} else{
        				$("#label1").css("color", "red").text("중복된 ID 입니다.");
        				$("#userCd").val('');
        			}
        		}
        	}); //End Ajax
    		
		});	
    	
    	
    	$("#ihidnum").on("focusout", function(){
    		var ihidnum = $("#ihidnum").val();
    		const regUnique = /^(?:[0-9]{2}(?:0[1-9]|1[0-2])(?:0[1-9]|[1,2][0-9]|3[0,1]))-[1-8][0-9]{6}$/;
    		if(!regUnique.test(ihidnum)){
    			$("#label12").css("color", "red").text("주민번호를 확인해주세요");
    		}else{
    			$("#label12").css("color", "red").text("");
    			
    			
    		}
    		
    	});
    	
    	$("#password2").on("focusout", function(){
    		 var p1 = document.getElementById('password').value;
   	      	var p2 = document.getElementById('password2').value;
    		if(p1 != p2){
    			$("#label13").css("color", "red").text("비밀번호가 일치하지 않습니다.");
    			$("#password2").val('');
    		}else{
    			$("#label13").css("color", "red").text("");
    			
    		}
    	});
    	$("#telno").on("focusout", function(){
    		 var telno = document.getElementById('telno').value;
   	      	 var regExp = /^\d{3}-\d{3,4}-\d{4}$/;
    		if(!regExp.test(telno)){
    			$("#label14").css("color", "red").text("핸드폰번호를 확인해주세요");
    		}else{
    			$("#label14").css("color", "red").text("");
    			
    		}
    	});
    	
    	
	});
	
	
	
});	

</script>

<div class="col mx-auto">
	<div class="auth-form-box">
		<div class="text-center mb-3">
			<a class="d-flex flex-center text-decoration-none mb-4"
				href="/cbs/create">
				<div class="d-flex align-items-center fw-bolder fs-3 d-inline-block">
					<img src="/resources/img/mainLogo.png" alt="phoenix"
						width="110">
				</div>
			</a>
			<h3 class="text-body-highlight">Sign Up</h3>
			<!-- <p class="text-body-tertiary">가입 승인이 완료된 후 로그인할 수 있습니다.</p> -->
		</div>
			<hr class="bg-body-secondary">
		<form name="frm" id="frm" enctype="multipart/form-data">
			<div class="row" style="width: 150%; position: relative; right: 50px;">
                        <div class="col-md-6 mb-3 mt-2">
                            <div class="input-group">
                                <div class="input-group-text">아이디</div>
                                <input class="form-control" id="userCd" name="userCd" type="text" placeholder="ID">
                            </div>
                        </div>
                        <div class="col-md-6 mb-3  mt-2">
                            <div class="input-group">
                            <label id="label1" style="position: relative; color: black; top: 8;"></label>
                            </div>
                        </div>
                    </div>
			<div class="row" style="width: 150%; position: relative; right: 50px;">
                        <div class="col-md-6 mb-3 mt-2">
                            <div class="input-group">
                                <div class="input-group-text">이름</div>
                                <input class="form-control" id="userNm" name="userNm" type="text" placeholder="Name">
                            </div>
                        </div>
                        <div class="col-md-6 mb-3  mt-2">
                            <div class="input-group">
                                <div class="input-group-text">주민번호</div>
                                <input class="form-control" id="ihidnum" name="ihidnum" type="text" placeholder="-포함">
                            </div>
                            <label id="label12" style="position: relative; color: black; top: 8;"></label>
                        </div>
                    </div>
			<div class="row" style="width: 150%; position: relative; right: 50px;">
                        <div class="col-md-6 mb-3 mt-2">
                            <div class="input-group">
                                <div class="input-group-text">전화번호</div>
                                <input class="form-control" id="telno" name="telno" type="text" placeholder="-포함">
                            </div>
                            <label id="label14" style="position: relative; color: black; top: 8;"></label>
                        </div>
                        <div class="col-md-6 mb-3  mt-2">
                            <div class="input-group">
                                <div class="input-group-text">이메일주소</div>
                                <input class="form-control" id="emailAdres" name="emailAdres" type="email" placeholder="email">
                            </div>
                        </div>
                    </div>
			<div class="row" style="width: 150%; position: relative; right: 50px;">
                        <div class="col-md-6 mb-3 mt-2">
                            <div class="input-group">
                                <div class="input-group-text">주소</div>
                                <input class="form-control" id="roadAddress" name="roadAddress"  type="text" placeholder="클릭" onclick="prod1()">
                            </div>
                        </div>
                        <div class="col-md-6 mb-3  mt-2">
                            <div class="input-group">
                                <div class="input-group-text">상세주소</div>
                                <input class="form-control" id="detailAdres" name="detailAdres" type="text" >
                            </div>
                        </div>
                    </div>
			<div class="row" style="width: 150%; position: relative; right: 50px;">
                        <div class="col-md-6 mb-3 mt-2">
                            <div class="input-group">
                                <div class="input-group-text">자격번호</div>
                                <input class="form-control" id="qualfNo" name="customsBrokerVO.qualfNo" type="text" >
                            </div>
                        </div>
                        <div class="col-md-6 mb-3  mt-2">
                            <div class="input-group">
                                <div class="input-group-text">자격취득일자</div>
                                <input class="form-control" id="qualfAcqsDe" name="customsBrokerVO.qualfAcqsDe" type="date" >
                            </div>
                        </div>
                    </div>
			<div class="row" style="width: 150%; position: relative; right: 50px;">
                        <div class="col-md-6 mb-3 mt-2">
                            <div class="input-group">
                                <div class="input-group-text">비밀번호</div>
                                <input class="form-control" id="password" name="password" type="password" placeholder="password">
                            </div>
                        </div>
                        <div class="col-md-6 mb-3  mt-2">
                            <div class="input-group">
                                <div class="input-group-text">비밀번호확인</div>
                                <input class="form-control" id="password2" name="password2" type="password" placeholder="Confirm Password">
                            </div>
                            <label id="label13" style="position: relative; color: black; top: 8;"></label>
                        </div>
                    </div>
			<div  style="width: 150%; position: relative; right: 50px;">
                        <div class="col-md-6 mb-3 mt-2">
                            <div class="input-group-text" style="width:570;">프로필사진&emsp;
                            <input type="file" id="inputImgs" name="customsBrokerVO.uploadFile" placeholder="프로필사진"></div>
                           
                        </div>
                    </div>
			
			<div class="form-check mb-3" style="position: relative; left: 100px;">
				<input class="form-check-input" id="termsService" type="checkbox"><label
					class="form-label fs-9 text-transform-none" for="termsService"><a href="#!">약관 </a>및 <a href="#!">개인정보 보호정책에</a>동의합니다.
				</label>
			</div>
			<button onclick="shFormAjax()" class="btn btn-primary w-70 mb-3" style="position: relative; left: 100px;">가입하기</button>
			<div class="text-center">
				<a class="fs-9 fw-bold"
					href="/cbs/login" style="position: relative; left: 45px;">기존 계정에 로그인</a>
			</div>

		</form>
		</div>
		<a class="btn btn-primary" id="btnAuto1">자동입력</a>
	</div>
</body>	</html>

