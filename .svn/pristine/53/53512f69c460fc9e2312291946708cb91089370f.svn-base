package com.team4.cbs.main.service.impl;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.team4.cbs.main.mapper.ScheduleMapper;
import com.team4.cbs.main.service.ScheduleService;
import com.team4.cbs.main.vo.ScheduleVO;


@Service
public class ScheduleServiceImpl implements ScheduleService {

	// DI(의존성  주입)
	@Inject
	private ScheduleMapper scheduleMapper;
	
	// 입력
	@Override
	public int insert(ScheduleVO schedule) {
		return this.scheduleMapper.insert(schedule);
	}

	@Override
	public List<ScheduleVO> findAll(String id) {
		
		return this.scheduleMapper.findAll(id);
	}

	@Override
	public int delete(String startDate) {
		
		return this.scheduleMapper.delete(startDate);
	}

	@Override
	public int update(ScheduleVO scheduleVO) {
		
		return this.scheduleMapper.update(scheduleVO);
	}

}
