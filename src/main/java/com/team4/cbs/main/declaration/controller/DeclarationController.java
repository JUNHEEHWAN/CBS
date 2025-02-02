package com.team4.cbs.main.declaration.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.team4.cbs.common.vo.UserVO;
import com.team4.cbs.main.declaration.service.TransDeclrationService;
import com.team4.cbs.main.declaration.vo.TransportChitVO;
import com.team4.cbs.main.declaration.vo.TransportDeclarationVO;
import com.team4.cbs.trnsprt.vo.VehiclesDiaryVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/cbs/declaration")
public class DeclarationController {

	@Autowired
	TransDeclrationService tdService;
	
// 보세운송 필증 테이블 인서트 메소드
	@ResponseBody
	@PostMapping("/insTrnDecl")
	public int insTrnDecl(@RequestBody TransportDeclarationVO tdVO) {
		log.info("보세운송필증을위해 insert한 값 : "+tdVO);
		
		int result = tdService.insTrnDecl(tdVO);
		
		return result;
	}
// 유저정보 셀렉트 메소드	
	@ResponseBody
	@PostMapping("/selUserInfo")
	public UserVO selUserInfo(@RequestBody Map<String, Object> map) {
		log.info("유저 정보를 위해 받은값 : "+map);
		UserVO userVO = tdService.selUserInfo(map);
		return userVO;
	}
	
// 보세운송 일지 셀렉트 메소드
	@ResponseBody
	@PostMapping("/selVehiInfo")
	public VehiclesDiaryVO selVehiInfo(@RequestBody Map<String, Object> map) {
		log.info("유저 정보를 위해 받은값 : "+map);
		VehiclesDiaryVO vdVO = tdService.selVehiInfo(map);
		return vdVO;
	}

// 운송 신고서 필요 정보 SELECT 메소드
	  @ResponseBody
	  @PostMapping("/selVehiDecl") 
	  public List<TransportDeclarationVO> selVehiDecl(@RequestBody Map<String, Object> map) { 
		  log.info("운송 신고서 위해 받은 값 : "+map);
		  
		  List<TransportDeclarationVO> TDlist = tdService.selVehiDecl(map);
		  log.info("DB운송 신고서 받은 값 : "+TDlist); 
		  
		  return TDlist; 
	  }

// 운송 전표 SELECT전표 메소드
	  @ResponseBody
	  @PostMapping("/transChit")
	  public TransportChitVO transChit(@RequestBody Map<String, Object> map) {
		  log.info("전표 SELECT을 위해 받은 Map : " + map);
		  
		  TransportChitVO tcVO = tdService.selTranChit(map);
		  log.info("SELECT후 받은 값 체크 : " + tcVO);
		  
		  return tcVO;
	  }

// 보세운송필증 제출상태 2업데이트
	  @ResponseBody
	  @PostMapping("/updtranDecl")
	  public int updtranDecl(@RequestBody Map<String, Object> map) {
		  log.debug("[updtranDecl값 체크 ],{}" + map);
		  
		  int result = tdService.updtranDecl(map);
		  
		  return result;
	  }
}
