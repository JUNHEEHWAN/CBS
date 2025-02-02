package com.team4.cbs.admin.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team4.cbs.admin.mapper.AdminMapper;
import com.team4.cbs.admin.service.AdminService;
import com.team4.cbs.common.vo.ChargeCustomerVO;
import com.team4.cbs.common.vo.UserVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class AdminServiceImpl implements AdminService {

	@Autowired
	AdminMapper adminMapper;

	// 관세사 전체 목록 리스트
	@Override
	public List<UserVO> getList(Map<String, Object> map) {
		return adminMapper.getList(map);
	}

	// 공무원 전체 리스트
	@Override
	public List<UserVO> pbList(Map<String, Object> map) {
		return adminMapper.pbList(map);
	}

	// 페이징 처리를 위해 전체 행 갯수 가져오기(공무원)
	@Override
	public int getTotal(Map<String, Object> map) {
		return adminMapper.getTotal(map);
	}

	// 페이징 처리를 위해 전체 행 갯수 가져오기(관세사)
	@Override
	public int getTotal2(Map<String, Object> map) {
		return adminMapper.getTotal2(map);
	}

	// 모달 상세
	@Override
	public UserVO brkrlistOne(UserVO userVO) {
		return this.adminMapper.brkrlistOne(userVO);
	}

	// 관세사 승인 업데이트
	@Override
	public int brkrUpdate(UserVO userVO) {
		return adminMapper.brkrUpdate(userVO);
	}
	@Override
	public int brkrUpdate2(UserVO userVO) {
		return adminMapper.brkrUpdate2(userVO);
	}

	// 고객관리 리스트
	@Override
	public List<ChargeCustomerVO> chargeCustomerList(Map<String, Object> map) {
		return this.adminMapper.chargeCustomerList(map);
	}

	// 페이징 처리를 위해 전체 행갯수 가져오기 (고객관리)
	@Override
	public int getTotal3(Map<String, Object> map) {
		return adminMapper.getTotal3(map);
	}


	

}
