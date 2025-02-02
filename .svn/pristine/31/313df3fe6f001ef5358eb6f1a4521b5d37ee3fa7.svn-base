package com.team4.cbs.cstbrkr.controller;

import java.io.File;
import java.security.Principal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.team4.cbs.common.vo.ChargeCustomerVO;
import com.team4.cbs.common.vo.CustomerVO;
import com.team4.cbs.common.vo.CustomsBrokerVO;
import com.team4.cbs.common.vo.EntryProcessStatusVO;
import com.team4.cbs.common.vo.UserVO;
import com.team4.cbs.cstbrkr.service.CstbrkrService;
import com.team4.cbs.cstbrkr.vo.EntryProcessListVO;
import com.team4.cbs.cstbrkr.vo.EntryTaxVO;
import com.team4.cbs.cstbrkr.vo.EntryThingVO;
import com.team4.cbs.cstbrkr.vo.EntryVO;
import com.team4.cbs.cstbrkr.vo.GoodsVO;
import com.team4.cbs.cstbrkr.vo.ImportExportCertificateVO;
import com.team4.cbs.cstbrkr.vo.PresentnPapersVO;
import com.team4.cbs.trnsprt.vo.ShipDiaryVO;
import com.team4.cbs.util.ArticlePageList;

import lombok.extern.slf4j.Slf4j;
import oracle.jdbc.proxy.annotation.Post;

// 관세사 메인 컨트롤러
@Slf4j
@Controller
@RequestMapping("cbs/cstbrkr")
public class CstbrkrController {

	@Autowired
	CstbrkrService cstbrkrService;

	@GetMapping("/entry")
	public String list() {
		return "cstbrkr/list";
	}

	@GetMapping("/cstbrkrHome")
	public String cstbrkrHome() {
		return "cstbrkr/cstbrkrHome";
	}

	/*
	 * 공통 통관 진행 상태
	 * 시작-------------------------------------------------------------------------
	 */
	@GetMapping("/entryProcessStatusPopup")
	public String entryProcessStatusPopup() {
		log.debug("통관 진행상태 팝업 실행");
		return "main/entryProcessStatusPopup";
	}

	@GetMapping("/entryDocumentsPopup")
	public String entryDocumentsPopup() {
		log.debug("통관서류 팝업 실행");
		return "main/entryDocumentsPopup";
	}

	@GetMapping("/ImportExportCertificate")
	public String ImportExportCertificate() {
		log.debug("수출입신고서");
		return "main/ImportExportCertificate";
	}
	
	@GetMapping("/customsClearanceAgencyFeeTaxInvoice")
	public String customsClearanceAgencyFeeTaxInvoice() {
		log.debug("통관대행료 세금계산서 실행");
		return "main/customsClearanceAgencyFeeTaxInvoice";
	}
	
	@ResponseBody
	@PostMapping("/customsClearanceAgencyFeeTaxInvoiceInfo")
	public List<Map<String, Object>> customsClearanceAgencyFeeTaxInvoiceInfo(@RequestBody String entrManageNo) {
		log.debug("통관대행료 세금계산서 정보 가져오기 메서드 실행");
		List<Map<String, Object>> response = this.cstbrkrService.customsClearanceAgencyFeeTaxInvoiceInfo(entrManageNo);
		log.debug("통관대행료 세금계산서 정보 가져오기 메서드 가져온 값 : {}", response);
		
		return response;
	}
	
	// 담당고객 목록 페이지
   @GetMapping("/customer")
   public String chargeCustomerList() {
      return "cstbrkr/chargeCustomerList";
   }

