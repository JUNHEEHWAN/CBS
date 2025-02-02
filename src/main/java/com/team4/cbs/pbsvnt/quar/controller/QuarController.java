package com.team4.cbs.pbsvnt.quar.controller;

import java.io.Console;
import java.security.Principal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.velocity.runtime.directive.Parse;
import org.springframework.asm.TypeReference;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.team4.cbs.common.vo.ChargeCustomerVO;
import com.team4.cbs.common.vo.UserVO;
import com.team4.cbs.cstbrkr.vo.EntryVO;
import com.team4.cbs.pbsvnt.quar.service.QuarService;
import com.team4.cbs.pbsvnt.quar.vo.QuarantineItemVO;
import com.team4.cbs.pbsvnt.quar.vo.QuarantineRequestVO;
import com.team4.cbs.util.ArticlePage;

import lombok.extern.slf4j.Slf4j;

// 검역 공무원 컨트롤러
@Slf4j
@CrossOrigin
@Controller
@RequestMapping("cbs/quar")
public class QuarController {

	@Autowired
	QuarService quarService;

	// 검사검역 페이지
	@GetMapping("/qlist")
	public String quarPage() {

		return "pbsvnt/quar/quarList";
	}

	// 검사검역 배정 페이지
	@GetMapping("/qstart")
	public String quarStart() {

		return "pbsvnt/quar/quarStart";
	}

	// 검사검역 문서 페이지
	@GetMapping("/quarPaperList")
	public String quarPaperList() {

		return "pbsvnt/quar/paperList";
	}

	// 검사검역 결과서 페이지
	@GetMapping("/qpaper")
	public String quarPaper() {

		return "pbsvnt/quar/a/quarPaper";
	}

	// 검사검역 전표 페이지
	@GetMapping("/qchitpaper")
	public String quarChitPaper() {

		return "pbsvnt/quar/a/quarChit";
	}
	// 검사검역 전표 페이지
	@GetMapping("/qchitpaperB")
	public String quarPaperB() {
		
		return "pbsvnt/quar/a/quarChitB";
	}

	// 모달 데이터 삭제
	@ResponseBody
	@PostMapping("/quarModifyDel")
	public int qDelete(@RequestBody QuarantineItemVO quarantineItemVO) {
		// log.info("넘어온값 체크 : "+quarantineItemVO);
		int result = 0;

		result += this.quarService.quarDelete(quarantineItemVO);

		return result;
	}

	// 검역 실행 리스트
	@ResponseBody
	@PostMapping("/quarList")
	public ArticlePage<QuarantineRequestVO> list(@RequestBody(required = false) Map<String, Object> map,
			Principal principal) {
		log.info("map:" + map);

		// log.info("id:"+id);
		List<QuarantineRequestVO> quarList = this.quarService.list(map);
		log.info("qList:" + quarList);

		int total = this.quarService.getTotal3(map);

		int size = 10;

		String currentPage = map.get("currentPage").toString(); // from jsp

		String keyword = "";
		if (map != null) {
			keyword = map.get("keyword") != null ? (String) map.get("keyword") : "";
		}

		ArticlePage<QuarantineRequestVO> data = new ArticlePage<QuarantineRequestVO>(total,
				Integer.parseInt(currentPage), size, quarList, keyword);
		// log.info("quarList->data: " + data);

		String url = "/cbs/quar/qlist";
		data.setUrl(url);

		return data;

	}

	// 검역 문서 출력 리스트
	@ResponseBody
	@PostMapping("/quarPaperList")
	public ArticlePage<QuarantineRequestVO> paperList(@RequestBody(required = false) Map<String, Object> map,
			Principal principal) {
		log.info("map:" + map);

		// log.info("id:"+id);
		List<QuarantineRequestVO> quarList = this.quarService.paperList(map);
		log.info("qList:" + quarList);

		int total = this.quarService.getTotal4(map);

		int size = 10;

		String currentPage = map.get("currentPage").toString(); // from jsp
		log.info("currentPage3152345243:" + currentPage);

		String keyword = "";
		if (map != null) {
			keyword = map.get("keyword") != null ? (String) map.get("keyword") : "";
		}

		ArticlePage<QuarantineRequestVO> data = new ArticlePage<QuarantineRequestVO>(total,
				Integer.parseInt(currentPage), size, quarList, keyword);
		// log.info("quarList->data: " + data);

		String url = "/cbs/quar/qlist";
		data.setUrl(url);

		return data;

	}

