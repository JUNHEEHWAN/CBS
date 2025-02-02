package com.team4.cbs.trnsprt.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team4.cbs.trnsprt.mapper.ShipDiaryMapper;
import com.team4.cbs.trnsprt.service.ShipDiaryService;
import com.team4.cbs.trnsprt.vo.DiaryShipInfoVO;
import com.team4.cbs.trnsprt.vo.IcCardVO;
import com.team4.cbs.trnsprt.vo.ShipContainerVO;
import com.team4.cbs.trnsprt.vo.ShipDiaryDetailVO;
import com.team4.cbs.trnsprt.vo.ShipDiaryVO;
import com.team4.cbs.trnsprt.vo.VehiclesDiaryVO;

@Service
public class ShipDiaryServiceImpl implements ShipDiaryService {

	@Autowired
	ShipDiaryMapper shipDiaryMapper;
	
// 선박 운항일지 리스트 SELECT 메소드
	@Override
	public List<ShipDiaryVO> SelShipDiary(Map<String, Object> map) {
		return shipDiaryMapper.SelShipDiary(map);
	}

// 차량선박 일지 리스트 SELECT 메소드
	@Override
	public List<VehiclesDiaryVO> selectVD(Map<String, Object> map) {
		return shipDiaryMapper.selectVD(map);
	}

// IC카드 상세정보 SELECT메소드
	@Override
	public IcCardVO icInfoSel(Map<String, Object> map) {
		return shipDiaryMapper.icInfoSel(map);
	}
	
// IMO 상세정보 SELECT메소드
	@Override
	public ShipDiaryDetailVO shipInfoSel(Map<String, Object> map) {
		return shipDiaryMapper.shipInfoSel(map);
	}

// IMO번호별 컨테이너 정보 리스트 SELECT조회
	@Override
	public List<ShipContainerVO> selShipContain(Map<String, Object> map) {
		return shipDiaryMapper.selShipContain(map);
	}

//	선박 일지 등록 메소드
	@Override
	public int insertSD(ShipDiaryVO shipDiaryVO) {
		return shipDiaryMapper.insertSD(shipDiaryVO);
	}

// 	선박 운항 일지 등록시 필요 정보 SELECT메소드
	@Override
	public List<DiaryShipInfoVO> shipInfo(Map<String, Object> sdMap) {
		return shipDiaryMapper.shipInfo(sdMap);
	}


}
