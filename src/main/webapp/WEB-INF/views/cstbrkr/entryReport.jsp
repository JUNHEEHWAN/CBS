<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>수출입 통관신청</title>
    <script type="text/javascript" src="/resources/js/jquery.min.js"></script>
    <style>
        .custom-tabs {
            display: flex;
        }

        .custom-tab {
            padding: 10px 20px;
            cursor: pointer;
        }

        .custom-tab.active {
            background-color: #f0f0f0;
        }

        .tab-content {
            display: none;
        }

        .tab-content.active {
            display: block;
        }
    </style>
    <script>
        document.addEventListener('DOMContentLoaded', function () {
            //탭기능 시작
            const tabs = document.querySelectorAll('.custom-tab');
            const contents = document.querySelectorAll('.tab-content');

            tabs.forEach(tab => {
                tab.addEventListener('click', function () {
                    const tabNum = this.dataset.tab;

                    tabs.forEach(tab => tab.classList.remove('active'));
                    contents.forEach(content => content.classList.remove('active'));

                    this.classList.add('active');
                    document.querySelector(`.tab-content[data-tab="${tabNum}"]`).classList.add('active');
                });
            });
            // 첫 번째 탭과 해당 내용을 기본으로 활성화
            tabs[0].classList.add('active');
            contents[0].classList.add('active');
            //탭기능 종료

            //previous, next 버튼 기능 시작
            const prevBtn = document.getElementById('prevBtn');
            const nextBtn = document.getElementById('nextBtn');
            let currentIndex = 0;

            // 탭 변경 함수
            function changeTab(index) {
                tabs.forEach(tab => tab.classList.remove('active'));
                contents.forEach(content => content.classList.remove('active'));
                tabs[index].classList.add('active');
                contents[index].classList.add('active');
                currentIndex = index;

                // 통관 탭에서는 previous 버튼 숨기기
                if (currentIndex === 0) {
                    prevBtn.style.display = 'none';
                } else {
                    prevBtn.style.display = 'inline-block';
                }

                // 신청완료 탭에서는 next 버튼 숨기기
                if (currentIndex === tabs.length - 1) {
                    nextBtn.style.display = 'none';
                } else {
                    nextBtn.style.display = 'inline-block';
                }
            }

            // 첫 번째 탭과 해당 내용을 기본으로 활성화
            changeTab(currentIndex);

            // previous 버튼 클릭 시 이전 탭으로 이동
            prevBtn.addEventListener('click', function () {
                currentIndex = (currentIndex - 1 + tabs.length) % tabs.length;
                changeTab(currentIndex);
            });

            // next 버튼 클릭 시 다음 탭으로 이동
            nextBtn.addEventListener('click', function () {
                currentIndex = (currentIndex + 1) % tabs.length;
                changeTab(currentIndex);
            });

            tabs.forEach((tab, index) => {
                tab.addEventListener('click', function () {
                    changeTab(index);
                });
            });
            //previous, next 버튼 기능 종료
        });
        
    </script>
</head>

