package com.team4.cbs.trnsprt.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team4.cbs.common.vo.EntryProcessStatusVO;
import com.team4.cbs.trnsprt.mapper.DeliveryMapper;
import com.team4.cbs.trnsprt.service.DeliveryService;
import com.team4.cbs.trnsprt.vo.DeliveryReqVO;
import com.team4.cbs.trnsprt.vo.VehiclesDiaryVO;

@Service
public class DeliveryServiceImpl implements DeliveryService {
	
	@Autowired
	DeliveryMapper deliveryMapper;

// 출고 요청 목록 SELECT 메소드
	@Override
	public List<DeliveryReqVO> selectDel(Map<String, Object> map) {
		return deliveryMapper.selectDel(map);
	}

// 출고 완료 목록 SELECT 메소드
	@Override
	public List<DeliveryReqVO> selectDelFini(Map<String, Object> map) {
		return deliveryMapper.selectDelFini(map);
	}
	
// 운송 일지 Insert 메소드
	@Override
	public int insertDelVD(VehiclesDiaryVO vehiclesDiaryVO) {
		return deliveryMapper.insertDelVD(vehiclesDiaryVO);
	}

// 출고 완료 상태 Insert 메소드
	@Override
	public int insDelEntryStat(EntryProcessStatusVO entryProcessStatusVO) {
		return deliveryMapper.insDelEntryStat(entryProcessStatusVO);
	}

	@Override
	public int updDeliDe(Map<String, Object> map) {
		return deliveryMapper.updDeliDe(map);
	}
	
}
