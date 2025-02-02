package com.team4.cbs.trnsprt.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.team4.cbs.trnsprt.service.ShipDiaryService;
import com.team4.cbs.trnsprt.vo.DiaryShipInfoVO;
import com.team4.cbs.trnsprt.vo.IcCardVO;
import com.team4.cbs.trnsprt.vo.ShipContainerVO;
import com.team4.cbs.trnsprt.vo.ShipDiaryDetailVO;
import com.team4.cbs.trnsprt.vo.ShipDiaryVO;
import com.team4.cbs.trnsprt.vo.VehiclesDiaryVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/cbs/trnsprt")
public class DiaryController {
	
	@Autowired
	ShipDiaryService shipDiaryService;
	
// 관세사가 선박 일지 가져가는 메소드
	@GetMapping("/cstbrkr")
	public String cstDiary() {
		return "main/shipDiary";
	}
// 관세사가 선박 일지 + 컨테이너 가져가는 메소드
	@GetMapping("/cstbrkrContain")
	public String shipContainDiary() {
		return "main/shipContainDiary";
	}
	
// 일지 화면 호출 메소드
	@GetMapping("/diary")
	public String diary() {
		return "trnsprt/diary/list";
	}


	
// 차량 일지 리스트 SELECT 메소드
	@ResponseBody
	@PostMapping("/selectVD")
	public List<VehiclesDiaryVO> selectVD(@RequestBody(required = false) Map<String, Object> map){
		log.info("jsp에서 검색값으로 넘어온값 체크 : "+map);
		
		List<VehiclesDiaryVO> VDList = shipDiaryService.selectVD(map);
		log.info("DB에서 넘어온값 체크 : "+VDList);
		return VDList;
	}
	
// 선박 운항일지 리스트 SELECT 메소드
	@ResponseBody
	@PostMapping("/shipDiary")
	public List<ShipDiaryVO> SDlist(@RequestBody(required = false) Map<String, Object> map){
		log.info("결과값 체크 : "+map);
		
		List<ShipDiaryVO> SDlist = shipDiaryService.SelShipDiary(map);
		log.info("결과값 체크 : "+SDlist);
		
		return SDlist;
	}

// IC카드 상세정보 SELECT메소드
	@ResponseBody
	@PostMapping("/icInfoSel")
	public IcCardVO icInfoSel(@RequestBody Map<String, Object> map) {
		log.info("IC카드 상세정보 넘어온값 체크 : ",map);
		
		IcCardVO icVO = shipDiaryService.icInfoSel(map);
		
		return icVO;
	}
	
// IMO 상세정보 SELECT메소드
	@ResponseBody
	@PostMapping("/shipInfoSel")
	public ShipDiaryDetailVO shipInfoSel(@RequestBody Map<String, Object> map) {
		log.info("IMO 넘어온값 체크 : ",map);
		
		ShipDiaryDetailVO SDDVO = shipDiaryService.shipInfoSel(map);
		log.info("IMO상세정보 받아온값 체크 : "+SDDVO);
		
		return SDDVO;
	}
	
	
// IMO번호별 컨테이너 정보 리스트 SELECT조회
	@ResponseBody
	@PostMapping("/shipContain")
	public List<ShipContainerVO> selShipContain(@RequestBody(required = false) Map<String, Object> map){
		log.info("jsp에서 컨테이너 검색위해 넘어온값 체크 : "+map);
		
		List<ShipContainerVO> SCList = shipDiaryService.selShipContain(map);
		log.info("DB에서 컨테이너 넘어온값 체크 : "+SCList);
		
		return SCList;
	}
	
// 	선박 운항 일지 등록시 필요 정보 SELECT메소드
	@ResponseBody
	@PostMapping("/selectSI")
	public List<DiaryShipInfoVO> selectSI(@RequestBody(required=false) Map<String,Object> sdMap) {
		log.info("컨트롤러로 넘어온값 체크 : "+sdMap);
		
		List<DiaryShipInfoVO> sdList = shipDiaryService.shipInfo(sdMap);
		log.info("SELECT된값 체크 : "+sdList);
		
		return sdList;
	}
	
//	선박 일지 등록 메소드
	@ResponseBody
	@PostMapping("/insertSD")
	public int insertSD(@RequestBody ShipDiaryVO shipDiaryVO) {
		log.info("컨트롤러로 넘어온값 체크 : "+shipDiaryVO);
		int result = shipDiaryService.insertSD(shipDiaryVO);
		
		return result;
	}
	
}