<body>
    <div class="custom-tabs">
        <div class="custom-tab active" data-tab="1">통관</div>
        <div class="custom-tab" data-tab="2">통관물품</div>
        <div class="custom-tab" data-tab="3">검역 및 운송</div>
        <div class="custom-tab" data-tab="4">신청완료</div>
    </div>

    <div class="tab-content" data-tab="1">
        <div id="entry1">
            <!--*****************************통관내용시작*****************************-->
            <h5>의뢰인</h5>
            <hr>
            <table>
                <tr>
                    <td>의뢰인 유형</td>
                    <td>
                        <select name="" id="">
                            <option value="">선택</option>
                            <option value="individual">개인</option>
                            <option value="legal">법인</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>의뢰 유형</td>
                    <td>
                        <select name="entrSe" id="entrSe">
                            <option value="">선택</option>
                            <option value="expter">수출</option>
                            <option value="impr">수입</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>상호(기업 명)</td>
                    <td><input type="text" name="client" id="client"></td>
                </tr>
            </table>
            <br>
            <h5>수출입 대행자</h5>
            <hr>
            <table>
                <tr>
                    <td>상호</td>
                    <td><input type="text" id="notifyInfo" value="CBS" readonly></td>
                </tr>
                <tr>
                    <td>대행자 구분</td>
                    <td><input type="text" value="관세사" readonly></td>
                </tr>
                <tr>
                    <td>대행자 이름</td>
                    <td><input type="text" id="userNm" name="userNm" value=""></td>
                </tr>
            </table>
            <br>
            <h5>수출자</h5>
            <hr>
            <table>
                <tr>
                    <td>수출자 상호</td>
                    <td><input type="text" name="expterCmpnm" id="expterCmpnm"></td>
                    <td>수출자 주소</td>
                    <td><input type="text" name="expterAdres" id="expterAdres"></td>
                </tr>
                <tr>
                    <td>수출자 전화번호</td>
                    <td><input type="text" name="expterTelno" id="expterTelno"></td>
                    <td>수출자 담당자</td>
                    <td><input type="text" name="expterCharger" id="expterCharger"></td>
                </tr>
            </table>
            <br>
            <h5>수입자</h5>
            <hr>
            <table>
                <tr>
                    <td>수입자 상호</td>
                    <td><input type="text" name="imprCmpnm" id="imprCmpnm"></td>
                    <td>수입자 주소</td>
                    <td><input type="text" name="imprAdres" id="imprAdres"></td>
                </tr>
                <tr>
                    <td>수입자 전화번호</td>
                    <td><input type="text" name="imprTelno" id="imprTelno"></td>
                    <td>수입자 담당자</td>
                    <td><input type="text" name="imprCharger" id="imprCharger"></td>
                </tr>
            </table>
            <br>
            <h5>관할세관 정보</h5>
            <hr>
            <table>
                <tr>
                    <td>관할세관</td>
                    <td>
                        <select name="manctmKwa" id="manctmKwa">
                            <option value="">선택</option>
                            <option value="부산">부산</option>
                            <option value="울산">울산</option>
                            <option value="인천">인천</option>
                            <option value="대전">대전</option>
                        </select>
                    </td>
                    <td>세관 담당자</td>
                    <td><input type="text" name="manctmKwaCharger" id="manctmKwaCharger"></td>
                </tr>
            </table>
            <button onclick="entryTempararyAutoComplate()">자동완성</button>
            <button onclick="entryTempararySave()">임시저장</button>
            <!--*****************************통관내용종료*****************************-->
        </div>
    </div>
    <div class="tab-content" data-tab="2">
        <div>
            <!--*****************************통관물품내용시작*****************************-->
            <h5>통관정보</h5>
            <hr>
            <table>
                <tr>
                    <td>통관관리번호</td>
                    <td><input type="text" name="entrManageNo" id="entrManageNo" value=""></td>
                    <td>고객 코드</td>
                    <td><input name="cstmrCd" id="cstmrCd" type="text" value="CSTM0001"></td>
                </tr>
            </table>
            <br>
            <h5>물품등록</h5>
            <button onclick="fadd()">추가등록</button>
            <div id="tempFamily" style="border: 1px solid black; display: none;">
                <hr>
                <table>
                    <tr>
                        <td>고객 상품 검색</td>
                        <td>
                        	<button class="btn btn-primary" type="button" data-bs-toggle="modal" data-bs-target="#tooltipModal" onclick="cstSrcBtn()">상품검색</button>
                        </td>
                        <td>상품 번호</td>
                        <td><input type="text" name="goodsNo" id="goodsNo" value=""></td>
                        <td>상품 명</td>
                        <td><input type="text" name="goodsNm" id="goodsNm" value=""></td>
                        <td>HS Code</td>
                        <td><input type="text" name="hsCd" id="hsCd" value=""></td>
                    </tr>
                </table>
                <h5>물품정보</h5>
                <hr>
                <table>
                    <tr>
                        <td>물품 유형</td>
                        <td>
                            <select name="thingTy" id="thingTy">
                                <option value="">선택</option>
                                <option value="animalsplants">동/식물</option>
                                <option value="common">일반</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>물품 명</td>
                        <td><input name="thingNm" id="thingNm" type="text" value=""></td>
                        <td>거래품 명</td>
                        <td><input name="delngPrdnm" id="delngPrdnm" type="text" value=""></td>
                        <td>수하물 총 포장개수</td>
                        <td><input name="baggTnpakg" id="baggTnpakg" type="text" value=""></td>
                    </tr>
                    <tr>
                        <td>수량</td>
                        <td><input name="qy" id="qy" type="text" value=""></td>
                        <td>금액</td>
                        <td><input name="amount" id="amount" type="text" value=""></td>
                        <td>총 금액</td>
                        <td><input name="totAmount" id="totAmount" type="text" value=""></td>
                    </tr>
                    <tr>
                        <td>순 중량</td>
                        <td><input name="netwght" id="netwght" type="text" value=""></td>
                        <td>총 중량</td>
                        <td><input name="totWt" id="totWt" type="text" value=""></td>
                        <td>단가(kg)</td>
                        <td><input name="untpc" id="untpc" type="text" value=""></td>
                    </tr>
                </table>
                <button onclick="fremove(this)">삭제</button>
            </div>
            <div id="disp">
                <!--추가등록 버튼 누르면 추가되는 곳.-->
            </div>
            <button onclick="fdata()">임시저장</button>
            <!--*****************************통관물품내용종료*****************************-->
        </div>
    </div>
    <div class="tab-content" data-tab="3">
        <div>
            <!--*****************************검역및운송내용시작*****************************-->
            <h5>통관정보</h5>
            <hr>
            <table>
                <tr>
                    <td>통관관리번호</td>
                    <td><input type="text" name="entrManageNo" id="entrManageNo" value="" readonly></td>
                    <td>고객 코드</td>
                    <td><input name="cstmrCd" id="cstmrCd" type="text" value="" readonly></td>
                </tr>
            </table>
            <br>

            <h5>검역신청</h5>
            <hr>
            <table>
                <tr>
                    <th>상품번호</th>
                    <th>상품명</th>
                    <th>HSCode</th>
                    <th>물품유형</th>
                    <th>물품명</th>
                    <th>거래품명</th>
                    <th>수량</th>
                    <th>수하물포장개수</th>
                    <th>순중량</th>
                    <th>총중량</th>
                </tr>
                <tr>
                    <td><input name="" id="" type="text" readonly></td>
                    <td><input name="" id="" type="text" readonly></td>
                    <td><input name="" id="" type="text" readonly></td>
                    <td><input name="" id="" type="text" readonly></td>
                    <td><input name="" id="" type="text" readonly></td>
                    <td><input name="" id="" type="text" readonly></td>
                    <td><input name="" id="" type="text" readonly></td>
                    <td><input name="" id="" type="text" readonly></td>
                    <td><input name="" id="" type="text" readonly></td>
                    <td><input name="" id="" type="text" readonly></td>
                </tr>

            </table>
            <button onclick="quarantineBtn()">신청</button>
            <br>


            <h5>컨테이너 지정</h5>
            <hr>
            <div style="float: left; border: 1px solid black; width: 50%;">
                	컨테이너 목록
                <table>
                    <tr>
                        <th>고유번호</th>
                        <th>규격</th>
                        <th>재질</th>
                        <th>취급화물유형</th>
                    </tr>
                    <tr>
                        <td><input type="text" readonly></td>
                        <td><input type="text" readonly></td>
                        <td><input type="text" readonly></td>
                        <td><input type="text" readonly></td>
                    </tr>
                </table>
            </div>
            <div style="border: 1px solid black;">
                	컨테이너상세
                <table>
                    <tr>
                        <th>고유번호</th>
                        <th>통관관리번호</th>
                        <th>사용시작일</th>
                        <th>사용종료일</th>
                    </tr>
                    <tr>
                        <td><input type="text" readonly></td>
                        <td><input type="text" readonly></td>
                        <td><input type="text" readonly></td>
                        <td><input type="text" readonly></td>
                    </tr>
                </table>
            </div>
            <div>
                컨테이너 고유번호<input type="text"> 사용시작일<input type="date"> ~ 사용종료일<input type="date">
                <br>
                <button onclick="containerSelectBtn">지정</button>
            </div>
            <br>


            <h5>운송신청</h5>
            <hr>
            <br>
            <!--*****************************검역및운송내용종료*****************************-->
        </div>
    </div>
    <div class="tab-content" data-tab="4">
        <div>
            <!--*****************************신청완료내용시작*****************************-->
            	세금 계산 하는 곳이 나와야함.
            <!--*****************************신청완료내용종료*****************************-->
        </div>
    </div>
    <div>
        <input type="button" value="previous" style="float: left;" id="prevBtn" />
        <input type="button" value="next" style="float: right;" id="nextBtn" disabled/>
    </div>
    
    
            	<!-- 고객 상품 검색 모달 시작 -->
            	<div class="modal fade" id="tooltipModal" tabindex="-1" aria-labelledby="tooltipModalLabel" aria-hidden="true">
				  <div class="modal-dialog modal-dialog-centered">
				    <div class="modal-content">
				      <div class="modal-header">
				        <h5 class="modal-title" id="tooltipModalLabel">의뢰인 상품 목록</h5><button class="btn p-1" type="button" data-bs-dismiss="modal" aria-label="Close"><span class="fas fa-times fs-9"></span></button>
				      </div>
				      <div class="modal-body">
				      	<!-- 고객상품리스트 들어가는 곳. -->
				      		<table>
				      			<thead id="goodstHead">
									<tr>                       
										<th scope='col'></th>
										<th scope='col'>No</th>
										<th scope='col'>고객코드</th>
										<th scope='col'>상품코드</th>    
										<th scope='col'>상품 명</th>  
										<th scope='col'>HS Code</th>
									</tr>
								</thead>
									<tbody id="goodsBody">
									
									</tbody>
				      		</table>
				      </div>
				      <div class="modal-footer">
					      <button class="btn btn-primary" type="button" data-bs-dismiss="modal" id="goodsModalSelectBtn">Select</button>
					      <button class="btn btn-outline-primary" type="button" data-bs-dismiss="modal">Cancel</button>
					  </div>
				    </div>
				  </div>
				</div>
				<!-- 고갹 상품 검색 모달 종료 -->