   // 담당고객 목록 + 페이징처리 + 조건검색
   @ResponseBody
   @PostMapping("/customer")
   public ArticlePageList<ChargeCustomerVO> chargeCustomerList(@RequestBody(required = false) Map<String, Object> map,
         Principal principal) {
      log.info("체크 map : " + map);

      String id = principal.getName();
      map.put("cstbrkrCd", id);

      List<ChargeCustomerVO> chargeCustomerList = this.cstbrkrService.chargeCustomerList(map);

      // 페이징처리 시작///////////////////
      // 전체 갯수 확인
      int total = this.cstbrkrService.getTotal(map);
      log.info("체크 Total : " + total);

      // select한 10개의 행
      int size = 10;

      // jsp에서 넘겨준 현재 페이지수(currentPage)
      String currentPage = map.get("currentPage").toString();
      log.info("체크 currentPage : " + currentPage);

      String keyword = "";
      if (map != null) {
         keyword = map.get("keyword") != null ? (String) map.get("keyword") : "";
      }

      // ArticlePage객체 생성 -> ArticlePage(사용해야할 VO>
      ArticlePageList<ChargeCustomerVO> data = new ArticlePageList<ChargeCustomerVO>(total,
            Integer.parseInt(currentPage), size, chargeCustomerList, keyword);
      log.info("체크 data : " + data);

      // AriticlePage안의 url 속에 값넣기
      String url = "/cbs/cstbrkr";
      data.setUrl(url);
      log.debug("체크 data : " + data.toString());

      return data;
   }

   // 담당고객 상세
   @ResponseBody
   @PostMapping("/chargeCustomerDetail")
   public ChargeCustomerVO chargeCustomerDetail(@RequestBody ChargeCustomerVO CstmrCd) {
      log.info("ChargeCustomerVO 살행 " + CstmrCd);
      return this.cstbrkrService.chargeCustomerDetail(CstmrCd);
   }

   // 법인고객 등록
   @ResponseBody
   @PostMapping("/legalChargeCustomerInsert")
   public int legalChargeCustomerInsert(@RequestBody ChargeCustomerVO chargeCustomerVO, Principal principal) {
      String id = principal.getName(); // 현재 로그인한 아이디 가져오기
      log.info("id" + id);
      chargeCustomerVO.setCstbrkrCd(id);
      log.info("법인 고객 등록 실행" + chargeCustomerVO);
      log.info("reprsntAdres: " + chargeCustomerVO.getReprsntAdres());
      return this.cstbrkrService.legalChargeCustomerInsert(chargeCustomerVO);
   }

   // 개인고객 등록
   @ResponseBody
   @PostMapping("/indivChargeCustomerInsert")
   public int indivChargeCustomerInsert(@RequestBody ChargeCustomerVO chargeCustomerVO, Principal principal) {
      String id = principal.getName(); // 현재 로그인한 아이디 가져오기
      log.info("id" + id);
      chargeCustomerVO.setCstbrkrCd(id);
      return this.cstbrkrService.indivChargeCustomerInsert(chargeCustomerVO);
   }

   // 법인고객 수정
   @ResponseBody
   @PostMapping("/legalChargeCustomerUpdate")
   public int legalChargeCustomerUpdate(@RequestBody ChargeCustomerVO chargeCustomerVO) {
      log.info("legalChargeCustomerUpdate : " + chargeCustomerVO);
      int result = this.cstbrkrService.legalChargeCustomerUpdate(chargeCustomerVO);
      log.info("legalChargeCustomerUpdate : " + result);
      return result;
   }

   // 개인고객 수정
   @ResponseBody
   @PostMapping("/indivChargeCustomerUpdate")
   public int indivChargeCustomerUpdate(@RequestBody ChargeCustomerVO chargeCustomerVO) {
      log.info("indivChargeCustomerUpdate : " + chargeCustomerVO);
      int result = this.cstbrkrService.indivChargeCustomerUpdate(chargeCustomerVO);
      log.info("indivChargeCustomerUpdate : " + result);
      return result;
   }

   // 담당고객 삭제
   @ResponseBody
   @PostMapping("/chargeCustomerDelete")
   public int chargeCustomerDelete(@RequestBody ChargeCustomerVO chargeCustomerVO) {
      log.info("chargeCustomerVO" + chargeCustomerVO);
      int result = this.cstbrkrService.chargeCustomerDelete(chargeCustomerVO);
      log.info("chargeCustomerDelete-->result : " + result);
      return result;
   }

