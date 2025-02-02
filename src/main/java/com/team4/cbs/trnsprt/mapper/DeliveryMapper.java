package com.team4.cbs.trnsprt.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.team4.cbs.common.vo.EntryProcessStatusVO;
import com.team4.cbs.trnsprt.vo.DeliveryReqVO;
import com.team4.cbs.trnsprt.vo.VehiclesDiaryVO;

@Mapper
public interface DeliveryMapper {

// 출고 요청 SELECT 메소드
	List<DeliveryReqVO> selectDel(Map<String, Object> map);

// 출고 완료 SELECT 메소드
	List<DeliveryReqVO> selectDelFini(Map<String, Object> map);

// 운송 일지 Insert 메소드
	int insertDelVD(VehiclesDiaryVO vehiclesDiaryVO);

// 출고 완료 상태 Insert메소드 
	int insDelEntryStat(EntryProcessStatusVO entryProcessStatusVO);

	int updDeliDe(Map<String, Object> map);

}
