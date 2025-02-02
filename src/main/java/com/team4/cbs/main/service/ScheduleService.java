package com.team4.cbs.main.service;

import java.util.List;

import com.team4.cbs.main.vo.ScheduleVO;


public interface ScheduleService {
	// 저장
	public int insert(ScheduleVO schedule);

	// DB에 저장되어 있는 스케쥴 가지고오기
	public List<ScheduleVO> findAll(String id);

	// 스케쥴 삭제하기
	public int delete(String startDate);
	
	// 스케쥴 수정하기
	public int update(ScheduleVO scheduleVO);
}