   // 삭제 전 통관 테이블에서 고객 코드 체크
   @ResponseBody
   @PostMapping("/checkCstmrCd")
   public int checkCstmrCd(@RequestParam String cstmrCd) {
      int count = this.cstbrkrService.checkCstmrCd(cstmrCd);
      return count;
   }

   /*
    * 의뢰목록-------------------------------------------------------------------------
    * -----------------
    */

   // 의뢰 목록 페이지
   @GetMapping("/presentnList")
   public String presentnList() {
      log.info("의뢰 목록 페이지 접속함.");
      return "cstbrkr/presentnList";
   }

   // 의뢰 목록 페이지 리스트 불러오는 메서드 Select
   @ResponseBody
   @PostMapping("/presentnPapersList")
   public List<PresentnPapersVO> presentnPapersList() {
      log.info("의뢰 목록 페이지 리스트 불러오는 메서드 - 리스트 불러오기 시작");
      List<PresentnPapersVO> presentnPapersVOList = this.cstbrkrService.presentnPapersList();
      log.info("의뢰 목록 리스트 불러오는 메서드 - 가져온 리스트 : {}", presentnPapersVOList);

      return presentnPapersVOList;
   }

   // 의뢰 목록 페이지 검색 조건을 통해 불러오는 메서드
   @ResponseBody
   @PostMapping("/presentnPapersConditionSearchList")
   public List<PresentnPapersVO> presentnPapersConditionSearchList(
         @RequestBody(required = false) Map<String, Object> conditionDatas) {
      log.info("통관 목록 페이지 검색 조건을 통해 불러오는 메서드 - 리스트 불러오기 시작");
      log.info("통관 목록 페이지 검색 조건을 통해 불러오는 메서드 - 받은 데이터 : {}", conditionDatas);
      List<PresentnPapersVO> presentnPapersVOList = this.cstbrkrService
            .presentnPapersConditionSearchList(conditionDatas);
      log.info("통관 목록 페이지 검색 조건을 통해 불러오는 메서드 - 검색 결과 값 : {}", presentnPapersVOList);
      log.info("통관 목록 페이지 검색 조건을 통해 불러오는 메서드 - 리스트 불러오기 종료");
      return presentnPapersVOList;
   }

   // 의뢰 팝업
   @GetMapping("/presentnPapersWindow")
   public String presentnPapersWindow() {
      return "main/presentnPapersWindow";
   }

   // 의뢰 상세
   @ResponseBody
   @PostMapping("/presentnPapersDetail")
   public CustomerVO presentnPapersDetail(@RequestBody PresentnPapersVO presentnPapersNo) {
      // presentnPapersDetail->presentnPapersNo : PPNO0001
      log.info("presentnPapersDetail->presentnPapersNo : " + presentnPapersNo);
      return this.cstbrkrService.presentnPapersDetail(presentnPapersNo);
   }

   // 고객검사 요청
   @ResponseBody
   @PostMapping("/customerRequest")
   public int customerRequest(@RequestBody CustomerVO customerVO) {
      log.info("CustomerRequest받아와 : " + customerVO);
      int result = this.cstbrkrService.customerRequest(customerVO);
      log.info("CustomerRequest보내 : " + result);
      return result;
   }

	/*
	 * 통관
	 * 신청시작-------------------------------------------------------------------------
	 */

	// 고객검사 승인 된 의뢰인 목록 페이지 접속
	@GetMapping("/entryApplyList")
	public String entryApplyList() {
		return "cstbrkr/entryApplyList";
	}

