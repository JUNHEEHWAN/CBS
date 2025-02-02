package com.team4.cbs.trnsprt.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.team4.cbs.trnsprt.vo.DiaryShipInfoVO;
import com.team4.cbs.trnsprt.vo.IcCardVO;
import com.team4.cbs.trnsprt.vo.ShipContainerVO;
import com.team4.cbs.trnsprt.vo.ShipDiaryDetailVO;
import com.team4.cbs.trnsprt.vo.ShipDiaryVO;
import com.team4.cbs.trnsprt.vo.VehiclesDiaryVO;

@Mapper
public interface ShipDiaryMapper {

// 선박 운항일지 리스트 SELECT 메소드
	List<ShipDiaryVO> SelShipDiary(Map<String, Object> map);

// 차량일지 리스트 SELECT 메소드
	List<VehiclesDiaryVO> selectVD(Map<String, Object> map);

// IC카드 상세정보 SELECT메소드
	IcCardVO icInfoSel(Map<String, Object> map);

// IMO 상세정보 SELECT메소드
	ShipDiaryDetailVO shipInfoSel(Map<String, Object> map);

// IMO번호별 컨테이너 정보 리스트 SELECT조회
	List<ShipContainerVO> selShipContain(Map<String, Object> map);

//	선박 일지 등록 메소드
	int insertSD(ShipDiaryVO shipDiaryVO);

// 	선박 운항 일지 등록시 필요 정보 SELECT메소드
	List<DiaryShipInfoVO> shipInfo(Map<String, Object> sdMap);
}
