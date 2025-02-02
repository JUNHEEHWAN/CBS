package com.team4.cbs.trnsprt.service;

import java.util.List;
import java.util.Map;

import com.team4.cbs.trnsprt.vo.IcCardVO;
import com.team4.cbs.trnsprt.vo.TrnsprtCompanyVO;
import com.team4.cbs.trnsprt.vo.VehiclesDriverVO;
import com.team4.cbs.trnsprt.vo.VehiclesInformationVO;

public interface IcCardService {

// IC카드 인서드 메소드
	int insertIcCard(IcCardVO icCardVO);

// IC카드 SELECT 메소드
	List<IcCardVO> selectIcCard(Map<String, Object> map);

// 차량 정보 SEL메소드
	List<VehiclesInformationVO> selVehiInfo(Map<String, Object> map);

// 운전자 정보 SEL메소드
	List<VehiclesDriverVO> selDiriverInfo(Map<String, Object> map);

// 회사 정보 SEL메소드
	List<TrnsprtCompanyVO> selComInfo(Map<String, Object> map);

	List<Map<String, Object>> selVehiDriver(String cmpnyCd);

}
