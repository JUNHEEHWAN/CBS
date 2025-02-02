package com.team4.cbs.pbsvnt.bounded.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team4.cbs.pbsvnt.bounded.mapper.BoundedMapper;
import com.team4.cbs.pbsvnt.bounded.service.BoundedService;
import com.team4.cbs.pbsvnt.bounded.vo.BoundedReqVO;
import com.team4.cbs.pbsvnt.bounded.vo.BoundedWarehouseVO;
import com.team4.cbs.pbsvnt.bounded.vo.UseBoundedWarehouseVO;

@Service
public class BoundedServiceImpl implements BoundedService {
	
	@Autowired
	BoundedMapper boundedMapper;
	
	@Override
	public List<BoundedReqVO> getReqList() { // 입고 요청 모록
		return this.boundedMapper.getReqList();
	}

	@Override
	public int insUseBounded(BoundedReqVO boundedReqVO) { // 입고 등록 (사용 보세 창고 TABLE INSERT)
		return this.boundedMapper.insUseBounded(boundedReqVO);
	}

	@Override
	public List<BoundedWarehouseVO> getZone() { // 창고 구역 불러오기
		return this.boundedMapper.getZone();
	}
	
	@Override
	public List<BoundedWarehouseVO> getNo() { // 창고 번호 불러오기
		return this.boundedMapper.getNo();
	}
	
	@Override
	public List<UseBoundedWarehouseVO> useBoundedList(String bndwasCd) { // 창고 구역 선택 후 목록
		return this.boundedMapper.useBoundedList(bndwasCd);
	}

}
