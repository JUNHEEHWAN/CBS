package com.team4.cbs.trnsprt.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.team4.cbs.trnsprt.vo.IcCardVO;
import com.team4.cbs.trnsprt.vo.TrnsprtCompanyVO;
import com.team4.cbs.trnsprt.vo.VehiclesDriverVO;
import com.team4.cbs.trnsprt.vo.VehiclesInformationVO;

@Mapper
public interface IcCardMapper {

// IC카드 인서트 메소드
	int insertIcCard(IcCardVO icCardVO);
	
// IC카드 SELECT 메소드
	List<IcCardVO> selectIcCard(Map<String, Object> map);

// 차량 정보 SEl메소드
	List<VehiclesInformationVO> selVehiInfo(Map<String, Object> map);

// 운전자 정보 SEl메소드
	List<VehiclesDriverVO> selDiriverInfo(Map<String, Object> map);

// 회사 정보 SEL메소드
	List<TrnsprtCompanyVO> selComInfo(Map<String, Object> map);

	List<VehiclesInformationVO> selVehiInfoDetail(String cmpnyCd);

	List<VehiclesDriverVO> selVehiDriverDetail(String cmpnyCd);

}
