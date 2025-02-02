package com.team4.cbs.trnsprt.service;

import java.util.List;
import java.util.Map;

import com.team4.cbs.trnsprt.vo.ShipInfomationVO;
import com.team4.cbs.trnsprt.vo.TrnsprtCompanyVO;
import com.team4.cbs.trnsprt.vo.VehiclesInformationVO;

public interface TrnsprtService {
	
	// 운송회사 전체 목록 조회
	public List<TrnsprtCompanyVO> getList(Map<String, Object> map);
	
	// 선박조회
	public List<ShipInfomationVO> getShip(Map<String, Object> map);
	
	// 차량 조회
	public List<VehiclesInformationVO> getVehi(Map<String, Object> map);

	// 페이징 처리를 위해 전체 행갯수 가져오기 
	public int getTotal(Map<String, Object> map);

	public int getTotalShip(Map<String, Object> map);


}
