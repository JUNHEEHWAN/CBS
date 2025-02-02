package com.team4.cbs.pbsvnt.admin.controller;

import java.security.Principal;
import java.util.Collection;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.catalina.authenticator.SpnegoAuthenticator.AuthenticateAction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.team4.cbs.common.vo.CustomerVO;
import com.team4.cbs.common.vo.EntryProcessStatusVO;
import com.team4.cbs.cstbrkr.vo.EntryThingVO;
import com.team4.cbs.cstbrkr.vo.EntryVO;
import com.team4.cbs.pbsvnt.admin.service.SvntAdminService;
import com.team4.cbs.pbsvnt.admin.vo.ExportLicenseVO;
import com.team4.cbs.pbsvnt.admin.vo.OneEntryDetailVO;
import com.team4.cbs.pbsvnt.admin.vo.WarehouseChitVO;
import com.team4.cbs.pbsvnt.bounded.vo.BoundedWarehouseVO;
import com.team4.cbs.pbsvnt.bounded.vo.UseBoundedWarehouseVO;
import com.team4.cbs.pbsvnt.quar.vo.QuarantineRequestVO;
import com.team4.cbs.util.ArticlePage;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/cbs/svntAdmin")
public class svntAdminController {
	
	@Autowired
	SvntAdminService svntAdminService;
	
	@ResponseBody
	@PostMapping("/warehouseChit")
	public WarehouseChitVO warehouseChit(@RequestBody WarehouseChitVO warehouseChitVO) {
		log.info("warehouseChit()->warehouseChitVO" + warehouseChitVO);
		return this.svntAdminService.warehouseChit(warehouseChitVO);
	}
	
	@GetMapping("/warehouseChit")
	public String warehouseChit() {
		return "main/warehouseChit";
	}
	
	@GetMapping("/exportLicense")
	public String exportLicense() { // 수출입 승인서
		return "main/certificate/exportLicense";
	}

	@GetMapping("/cstCheck")
	public String cstCheck() { // 고객 검사
		return "pbsvnt/admin/cstCheckList";	
	}
	
	@ResponseBody
	@PostMapping("/updSttus")
	public int updSttus(@RequestBody CustomerVO customerVO) { // 고객 처리 상태 변경
		return this.svntAdminService.updSttus(customerVO);
	}
	
	@ResponseBody
	@PostMapping("/oneCustomer")
	public CustomerVO oneCustomer(@RequestBody CustomerVO cstmrCd) { // 고객 코드 클릭시 고객 상세
		return this.svntAdminService.oneCustomer(cstmrCd);
	}
	
	
	@ResponseBody
	@PostMapping("/cusChkRandUpd")
	public int cusChkRandUpd(@RequestBody CustomerVO customerVO) { // 영업 여부, 범죄 이력, 세금 체납 이력 랜덤으로 넣어주기 (지금은 다 정상으로 고정되어 있음)
		return this.svntAdminService.cusChkRandUpd(customerVO);
	}
	
	@ResponseBody
	@PostMapping("/oneCusChk")
	public CustomerVO oneCusChk(@RequestBody CustomerVO customerVO) { // 고객 번호 클릭시 영업 여부, 범죄 이력, 세금 체납 이력 보이는 거
		return this.svntAdminService.oneCusChk(customerVO);
	}
	
	@ResponseBody
	@PostMapping("/updPbsvntCd")
	public int updPbsvntCd(@RequestBody List<EntryVO> entryVOList, Principal principal) { // 통관 접수시 ENTRY TABLE 공무원 코드 UPDATE
		int count = 0;
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pbsvntCd", principal.getName());
		for(EntryVO e : entryVOList) {
			map.put("entrManageNo", e.getEntrManageNo());
			this.svntAdminService.updPbsvntCd(map);
			count += 1;
		}
		return count;
	}
	
	@ResponseBody
	@PostMapping("/eps2upd")
	public int eps2upd(@RequestBody List<EntryVO> entryVOList, Principal principal) { // 통관 접수시
		int count = 0;
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userCd", principal.getName());
		for(EntryVO e : entryVOList) {
			map.put("entrManageNo", e.getEntrManageNo());
			this.svntAdminService.eps2upd(map);
			count += 1;
		}
		return count;
	}
	
	@ResponseBody
	@PostMapping("/eps3upd")
	public int eps3upd(@RequestBody EntryProcessStatusVO entryProcessStatusVO, Principal principal) { // 운송 요청시
		int count = 0;
		entryProcessStatusVO.setUserCd(principal.getName());
		this.svntAdminService.eps3upd(entryProcessStatusVO);
		return count;
	}
	
	@ResponseBody
	@PostMapping("/eps5upd")
	public int eps5upd(@RequestBody EntryProcessStatusVO entryProcessStatusVO, Principal principal) { // 검역 요청시
		int count = 0;
		entryProcessStatusVO.setUserCd(principal.getName());
		this.svntAdminService.eps5upd(entryProcessStatusVO);
		return count;
	}