	// 고객검사 승인 된 목록만 가져오는 메서드 Select
	@ResponseBody
	@PostMapping("/entryApplyListSelect")
	public List<ChargeCustomerVO> entryApplyListSelect(@RequestBody String cstbrkrCd) {
		log.debug("고객검사 승인 된 목록만 가져오는 메서드 - 리스트 불러오기 시작");
		log.debug("고객검사 승인 된 목록만 가져오는 메서드 - 가져온 값 : {}", cstbrkrCd);
		List<ChargeCustomerVO> chargeCustomerVOList = this.cstbrkrService.entryApplyListSelect(cstbrkrCd);
		log.debug("고객검사 승인 된 목록만 가져오는 메서드 - 가져온 리스트 : {}", chargeCustomerVOList);
		log.debug("고객검사 승인 된 목록만 가져오는 메서드 - 리스트 불러오기 종료");
		return chargeCustomerVOList;
	}

	// 고객검사 승인 된 목록 조건 검색 메서드 Select
	@ResponseBody
	@PostMapping("/entryApplyListSelectConditionSearch")
	public List<ChargeCustomerVO> entryApplyListSelectConditionSearch(@RequestBody Map<String, Object> conditionData) {
		log.debug("통관 목록 페이지 검색 조건을 통해 불러오는 메서드 - 리스트 불러오기 시작");
		log.debug("통관 목록 페이지 검색 조건을 통해 불러오는 메서드 - 받은 데이터 : {}", conditionData);
		List<ChargeCustomerVO> chargeCustomerVOList = this.cstbrkrService
				.entryApplyListSelectConditionSearch(conditionData);
		log.debug("통관 목록 페이지 검색 조건을 통해 불러오는 메서드 - 검색 결과 값 : {}", chargeCustomerVOList);
		log.debug("통관 목록 페이지 검색 조건을 통해 불러오는 메서드 - 리스트 불러오기 종료");
		return chargeCustomerVOList;
	}

	// 선택 의뢰인 통관건 신청하는 페이지
	@GetMapping("/entryApply")
	public String entryApply() {
		return "cstbrkr/entryApply";
	}

	// 고객 검사 승인 된 목록 진행중 버튼 클릭
	@ResponseBody
	@PostMapping("/progressBtn")
	public Map<String, Object> progressBtn(@RequestBody String presentnPapersNo) {
		log.debug("고객 검사 승인 된 목록 진행중 버튼 클릭시 통관정보를 가져오는 메소드 시작");
		log.debug("고객 검사 승인 된 목록 진행중 버튼 클릭시 통관정보를 가져오는 메소드 - 가져온 값 : {}", presentnPapersNo);
		Map<String, Object> resultMap = this.cstbrkrService.progressEntryInfo(presentnPapersNo);
		log.debug("고객 검사 승인 된 목록 진행중 버튼 클릭시 통관정보를 가져오는 메소드 - 반환하는 값 : {}", resultMap);
		log.debug("고객 검사 승인 된 목록 진행중 버튼 클릭시 통관정보를 가져오는 메소드 종료");
		return resultMap;
	}

	// 통관 신청 관세사 이름 찾아오기
	@ResponseBody
	@PostMapping("/entryApplyCstbk")
	public UserVO entryApplyCstbk(@RequestBody CustomsBrokerVO customsBrokerVO) {
		log.debug("받아온 관세사 코드: {}", customsBrokerVO);
		UserVO userVO = this.cstbrkrService.selectCstbkNm(customsBrokerVO);
		return userVO;
	}

	// 수입자 정보 찾아오기
	@ResponseBody
	@PostMapping("/entryImportInfo")
	public CustomerVO entryImportInfo(@RequestBody CustomerVO customerVO) {
		log.debug("받아온 수입자 고객 코드: {}", customerVO);
		customerVO = this.cstbrkrService.entryImportInfo(customerVO);
		return customerVO;
	}

	// 수출자 정보 찾아오기
	@ResponseBody
	@PostMapping("/entryExportInfo")
	public CustomerVO entryExportInfo(@RequestBody CustomerVO customerVO) {
		log.debug("받아온 수출자 고객 코드: {}", customerVO);
		customerVO = this.cstbrkrService.entryExportInfo(customerVO);
		return customerVO;
	}

