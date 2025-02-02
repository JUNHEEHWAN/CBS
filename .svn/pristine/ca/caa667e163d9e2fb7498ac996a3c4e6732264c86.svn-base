package com.team4.cbs.main.declaration.service;

import java.util.List;
import java.util.Map;

import com.team4.cbs.common.vo.UserVO;
import com.team4.cbs.main.declaration.vo.TransportChitVO;
import com.team4.cbs.main.declaration.vo.TransportDeclarationVO;
import com.team4.cbs.trnsprt.vo.VehiclesDiaryVO;

public interface TransDeclrationService {

// 운송 필증 인서트를 위한 메소드
	int insTrnDecl(TransportDeclarationVO tdVO);

// 유저 정보 SELECT 메소드
	UserVO selUserInfo(Map<String, Object> map);

// 보세 운송 일지 SELECT 메소드
	VehiclesDiaryVO selVehiInfo(Map<String, Object> map);

// 운송 신고서 필요 정보 SELECT 메소드
	List<TransportDeclarationVO> selVehiDecl(Map<String, Object> map);

// 운송 전표 SELECT전표 메소드
	TransportChitVO selTranChit(Map<String, Object> map);

// 보세운송필증 제출상태 2업데이트
	int updtranDecl(Map<String, Object> map);

}
