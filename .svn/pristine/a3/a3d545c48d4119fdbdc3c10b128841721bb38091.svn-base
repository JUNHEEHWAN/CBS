package com.team4.cbs.main.declaration.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team4.cbs.common.vo.UserVO;
import com.team4.cbs.main.declaration.mapper.TransDeclrationMapper;
import com.team4.cbs.main.declaration.service.TransDeclrationService;
import com.team4.cbs.main.declaration.vo.TransportChitVO;
import com.team4.cbs.main.declaration.vo.TransportDeclarationVO;
import com.team4.cbs.trnsprt.vo.VehiclesDiaryVO;

@Service
public class TransDeclrationServiceImpl implements TransDeclrationService {
	
	@Autowired
	TransDeclrationMapper tdMapper;
	
// 운송 필증 인서트를 위한 메소드
	@Override
	public int insTrnDecl(TransportDeclarationVO tdVO) {
		return tdMapper.insTrnDecl(tdVO);
	}

// 유저 정보 SELECT 메소드
	@Override
	public UserVO selUserInfo(Map<String, Object> map) {
		return tdMapper.selUserInfo(map);
	}

// 보세 운송 일지 SELECT 메소드
	@Override
	public VehiclesDiaryVO selVehiInfo(Map<String, Object> map) {
		return tdMapper.selVehiInfo(map);
	}

// 운송 신고서 필요 정보 SELECT 메소드
	@Override
	public List<TransportDeclarationVO> selVehiDecl(Map<String, Object> map) {
		return tdMapper.selVehiDecl(map);
	}

// 운송 전표 SELECT전표 메소드
	@Override
	public TransportChitVO selTranChit(Map<String, Object> map) {
		return tdMapper.selTranChit(map);
	}

// 보세운송필증 제출상태 2업데이트
	@Override
	public int updtranDecl(Map<String, Object> map) {
		return tdMapper.updtranDecl(map);
	}

}
