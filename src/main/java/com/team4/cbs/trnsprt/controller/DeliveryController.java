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
import com.team4.cbs.trnsprt.service.DeliveryService;
import com.team4.cbs.trnsprt.vo.DeliveryReqVO;
import com.team4.cbs.trnsprt.vo.StoreReqVO;
import com.team4.cbs.trnsprt.vo.VehiclesDiaryVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/cbs/trnsprt")
public class DeliveryController {

	@Autowired
	DeliveryService deliveryService;
	
// 출고 요청 목록 화면 jsp 호출 메소드
	@GetMapping("/delivery")
	public String deliveryReq() {
		return "trnsprt/delivery/list";
	}
	
	
	// 수출승인 신청서 http://localhost/cbs/trnsprt/exportion
	@GetMapping("/exportion")
	public String exportion() {
		return "main/exportLicense";
	}

	// 출고 요청 목록 SELECT 메소드
	@ResponseBody
	@PostMapping("/selectDdel")
	public List<DeliveryReqVO> selectDel(@RequestBody(required = false) Map<String, Object> map){
		log.info("출고요청 목록 검색 조건으로 넘어온 값 : "+map);
		
		List<DeliveryReqVO> delReqList = deliveryService.selectDel(map);
		log.info("출고 요청 목록 결과값으로 받은 값 : " + delReqList);
		return delReqList;
	}

// 출고 완료 목록 SELECT 메소드
	@ResponseBody
	@PostMapping("/selectDelFini")
	public List<DeliveryReqVO> selectDelFini(@RequestBody(required = false) Map<String, Object> map){
		log.info("출고요청 목록 검색 조건으로 넘어온 값 : "+map);
		
		List<DeliveryReqVO> delFinList = deliveryService.selectDelFini(map);
		log.info("출고 요청 목록 결과값으로 받은 값 : " + delFinList);
		return delFinList;
	}
	
	@ResponseBody
	@PostMapping("/insertDelVD")
	public int insertDelVD(@RequestBody VehiclesDiaryVO vehiclesDiaryVO) {
		log.info("출고jsp 에서 넘어온 값 체크 : "+vehiclesDiaryVO);
		
		int result = deliveryService.insertDelVD(vehiclesDiaryVO);
		
		return result;
	}
	
	@ResponseBody
	@PutMapping("/updDeliDe")
	public int updDeliDe(@RequestBody Map<String, Object> map) {
		log.info("출고 시작 일자 업데이트 처리 위해 넘어온값 : "+map);
	
		int result = deliveryService.updDeliDe(map);
		
		return result;
	}
	
	@ResponseBody
	@PostMapping("/insDelEntryStat")
	public int insDelEntryStat(@RequestBody EntryProcessStatusVO entryProcessStatusVO) {
		log.info("출고jsp에서 통관처리 상태를 위해 넘어온값 : "+entryProcessStatusVO);
		
		int result = deliveryService.insDelEntryStat(entryProcessStatusVO);
		
		return result;
	}
	
}
