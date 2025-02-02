package com.team4.cbs.trnsprt.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.team4.cbs.trnsprt.vo.ShipInfomationVO;
import com.team4.cbs.trnsprt.vo.TrnsprtCompanyVO;
import com.team4.cbs.trnsprt.vo.VehiclesInformationVO;

@Mapper
public interface TrnsprtMapper {
	
	// 운송회사 전체 목록 조회
	List<TrnsprtCompanyVO> getList(Map<String, Object> map);

	// 선박조회
	List<ShipInfomationVO> getShip(Map<String, Object> map);
	
	// 차량 조회
	List<VehiclesInformationVO> getVehi(Map<String, Object> map);

	// 페이징 처리를 위해 전체 행갯수 가져오기
	int getTotal(Map<String, Object> map);
	
	// 총 선박수 가져오기
	int getTotalShip(Map<String, Object> map);

}