</body>
<script>
	window.onload = function(){
// 	    fadd();
	}
	
	var tabNum = 0;
	
	//통관 페이지 자동완성 시작////////////////
	const entryTempararyAutoComplate = function(){
	          document.querySelector("#client").value = "(재)대덕인재개발원";
	          document.querySelector("#entrSe").value = "expter";
	          document.querySelector("#userNm").value = "userNm";
	          document.querySelector("#expterCmpnm").value = "(재)대덕인재개발원";
	          document.querySelector("#expterAdres").value = "대전광역시 중구 계룡로 846 3층";
	          document.querySelector("#expterTelno").value = "042-222-8202";
	          document.querySelector("#expterCharger").value = "원장님";
	          document.querySelector("#imprCmpnm").value = "김일성대학";
	          document.querySelector("#imprAdres").value = "함경남도 개성시 김일성대학 인문사회관 201호";
	          document.querySelector("#imprTelno").value = "55-666-1111";
	          document.querySelector("#imprCharger").value = "김정은";
	          document.querySelector("#manctmKwa").value = "부산";
	          document.querySelector("#manctmKwaCharger").value = "송인호";
	      }
	//통관 페이지 자동완성 종료////////////////
	
	      //통관 페이지 임시저장 시작////////////////
	      const entryTempararySave = function(){
	          let entry1 = document.querySelectorAll("#entry1");
	          let entry1Arr = [];
	          for(let i=0; i<entry1.length; i++){
	              let entry = entry1[i];
	              let data = {
	                  client : entry.querySelector("#client").value,
	                  notifyInfo : entry.querySelector("#notifyInfo").value,
	                  entrSe : entry.querySelector("#entrSe").value,
	                  expterCmpnm : entry.querySelector("#expterCmpnm").value,
	                  expterAdres : entry.querySelector("#expterAdres").value,
	                  expterTelno : entry.querySelector("#expterTelno").value,
	                  expterCharger : entry.querySelector("#expterCharger").value,
	                  imprCmpnm : entry.querySelector("#imprCmpnm").value,
	                  imprAdres : entry.querySelector("#imprAdres").value,
	                  imprTelno : entry.querySelector("#imprTelno").value,
	                  imprCharger : entry.querySelector("#imprCharger").value,
	                  manctmKwa : entry.querySelector("#manctmKwa").value,
	                  manctmKwaCharger : entry.querySelector("#manctmKwaCharger").value
	              }
	              entry1Arr.push(data);
	          }
	          console.log("통관 내용 데이터 : ",entry1Arr);
	          
	          $.ajax({
	              url : "/cbs/cstbrkr/insertEntryOne",
	              contentType : "application/json;charset=utf-8",
	              type : "post",
	              data : JSON.stringify(entry1Arr),
	              dataType : 'text',
// 	              beforeSend:function(xhr){
// 	                  xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
// 	            	},
	              success : function(result){
	                  console.log("통관 내용 데이터 전송 완료", result);
	                  tabNum += result;
	                  
	                  const target = document.getElementById('nextBtn');
	                  console.log("nextbtn 누름",target);
	                  
	                  if(0 < result){
	                  	console.log("next버튼 활성화 완료");
	                  	target.disabled = false;
	                  }else{
	                  	alert("데이터를 다시 입력해주세요.");
	                  }
	                  
	              },
	              error: function (xhr, status, error) {
	                  console.log("code: " + xhr.status)
	                  console.log("message: " + xhr.responseText)
	                  console.log("error: " + error);
	              }
	          })
	          
	      };
	      //통관 페이지 임시저장 종료////////////////
	
	      //통관 물품 페이지 시작//////////////////
	      const myDisp = document.querySelector("#disp");
	      const tempFamily = document.querySelector("#tempFamily");
	
	      const currentBtnIndex = 0;
	      const famNm = "";
	      //상품 추가 버튼
	      var clickIdx = 0;
	      const fadd = function(){
	          let famClone = tempFamily.cloneNode(true);
	          clickIdx += 1;
	          famClone.id = "fam"+clickIdx;
	          famClone.style.display = "block";
	          myDisp.appendChild(famClone);
	          famNm = famClon.id;
	      }
	
	      //상품 삭제 버튼
	      const fremove = function(pThis){
	          myDisp.removeChild(pThis.parentElement);
	      }
	      
          var goodsNo = "";
          var goodsNm = "";
          var hsCd = "";
	      //고객 상품 검색 버튼
	      const cstSrcBtn = function(){
	    	  var cstSrcCd = document.querySelector("#cstmrCd").value;
	    	  var data = {
	    			  cstmrCd : cstSrcCd
	    	  }
	    	  console.log("고객코드 : ", cstSrcCd);
	    	  
	    	  $.ajax({
                url : "/cbs/cstbrkr/customerMainGoods",
                contentType : "application/json;charset=utf-8",
                type : "post",
                data : JSON.stringify(cstSrcCd),
                dataType : "json",
                success : function(result){
                    console.log("고객 상품 목록 출력 완료", result);

                    var cstmrCd = result[0].mainGoodsVOList[0].cstmrCd;
                    console.log("선택된 고객코드 : ", cstmrCd);
                    var str = "";
                    result.forEach(function(goodsVO, idx){
                        console.log("goods["+idx+"]",goodsVO);
                        
                        str += "<tr id=goodsRow"+idx+">";
                        str += "<td><input type='checkbox' id='checkbox"+idx+"'/></td>";
                        str += "<td>"+(idx+1)+			"</td>";
                        str += "<td>"+cstmrCd+			"</td>";
                        str += "<td>"+goodsVO.goodsNo+	"</td>";
                        str += "<td>"+goodsVO.goodsNm+	"</td>";
                        str += "<td>"+goodsVO.hsCd+		"</td>";
                        str += "<tr>";
                        
                    })
                    $("#goodsBody").html(str);
                    
                    result.forEach(function(goodsVO, idx){
                        //행 클릭했을 때, 함수 부여
                        $("#goodsRow"+idx).on("click", function(){
                        	//행 클릭하면 해당 행의 체크박스에 체크가 됨.
                        	$("input[type='checkbox']").prop("checked", false);
                        	//다른 행을 클릭하면 해당 행에 체크가 됨.
                        	$("#checkbox"+idx).prop("checked", true);
                        	//해당 클릭 행의 콜백 함수 실행.
                        	goodsSelect(idx);
                        });
                    })
                    
                    //행 클릭했을 때 통관 내용에 입력 될 수 있게.
                    const goodsSelect = function(idx){
                    	console.log("클릭한 행 : ", idx);
                    	var selectedGoods = result[idx];
                    	console.log(selectedGoods);
                    	
                    	goodsNo = selectedGoods.goodsNo;
                    	goodsNm = selectedGoods.goodsNm;
                    	hsCd = selectedGoods.hsCd;
                    }
                    
                    //Okaybutton을 눌렀을 때 함수
                    $("#goodsModalSelectBtn").on("click", function(){
                    	console.log("선택 데이터 : ", goodsNo, goodsNm, hsCd);
                    	$("#tooltipModal").hide();
                    	$("#goodsNo").val(goodsNo);
                    	$("#goodsNm").val(goodsNm);
                    	$("#hsCd").val(hsCd);
                    });
                },
                error: function (xhr, status, error) {
	                  console.log("code: " + xhr.status);
	                  console.log("message: " + xhr.responseText);
	                  console.log("error: " + error);
	            }
                
              })
	      };
	
	      //임시저장 버튼
	      const fdata = function(){
	          let fams = document.querySelectorAll("#fam");
	          let familyArr = [];
	          let entrManageNo = document.querySelector("#entrManageNo").value;
	          let cstmrCd = document.querySelector("#cstmrCd").value;
	          for(let i=0; i<fams.length; i++){
	              let fam = fams[i];
	              let family = {
	                  //통관관리번호
	                  entrManageNo,
	                  //상품번호
	                  goodsNo:fam.querySelector("[name=goodsNo]").value,
	                  //고객코드
	                  cstmrCd,
	                  //물품유형
	                  thingTy:fam.querySelector("[name=thingTy]").value,
	                  //수량
	                  qy:fam.querySelector("[name=qy]").value,
	                  //단가
	                  untpc:fam.querySelector("[name=untpc]").value,
	                  //금액
	                  amount:fam.querySelector("[name=amount]").value,
	                  //총금액
	                  totAmount:fam.querySelector("[name=totAmount]").value,
	                  //순중량
	                  netwght:fam.querySelector("[name=netwght]").value,
	                  //총중량
	                  totWt:fam.querySelector("[name=totWt]").value,
	                  //수하물포장개수
	                  baggTnpakg:fam.querySelector("[name=baggTnpakg]").value,
	                  //물품명
	                  thingNm:fam.querySelector("[name=thingNm]").value,
	                  //거래품명
	                  delngPrdnm:fam.querySelector("[name=delngPrdnm]").value
	              }
	              familyArr.push(family);
	          }
	          console.log("통관 물품 확인 : ", familyArr);
	      };
	      //통관 물품 페이지 종료//////////////
</script>

</html>