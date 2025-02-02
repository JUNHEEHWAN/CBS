package com.team4.cbs.trnsprt.service.impl;

import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.log;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team4.cbs.trnsprt.mapper.IcCardMapper;
import com.team4.cbs.trnsprt.service.IcCardService;
import com.team4.cbs.trnsprt.vo.IcCardVO;
import com.team4.cbs.trnsprt.vo.TrnsprtCompanyVO;
import com.team4.cbs.trnsprt.vo.VehiclesDriverVO;
import com.team4.cbs.trnsprt.vo.VehiclesInformationVO;

@Service
public class IcCardServiceImpl implements IcCardService{

	@Autowired
	IcCardMapper icCardMapper;

// IC카드 인서트 메소드
	@Override
	public int insertIcCard(IcCardVO icCardVO) {
		return icCardMapper.insertIcCard(icCardVO);
	}
	
// IC카드 SLECT 메소드
	@Override
	public List<IcCardVO> selectIcCard(Map<String, Object> map) {
		return icCardMapper.selectIcCard(map);
	}

// 차량 정보 SEL 메소드
	@Override
	public List<VehiclesInformationVO> selVehiInfo(Map<String, Object> map) {
		return icCardMapper.selVehiInfo(map);
	}

// 운전자 정보 SEL 메소드
	@Override
	public List<VehiclesDriverVO> selDiriverInfo(Map<String, Object> map) {
		return icCardMapper.selDiriverInfo(map);
	}

	@Override
	public List<TrnsprtCompanyVO> selComInfo(Map<String, Object> map) {
		return icCardMapper.selComInfo(map);
	}

	@Override
	public List<Map<String, Object>> selVehiDriver(String cmpnyCd) {
		
		List<Map<String, Object>> vehiComResponse = new ArrayList<Map<String,Object>>();
		Map<String, Object> vehiInfoMap = new HashMap<String, Object>();
		
		List<VehiclesInformationVO> vehiInfoList = icCardMapper.selVehiInfoDetail(cmpnyCd);
		vehiInfoMap.put("vehiInfoList", vehiInfoList);
		
		List<VehiclesDriverVO> vehiDriverList = icCardMapper.selVehiDriverDetail(cmpnyCd);
		vehiInfoMap.put("vehiDriverList", vehiDriverList);
		
		vehiComResponse.add(vehiInfoMap);
		
		return vehiComResponse;
	}

}