	@ResponseBody
	@PostMapping("/quarPassEps8upd")
	public int quarPassEps8upd(@RequestBody EntryProcessStatusVO entryProcessStatusVO, Principal principal) { // 검역 승인시
		int count = 0;
		entryProcessStatusVO.setUserCd(principal.getName());
		this.svntAdminService.quarPassEps8upd(entryProcessStatusVO);
		return count;
	}
	
	@ResponseBody
	@PostMapping("/eps10upd")
	public int eps8upd(@RequestBody EntryProcessStatusVO entryProcessStatusVO, Principal principal) { // 출고 요청시
		int count = 0;
		entryProcessStatusVO.setUserCd(principal.getName());
		this.svntAdminService.eps10upd(entryProcessStatusVO);
		return count;
	}

	@ResponseBody
	@PostMapping("/eps12upd")
	public int eps12upd(@RequestBody EntryProcessStatusVO entryProcessStatusVO, Principal principal) { // 수출입 승인
		int count = 0;
		entryProcessStatusVO.setUserCd(principal.getName());
		this.svntAdminService.eps12upd(entryProcessStatusVO);
		return count;
	}
	
	@GetMapping("/entryList")
	public String entryList() {
		return "pbsvnt/admin/entryList";
	}
	
	@ResponseBody
	@PostMapping("/list")
	public ArticlePage<EntryVO> entryList(@RequestBody(required=false) Map<String,Object> map) { // 통관 접수 후 심사 전 배정 목록
		log.info("entryList->map: " + map);
		List<EntryVO> entryList = this.svntAdminService.entryList(map);
		
		int total = this.svntAdminService.getTotalEntryList();
		int size = 10;
		String currentPage = map.get("currentPage").toString(); // from jsp
		String keyword = "";
		
		ArticlePage<EntryVO> data = new ArticlePage<EntryVO>(total, Integer.parseInt(currentPage), size, entryList, keyword);
		log.info("entryList->data: " + data);
		String url = "/cbs/svntAdmin/entryList";
		data.setUrl(url);
		
		return data;
	}
	
	@ResponseBody
	@PostMapping("/cstCheckList")
	public ArticlePage<CustomerVO> cstCheckList(@RequestBody(required=false) Map<String,Object> map) { // 고객 검사 목록
		log.info("cstCheckList()->map: " + map);
		List<CustomerVO> cstCheckList = this.svntAdminService.cstCheck(map);
		
		int total = this.svntAdminService.getTotalCstCheckList(map);
		int size = 10;
		String currentPage = map.get("currentPage").toString(); // from jsp
		String keyword = "";
		
		ArticlePage<CustomerVO> data = new ArticlePage<CustomerVO>(total, Integer.parseInt(currentPage), size, cstCheckList, keyword);
//		log.info("cstCheckList->data: " + data);
		String url = "/cbs/svntAdmin/cstCheck";
		data.setUrl(url);
		
		return data;
	}
	
	@GetMapping("/entryJudge")
	public String entryJudgeList(Principal principal) { 
		//log.info("principal.getName() " + principal.getName());
		return "pbsvnt/admin/entryJudge";
	}
	
	@ResponseBody
	@PostMapping("/judgeList")
	public ArticlePage<EntryProcessStatusVO> judgeList(@RequestBody(required=false) Map<String, Object> map, Principal principal) { // 통관 심사 목록
		log.info("judgeList()->map" + map);
		map.put("pbsvntCd", principal.getName());
		List<EntryProcessStatusVO> judgeList = this.svntAdminService.judgeList(map);
		
		int total = this.svntAdminService.getTotalJudgeList();
		int size = 10;
		String currentPage = map.get("currentPage").toString(); // from jsp
//		log.info("judgeList()->currentPage: " + currentPage);
		String keyword = "";
		
		ArticlePage<EntryProcessStatusVO> data = new ArticlePage<EntryProcessStatusVO>(total, Integer.parseInt(currentPage), size, judgeList, keyword);
		String url = "/cbs/svntAdmin/judgeList";
		data.setUrl(url);
		
		return data;
	}
	
	@ResponseBody
	@PostMapping("/oneEntryDetail")
	public OneEntryDetailVO oneEntryDetail(@RequestBody Map map) {
		//log.info("oneEntryDetail()->entrManageNo: " + entrManageNo);
		//log.info("oneEntryDetail()->OneEntryDetailVO: " + oedVO);
		String entrManageNo = (String)map.get("entrManageNo");
		log.info("oneEntryDetail()->entrManageNo: " + entrManageNo);
		return this.svntAdminService.oneEntryDetail(entrManageNo);
	}
	
	@ResponseBody
	@PostMapping("/tooltipInfo")
	public List<OneEntryDetailVO> tooltipInfo(@RequestBody String entrManageNo) {
		return this.svntAdminService.tooltipInfo(entrManageNo);
	}
	
//  ############################동현 시작##########################################

	@ResponseBody
	@GetMapping("/entryDetailList")
	public List<EntryThingVO> entryDetailList(@RequestParam String entrManageNo) {
//		log.info("데이터 가져와봐 entryDetailList()->entrManageNo: " + entrManageNo);
  
		List<EntryThingVO> entryDetailList = this.svntAdminService.entryDetailList(entrManageNo);
//		log.info("entryDetailList()->entryDetailList" + entryDetailList);
      
		return entryDetailList;
	}

