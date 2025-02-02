package com.team4.cbs.pbsvnt.bounded.service;

import java.util.List;

import com.team4.cbs.pbsvnt.bounded.vo.BoundedReqVO;
import com.team4.cbs.pbsvnt.bounded.vo.BoundedWarehouseVO;
import com.team4.cbs.pbsvnt.bounded.vo.UseBoundedWarehouseVO;

public interface BoundedService {
	public List<BoundedReqVO> getReqList(); 			 				// 입고 요청 목록
	public int insUseBounded(BoundedReqVO boundedReqVO);				// 입고 등록 (사용 보세 창고 TABLE INSERT)
	public List<BoundedWarehouseVO> getZone();				    		// 창고 구역 불러오기
	public List<BoundedWarehouseVO> getNo();							// 창고 번호 불러오기
	public List<UseBoundedWarehouseVO> useBoundedList(String bndwasCd); // 창고 구역 선택 후 목록
}
