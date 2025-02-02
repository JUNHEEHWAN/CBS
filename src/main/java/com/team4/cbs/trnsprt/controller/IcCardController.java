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

import com.team4.cbs.trnsprt.service.IcCardService;
import com.team4.cbs.trnsprt.vo.IcCardVO;
import com.team4.cbs.trnsprt.vo.TrnsprtCompanyVO;
import com.team4.cbs.trnsprt.vo.VehiclesDriverVO;
import com.team4.cbs.trnsprt.vo.VehiclesInformationVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/cbs/trnsprt")
public class IcCardController {

	@Autowired
	IcCardService icCardService;
	
	@GetMapping("/createIc")
	public String createIc() {
		return "trnsprt/diary/createIC";
	}
	
// 차량 정보 SEL메소드 시작 /////////////
	@ResponseBody
	@PostMapping("/selVehiInfo")
	public List<VehiclesInformationVO> selVehiInfo(@RequestBody(required = false) Map<String, Object> map){
		log.debug("[selVehiInfo] 차량정보 SEL위해 받은 검색 값 {}" + map);
		
		List<VehiclesInformationVO> VIlist = icCardService.selVehiInfo(map);
		log.debug("[selVehiInfo] 차량정보 SEL후 받은값 {}" + VIlist);
		
		return VIlist;
	}

// 운전자 정보 SEL메소드 시작 /////////////
	@ResponseBody
	@PostMapping("/selDiriverInfo")
	public List<VehiclesDriverVO> selDiriverInfo(@RequestBody(required = false) Map<String, Object> map){
		log.debug("[selDiriverInfo] 차량정보 SEL위해 받은 검색 값 {}" + map);
		
		List<VehiclesDriverVO> DriverList = icCardService.selDiriverInfo(map);
		log.debug("[selDiriverInfo] 차량정보 SEL후 받은값 {}" + DriverList);
		
		return DriverList;
	}
	
// 회사 정보 SEL메소드 시작////
	@ResponseBody
	@PostMapping("/selComInfo")
	public List<TrnsprtCompanyVO> selComInfo(@RequestBody(required = false) Map<String, Object> map){
		log.debug("[selComInfo] 회사정보 SEL을 위해 받은 검색 값 {}" + map);
		
		List<TrnsprtCompanyVO> TCList = icCardService.selComInfo(map);
		log.debug("[selComInfo] 회사정보 SEL후 받은값 " + TCList);
		
		return TCList;
	}

// 회사 코드로 차량, 운전자 정보 SEl메소드
	@ResponseBody
	@PostMapping("/selVehiDriver")
	public List<Map<String, Object>> selVehiDriver(@RequestBody String cmpnyCd){
		log.debug("[selVehiDriver] 차량,운전자 정보 SEL을 위해 받은 검색 값 {}" + cmpnyCd);
		
		List<Map<String, Object>> totalSel = icCardService.selVehiDriver(cmpnyCd);
		log.debug("[selVehiDriver] 회사정보 SEL후 받은값 " + totalSel);
		
		return totalSel;
	}
	
//	IC카드 인서트 메소드 시작 //////////////////////
	@ResponseBody
	@PostMapping("/insertIcCard")
	public int insertIcCard(@RequestBody IcCardVO icCardVO) {
		log.info("IC카드 인서트 jsp에서 넘긴값 체크 : "+icCardVO);
		
		int result = icCardService.insertIcCard(icCardVO);
		
		return result;
	}
//	IC카드 인서트 메소드 끝 //////////////////////	

//  IC카드 SELECT 메소드 시작 ////////////////////
	@ResponseBody
	@PostMapping("/selectIcCard")
	public List<IcCardVO> selectIcCard(@RequestBody(required = false)Map<String, Object> map){
		log.info("넘겨받은 검색조건 값 : "+map);
		
		List<IcCardVO> list = icCardService.selectIcCard(map);
		
		return list;
	}
	
//  IC카드 SELECT 메소드 끝 ////////////////////
}