	// 검역 배정 리스트
	@ResponseBody
	@PostMapping("/quarStartList")
	public ArticlePage<QuarantineRequestVO> startList(@RequestBody(required = false) Map<String, Object> map) {
		List<QuarantineRequestVO> quarList = new ArrayList<>();

		quarList = this.quarService.startList(map);
		// log.info("startList:"+quarList);

		int total = this.quarService.getTotal2(map);
		int size = 10;
		String currentPage = map.get("currentPage").toString(); // from jsp

		String keyword = "";
		if (map != null) {
			keyword = map.get("keyword") != null ? (String) map.get("keyword") : "";
		}

		ArticlePage<QuarantineRequestVO> data = new ArticlePage<QuarantineRequestVO>(total,
				Integer.parseInt(currentPage), size, quarList, keyword);
		// log.info("quarStartList->data: " + data);

		String url = "/cbs/quar/qstart";
		data.setUrl(url);

		return data;

	}

	@ResponseBody
	@PostMapping("/quarModify")
	public List<QuarantineItemVO> modifyList(@RequestBody QuarantineItemVO quarantineItemVO) {
		// log.info("받아온 modify quarantineItemVO"+quarantineItemVO);
		List<QuarantineItemVO> quarModifyList = new ArrayList<>();

		quarModifyList = this.quarService.quarModifyList(quarantineItemVO);
		// log.info("quarModifyList:"+quarModifyList);

		return quarModifyList;
		// return "pbsvnt/quar/quarList";

	}

	// 검역 상세
	@ResponseBody
	@PostMapping("/quarDetailList")
	public List<QuarantineItemVO> detailList(@RequestBody QuarantineItemVO quarantineItemVO) {
		// log.info("받아온 quarantineItemVOList: "+quarantineItemVO);

		List<QuarantineItemVO> quarDetail = this.quarService.detailList(quarantineItemVO);

		// log.info("quarDetail: "+quarDetail);

		return quarDetail;

	}

	@ResponseBody
	@PostMapping("/quarReady")
	public QuarantineRequestVO ready(@RequestBody QuarantineRequestVO quarantineRequestVO) {
		QuarantineRequestVO qReadyVO = this.quarService.getReady(quarantineRequestVO);
		// log.info("결과 체킁: " + qReadyVO);
		return qReadyVO;
	}

	@ResponseBody
	@PostMapping("/quarInsert")
	public int qInsert(@RequestBody List<QuarantineItemVO> quarantineItems) {
		// log.info("넘어온값 체크 : "+quarantineItems);
		int result = 0;

		for (QuarantineItemVO item : quarantineItems) {
			// log.info("바꾼값 체크"+item);

			result += this.quarService.quarInsert(item);
		}
		return result;
	}

	@ResponseBody
	@PostMapping("/quarAssignUpdate")
	public int quarAssignUpdate(@RequestBody List<QuarantineRequestVO> quarRequestVO) {
		log.info("넘어온값 체크 : " + quarRequestVO);

		int result = 0;

		for (QuarantineRequestVO request : quarRequestVO) {
			log.info("바꾼값 체크" + request);

			result += this.quarService.assignUpdate(request);
		}
		return result;
	}

	// 통관 처리상태 업데이트
	@ResponseBody
	@PostMapping("/entAssignUpdate")
	public int entAssignUpdate(@RequestBody List<QuarantineRequestVO> quarRequestVO) {
		log.info("넘어온값 체크 : " + quarRequestVO);

		int result = 0;

		for (QuarantineRequestVO request : quarRequestVO) {
			log.info("update바꾼값 체크" + request);

			result += this.quarService.entAssignUpdate(request);
		}
		return result;
	}

	//검사검역 여부 업데이트
	@ResponseBody
	@PostMapping("/quarUpdate")
	public int qUpdate(@RequestBody QuarantineItemVO quarantineItemVO) {
		// log.info("없데이트값 체크 : "+quarantineItemVO);

		int result = this.quarService.getQuarUpdate(quarantineItemVO);

		return result;
	}
	
	// 통관 진행상태 업데이트
	@ResponseBody
	@PostMapping("/quarStuUpdate")
	public int qStuUpdate(@RequestBody QuarantineItemVO quarantineItemVO) {
		// log.info("없데이트값 체크 : "+quarantineItemVO);

		int result = this.quarService.quarStuUpdate(quarantineItemVO);

		return result;
	}

	// 검역 전표
	@ResponseBody
	@PostMapping("/quarChitPaper")
	public List<QuarantineRequestVO> chitPaper(@RequestBody QuarantineRequestVO quarantineRequestVO) {
		List<QuarantineRequestVO> quarReVO = this.quarService.getChitPaper(quarantineRequestVO);

		return quarReVO;
	}

	// 검역 결과서
	@ResponseBody
	@PostMapping("/getQuarPaper")
	public List<QuarantineItemVO> quarPaperList(@RequestBody QuarantineItemVO quarantineItemVO) {
		List<QuarantineItemVO> quarPaperVO = this.quarService.getQuarPaper(quarantineItemVO);

		log.info("결과서 데이터 확인:" + quarPaperVO);

		return quarPaperVO;
	}

}