  //   ############################동현 끝##########################################
	
	@ResponseBody
	@PostMapping("/updWarehouse")
	public int updWarehouse(@RequestBody UseBoundedWarehouseVO useBoundedWarehouseVO) {
		return this.svntAdminService.updWarehouse(useBoundedWarehouseVO);
	}
	
	@ResponseBody
	@PostMapping("/getWarehouseInfo")
	public BoundedWarehouseVO getWarehouseInfo(@RequestBody BoundedWarehouseVO boundedWarehouseVO) {
		//log.info("체킁킁: " + boundedWarehouseVO);
		BoundedWarehouseVO vo = this.svntAdminService.getWarehouseInfo(boundedWarehouseVO);
		//log.info("체킁: " + vo);
		return this.svntAdminService.getWarehouseInfo(boundedWarehouseVO);
	}
	
	@GetMapping("/quarReq")
	public String quarReq() {
		return "main/quarReq";
	}
	
	@ResponseBody
	@PostMapping("/getQrantRequestCd")
	public String getQrantRequestCd() {
		return this.svntAdminService.getQrantRequestCd();
	}
	
	@ResponseBody
	@PostMapping("/insQuarRequest")
	public QuarantineRequestVO insQuarRequest(@RequestBody QuarantineRequestVO quarantineRequestVO) {
		//log.info("QuarantineRequestVO: " + quarantineRequestVO);
		return this.svntAdminService.insQuarRequest(quarantineRequestVO);
	}
	
	@ResponseBody
	@PostMapping("/insExportLicense") // 승인기관, 유효기간, 승인번호, 날짜, 승인자 insert
	public int insExportLicense(@RequestBody ExportLicenseVO exportLicenseVO) {
		return this.svntAdminService.insExportLicense(exportLicenseVO);
	}

	@ResponseBody
	@PostMapping("/getExportLicense") // 수출입 승인서 값 select -> 리스트 아닌 것
	public ExportLicenseVO getExportLicense(@RequestBody ExportLicenseVO exportLicenseVO) {
		 return this.svntAdminService.getExportLicense(exportLicenseVO);
	}

	@ResponseBody
	@PostMapping("/getExportLicense2") // 수출입 승인서 값 select -> 리스트인 것
	public List<ExportLicenseVO> getExportLicense2(@RequestBody ExportLicenseVO exportLicenseVO) {
		return this.svntAdminService.getExportLicense2(exportLicenseVO);
	}

	@ResponseBody
	@PostMapping("/getExportLicense3") // 수출입 승인서 값 select -> section3
	public ExportLicenseVO getExportLicense3(@RequestBody ExportLicenseVO exportLicenseVO) {
		return this.svntAdminService.getExportLicense3(exportLicenseVO);
	}
	
	
//	@GetMapping("/pbQuarList")
//	public String pbQuarList(Model model) { // 검역 결과 조회
//		List<QuarantineDetailVO> pbQuarList = this.svntAdminService.pbQuarList();
//		//log.info("pbQuarList()->pbQuarList" + pbQuarList);
//		model.addAttribute("pbQuarList", pbQuarList);
//		return "pbsvnt/admin/pbQuarList";
//	}
	
//	@GetMapping("/error")
//	public String error(Model model) { // 신고 내역 조회
//		List<ErrorsInDeclarationVO> errorList = this.svntAdminService.error();
//		model.addAttribute("errorList", errorList);
//		return "pbsvnt/admin/errorList";
//	}
	
//	@ResponseBody
//	@PostMapping("/oneQurantDet")
//	public QuarantineDetailVO oneQurantDet(@RequestBody QuarantineDetailVO quarntineDetailVO) { // 검역 상세 조회
//		QuarantineDetailVO oneQurantDet = this.svntAdminService.oneQurantDet(quarntineDetailVO);
//		//log.info("oneQurantDet()->oneQurantDet: " + oneQurantDet);
//		return oneQurantDet;
//	}
	
//	@ResponseBody
//	@PostMapping("/oneErorDet")
//	public ErrorsInDeclarationVO oneErorDet(@RequestBody ErrorsInDeclarationVO erorVO) { // 신고 상세 조회
//		ErrorsInDeclarationVO oneErorDet = this.svntAdminService.oneErorDet(erorVO);
//		return oneErorDet;
//	}
	
//	@GetMapping("/paperJudge")
//	public String myList(Model model, String pbsvntCd) { // 서류 심사 내 담당 목록
//		pbsvntCd = "PUBL2001"; // ------------------------------------------------------ 로그인 세션 구현 후 수정
//		List<EntryVO> myList = this.svntAdminService.myList(pbsvntCd);
//		log.info("myList()->myList: " + myList);
//		model.addAttribute("paperJudgeList", myList);
//		
//		return "pbsvnt/admin/paperJudge";
//	}
	
//	@ResponseBody
//	@PostMapping("/allList")
//	public List<EntryVO> allList() { // 서류 심사 접수 대기 목록
//		return this.svntAdminService.allList();
//	}
}
