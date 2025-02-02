package com.team4.cbs.trnsprt.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.team4.cbs.common.vo.EntryProcessStatusVO;
import com.team4.cbs.cstbrkr.vo.EntryThingVO;
import com.team4.cbs.trnsprt.service.StoreListService;
import com.team4.cbs.trnsprt.vo.StoreReqVO;
import com.team4.cbs.trnsprt.vo.VehiclesDiaryVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/cbs/trnsprt")
public class StoreListController {
	
	@Autowired
	StoreListService storeListService;
	
	@GetMapping("/store")
	public String Card() {
		
		return "trnsprt/store/list";
	}

// 통관 + 통관 물품 + 통관 상태 테이블 SELECT 컨트롤러  시작 ///////
	@ResponseBody
	@PostMapping("/storeReq")
	public List<StoreReqVO> storeReqList(@RequestBody(required = false) Map<String, Object> map){
		//log.info("운송일지 넘어온값 체크 : " + map);

		List<StoreReqVO> list = storeListService.storeReqList(map);
		log.info("쿼리후 넘어온값 체크 : " + list);
		
		return list;
	}
// 통관 + 통관 물품 + 통관 상태 테이블 SELECT 컨트롤러 끝 ///////

// 입고완료된 목록 SELECT 메소드  시작 ////////////////////////////////
	@ResponseBody
	@PostMapping("/finishReq")
	public List<StoreReqVO> finishReq(@RequestBody(required = false) Map<String, Object> map){
		//log.info("운송일지 넘어온값 체크 : " + map);
		
		List<StoreReqVO> FRlist = storeListService.finishReqList(map);
		//log.info("쿼리후 넘어온값 체크 : " + FRlist);
		
		return FRlist;
	}
// 입고완료된 목록 SELECT 메소드  끝 ////////////////////////////////
	
// 입고요청 목록 -> 통관 물품 상세 보기 메소드
	@ResponseBody
	@PostMapping("/selET")
	public List<EntryThingVO> selET(@RequestBody Map<String, Object> map){
		log.info("ET값 sel 위해 넘어온 값 체크 : "+map);
		
		List<EntryThingVO> ETList = storeListService.selET(map);
		log.info("ET값 sel후 넘어온 값 체크 : "+map);
		
		return ETList;
	}
	
// 입고 요청 목록 -> 운송 일지 등록 -> 입고완료 처리 Insert 메소드
	@ResponseBody
	@PostMapping("/insertVD")
	public int insertVD(@RequestBody VehiclesDiaryVO vehiclesDiaryVO) {
		//log.info("운송 일지 넘어온값 체크 : "+vehiclesDiaryVO);
		
		int result = storeListService.insertVD(vehiclesDiaryVO);
		
		return result;
	}

// 운송 일지 인서트후 사용 보세창고에 입고일자 업데이트 메소드
	@ResponseBody
	@PutMapping("/updStoreDe")
	public int updStoreDe(@RequestBody Map<String, Object> map) {
		log.info("넘어온 입고 일자 확인 : "+map);
		
		int result = storeListService.updStoreDe(map);
		
		return result;
	}
	
// 입고 완료 처리 인서트 메소드
	@ResponseBody
	@PostMapping("/insertEntryStat")
	public int insertEntryStat(@RequestBody EntryProcessStatusVO entryProcessStatusVO) {
		log.info("입고완료 처리시 넘어온값 : "+entryProcessStatusVO);
		
		
		int result = storeListService.insertEntryStat(entryProcessStatusVO);
				
		return result;
	}
}
