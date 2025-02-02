package com.team4.cbs.trnsprt.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team4.cbs.trnsprt.mapper.TrnsprtMapper;
import com.team4.cbs.trnsprt.service.TrnsprtService;
import com.team4.cbs.trnsprt.vo.ShipInfomationVO;
import com.team4.cbs.trnsprt.vo.TrnsprtCompanyVO;
import com.team4.cbs.trnsprt.vo.VehiclesInformationVO;

@Service
public class TrnsprtServiceImpl implements TrnsprtService {
	
	@Autowired
	TrnsprtMapper trnsprtMapper;
	
	@Override
	public List<TrnsprtCompanyVO> getList(Map<String, Object> map) {
		return trnsprtMapper.getList(map);
	}

	@Override
	public List<ShipInfomationVO> getShip(Map<String, Object> map) {
		return trnsprtMapper.getShip(map);
	}
	
	@Override
	public List<VehiclesInformationVO> getVehi(Map<String, Object> map) {
		return trnsprtMapper.getVehi(map);
	}
	
	// 페이징 처리를 위해 전체 행갯수 가져오기
	@Override
	public int getTotal(Map<String, Object> map) {
		return trnsprtMapper.getTotal(map);
	}

	@Override
	public int getTotalShip(Map<String, Object> map) {
		return trnsprtMapper.getTotalShip(map);
	}


}