	// 통관 신청 하기
	@ResponseBody
	@PostMapping("/insertEntry")
	public int insertEntry(@RequestBody List<Map<String, Object>> dataList) {
		log.debug("insertEntry 메서드 - 수출입 신고 통관 부분 메서드 실행");
		log.debug("insertEntry 메서드 받은데이터 : {}", dataList);
		int entryThingInsert = this.cstbrkrService.insertEntry(dataList);
		log.debug("insertEntry 메서드 - 수출입 신고 통관 부분 메서드 실행 건 수: {}", entryThingInsert);

		return entryThingInsert;
	}

	// 통관관리번호 호출하기
	@ResponseBody
	@GetMapping("/selectEntryNo")
	public EntryVO selectEntryNo() {
		log.debug("selectEntryNo 메서드 - 통관관리번호 고객번호 전송 메소드 실행");
		EntryVO entryVO = this.cstbrkrService.selectEntryNo();
		System.out.println(entryVO);
		return entryVO;
	}

	@GetMapping("/mainGoods")
	public String mainGoods() {
		return "main/mainGoodsList";
	}

	// 주력상품 리스트 검색
	@ResponseBody
	@PostMapping("/GoodsSearch")
	public List<GoodsVO> goodsSearch(@RequestBody String searchText) {
		log.debug("goodsSearch 메서드 - 물품 검색 리스트 검색 실행");
		List<GoodsVO> goodsList = this.cstbrkrService.goodsSearch(searchText);
		log.debug("goodsList : {}", goodsList);

		return goodsList;
	}

	// 수출입 신고 통관 물품 여러건 삽입
	@ResponseBody
	@PostMapping("/insertEntryThings")
	public int insertEntryThings(@RequestBody List<EntryThingVO> entryThingVOList) {
		log.debug("insertEntryThings 메서드  - 통관 물품들 insert 실행");
		log.debug("받아 온 값 entryThingVO : {}", entryThingVOList);
		int result = 0;
		result += this.cstbrkrService.insertEntryThings(entryThingVOList);
//		for (EntryThingVO entryThingVO : entryThingVOList) {
//			result += this.cstbrkrService.insertEntryThings(entryThingVO);
//		}
		log.debug("insertEntryThings 메서드  - 통관 물품들 insert 실행 건 수 : {}", result);

		return result;
	}

	// 선박일정 불러오는 메소드
	@ResponseBody
	@GetMapping("/shipDiarySearch")
	public List<ShipDiaryVO> shipDiarySearch() {
		log.debug("shipDiarySearch 메서드 - 선박 일정 불러오기 select 실행");
		List<ShipDiaryVO> shipDiaryVOList = this.cstbrkrService.shipDiarySearch();
		log.debug("shipDiaryVOList 데이터 값 : {}", shipDiaryVOList);
		log.debug("shipDiarySearch 메서드 - 선박 일정 불러오기 select 종료");
		return shipDiaryVOList;
	}

	// 통관물품 통관신청시 처리상태 insert
	@ResponseBody
	@PostMapping("entryProcessStatusInsert")
	public int entryProcessStatusInsert(@RequestBody List<EntryProcessStatusVO> entryProcessStatusVOList) {
		log.debug("통관 물품 통관 신청시 처리상태 메서드 - 처리상태 insert 실행 ");
		log.debug("통관 물품 통관 신청시 처리상태 메서드 - web에서 받아온 값 : {}", entryProcessStatusVOList);

		int result = 0;
		for (EntryProcessStatusVO entryProcessStatusVO : entryProcessStatusVOList) {
			result = this.cstbrkrService.entryProcessStatusInsert(entryProcessStatusVO);
		}
		log.debug("통관 물품 통관 신청시 처리상태 메서드 - 처리상태 insert 종료 건 2가 나와야함. : {}", result);

		return result;
	}

	/*
	 * 통관
	 * 신청종료-------------------------------------------------------------------------
	 */

	/*
	 * 통관
	 * 목록시작-------------------------------------------------------------------------
	 */

	@GetMapping("/entryList")
	public String entryList() {
		log.info("통관 목록 페이지 접속함.");
		return "cstbrkr/entryList";
	}

