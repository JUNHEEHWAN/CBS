package com.team4.cbs.trnsprt.service;

import java.util.List;
import java.util.Map;

import com.team4.cbs.common.vo.EntryProcessStatusVO;
import com.team4.cbs.cstbrkr.vo.EntryThingVO;
import com.team4.cbs.trnsprt.vo.IcCardVO;
import com.team4.cbs.trnsprt.vo.StoreReqVO;
import com.team4.cbs.trnsprt.vo.VehiclesDiaryVO;

public interface StoreListService {

	
// 통관 + 통관 물품 + 통관 상태 테이블 SELECT 컨트롤러  시작 ///////
	List<StoreReqVO> storeReqList(Map<String, Object> map);
// 통관 + 통관 물품 + 통관 상태 테이블 SELECT 컨트롤러  끝 ///////

// 입고 요청 목록 -> 운송 일지 등록 -> 입고완료 처리 Insert 메소드
	int insertVD(VehiclesDiaryVO vehiclesDiaryVO);

// 입고 완료 처리 인서트 메소드
	int insertEntryStat(EntryProcessStatusVO entryProcessStatusVO);

//	입고완료된 목록 SELECT 메소드  시작 ////////////////////////////////
	List<StoreReqVO> finishReqList(Map<String, Object> map);

// 사용 보세창고 입고 일자 업데이트 메소드
	int updStoreDe(Map<String, Object> map);

// 입고요청 목록 -> 통관 물품 상세 보기 메소드
	List<EntryThingVO> selET(Map<String, Object> map);
	
}
