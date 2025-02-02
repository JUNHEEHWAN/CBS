package com.team4.cbs.pbsvnt.quar.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team4.cbs.pbsvnt.quar.mapper.QuarMapper;
import com.team4.cbs.pbsvnt.quar.service.QuarService;
import com.team4.cbs.pbsvnt.quar.vo.QuarantineItemVO;
import com.team4.cbs.pbsvnt.quar.vo.QuarantineRequestVO;


@Service
public class QuarServiceImpl implements QuarService {

	@Autowired
	QuarMapper quarMapper;
	
	@Override
	public List<QuarantineRequestVO> list(Map<String,Object> map) {
		return this.quarMapper.list(map);
	}

	@Override
	public QuarantineRequestVO getReady(QuarantineRequestVO quarantineRequestVO) {
		return this.quarMapper.getReady(quarantineRequestVO);
	}

	@Override
	public int quarInsert(QuarantineItemVO item) {
		return this.quarMapper.qGetInsert(item);
	}

	@Override
	public int getQuarUpdate(QuarantineItemVO quarantineItemVO) {
		return this.quarMapper.getQuarUpdate(quarantineItemVO);
	}

	@Override
	public List<QuarantineItemVO> detailList(QuarantineItemVO quarantineItemVO) {
		return this.quarMapper.detailList(quarantineItemVO);
	}

	@Override
	public List<QuarantineItemVO> quarModifyList(QuarantineItemVO quarantineItemVO) {
		return this.quarMapper.quarModifyList(quarantineItemVO);
	}

	@Override
	public int quarDelete(QuarantineItemVO quarantineItemVO) {
		return this.quarMapper.quarDelete(quarantineItemVO);
	}

	@Override
	public int getTotal3(Map<String, Object> map) {
		return this.quarMapper.getTotal3(map);
	}
	
	@Override
	public int getTotal2(Map<String, Object> map) {
		return this.quarMapper.getTotal2(map);
	}

	@Override
	public List<QuarantineRequestVO> startList(Map<String,Object> map) {
		return this.quarMapper.getStartList(map);
	}

	@Override
	public int assignUpdate(QuarantineRequestVO request) {
		return this.quarMapper.assignUpdate(request);
	}

	@Override
	public int entAssignUpdate(QuarantineRequestVO request) {
		return this.quarMapper.entAssignUpdate(request);
	}

	@Override
	public int quarStuUpdate(QuarantineItemVO quarantineItemVO) {
		return this.quarMapper.quarStuUpdate(quarantineItemVO);
	}

	@Override
	public List<QuarantineRequestVO> getChitPaper(QuarantineRequestVO quarantineRequestVO) {
		return this.quarMapper.getChitPaper(quarantineRequestVO);
	}

	@Override
	public List<QuarantineRequestVO> paperList(Map<String, Object> map) {
		return this.quarMapper.paperList(map);
	}

	@Override
	public int getTotal4(Map<String, Object> map) {
		return this.quarMapper.getTotal4(map);
	}

	@Override
	public List<QuarantineItemVO> getQuarPaper(QuarantineItemVO quarantineItemVO) {
		return this.quarMapper.getQuarPaper(quarantineItemVO);
	}

	@Override
	public List<QuarantineItemVO> getQuarName(QuarantineItemVO quarantineItemVO) {
		return this.quarMapper.getQuarName(quarantineItemVO);
	}


	 











}