	// 통관 목록 페이지 리스트 불러오는 메서드 Select
	@ResponseBody
	@PostMapping("/entryProcessList")
	public List<EntryProcessListVO> entryProcessList() {
		log.debug("통관 목록 페이지 리스트 불러오는 메서드 - 리스트 불러오기 시작");

		List<EntryProcessListVO> entryProcessListVOList = this.cstbrkrService.entryProcessList();
		log.debug("통관 목록 페이지 리스트 불러오는 메서드 - 가져온 리스트 : {}", entryProcessListVOList);

		log.debug("통관 목록 페이지 리스트 불러오는 메서드 - 리스트 불러오기 종료");
		return entryProcessListVOList;
	}

	// 통관 목록 페이지 검색 조건을 통해 불러오는 메서드 Select
	@ResponseBody
	@PostMapping("/entryProcessConditionSearchList")
	public List<EntryProcessListVO> entryProcessConditionSearchList(
			@RequestBody(required = false) Map<String, Object> conditionData) {
		log.debug("통관 목록 페이지 검색 조건을 통해 불러오는 메서드 - 리스트 불러오기 시작");
		log.debug("통관 목록 페이지 검색 조건을 통해 불러오는 메서드 - 받은 데이터 : {}", conditionData);
		List<EntryProcessListVO> entryProcessListVOList = this.cstbrkrService
				.entryProcessConditionSearchList(conditionData);
		log.debug("통관 목록 페이지 검색 조건을 통해 불러오는 메서드 - 검색 결과 값 : {}", entryProcessListVOList);
		log.debug("통관 목록 페이지 검색 조건을 통해 불러오는 메서드 - 리스트 불러오기 종료");
		return entryProcessListVOList;
	}

	/*
	 * 통관
	 * 목록종료-------------------------------------------------------------------------
	 */

	/*
	 * 마이페이지
	 * 시작-------------------------------------------------------------------------
	 */

	private boolean isPasswordChecked = false;

	@GetMapping("/myPage")
	public String myPage() {
		return "cstbrkr/check";
	}

	@GetMapping("/detailsForm")
	public String updateForm(Principal principal, Model model, UserVO userVO) {

		if (isPasswordChecked != true) {
			return "cstbrkr/check";
		} else {

			isPasswordChecked = false;

			String username = principal.getName(); // 현재 로그인한 사용자의 아이디 가져오기
			log.debug("username : {}", username);
			isPasswordChecked = false;
			List<UserVO> userDet = this.cstbrkrService.userDet(username);

			for (UserVO user : userDet) {
				String ihidnum = user.getIhidnum(); // 각 사용자의 주민등록번호 가져오기
				String ihidnum1 = ihidnum.substring(0, 8) + "*******";
				log.info("ihidnum" + ihidnum);
				user.setIhidnum(ihidnum1);
			}

			log.info("userDet" + userDet);
			model.addAttribute("userDet", userDet);

			return "cstbrkr/detailsForm";
		}
	}

	// 비밀번호 제외한 개인정보 업데이트
	@ResponseBody
	@PostMapping("/perUpd")
	public int perUpd(@RequestBody UserVO userVo) {
		isPasswordChecked = true;
		log.info("userVo" + userVo);
		return this.cstbrkrService.perUpd(userVo);
	}

	// 비밀번호 포함한 개인정보 업데이트
	@ResponseBody
	@PostMapping("/perUpd2")
	public int perUpd2(@RequestBody UserVO userVo) {
		isPasswordChecked = true;
		log.info("userVo" + userVo);
		String ChangePw = userVo.getPassword();
		log.debug("ChangePw : {}", ChangePw);

		PasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		String encodedPassword = passwordEncoder.encode(ChangePw);

		userVo.setPassword(encodedPassword);
		log.debug("encodedPassword : {}", encodedPassword);

		return this.cstbrkrService.perUpd2(userVo);
	}

