package com.team4.cbs.trnsprt.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.team4.cbs.trnsprt.service.TrnsprtService;
import com.team4.cbs.trnsprt.vo.ShipInfomationVO;
import com.team4.cbs.trnsprt.vo.TrnsprtCompanyVO;
import com.team4.cbs.trnsprt.vo.VehiclesInformationVO;
import com.team4.cbs.util.ArticlePage;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/cbs/trnsprt")
public class CompanyController {
	
	@Autowired
	TrnsprtService trnsprtService;

// 운송 메인 페이직 시작
	@GetMapping("/trnsprtHome")
	public String trnsprtHome() {
	   return "trnsprt/trnsprtHome";
	} 
	
// 운송 회사 관리 페이지 
	@GetMapping("/company")
	public String company(Model model) {
		return "trnsprt/company/list";
	}
	
// 운송회사 전체 목록
	@ResponseBody
	@PostMapping("/trnsCompany")
	public List<TrnsprtCompanyVO> getList(@RequestBody(required=false) Map<String,Object> map) {
		log.info("map 체크 : "+map);
		
		List<TrnsprtCompanyVO> trnsList = this.trnsprtService.getList(map);
		log.info("trnsList 체크 : "+trnsList);
		
		return trnsList;
	}
	
// 회사 코드별 선박 목록
	@ResponseBody
	@PostMapping("/shiplist")
	public List<ShipInfomationVO> getShip(@RequestBody(required=false) Map<String,Object> map){
		log.info("검색후 넘어온값 체크 : " + map);
		
		List<ShipInfomationVO> shipList = trnsprtService.getShip(map);
		log.info("선박 조회 체크:"+shipList);
		
		return shipList;
	}

// 회사 코드별 차량 목록
	@ResponseBody
	@PostMapping("/vehilist")
	public List<VehiclesInformationVO> getVehi(@RequestBody(required=false) Map<String,Object> map){
		log.info("넘어온값 체크 : " + map);
		
		List<VehiclesInformationVO> vehiList = this.trnsprtService.getVehi(map);
		log.info("차량 조회 체크:"+vehiList);
		
		return vehiList;
	}

// 회사 등록 메소드
	@ResponseBody
	@PostMapping("/insertCom")
	public int insertCompany(@RequestBody TrnsprtCompanyVO companyVO) {
		log.info("넘어온 값 체크 :{}",companyVO );
		return 1;
	}
}
