package com.team4.cbs.trnsprt.service;

import java.util.List;
import java.util.Map;

import com.team4.cbs.common.vo.EntryProcessStatusVO;
import com.team4.cbs.trnsprt.vo.DeliveryReqVO;
import com.team4.cbs.trnsprt.vo.VehiclesDiaryVO;

public interface DeliveryService {

// 출고 요청 목록 SELECT 메소드
	List<DeliveryReqVO> selectDel(Map<String, Object> map);

// 출고 완료 목록 SELECT 메소드
	List<DeliveryReqVO> selectDelFini(Map<String, Object> map);

// 운송 일지 Insert메소드(출고 요청 관련)
	int insertDelVD(VehiclesDiaryVO vehiclesDiaryVO);

// 출고 완료 상태 Insert메소드
	int insDelEntryStat(EntryProcessStatusVO entryProcessStatusVO);

	int updDeliDe(Map<String, Object> map);

}