	// 비밀번호 비교
	@ResponseBody
	@PostMapping("/checkPwd")
	public boolean checkPwd(Principal principal, @RequestBody Map<String, String> requestBody) { // 비밀번호 확인
		String username = principal.getName(); // 현재 로그인한 사용자의 아이디 가져오기
		log.debug("username : {}", username);

		String checkPwd = requestBody.get("checkPwd");
		log.debug("checkPwd : {}", checkPwd);

		// 사용자의 아이디로부터 암호화된 비밀번호 가져오기
		String storedPwd = this.cstbrkrService.getPwd(username);
		log.debug("Stored Password : {}", storedPwd);

		// 비밀번호 비교
		PasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		boolean matches = passwordEncoder.matches(checkPwd, storedPwd);

		if (matches) {
			isPasswordChecked = true; // 암호가 올바르면 상태를 업데이트합니다.
			return matches; // 암호가 올바르면 수정 페이지로 리다이렉트합니다.
		} else {
			return matches; // 암호가 잘못된 경우 다시 암호 확인 페이지로 이동합니다.
		}

	}

	// 사용자 아이디 가져오기
	@ResponseBody
	@GetMapping("/getUserInfo")
	public Map<String, String> getUserInfo(Principal principal) {
		String username = principal.getName(); // 전역 변수로 설정된 사용자 이름 사용
		Map<String, String> userInfo = new HashMap<>();
		userInfo.put("username", username); // 전역 변수로 설정된 사용자 이름 사용
		return userInfo;
	}

	// 프로필사진 업로드
	@ResponseBody
	@PostMapping("/profileUpd")
	public String profileUpd(@RequestParam("uploadFile") MultipartFile uploadFile, Principal principal)
			throws Exception {
		String cstbrkrCd = principal.getName();

		// CustomsBrokerVO 객체를 생성하거나 사용할 필요가 있는 경우에만 사용
		CustomsBrokerVO customsBrokerVO = new CustomsBrokerVO(); // 예시로 생성

		customsBrokerVO.setCstbrkrCd(cstbrkrCd);

		log.debug("체킁3: {}", uploadFile.getOriginalFilename());

		String saveName = uploadFile.getOriginalFilename();
		uploadFile.transferTo(new File("d:/team4/uploads/" + saveName)); // 물리적 저장 완료

		String webURL = "/team4/uploads/" + saveName;
		customsBrokerVO.setProfileFile(webURL);

		cstbrkrService.profileUpd(customsBrokerVO); // 필요한 경우 서비스 계층에서 사용
		isPasswordChecked = true;
		return "0";
	}
	/*
	 * 마이페이지
	 * 종료-------------------------------------------------------------------------
	 */

	// 수입신고서 데이터 가져오기
      @ResponseBody
      @PostMapping("/ImportExportCertificate")
      public Map<String, Object> ImportExportCertificate(@RequestBody String entrManageNo){
         log.debug("수입신고서 - 수입신고서 데이터 가져오기 시작");
         Map<String, Object> responseData = new HashMap<>();
         log.debug("entrManageNo : {}", entrManageNo);
        
         List<EntryThingVO> EntryThingVOList = this.cstbrkrService.entryThingData(entrManageNo);
         List<ImportExportCertificateVO> ImportExportCertificateVOList = this.cstbrkrService.ImportExportCertificate(entrManageNo);
         List<EntryTaxVO> EntryTaxVOList = this.cstbrkrService.entryTaxData(entrManageNo);
         
         
         log.debug("EntryThingVOList 확인 - 가져온 값 : {}", EntryThingVOList);
         log.debug("ImportExportCertificateVOList 확인 - 가져온 값 : {}", ImportExportCertificateVOList);
         log.debug("EntryTaxVOList 확인 - 가져온 값 : {}", EntryTaxVOList);
         
         // Map에 데이터 추가
         responseData.put("EntryThingVOList", EntryThingVOList);
         responseData.put("ImportExportCertificateVOList", ImportExportCertificateVOList);
         responseData.put("EntryTaxVOList", EntryTaxVOList);
         
         
         return responseData;
      }
      

}