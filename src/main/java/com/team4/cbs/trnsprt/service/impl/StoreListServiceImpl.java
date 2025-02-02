package com.team4.cbs.trnsprt.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team4.cbs.common.vo.EntryProcessStatusVO;
import com.team4.cbs.cstbrkr.vo.EntryThingVO;
import com.team4.cbs.trnsprt.mapper.StoreListMapper;
import com.team4.cbs.trnsprt.service.StoreListService;
import com.team4.cbs.trnsprt.vo.IcCardVO;
import com.team4.cbs.trnsprt.vo.StoreReqVO;
import com.team4.cbs.trnsprt.vo.VehiclesDiaryVO;

@Service
public class StoreListServiceImpl implements StoreListService {
	
	@Autowired
	StoreListMapper storeListMapper;
	

// 통관 + 통관 물품 + 통관 상태 테이블 SELECT 컨트롤러  시작 ///////
	@Override
	public List<StoreReqVO> storeReqList(Map<String, Object> map) {
		return storeListMapper.storeReqList(map);
	}
// 통관 + 통관 물품 + 통관 상태 테이블 SELECT 컨트롤러  끝 ///////

// 입고 요청 목록 -> 운송 일지 등록 -> 입고완료 처리 Insert 메소드
	@Override
	public int insertVD(VehiclesDiaryVO vehiclesDiaryVO) {
		return storeListMapper.insertVD(vehiclesDiaryVO);
	}
	
// 입고요청 목록 -> 통관 물품 상세 보기 메소드
	@Override
	public List<EntryThingVO> selET(Map<String, Object> map) {
		return storeListMapper.selET(map);
	}

// 입고 완료 처리 인서트 메소드
	@Override
	public int insertEntryStat(EntryProcessStatusVO entryProcessStatusVO) {
		return storeListMapper.insertEntryStat(entryProcessStatusVO);
	}
	
//	입고완료된 목록 SELECT 메소드  시작 ////////////////////////////////
	@Override
	public List<StoreReqVO> finishReqList(Map<String, Object> map) {
		return storeListMapper.finishReqList(map);
	}

// 사용 보세창고 입고 일자 메소드
	@Override
	public int updStoreDe(Map<String, Object> map) {
		return storeListMapper.updStoreDe(map);
	}



}
